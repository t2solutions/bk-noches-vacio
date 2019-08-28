const express = require('express');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser')
const jwt = require('jsonwebtoken')
const jwtKey = 'secret'
const jwtExpirySeconds = 300
const dotenv = require('dotenv').config();

const app = express();
const port = process.env.NODE_PORT || process.env.PORT //PORT si toma .env

const db = require('./queries')
const jwtDep = require('./jwt')

app.use(bodyParser.json())
app.use(
    bodyParser.urlencoded({
        extended: true,
    })    
)
app.use(cookieParser())

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

    var usernameIn = request.body.username;
    //var pwdIn = request.body.password;

    let loginInvoke = await db.doLogin2(request);
    let doGetPersonalInformation;
    if (loginInvoke.status == 200) {
        doGetPersonalInformation = await db.doGetPersonalInformation(loginInvoke.data.idUsuario);
    } else {
        doGetPersonalInformation = loginInvoke;
    }

    if (doGetPersonalInformation.status == 200) 
    {
        // Create a new token with the username in the payload
        // and which expires 300 seconds after issue
        let token = jwt.sign({ usernameIn }, jwtKey, {
            algorithm: 'HS256',
            expiresIn: jwtExpirySeconds
        })

        // set the cookie as the token string, with a similar max age as the token
        // here, the max age is in milliseconds, so we multiply by 1000
        //response.cookie('token', token, { maxAge: jwtExpirySeconds * 1000 })
        let jsonSalida = {
            'status': doGetPersonalInformation.status,
            'message': doGetPersonalInformation.message,
            'token': token
         }
         response.status(doGetPersonalInformation.status);
         response.json(jsonSalida);

    } else {
        response.status(doGetPersonalInformation.status);
        response.json(doGetPersonalInformation);
    }

    //response.status(doGetPersonalInformation.status);
    //response.json(doGetPersonalInformation);

})

app.get('/combos/especie', async(request, response) => {

     // We can obtain the session token from the requests cookies, which come with every request
    let token = request.headers.token
    // if the cookie is not set, return an unauthorized error
    if (token == 'undefined') {
        return response.status(401).end()
    }
    var payload = await jwtDep.getPayload(request, response);

    let doGetEspecies;
    if (payload != 'undefined' && payload.status != 401) {
        doGetEspecies = await db.doGetEspecies();
    } else {
        doGetEspecies = payload;
    }
       
    response.status(doGetEspecies.status);
    response.json(doGetEspecies);

})

app.get('/combos/zona', async(request, response) => {
    let doGetZonas = await db.doGetZonas();
    response.status(doGetZonas.status);
    response.json(doGetZonas);
})

app.get('/combos/nivel', async(request, response) => {
    let doGetNivel = await db.doGetNiveles();
    response.status(doGetNivel.status);
    response.json(doGetNivel);
})

app.get('/combos/subnivel', async(request, response) => {
    let doGetSubnivel = await db.doGetSubNiveles();
    response.status(doGetSubnivel.status);
    response.json(doGetSubnivel);
})

app.get('/combos/rol', async(request, response) => {
    let doGetRol;

    response.json(doGetRol);
    response.status(200);
})

app.get('/token/refresh', async(request, response) => {
    let doGetTokenRefresh = await jwtDep.refresh(request, response);
    response.status(doGetTokenRefresh.status);
    response.json(doGetTokenRefresh);
})

app.listen(port, () => {
    console.log('App running on port ' + port + ' ')
})