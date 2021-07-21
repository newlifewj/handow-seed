"use strict";

/* These keywords and varible are injected by build engine, they are available in all step functions */
let Then, browser, page, config;
const expect = require('expect');   // Steps implement "expect" expression to verify criterias

Then("I am okay", async () => {
    await page.waitForTimeout( 100 );
});




