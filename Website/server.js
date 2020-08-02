const express = require("express");
const bodyparser = require("body-parser");
const app= express();
app.set('view engine', 'ejs');
app.use(express.static("public"));
app.use(bodyparser.urlencoded({extended:true}));
app.get("/", function(req,res){
    res.render('homepage');
});
app.listen(3000, function(req,res){
    console .log("server started successfully");
})