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


When("I do nothing", async () => {
    await page.waitFor( 100 );
});


/**
 * Keep it as a custom step
 * Hard to serialize the dialog provess into steps
 * Here is an example big-step for testing prompt dialog
 */
When("I handle the prompt by provide name {name}", async (name) => {

    let type;
    page.on("dialog", (dlg) => {
        type = dlg.type();
        setTimeout( function(){ dlg.accept(name);; }, 1500);    // Add time delay for local running and watching
        // dlg.accept(name);
    });

    await page.waitForSelector("#prompt-trigger", { visible: true, timeout: 1000 });

    const elements = await page.$$("#prompt-trigger");
    page.evaluate( el => el.click(), elements[0] );

    await page.waitForSelector("#provided-name", { visible: true, timeout: 2000 });

    if ( "prompt" !== `${type}` ) {
        throw new TypeError(`The popover is not a prompt dialog`);
    }
})

Given("I have opened url {url}", async (url) => {
    await page.goto(url);
});