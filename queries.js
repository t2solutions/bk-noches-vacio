const mysql = require('mysql2/promise');

const options = {
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
    password: process.env.DB_PASS,
    database: process.env.DB_DBNAME,
    multipleStatements: true
};
const mysqlConnection = mysql.createPool(options);

async function doLogin2(request) {
    let querySp = "SELECT nochesvacio.FU_Login(?, ?) AS idUsuario;"
    var usr = request.body.username;
    var pwd = request.body.password;
    try {
        var result = await mysqlConnection.query(querySp, [usr, pwd]);
    } catch (err) {
        //next(err);
        return result = { 'status': 500, 'message': err.sqlMessage };
    }

    if (result[0].length > 0) {
        if (result[0][0].idUsuario == '0') {
            return result = { 'status': 401, 'message': 'Usuario y/o contraseña incorrectos' };
        } else {
            return result = { 'status': 200, 'message': 'OK', 'data': result[0][0] };
        }

    }
}

async function doGetPersonalInformation(userId) {
    let querySp = "SELECT id_usuario AS idUsuario, rut, nombre, ap_pat AS apPat, ap_mat AS apMat, user AS usr, fono, id_tipousuario AS idTipoUsuario FROM usuario WHERE id_usuario = ?;"
    try {
        var result = await mysqlConnection.query(querySp, [userId]);
        if (result[0].length > 0) {
            return result = { 'status': 200, 'message': 'OK', 'data': result[0] };
        } else {
            return result = { 'status': 404, 'message': 'Datos no encontrados' };
        }

    } catch (err) {
        return result = { 'status': 500, 'message': err.sqlMessage };
    }


}

async function doGetEspecies() {
    let querySp = "SELECT id_especie AS idEspecie, nombre FROM especie ORDER BY id_especie ASC;"
    try {
        var result = await mysqlConnection.query(querySp);
        if (result[0].length > 0) {
            return result = { 'status': 200, 'message': 'OK', 'data': result[0] };
        } else {
            return result = { 'status': 404, 'message': 'Datos no encontrados' };
        }

    } catch (err) {
        return result = { 'status': 500, 'message': err.sqlMessage };
    }
}

async function doGetZonas() {
    let querySp = "SELECT id_zona AS idZona, descripción AS descripcion, id_especie as idEspecie FROM Zona ORDER BY id_zona ASC;"
    try {
        var result = await mysqlConnection.query(querySp);
        if (result[0].length > 0) {
            return result = { 'status': 200, 'message': 'OK', 'data': result[0] };
        } else {
            return result = { 'status': 404, 'message': 'Datos no encontrados' };
        }

    } catch (err) {
        return result = { 'status': 500, 'message': err.sqlMessage };
    }
}



const doCalculo = (request, response) => {


}

module.exports = {
    doCalculo,
    doLogin2,
    doGetPersonalInformation,
    doGetEspecies,
    doGetZonas,
};