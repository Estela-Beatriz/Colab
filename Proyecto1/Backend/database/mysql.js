const mysql = require('mysql');

const MYSQL_HOST = process.env.HOST; 
const MYSQL_USER = process.env.USER; 
const MYSQL_PASSWORD = process.env.PASSWORD; 
const MYSQL_DATABASE = process.env.DATABASE; 

const MYSQL_CONFIG = {
    host: MYSQL_HOST,
    user: MYSQL_USER,
    password: MYSQL_PASSWORD,
    database: MYSQL_DATABASE
};

const connection = mysql.createConnection(MYSQL_CONFIG)

module.exports = connection;