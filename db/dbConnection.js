const mysql = require('mysql')

// ******************************************************

const mysqlconnection = mysql.createConnection({
  host : "localhost",
  user : "root",
  password : "phpmyadmin",
  database : "smart_reporting_batch6",
  multiStatements : true
})


mysqlconnection.connect((err) => {
  if(!err){
    console.log('connected !')
  }
  else{
    console.log('connection failed !')
    
  }
})
// ******************************************************

module.exports = mysqlconnection