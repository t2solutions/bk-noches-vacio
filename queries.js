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
  //let querySp = "SELECT id_usuario AS idUsuario, rut, nombre, ap_pat AS apPat, ap_mat AS apMat, user AS usr, fono, id_tipousuario AS idTipoUsuario FROM usuario WHERE id_usuario = ?;"
   let querySp2 = "SELECT usuario.id_usuario AS idUsuario, usuario.rut, usuario.nombre, usuario.ap_pat AS apPat, usuario.ap_mat AS apMat, usuario.user AS usr, usuario.fono, usuario.id_tipousuario AS idTipoUsuario ,tipo_usuario.id_rol,tipo_usuario.descripcion AS descripcion_rol FROM usuario,tipo_usuario WHERE tipo_usuario.id_tipousuario = usuario.id_tipousuario AND usuario.id_usuario=?; "
    
    try {
        var result = await mysqlConnection.query(querySp2, [userId]);
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
    let querySp = "SELECT id_especie, nombre FROM especie ORDER BY id_especie ASC;"
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

async function doGetZonas(idEspecie) {
    let querySp = "SELECT id_zona, descripción AS descripcion, id_especie FROM Zona WHERE id_especie = ? ORDER BY id_zona ASC;"
    try {
        var result = await mysqlConnection.query(querySp, [idEspecie]);
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
    let querySp = "SELECT id_rol, descripcion_rol FROM Rol ORDER BY id_rol ASC;"
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

async function doGetNiveles(idEspecie) {
    let querySp = "SELECT id_nivel, nombre_nivel, id_especie, cod_nivel FROM nivel WHERE id_especie=? ORDER BY id_nivel ASC;"
    try {
        var result = await mysqlConnection.query(querySp, [idEspecie]);
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

async function doGetSubNiveles(idNivel) {
    let querySp = "SELECT id_subnivel, nombre_subnivel, id_zona, id_nivel, dir_georeferencia FROM Subnivel WHERE id_nivel=? ORDER BY id_subnivel ASC;"
    try {
        var result = await mysqlConnection.query(querySp, [idNivel]);
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

async function doGetLastSyncDate(idUsr) {
    let querySp = "SELECT fecha AS ultimaFecha FROM sincronizacion WHERE id_usuario=?;"
    try {
        var result = await mysqlConnection.query(querySp, [idUsr]);
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

async function doSync(idUsr, arrayData) {

    await mysqlConnection.beginTransaction();

    let querySp =  "INSERT INTO nochesvacio.trazabilidad (id_usuario, id_especie_or, id_zona_or, id_nivel_or, id_nivel_or, id_especie_des, id_zona_des, id_nivel_des, id_subnivel_des, id_tipo_usuario, fecha) " +
     " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, STR_TO_DATE(?, '%Y-%m-%d'));";   
    try {

        for (arry in arrayData) {
            await mysqlConnection.execute(querySp, [arry.id_usuario,
                arry.id_especie_or, arry.id_zona_or, arry.id_nivel_or, arry.id_nivel_or, arry.id_especie_des, arry.id_zona_des,
                arry.id_nivel_des, arry.id_subnivel_des, arry.id_tipo_usuario, arry.fecha
            ]);
        }

        //formato remoto 2019-08-28 18:00:00
        await mysqlConnection.execute("UPDATE nochesvacio.sincronizacion SET fecha=DATE_FORMAT(NOW(),'%Y-%m-%d %H:%i:%s') WHERE id_usuario=?; ", [idUsr]);
        await mysqlConnection.execute("UPDATE nochesvacio.parametros SET valor = (SELECT fecha FROM nochesvacio.sincronizacion where id_usuario=?); ", [idUsr]);
 
        await mysqlConnection.commit();
        return result = { 'status': 200, 'message': 'OK' };

        // if (result[0].length > 0) {
        //     return result = { 'status': 200, 'message': 'OK', 'data': result[0] };
        // } else {
        //     return result = { 'status': 404, 'message': 'Datos no encontrados' };
        // }

    } catch (err) {
        await mysqlConnection.rollback();
 
        if (err.sqlMessage == 'undefined') {
            return result = { 'status': 500, 'message': err.sqlMessage };
        } else {
            return result = { 'status': 500, 'message': err.message };
        }
    } finally {
        mysqlConnection.release();
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
    doGetLastSyncDate,
    doSync,
};