"use strict";

const Given = null;
const When = null;
const Then = null;
const page = null;
let config;

const expect = require('expect');
const fs = require('fs');
const deepExtend = require('deep-extend');
const { DH_NOT_SUITABLE_GENERATOR } = require('constants');


When("I do nothing", async () => {
    await page.waitForTimeout( 100 );
    
});

/**
 * Keep it as a custom step
 * Hard to serialize the dialog provess into steps
 * Here is an example big-step for testing prompt dialog
 */
When("I handle the prompt by providing {text}", async (text) => {

    let type;
    page.on("dialog", (dlg) => {
        type = dlg.type();
        setTimeout( function(){ dlg.accept(text);; }, 1500);    // Add time delay for local running and watching
        // dlg.accept(text);
    });

    await page.waitForSelector("#prompt-trigger", { visible: true, timeout: 1000 });

    const elements = await page.$$("#prompt-trigger");
    page.evaluate( el => el.click(), elements[0] );

    await page.waitForSelector("#provided-name", { visible: true, timeout: 2000 });

    if ( "prompt" !== `${type}` ) {
        throw new TypeError(`The popover is not a prompt dialog`);
    }
});

/**
 * Compound step to handle upload a file or multiple file
 * selector: the clicker which will open file picker
 * path: the path of the uploading file in local file system (multiple files separated by comma)
 * Althought "elementHandle.uploadFile(...filePaths)" is easier, but it not the real UI interaction
 */
/*
When("I click it {selector} and choose the files paths {paths}", async (selector, paths) => {
    
    const filePaths = paths.split(",");

    await page.waitForSelector(selector, { visible: true, timeout: 1000 });
    const uploadClicker = await page.$$(selector);

    const [fileChooser] = await Promise.all([
        page.waitForFileChooser(),
        page.evaluate( el => el.click(), uploadClicker[0] )
    ]);

    await fileChooser.accept(filePaths);

    config.reactTime && await page.waitFor(config.reactTime);  
});
*/

Given("I have opened {url}", async (url) => {
    await page.goto(url);
});







