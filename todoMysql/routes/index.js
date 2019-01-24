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
  res.render('index', { title: 'Express' });
});

router.post('/addItem',(req, res, next)=>{
  const newTask = req.body.newTask;
  const newTaskDate = req.body.newTaskDate;
  //We know what the user submitted, it comes in req.body.NAMEOFFIELD
  //We store those values into var's and insert them into the SQL

  //const badInsertQuery = `INSERT INTO task (taskName, taskDate) VALUES (${newTask},${newTaskDate});`;
  // ^ : Susceptible to SQL Injections
  const insertQuery = `INSERT into tasks (taskName,taskDate) VALUES (?,?);`;
  connection.query(insertQuery,[newTask,newTaskDate],(err,results)=>{
    if(err){
      throw(err);
    } else {
      //QUERY SUCCESS! Keep the user on the homepage!
      res.redirect('/');
    }
    
  });
  //res.json(req.body);
});

module.exports = router;