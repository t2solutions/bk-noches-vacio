const mysql = require('mysql');

const options = {
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_DBNAME,
    multipleStatements: true
};
const mysqlConnection = mysql.createPool(options);

const doCalculo = (request, response) => {
    const querySp = "CALL SP(?);"
    mysqlConnection.getConnection(
        function(err, connection) {

        }
    );

}


const doLogin = (request, response) => {


}

module.exports = {
    doCalculo,
    doLogin
}