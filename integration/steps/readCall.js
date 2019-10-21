var defineSupportCode = require('cucumber').defineSupportCode;
var requester = require('./requester');
defineSupportCode(function ({When}) {
    When(/^I call to the read "([^"]*)" Resource$/, function (route) {
        return requester.get('api/' + route);
    });
});