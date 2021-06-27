# Create E2E Test Project with *handow-seed*

Clone the *handow-seed* project to create a full-featured E2E test application. [Living Demo](http://demo.shm.handow.org/reports)

+ The test engine is driven by **[Playwright](https://playwright.dev/)**
+ Built-in test steps library
+ The test server with management UI and reports renderers
+ Demos

Then developers just need add new test stories, plans and run the E2E test locally or deploy the test server to cloud.

[More details](https://github.com/newlifewj/handow-seed/wiki)

## Install

Make sure [Node.js](https://nodejs.org/en/download/) has been installed to your local machine, versions >=12.0.0 && <15.0.0' are recommended).

Install dependencies in the project root:

```
$ npm install
```

> Installation need minutes because the Chromium, Firefox and Webkit browsers are instantiated to your local machine.

Then verify the E2E application by launching the test server locally:

```bash
$ npm start
```

The Handow test engine project on Github [handow](https://github.com/newlifewj/handow)

The Handow test server repository on NPM [handow-shm](https://www.npmjs.com/package/handow-shm)

The Handow engin repository on NPM [handow](https://www.npmjs.com/package/handow)

## License

MIT
