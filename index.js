const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 3000

const db = require('./queries')


app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.get('/test', (request, response) => {
  var jsonSalida = {
		code: 0,
    status: 'OK',
    codigos: [1, 2, 3]
  }	
  
  response.status(200);
  response.json(jsonSalida);
  
  //response.json({ info: 'Node.js, Express, and Postgres API' })
})

app.post('/login', (request, response) => {

  var username = request.body.username;
  var pwd = request.body.password;



  var jsonSalida = {
		code: 0,
    status: 'OK',
    username: username
  }	
  response.json(jsonSalida);
  response.status(200);
})

app.listen(port, () => {
  console.log('App running on port '+port+' ')
})

