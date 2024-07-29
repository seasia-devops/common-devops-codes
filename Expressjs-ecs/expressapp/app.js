// My first express.js application

const express=require('express')
// import express from express # for es6 this will work not above one
const app=express()
const port=process.env.PORT || '3000'


app.get('/',(req,res) => {
    res.send('This is my first application of express.js')
})

//or
// app.get('/', function (req, res) {
//     res.send('This is my first application of express.js')
// })


app.listen(port, () => {
    console.log('Server listening at http://localhost:${port}')
})