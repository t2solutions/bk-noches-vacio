const express = require('express');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser')
const jwt = require('jsonwebtoken')
const jwtKey = 'secret'
const jwtExpirySeconds = process.env.JWT_TIME_EXPIRE || 300
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

    var username = request.body.username;
    //var pwdIn = request.body.password;

    let loginInvoke = await db.doLogin2(request);
    let doGetPersonalInformation;
    if (loginInvoke.status == 200) {
        doGetPersonalInformation = await db.doGetPersonalInformation(loginInvoke.data.idUsuario);
    } else {
        doGetPersonalInformation = loginInvoke;
    }

    if (doGetPersonalInformation.status == 200) {
        // Crear nuevo token con datos del id de usuario y tipo de usuario
        // Este expira X segundos luego de entregarse
        var lastSyncDate = await db.doGetLastSyncDate(doGetPersonalInformation.data[0].idUsuario);
        lastSyncDate = lastSyncDate.data[0].ultimaFecha;
        var tknPayload = {
            'usr': doGetPersonalInformation.data[0].usr,
            'rut': username,            
            'idUsuario': doGetPersonalInformation.data[0].idUsuario,
            'idTipoUsuario': doGetPersonalInformation.data[0].idTipoUsuario,
            'idRol': doGetPersonalInformation.data[0].id_rol,
            'descRol': doGetPersonalInformation.data[0].descripcion_rol,
            'ultFechaSincronizacion': lastSyncDate
        };
        let token = jwt.sign(tknPayload, jwtKey, {
            algorithm: 'HS256',
            expiresIn: jwtExpirySeconds
        })

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

})

app.post('/calculo', async(request, response) => {
    //Si el header token no viene se gatilla 401
    let token = request.headers.token
    if (token == 'undefined') {
        return response.status(401).end()
    }
    //Evaluacion del token
    var payload = await jwtDep.getPayload(request, response);

    var paramIn = {
        'idTipoUsuario': request.body.idTipoUsuario,
        'idUsuario': token.idUsuario || request.body.idUsuario,
        'idRol': request.body.idRol,
        'idEspecieOrigen': request.body.idEspecieOrigen,
        'idZonaOrigen': request.body.idZonaOrigen,
        'idNivelOrigen': request.body.idNivelOrigen,
        'idSubnivelOrigen': request.body.idSubnivelOrigen,
        'idEspecieDestino': request.body.idEspecieDestino,
        'idZonaDestino': request.body.idZonaDestino,
        'idNivelDestino': request.body.idNivelDestino,
        'idSubnivelDestino': request.body.idSubnivelDestino
    };
    let doGetCalculo;
    if (payload != 'undefined' && payload.status != 401) {
        doGetCalculo = await db.doCalculo(paramIn);
    } else {
        doGetCalculo = payload;
    }

    response.status(doGetCalculo.status);
    response.json(doGetCalculo);

})

app.post('/data/sync', async(request, response) => {
   //Si el header token no viene se gatilla 401
   let token = request.headers.token
   if (token == 'undefined') {
       return response.status(401).end()
   }
   //Evaluacion del token
   var payload = await jwtDep.getPayload(request, response);

   let doGetCalculoGrid;
    if (payload != 'undefined' && payload.status != 401) {
        doGetCalculoGrid = await db.doSync(request.idUsuario, request.data);
    } else {
        doGetCalculoGrid = payload;
    }  

    if (doGetCalculoGrid.status == 200)
    {
        doGetCalculoGrid.data = doGetCalculoGrid.data[0];
    }

    response.status(doGetCalculoGrid.status);
    response.json(doGetCalculoGrid);

})


app.post('/calculo/grid', async(request, response) => {
    //Si el header token no viene se gatilla 401
    let token = request.headers.token
    if (token == 'undefined') {
        return response.status(401).end()
    }
    //Evaluacion del token
    var payload = await jwtDep.getPayload(request, response);

    var paramIn = {
        'idTipoUsuario': request.body.idTipoUsuario,
        'idUsuario': token.idUsuario || request.body.idUsuario,
        'idRol': request.body.idRol,
        'idEspecieOrigen': request.body.idEspecieOrigen,
        'idZonaOrigen': request.body.idZonaOrigen,
        'idNivelOrigen': request.body.idNivelOrigen,
        'idSubnivelOrigen': request.body.idSubnivelOrigen,
        'idEspecieDestino': request.body.idEspecieDestino,
        'idZonaDestino': request.body.idZonaDestino,
        'idNivelDestino': request.body.idNivelDestino,
        'idSubnivelDestino': request.body.idSubnivelDestino
    };
    let doGetCalculoGrid;
    if (payload != 'undefined' && payload.status != 401) {
        doGetCalculoGrid = await db.doGrillaCalculo(paramIn);
    } else {
        doGetCalculoGrid = payload;
    }

    if (doGetCalculoGrid.status == 200)
    {
        doGetCalculoGrid.data = doGetCalculoGrid.data[0];
    }

    response.status(doGetCalculoGrid.status);
    response.json(doGetCalculoGrid);
})

app.get('/combos/especie', async(request, response) => {
    //Si el header token no viene se gatilla 401
    let token = request.headers.token
    if (token == 'undefined') {
        return response.status(401).end()
    }
    //Evaluacion del token
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

app.get('/combos/zona/:idEspecie', async(request, response) => {

    let especieZona = request.params.idEspecie;
  
    //Si el header token no viene se gatilla 401
    let token = request.headers.token
    if (token == 'undefined') {
        return response.status(401).end()
    }
    //Evaluacion del token
    var payload = await jwtDep.getPayload(request, response);

    let doGetZonas;
    if (payload != 'undefined' && payload.status != 401) {
        doGetZonas = await db.doGetZonas(especieZona);
    } else {
        doGetZonas = payload;
    }

    response.status(doGetZonas.status);
    response.json(doGetZonas);
})

//Rectificado
app.get('/combos/nivel/:idEspecie/:idZona', async(request, response) => {

    let especieNivel = request.params.idEspecie;
    let zonaNivel = request.params.idZona;

    //Si el header token no viene se gatilla 401
    let token = request.headers.token
    if (token == 'undefined') {
        return response.status(401).end()
    }
    //Evaluacion del token
    var payload = await jwtDep.getPayload(request, response);

    let doGetNivel;
    if (payload != 'undefined' && payload.status != 401) {
        doGetNivel = await db.doGetNiveles(especieNivel, zonaNivel);
    } else {
        doGetNivel = payload;
    }

    response.status(doGetNivel.status);
    response.json(doGetNivel);
})

//rectificado
app.get('/combos/subnivel/:idNivel/:idEspecie/:idZona', async(request, response) => {

    let nivelBase = request.params.idNivel;
    let especieBase = request.params.idEspecie;
    let zonaBase = request.params.idZona;

    //Si el header token no viene se gatilla 401
    let token = request.headers.token
    if (token == 'undefined') {
        return response.status(401).end()
    }
    //Evaluacion del token
    var payload = await jwtDep.getPayload(request, response);

    let doGetSubnivel;
    if (payload != 'undefined' && payload.status != 401) {
        doGetSubnivel = await db.doGetSubNiveles(nivelBase, especieBase, zonaBase);
    } else {
        doGetSubnivel = payload;
    }

    response.status(doGetSubnivel.status);
    response.json(doGetSubnivel);
})

app.get('/combos/rol', async(request, response) => {
    //Si el header token no viene se gatilla 401
    let token = request.headers.token
    if (token == 'undefined') {
        return response.status(401).end()
    }
    //Evaluacion del token
    var payload = await jwtDep.getPayload(request, response);

    let doGetRol;
    if (payload != 'undefined' && payload.status != 401) {
        doGetRol = await db.doGetRoles();
    } else {
        doGetRol = payload;
    }

    response.status(doGetRol.status);
    response.json(doGetRol);
})

app.get('/token/refresh', async(request, response) => {
    let doGetTokenRefresh = await jwtDep.refresh(request, response);
    response.status(doGetTokenRefresh.status);
    response.json(doGetTokenRefresh);
})

app.listen(port, () => {
    console.log('App running on port ' + port + ' ')
})