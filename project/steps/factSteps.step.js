"use strict";

const Given = null;
const When = null;
const Then = null;
const page = null;
let config;

const expect = require('expect');
const fs = require('fs');
const deepExtend = require('deep-extend');

Then("the cookie {cookiename} with value {value} available in current page", async (cookiename, value) => {
    const existedCookies = await page.cookies();
    let isCookieFound = false

    for( const _cookie of existedCookies ) {
        if ( _cookie.name == cookiename && _cookie.value == value ) {
            return true
        } else if ( _cookie.name == cookiename && _cookie.value != value ) {
            throw new TypeError(`Found cookie ${_cookie.name} with value ${_cookie.value}, but expected ${value}`);
            break;
        }
    }

    throw new TypeError(`Not found cookie ${_cookie.name}`);
})


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

