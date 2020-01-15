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
    'I go to url {url}': {
        args: [
            'url',
            'page',
            'config'
        ],
        doStep: async (url, page, config) => {
            await page.goto(url);
        }
    },
    'I click it {selector}': {
        args: [
            'selector',
            'page',
            'config'
        ],
        doStep: async (selector, page, config) => {
            await page.waitForSelector(selector, {
                visible: true,
                timeout: 1000
            });
            const elements = await page.$$(selector);
            page.evaluate(el => el.click(), elements[0]);
        }
    },
    'I click it {xpath}': {
        args: [
            'xpath',
            'page',
            'config'
        ],
        doStep: async (xpath, page, config) => {
            await page.waitForXPath(xpath, {
                visible: true,
                timeout: 1000
            });
            const elements = await page.$x(xpath);
            page.evaluate(el => el.click(), elements[0]);
        }
    },
    'I wait it {selector} is displayed': {
        args: [
            'selector',
            'page',
            'config'
        ],
        doStep: async (selector, page, config) => {
            await page.waitForSelector(selector, {
                visible: true,
                timeout: config.elementAppearTimeout
            });
        }
    },
    'I wait it {xpath} is displayed': {
        args: [
            'xpath',
            'page',
            'config'
        ],
        doStep: async (xpath, page, config) => {
            await page.waitForXPath(xpath, {
                visible: true,
                timeout: config.elementAppearTimeout
            });
        }
    },
    'I wait it {selector} is disappeared': {
        args: [
            'selector',
            'page',
            'config'
        ],
        doStep: async (selector, page, config) => {
            await page.waitForSelector(selector, {
                hidden: true,
                timeout: config.elementAppearTimeout
            });
        }
    },
    'I wait it {url} is responsed with status {status}': {
        args: [
            'url',
            'status',
            'page',
            'config'
        ],
        doStep: async (url, status, page, config) => {
            await page.waitForResponse(response => {
                return response.url().includes(url) && response.status() == status;
            });
        }
    },
    'I wait it {url} is sent with {httpMethod}': {
        args: [
            'url',
            'httpMethod',
            'page',
            'config'
        ],
        doStep: async (url, httpMethod, page, config) => {
            await page.waitForRequest(request => {
                return request.url().includes(url) && request.method() === httpMethod;
            });
        }
    },
    'I wait time {seconds} seconds': {
        args: [
            'seconds',
            'page',
            'config'
        ],
        doStep: async (seconds, page, config) => {
            await page.waitFor(seconds * 800);
        }
    },
    'I continue testing': {
        args: [
            'page',
            'config'
        ],
        doStep: (page, config) => {
            return true;
        }
    },
    'I wait all pending requests resolved': {
        args: [
            'page',
            'config'
        ],
        doStep: async (page, config) => {
            await page.pendingXHR.waitForAllXhrFinished();
        }
    },
    'I wait all pending requests resolved in seconds {seconds}': {
        args: [
            'seconds',
            'page',
            'config'
        ],
        doStep: async (seconds, page, config) => {
            await Promise.race([
                page.pendingXHR.waitForAllXhrFinished(),
                new Promise(resolve => {
                    setTimeout(resolve, seconds * 1000);
                })
            ]);
            const pendings = page.pendingXHR.pendingXhrCount();
            if (pendings > 0) {
                throw new TypeError(`Timeout for ${ pendings } requests pending`);
            }
        }
    },
    'I send request xhr {xhr}': {
        args: [
            'xhr',
            'page',
            'config'
        ],
        doStep: async (xhr, page, config) => {
            if (xhr && xhr.method && xhr.url) {
                await page.axios.request(xhr).then(resp => {
                    page['xhr'] = resp;
                    page['xhreq'] = xhr;
                }).catch(err => {
                    if (err.response) {
                        page['xhr'] = err.response;
                        page['xhreq'] = xhr;
                    } else {
                        return Promise.reject(err);
                    }
                }).finally(() => {
                });
            } else {
                throw new TypeError(`The XHR is not defined properly`);
            }
        }
    },
    'I do nothing': {
        args: [
            'page',
            'config'
        ],
        doStep: (page, config) => {
            return true;
        }
    },
    'I reset local storage': {
        args: [
            'selector',
            'page',
            'config'
        ],
        doStep: async (selector, page, config) => {
            await fs.writeFile();
        }
    },
    'I click button {selector}': {
        args: [
            'selector',
            'page',
            'config'
        ],
        doStep: async (selector, page, config) => {
            const button = await page.waitForXPath(selector, {
                visible: true,
                timeout: config.elementAppearTimeout
            });
            page.evaluate(el => el.click(), button);
        }
    },
    'I have seen it {selector} is displayed': {
        args: [
            'selector',
            'page',
            'config'
        ],
        doStep: async (selector, page, config) => {
            await page.waitForSelector(selector, {
                visible: true,
                timeout: config.elementAppearTimeout
            });
        }
    },
    'I have seen it {xpath} is displayed': {
        args: [
            'xpath',
            'page',
            'config'
        ],
        doStep: async (xpath, page, config) => {
            await page.waitForXPath(xpath, {
                visible: true,
                timeout: config.elementAppearTimeout
            });
        }
    },
    'I have opened url {url}': {
        args: [
            'url',
            'page',
            'config'
        ],
        doStep: async (url, page, config) => {
            await page.goto(url);
        }
    },
    'I move mouse hover on it {selector}': {
        args: [
            'selector',
            'page',
            'config'
        ],
        doStep: async (selector, page, config) => {
            const element = await page.$(selector);
            await element.hover();
        }
    },
    'I move mouse hover on it {xpath}': {
        args: [
            'xpath',
            'page',
            'config'
        ],
        doStep: async (xpath, page, config) => {
            const elements = await page.$x(xpath);
            await elements[0].hover();
        }
    }
};