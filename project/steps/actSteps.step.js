"use strict";

/* These keywords and varible are injected by build engine */
let Given, When, browser, page, config;

/* Import additional dependencies, e.g. */
const fs = require('fs');

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

Given("I have opened {url}", async (url) => {
    await page.goto(url);
});

