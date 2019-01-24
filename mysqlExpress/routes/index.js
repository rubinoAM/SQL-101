var express = require('express');
var router = express.Router();

//Use mysql module to connect & query from express/node
//This module isn't part of core, so npm install it
var mysql = require('mysql');
var config = require('../config')
var connection = mysql.createConnection(config);
connection.connect();

/* GET home page. */
router.get('/', function(req, res, next) {
  /*  We want to load a list of our restaurants on the homepage
      This is inside of mysql
      Before we render the view, we want to get the data and send it over to the view*/
  const query = 'SELECT * FROM restaurant;';
  connection.query(query,(err,results)=>{
    if(err){
      throw(err);
    } else {
      res.json(results);
    }
  });
  //res.render('index', { title: 'Express' });
});

module.exports = router;
