# Create E2E Test Project with *handow-seed*

Clone the *handow-seed* project to create a full-featured E2E test application. [Living Demo](http://demo.shm.handow.org/reports)

+ Test engine is driven by **[Playwright](https://playwright.dev/)**
+ Built-in test steps library
+ Test server (SHM) with management UI and reports renderers
+ Demos

Then developers just need add new test stories, plans and run the E2E test locally or deploy the test server to cloud.

[More details](https://github.com/newlifewj/handow-seed/wiki)

## Install

Make sure [Node.js](https://nodejs.org/en/download/) has been installed to your local machine, versions >=12.0.0 && <15.0.0' are recommended).

Install dependencies in the project root:

```
$ npm install
```
> Run command with 'sudo' in Linux machine, e.g., 'sudo npm instal'.

> Installation need minutes because the Chromium, Firefox and Webkit browsers are instantiated to your local machine.

Then verify the E2E application by launching the test server locally:

```bash
$ npm start
```

The SHM UI is opened automatically by the default browser of current machine, users can investigate more details by naviagting to differnt dashboards. [Getting Start](https://github.com/newlifewj/handow-seed/wiki/Getting-Start)

> The SHM UI is opened with _http://localhost:3333_ by default, force reload it if it is a blank view.


## Resources

[Documentation](https://github.com/newlifewj/handow-seed/wiki)

The Handow test engine project on Github [handow](https://github.com/newlifewj/handow)

The Handow test server repository on NPM [handow-shm](https://www.npmjs.com/package/handow-shm)

The Handow engin repository on NPM [handow](https://www.npmjs.com/package/handow)

## License

MIT
