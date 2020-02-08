"use strict";

const Given = null;
const When = null;
const Then = null;
const page = null;
let config;

const expect = require('expect');
const fs = require('fs');
const deepExtend = require('deep-extend');

Then("I am okay", async() => {
    await page.waitFor( 100 );
});


Then("I can see them {xpath} sorted by order {order}", async (xpath, order) => {
    await page.waitForXPath(xpath, { visible: true, timeout: 100 });

    // Here elements are JSHandle object array
    const elements = await page.$x( xpath );

    /* Not working, got Promise object
    const testArray = elements.map( async (el) => await el.getProperty('innerText') );
    */

    /* Not working too, got "JSHandle:<text>" pairs array
    const textArray = [];
    for(const element of elements ) {
        textArray.push( await element.getProperty('innerText') );
    }
    */

    /* Working now !!!
    const _textArray = [];
    for(const element of elements ) {
        _textArray.push( await (await element.getProperty('innerText')).jsonValue() );
    }
    */

    const textArray = [];
    for(const element of elements ) {
        textArray.push( await page.evaluate( el => el['innerText'], element ) )     // getProperty() not a method??
    }

    const _order = order.toLowerCase();

    if (_order == "asc" || _order == "ascending" || _order == "ascend") {
        const _ta = [ ...textArray ];
        expect(textArray).toEqual(_ta.sort());

    } else if (_order == "desc" || _order == "descending" || _order == "descend") {
        const _ta = [ ...textArray ];
        expect(textArray).toEqual(_ta.sort().reverse());

    } else {
        expect(order).toEqual("valid ascending or descending keyword");
    }
});

Then("I can see them {xpath} amount number {number}", async (xpath, number) => {
    await page.waitForXPath(xpath, { visible: true, timeout: 100 });
    const elements = await page.$x( xpath );

    expect(elements.length).toEqual(number);
});

Then("I can see it {xpath} is showing text {text}", async (xpath, text) => {
    /**
     * pptr use $eval evaalute selector, then get the text result, but can not do it on xpath.
     * Here we get 'JSHandles' after $x(xpath), it is JavaScript references.
     * Call getProperty() to get an object, and then exteact text by toString().
     * However, the text of the property object includes other extra strings like "JSHandle:[actual-text]".
     * That's why we have to use 'includes()' instead of equal compare.
     */
    const elements = await page.$x( xpath );

    // this got JSHandle:<text> pairs, not the text -- 2020/02/08
    // const prop = await elements[0].getProperty('innerText');
    
    const prop = await (await elements[0].getProperty('innerText')).jsonValue();
    expect(prop.trim()).toEqual(text.trim());
});