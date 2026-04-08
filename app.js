require('dotenv').config();
//app.js is the main server object that: defines routes, adds middleware, starts server

//*this code imports these packages
const express = require("express");
const path = require('path');
const bodyParser = require('body-parser');
const mysql = require('mysql2');

//creating app as a express object
const app = express();

//3000 is local port, will have to change later
const port = 3000;

//tells Express to use EJS templating engine --> EJS lets you embed JS in HTML
app.set('view engine', 'ejs');

//Middleware
app.use(express.static(path.join(__dirname, 'public'))); 
app.use(bodyParser.urlencoded({ extended: false }));


//database connection
const db = mysql.createConnection( {
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

db.connect(err => {
    if (err) {
        console.error('Database connection failed:', err);
    } else {
        console.log('Connected to MySQL!');
    }
});

//

//route definition --> need this for each page
app.get('/' , (req, res) => {
    res.render('home');
});

app.get('/cityExplorer',(req,res) =>{
    db.query("SELECT * FROM cities", (err, results) => {
        if (err) throw err;
        console.log(results);
        res.render('cityExplorer', {cities: results})
    });
    
});

// Route for viewing individual city info
app.get('/city/name/:cityName', (req, res) => {
    const cityName = req.params.cityName;
    db.query("SELECT * FROM cities WHERE name = ?", [cityName], (err, results) => {
        if (err) throw err;
        if (results.length === 0) {
            return res.send("City not found");
        }
        const city = results[0];
        res.render('city', { city });
    });
});

// Route for viewing the leaderboard
app.get('/leaderboard', (req, res) => {
    db.query("SELECT * FROM users ORDER BY best_score DESC LIMIT 10", (err, results) => {
        if (err) throw err;
        if (results.length === 0) {
            return res.send("Scores not found");
        }
        const scores = results;
        res.render('leaderboard', { scores });
    });
});

//activate the port to start server
app.listen(port,()=> {
    console.log(`now listening on port http://localhost:3000`);
});


