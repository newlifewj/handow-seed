"use strict";

const Given = null;
const When = null;
const Then = null;
const page = null;
let config;

const expect = require('expect');
const fs = require('fs');
const deepExtend = require('deep-extend');

When("I wait it {url} is responsed with status {status}", async (url, status) => {
    await page.waitForResponse( ( response ) => {
        return response.url().includes(url) && response.status() == status;
    });
});

When("I do nothing", async () => {
    await page.waitFor( 100 );
})



Given("I set cookies {cookies} to current browser instance", async (cookies) => {
    await page.setCookie(...cookies);
})

When("I set cookies {cookies} to current browser instance", async (cookies) => {
    await page.setCookie(...cookies);
})



