"use strict";

const Given = null;
const When = null;
const Then = null;
const page = null;
let config;

const expect = require('expect');
const fs = require('fs');
const deepExtend = require('deep-extend');


When("I do nothing", async () => {
    await page.waitFor( 100 );
    
})