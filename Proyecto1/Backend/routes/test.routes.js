const { Router } = require('express');
const router = Router();
const mysql = require('../database/mysql')

router.get('/get',(Request,Response)=>{
    var miQuery1 = "select * from tipo;";
    mysql.query(miQuery1,function(err,result){
        if (err) {
            throw err;
        } else {
            console.log(result);
            Response.send(result) ;
        }
        
    });  
})

module.exports = router;