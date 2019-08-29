const jwt = require('jsonwebtoken')
const jwtKey = 'secret'
const jwtExpirySeconds = process.env.JWT_TIME_EXPIRE || 300

async function getPayload(req, res) {
    let payload
    let token = req.headers.token
    try {
        // Parse the JWT string and store the result in `payload`.
        // Note that we are passing the key in this method as well. This method will throw an error
        // if the token is invalid (if it has expired according to the expiry time we set on sign in),
        // or if the signature does not match
        payload = jwt.verify(token, jwtKey)
    } catch (e) {
        if (e instanceof jwt.JsonWebTokenError) {
            // if the error thrown is because the JWT is unauthorized, return a 401 error
            //return res.status(401).end()
            switch (e.name) {
                case "TokenExpiredError":
                    return payload = { 'status': 401, 'message': 'JWT ha expirado' }
                    break;

                default:
                    return payload = { 'status': 401, 'message': 'JWT incorrecto' }
                    break;
            }
        }
        // otherwise, return a bad request error
        //return res.status(400).end()
        return payload = { 'status': 400, 'message': 'Bad request' }
    }
    return payload;

}


async function refresh(req, res) {
    // (BEGIN) The code uptil this point is the same as the first part of the `welcome` route
    let token = req.headers.token

    if (!token) {
        return payload = { 'status': 400, 'message': 'JWT incorrecto' }; //res.status(401).end()
    }

    var payload
    try {
        payload = jwt.verify(token, jwtKey)
    } catch (e) {
        if (e instanceof jwt.JsonWebTokenError) {
            //if (e instanceof jwt.JsonWebTokenError) {
            // if the error thrown is because the JWT is unauthorized, return a 401 error
            //return res.status(401).end()
            switch (e.name) {
                case "TokenExpiredError":
                    return payload = { 'status': 401, 'message': 'JWT ha expirado' }
                    break;

                default:
                    return payload = { 'status': 400, 'message': 'JWT incorrecto' }
                    break;
            }
            //}
        }
    }

    // We ensure that a new token is not issued until enough time has elapsed
    // In this case, a new token will only be issued if the old token is within
    // 30 seconds of expiry. Otherwise, return a bad request status
    let nowUnixSeconds = Math.round(Number(new Date()) / 1000)
    if (payload.exp - nowUnixSeconds > process.env.JWT_TIME_REFRESH) {
        return payload = { 'status': 400, 'message': 'JWT ha expirado para refresco, solicite uno nuevo mediante login' }
            //return res.status(400).end()
    }

    // Now, create a new token for the current user, with a renewed expiration time
    let newToken = jwt.sign({ username: payload.username }, jwtKey, {
        algorithm: 'HS256',
        expiresIn: jwtExpirySeconds
    })

    // Set the new token as the users `token` cookie
    //res.cookie('token', newToken, { maxAge: jwtExpirySeconds * 1000 })
    let jsonSalida = { 'status': 200, 'message': 'OK', 'token': newToken }
    res.json(jsonSalida);
    return res.status(200).end();
}


module.exports = {
    getPayload,
    refresh,
};