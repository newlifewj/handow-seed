"use strict";

/* eslint-disable no-undef */

// References will inject to step contex in running time
const browser = null;
const page = null;
const config = null;
const Given = null;
const When = null;

const expect = require('expect');
const fs = require('fs');
const deepExtend = require('deep-extend');

Then("I am okay", async () => {
    await page.waitFor( 100 );
});


