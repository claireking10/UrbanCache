//app.js is the main server object that: defines routes, adds middleware, starts server

//*this code imports these packages
const express = require("express");
const path = require('path');
const bodyParser = require('body-parser');


//creating app as a express object
const app = express();

//3000 is local port, will have to change later
const port = 3000;

//tells Express to use EJS templating engine --> EJS lets you embed JS in HTML
app.set('view engine', 'ejs');

//Middleware
app.use(express.static(path.join(__dirname, 'public'))); 
app.use(bodyParser.urlencoded({ extended: false }));



//route definition --> need this for each page
app.get('/' , (req, res) => {
    res.render('home');
});

//activate the port to start server
app.listen(port,()=> {
    console.log(`now listening on port http://localhost:3000`);
});



