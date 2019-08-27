const express = require('express');
const bodyParser = require('body-parser');
const dotenv = require('dotenv').config();
const app = express();
const port = process.env.PORT

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
})

app.post('/login', async(request, response) => {

    //var usernameIn = request.body.username;
    //var pwdIn = request.body.password;

    let loginInvoke = await db.doLogin2(request);
    let doGetPersonalInformation;
    if (loginInvoke.status == 200) {
        doGetPersonalInformation = await db.doGetPersonalInformation(loginInvoke.data.idUsuario);
    } else {
        doGetPersonalInformation = loginInvoke;
    }

    //var jsonSalida = {
    //   code: 0,
    //  status: 'OK',
    //  username: username
    //}

    //response.json(loginInvoke);
    response.status(doGetPersonalInformation.status);
    response.json(doGetPersonalInformation);

})

app.get('/combos/especie', async(request, response) => {
    let doGetEspecies = await db.doGetEspecies();
    response.status(doGetEspecies.status);
    response.json();

})

app.get('/combos/zona', async(request, response) => {
    let doGetZonas = await db.doGetZonas();
    response.status(doGetZonas.status);
    response.json(doGetZonas);
})

app.get('/combos/nivel', async(request, response) => {
    let doGetNivel;


    response.json(doGetNivel);
    response.status(200);
})

app.get('/combos/subnivel', async(request, response) => {
    let doGetSubnivel;

    response.json(doGetSubnivel);
    response.status(200);
})

app.get('/combos/rol', async(request, response) => {
    let doGetRol;

    response.json(doGetRol);
    response.status(200);
})









app.listen(port, () => {
    console.log('App running on port ' + port + ' ')
})