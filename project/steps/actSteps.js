"use strict";

const Given = null;
const When = null;
const Then = null;
const page = null;
let config;

const expect = require('expect');
const fs = require('fs');
const deepExtend = require('deep-extend');

// 'page' and 'config' will be injected in run time

When("I enter value {value} to input {selector}", async (selector, vlue) => {
    await page.waitForSelector(selector, { visible: true, timeout: config.elementAppearTimeout });
    const elements = await page.$$(selector);
    await page.$eval( el => el.value = value, elements[0] );
});


