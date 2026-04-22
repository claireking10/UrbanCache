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

app.use((req, res, next) => {
    const isAuth = req.oidc?.isAuthenticated?.() || false;
    res.locals.isAuthenticated = isAuth;
    res.locals.user = req.oidc?.user || null;
    console.log("AUTH STATE:", isAuth);
    next();
});

// database
const db = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

// routes

// home page
app.get('/', async (req, res) => {
    try {
        const [cities] = await db.query("SELECT imagePath FROM cities");
        const images = cities.map(city => city.imagePath);
        res.render('home', { images });
    } catch (err) {
        console.error(err);
        res.render('home', { images: [] });
    }
});

// city explorer page
app.get('/cityExplorer', async (req, res) => {
    const [results] = await db.query("SELECT * FROM cities");
    res.render('cityExplorer', { cities: results });
});

// individual city page
app.get('/city/name/:cityName', async (req, res) => {
    const cityName = req.params.cityName;
    const [results] = await db.query("SELECT * FROM cities WHERE name = ?", [cityName]);
    if (results.length === 0) return res.send("City not found");
    res.render('city', { city: results[0] });
});

// profile
app.get('/profile', requiresAuth(), async (req, res) => {
    const auth0User = req.oidc?.user;
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
        SELECT COUNT(*) + 1 AS userRank 
        FROM users 
        WHERE best_score > (SELECT best_score FROM users WHERE id = ?)
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
    const avatarNum = avatar_url ? parseInt(avatar_url.replace(/\D/g, '')) : 1;

    await db.query(
        'UPDATE users SET username = ?, avatar_url = ?, avatar = ? WHERE auth0_id = ?',
        [username, avatar_url, avatarNum, auth0User.sub]
    );
    res.redirect('/profile');
});

// viewing the leaderboard
app.get('/leaderboard', async (req, res) => {
    const [results] = await db.query("SELECT * FROM users ORDER BY best_score DESC LIMIT 10");
    if (results.length === 0) return res.send("Scores not found");
    res.render('leaderboard', { scores: results });
});

//returns array of 5 random questions + ids from the questions table
function takeFive(qtable){
    let quizArray =[];
    const minCeiled = Math.ceil(1);
    const maxFloored = Math.floor(100);
        for(let i=0;i<5;i++){
            let rand = Math.floor(Math.random() * (maxFloored - minCeiled + 1) + minCeiled);
            quizArray.push({question: qtable[rand].question ,innerArrID: qtable[rand].question_id,cityAnswerID: qtable[rand].city_id});
        }
    return quizArray;
}

//route for trivia, questions table
app.get('/trivia', async (req, res) => {
    const [fromquestions] = await db.query("SELECT * FROM questions");
    const tempArray = takeFive(fromquestions);
    res.render('trivia', { questions: fromquestions, quizArray: tempArray });
});

// save scores after trivia
app.post('/trivia/submit', async (req, res) => {
    const { score } = req.body;
    if (!req.oidc.isAuthenticated()) return res.redirect('/trivia');
    const auth0User = req.oidc.user;
    const [[user]] = await db.query('SELECT * FROM users WHERE auth0_id = ?', [auth0User.sub]);
    if (user) {
        await db.query('INSERT INTO scores (user_id, score) VALUES (?, ?)', [user.id, score]);
        if (score > user.best_score) {
            await db.query('UPDATE users SET best_score = ? WHERE id = ?', [score, user.id]);
        }
    }
    res.redirect('/profile');
});

// start server
app.listen(port, () => {
    console.log(`now listening on port http://localhost:3000`);
});