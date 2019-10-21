var fetch = require('node-fetch');
var buildUrl = require('build-url');
var config = require('../../config');

var baseUrl = 'http://' + config.server.ip + ':' + config.server.portSSL;

var lastResponse;
var token;

function get(url) {
    var realUrl = buildUrl(baseUrl, {
        path: url
    });

    const headers = {};
    headers['content-type'] = 'application/json';
    if (token) {
        headers.token = token;
    }

    lastResponse = fetch(realUrl, {method: 'GET', headers: headers})
        .then((res) => {
            return res.json().then((body) => {
                return {
                    status: res.status,
                    headers: res.headers.raw(),
                    body: body
                };
            });
        });

    return lastResponse;
}

function post(url, body) {
    const realUrl = buildUrl(baseUrl, {
        path: url
    });

    const headers = {};
    headers['content-type'] = 'application/json';
    if (token) {
        headers.token = token;
    }

    lastResponse = fetch(realUrl, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify(body)
    }).then((res) => {
        let bodyPromise;
        const contentType = res.headers.get('content-type') || '';
        if (contentType.indexOf('application/json') >= 0) {
            bodyPromise = res.json();
        } else {
            bodyPromise = res.text();
        }

        return bodyPromise.then((body) => {
            return {
                status: res.status,
                headers: res.headers.raw(),
                body: body
            };
        });
    });

    return lastResponse;
}

function put(url, body) {
    const realUrl = buildUrl(baseUrl, {
        path: url
    });

    const headers = {};
    headers['content-type'] = 'application/json';
    if (token) {
        headers.token = token;
    }

    lastResponse = fetch(realUrl, {
        method: 'PUT',
        headers: headers,
        body: JSON.stringify(body)
    }).then((res) => {
        let bodyPromise;
        const contentType = res.headers.get('content-type') || '';
        if (contentType.indexOf('application/json') >= 0) {
            bodyPromise = res.json();
        } else {
            bodyPromise = res.text();
        }

        return bodyPromise.then((body) => {
            console.log(body);
            return {
                status: res.status,
                headers: res.headers.raw(),
                body: body
            };
        });
    });

    return lastResponse;
}

function authenticate(user, password) {
    sha3_512 = require('js-sha3').sha3_512;

    const realUrl = buildUrl(baseUrl, {
        path: '/api/login'
    });

    const headers = {};
    headers['content-type'] = 'application/json';
    if (token) {
        headers.token = token;
    }

    lastResponse = fetch(realUrl, {
        method: 'PUT',
        headers: headers,
        body: JSON.stringify({
            name: user,
            pass: sha3_512(password)
        })
    }).then((res) => {
        let bodyPromise;
        const contentType = res.headers.get('content-type') || '';
        if (contentType.indexOf('application/json') >= 0) {
            bodyPromise = res.json();
        } else {
            bodyPromise = res.text();
        }

        return bodyPromise.then((body) => {
            token = body.data.token;
            return {
                status: res.status,
                headers: res.headers.raw(),
                body: body
            };
        });
    });

    return lastResponse;
}

function getLastResponse() {
    return lastResponse;
}

function clearAuthentication() {
    token = undefined;
}

module.exports = {
    get: get,
    post: post,
    put: put,
    getLastResponse: getLastResponse,
    authenticate: authenticate,
    clearAuthentication: clearAuthentication
};