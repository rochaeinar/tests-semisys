const defineSupportCode = require('cucumber').defineSupportCode;
const requester = require('./requester');
var {Given} = require('cucumber');

defineSupportCode(function ({Before, Given}) {
    Before(function () {
        requester.clearAuthentication();
    });

    Given(/^I have authenticated as user "([^"]*)" with password "([^"]*)"$/,
        function (username, password) {
            return requester.authenticate(username, password);
        });
});
