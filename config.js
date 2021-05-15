"use strict";

/**
 * Custom configuration for handow running, will override the default seeting (_config.js module)
 *
 * @module config
 */

module.exports = {

    // The viewport size, "mobile"==460x720 | "desktop"==1024x768 | "default"==800x600
    viewport: "desktop",

    // Doesn't make sense for fine setting. Just true: shot each act step, false: no screen shot
    screenshot: true,

    // Add cookies info to report or not. true -- will add cookies available for current page path to each act
    cookies: true,

    // Add errors happened currently to report or not. true -- Will add errors existed in current page to each act
    pageErrors: true,

    // Reacting time (ms) after each Act step, default is 300.
    reactTime: 500,

    // Wait all XHR resolved after each action step or not, default is true - resolve all XHR after each action before taking screenshot. 
    actResolveXHR: true,

    // Timeout (ms) for waiting element appear/disappear, default is 30000.
    elementAppearTimeout: 10000,

    // Timeout for verify element nonexistent, default is 2000.
    elementAbsentTimeout: 10000,

    // Coding and building base directory
    projectPath: "project",

    storiesPath: "project/stories",

    // Where are your custom steps
    stepsPath: "project/steps",

    reportPath: "records",

    // Archive stack length, default is false - no archive stack
    autoArchive: 100,

    consoleOutput: "step",

    outputSkipInfo: true,

    headlessChromium: false,

    browserSessionScope: "plan",

    newIncognitoContext: false,

    // Timeout (ms) for waiting xhr call response, default is 30000.
    xhrResponseTimeout: 10000,

    globalParams: 'project/params'
};