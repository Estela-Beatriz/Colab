const express = require('express');
const app = new express();

const env = require('dotenv').config();

app.use(express.json({ extended: true }))

app.use(function(req,res,next)
{
    res.header("Access-Control-Origin","*");
    res.header("Access-Control-Headers","Origin,X-Requested-With,Content-Type,Accept");
    next();
}
);

require('../database/mysql');

app.use(require('../routes/test.routes'));

app.listen(process.env.port || 8080);
console.log('Server on port:', 8080)