'use strict';
const fs = require('fs');
const deepExtend = require('deep-extend');
const _ = require('lodash');
const expect = require('expect');
const Then = null;
const config = null;
const page = null;
const When = null;
const Given = null;
module.exports = {
    'I can see it {selector} is displayed': {
        args: [
            'selector',
            'page',
            'config'
        ],
        doStep: async (selector, page, config) => {
            const html = await page.$$eval(selector, elements => elements[0].outerHTML);
            expect(html).toBeDefined();
        }
    },
    'I can see it {xpath} is displayed': {
        args: [
            'xpath',
            'page',
            'config'
        ],
        doStep: async (xpath, page, config) => {
            await page.waitForXPath(xpath, {
                visible: true,
                timeout: 100
            });
            const elements = await page.$x(xpath);
            expect(elements[0]).toBeDefined();
        }
    },
    'I can see it {selector} is showing text {text}': {
        args: [
            'selector',
            'text',
            'page',
            'config'
        ],
        doStep: async (selector, text, page, config) => {
            const _text = await page.$eval(selector, el => el.innerText);
            expect(_text).toBe(text);
        }
    },
    'I can see it {xpath} is showing text {text}': {
        args: [
            'xpath',
            'text',
            'page',
            'config'
        ],
        doStep: async (xpath, text, page, config) => {
            const elements = await page.$x(xpath);
            const prop = await elements[0].getProperty('innerText');
            expect(prop.toString().includes(text)).toBe(true);
        }
    },
    'I can see it {selector} is disappered': {
        args: [
            'selector',
            'page',
            'config'
        ],
        doStep: async (selector, page, config) => {
            let html;
            try {
                html = await page.$$eval(selector, elements => elements[0].outerHTML);
            } catch (e) {
                html = null;
            }
            expect(html).toBeNull();
        }
    },
    'I can see it {selector} is enabled': {
        args: [
            'selector',
            'page',
            'config'
        ],
        doStep: async (selector, page, config) => {
            const attr = await page.$$eval(`${ selector }`, elements => elements[0].disabled);
            expect(attr).not.toBeDefined();
        }
    },
    'I can see it {selector} is disabled': {
        args: [
            'selector',
            'page',
            'config'
        ],
        doStep: async (selector, page, config) => {
            const attr = await page.$$eval(`${ selector }`, elements => elements[0].disabled);
            expect(attr).toBeDefined();
        }
    },
    'I finished': {
        args: [
            'page',
            'config'
        ],
        doStep: async (page, config) => {
            expect(true).toBe(true);
        }
    },
    'I see the address is url{url}': {
        args: [
            'url',
            'page',
            'config'
        ],
        doStep: async (url, page, config) => {
            const addr = await page.url();
            expect(addr).toBe(url);
        }
    },
    'I can see cookies {cookies} exist': {
        args: [
            'cookies',
            'page',
            'config'
        ],
        doStep: async (cookies, page, config) => {
            const existedCookies = await page.cookies();
            const _cookies = cookies.split(',');
            const _existedCookies = existedCookies.map((ck, index) => {
                return ck.name.trim();
            });
            for (const name of cookies) {
                if (_existedCookies.indexOf(name.trim()) === -1) {
                    throw new TypeError(`Failed on Expecting ${ name } included in ${ _existedCookies.join(',') }`);
                }
            }
            return true;
        }
    },
    'I received response with status {status} HTTP status': {
        args: [
            'status',
            'page',
            'config'
        ],
        doStep: (status, page, config) => {
            expect(page.xhr.status).toBe(status);
        }
    },
    'I received response with data {data}': {
        args: [
            'data',
            'page',
            'config'
        ],
        doStep: (data, page, config) => {
            let _model = deepExtend({}, page.xhr.data);
            _model = deepExtend(_model, data);
            if (!_.isEqualWith(page.xhr.data, _model)) {
                page.errAttachment = JSON.stringify(data, null, 4);
                throw TypeError(`Received xhr response is not matching the following expected object`);
            }
        }
    },
    'I am ok': {
        args: [
            'page',
            'config'
        ],
        doStep: (page, config) => {
        }
    },
    'I can see it {selector} is showing html {html}': {
        args: [
            'selector',
            'html',
            'page',
            'config'
        ],
        doStep: async (selector, html, page, config) => {
            const _html = await page.$eval(selector, el => el.innerHTML);
            expect(_html).toBe(html);
        }
    },
    'I can see it {selector} is showing content {content}': {
        args: [
            'selector',
            'content',
            'page',
            'config'
        ],
        doStep: async (selector, content, page, config) => {
            const _text = await page.$eval(selector, el => el.innerText);
            expect(_text).toBe(content);
        }
    }
};