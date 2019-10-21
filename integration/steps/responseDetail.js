const defineSupportCode = require('cucumber').defineSupportCode;
const jsonpath = require('jsonpath');
const expect = require('unexpected');
const requester = require('./requester');

defineSupportCode(function ({Then}) {
    Then('the response has the following details:', function (data) {
        return requester.getLastResponse().then((response) => {
            const expected = data.rowsHash();

            Object.keys(expected)
                .forEach(key => {
                    const expectedValue = expected[key];
                    const value = response.body[key].toString();
                    expect(value, 'to equal', expectedValue);
                });
        });
    });
});