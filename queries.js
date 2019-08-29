const mysql = require('mysql2/promise');

const options = {
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    port: process.env.DB_PORT, //3307
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
        if (err.sqlMessage == 'undefined') {
            return result = { 'status': 500, 'message': err.sqlMessage };
        } else {
            return result = { 'status': 500, 'message': err.message };
        }
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
        if (err.sqlMessage == 'undefined') {
            return result = { 'status': 500, 'message': err.sqlMessage };
        } else {
            return result = { 'status': 500, 'message': err.message };
        }
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
        if (err.sqlMessage == 'undefined') {
            return result = { 'status': 500, 'message': err.sqlMessage };
        } else {
            return result = { 'status': 500, 'message': err.message };
        }
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
        if (err.sqlMessage == 'undefined') {
            return result = { 'status': 500, 'message': err.sqlMessage };
        } else {
            return result = { 'status': 500, 'message': err.message };
        }
    }
}

async function doGetRoles() {
    let querySp = "SELECT id_rol AS idRol, descripcion_rol AS descripcion FROM Rol ORDER BY id_rol ASC;"
    try {
        var result = await mysqlConnection.query(querySp);
        if (result[0].length > 0) {
            return result = { 'status': 200, 'message': 'OK', 'data': result[0] };
        } else {
            return result = { 'status': 404, 'message': 'Datos no encontrados' };
        }

    } catch (err) {
        if (err.sqlMessage == 'undefined') {
            return result = { 'status': 500, 'message': err.sqlMessage };
        } else {
            return result = { 'status': 500, 'message': err.message };
        }
    }
}

async function doGetNiveles() {
    let querySp = "SELECT id_nivel AS idNivel, nombre_nivel AS nombreNivel, id_especie as idEspecie, cod_nivel AS codNivel FROM nivel ORDER BY idNivel ASC;"
    try {
        var result = await mysqlConnection.query(querySp);
        if (result[0].length > 0) {
            return result = { 'status': 200, 'message': 'OK', 'data': result[0] };
        } else {
            return result = { 'status': 404, 'message': 'Datos no encontrados' };
        }

    } catch (err) {
        if (err.sqlMessage == 'undefined') {
            return result = { 'status': 500, 'message': err.sqlMessage };
        } else {
            return result = { 'status': 500, 'message': err.message };
        }
    }
}

async function doGetSubNiveles() {
    let querySp = "SELECT id_subnivel AS idSubnivel, nombre_subnivel AS nombreSubNivel, id_zona as idZona, id_nivel AS idNivel, dir_georeferencia AS dirGeoReferencia FROM nivel ORDER BY id_subnivel ASC;"
    try {
        var result = await mysqlConnection.query(querySp);
        if (result[0].length > 0) {
            return result = { 'status': 200, 'message': 'OK', 'data': result[0] };
        } else {
            return result = { 'status': 404, 'message': 'Datos no encontrados' };
        }

    } catch (err) {
        if (err.sqlMessage == 'undefined') {
            return result = { 'status': 500, 'message': err.sqlMessage };
        } else {
            return result = { 'status': 500, 'message': err.message };
        }
    }
}


async function doCalculo(params) {
    let querySp = "CALL nochesvacio.SP_Calculo_NocheVacio(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, @salida); select @salida";
    try {
        var parms = params;
        var result = await mysqlConnection.query(querySp, [parms.idTipoUsuario,
            parms.idUsuario, parms.idRol, parms.idEspecieOrigen, parms.idZonaOrigen, parms.idNivelOrigen, parms.idSubnivelOrigen,
            parms.idEspecieDestino, parms.idZonaDestino, parms.idNivelDestino, parms.idSubnivelDestino
        ]);

    } catch (err) {
        //next(err);
        if (err.sqlMessage == 'undefined') {
            return result = { 'status': 500, 'message': err.sqlMessage };
        } else {
            return result = { 'status': 500, 'message': err.message };
        }
    }

    if (result[0].length > 0) {
        if (result[0][0].idUsuario == '0') {
            return result = { 'status': 401, 'message': 'Usuario y/o contraseña incorrectos' };
        } else {
            return result = { 'status': 200, 'message': 'OK', 'data': result[0][0] };
        }

    }

}

async function doGrillaCalculo(params) {
    //let querySp = "SELECT id_subnivel AS idSubnivel, nombre_subnivel AS nombreSubNivel, id_zona as idZona, id_nivel AS idNivel, dir_georeferencia AS dirGeoReferencia FROM nivel ORDER BY id_subnivel ASC;"
    let querySp = "CALL nochesvacio.SP_Grilla_NocheVacio(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    try {
        var parms = params;
        var result = await mysqlConnection.query(querySp, [parms.idTipoUsuario,
            parms.idUsuario, parms.idRol, parms.idEspecieOrigen, parms.idZonaOrigen, parms.idNivelOrigen, parms.idSubnivelOrigen,
            parms.idEspecieDestino, parms.idZonaDestino, parms.idNivelDestino, parms.idSubnivelDestino
        ]);
        if (result[0].length > 0) {
            return result = { 'status': 200, 'message': 'OK', 'data': result[0] };
        } else {
            return result = { 'status': 404, 'message': 'Datos no encontrados' };
        }

    } catch (err) {
        if (err.sqlMessage == 'undefined') {
            return result = { 'status': 500, 'message': err.sqlMessage };
        } else {
            return result = { 'status': 500, 'message': err.message };
        }
    }


}

module.exports = {
    doCalculo,
    doGrillaCalculo,
    doLogin2,
    doGetPersonalInformation,
    doGetEspecies,
    doGetZonas,
    doGetNiveles,
    doGetSubNiveles,
    doGetRoles,
};