require('dotenv').config();
const { auth, requiresAuth } = require('express-openid-connect');
const express = require("express");
const path = require('path');
const bodyParser = require('body-parser');
const mysql = require('mysql2/promise');
const session = require('express-session');

const app = express();
const port = 3000;

app.set('view engine', 'ejs');

// middleware
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.urlencoded({ extended: false }));

app.use(session({
    secret: process.env.SECRET,
    resave: false,
    saveUninitialized: false,
    cookie: { secure: false }
}));

// auth0
app.use(auth({
    authRequired: false,
    auth0Logout: true,
    secret: process.env.SECRET,
    baseURL: process.env.BASE_URL,
    clientID: process.env.CLIENT_ID,
    clientSecret: process.env.CLIENT_SECRET,
    issuerBaseURL: process.env.ISSUER_BASE_URL
}));


// database
const db = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

// routes
app.get('/', (req, res) => {
    res.render('home');
});

app.get('/cityExplorer', async (req, res) => {
    const [results] = await db.query("SELECT * FROM cities");
    res.render('cityExplorer', { cities: results });
});

app.get('/city/name/:cityName', async (req, res) => {
    const cityName = req.params.cityName;
    const [results] = await db.query("SELECT * FROM cities WHERE name = ?", [cityName]);
    if (results.length === 0) return res.send("City not found");
    res.render('city', { city: results[0] });
});

// profile
app.get('/profile', requiresAuth(), async (req, res) => {
    const auth0User = req.oidc.user;

    let [[user]] = await db.query(
        'SELECT * FROM users WHERE auth0_id = ?', [auth0User.sub]
    );

    if (!user) {
        await db.query(
            'INSERT INTO users (auth0_id, username, email) VALUES (?, ?, ?)',
            [auth0User.sub, auth0User.nickname, auth0User.email]
        );
        [[user]] = await db.query(
            'SELECT * FROM users WHERE auth0_id = ?', [auth0User.sub]
        );
    }

    const userId = user.id;

    const [[pb]] = await db.query(
        'SELECT COALESCE(MAX(score), 0) as personalBest FROM scores WHERE user_id = ?', [userId]
    );

    const [[rankRow]] = await db.query(`
        SELECT COUNT(*) + 1 AS userRank FROM (
            SELECT user_id, MAX(score) as top FROM scores GROUP BY user_id
        ) t WHERE t.top > (SELECT COALESCE(MAX(score), 0) FROM scores WHERE user_id = ?)
    `, [userId]);
    
    const [[stats]] = await db.query(`
        SELECT
            COUNT(*) as gamesPlayed,
            COALESCE(SUM(score), 0) as totalPoints,
            0 as citiesDiscovered
        FROM scores WHERE user_id = ?
    `, [userId]);

    const [scores] = await db.query(
        'SELECT * FROM scores WHERE user_id = ? ORDER BY score DESC LIMIT 10', [userId]
    );

    res.render('profile', {
        user: { ...user, personalBest: pb.personalBest, userRank: rankRow['userRank'], ...stats },
        scores
    });
});

// edit profile
app.post('/profile/edit', requiresAuth(), async (req, res) => {
    const auth0User = req.oidc.user;
    const { username, avatar_url } = req.body;
    await db.query(
        'UPDATE users SET username = ?, avatar_url = ? WHERE auth0_id = ?',
        [username, avatar_url, auth0User.sub]
    );
    res.redirect('/profile');
});

// start server
app.listen(port, () => {
    console.log(`now listening on port http://localhost:3000`);
});