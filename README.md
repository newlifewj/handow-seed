## Handow UAT Demo and Seed Project

[Handow on NPM repository](https://www.npmjs.com/package/handow)
[handow-coreproject on Github](https://github.com/newlifewj/handow-core)

The project provide live UAT samples to demo how to implement Handow. It is part of [Hoandow Documentation](http://www.handow.org/documents), and also a template to scaffold a Handow UAT project. Clone the project and refactor it as an UAT for any webapp E2E test.

### Install

Clone this project and make sure [Node.js](https://nodejs.org/en/download/) has been installed to your local machine. The project has only one dependency right now - **handow**, which is added to _package.json_ already. Install it from the project root path:

```
$ npm install
```

> Install need minutes because Handow will install Chromium to you local machine.

### Project and running

Demos have been added to NPM runner.

```json
"scripts": {
    "basic_1": "handow --story project/stories/basic_1.feature",
    "basic_2": "handow --story project/stories/basic_2.feature",
    "form_1": "handow --buildstep && handow --story project/stories/form_1.feature",
    "table": "handow --buildstep && handow --story project/stories/table.feature",
    "xhr": "handow --buildstep && handow --story project/stories/xhr_cookie.feature",
    "labPlan_1": "handow --buildstep && handow --plan project/labPlan_1",
    "labPlan_2": "handow --buildstep && handow --plan project/labPlan_2",
    "demostory": "handow --story project/stories/demostory",
    "demostory1": "handow --story project/stories/demostory1",
    "demostory2": "handow --story project/stories/demostory2",
    "demoplan": "handow --plan project/demoplan",
    "buildstep": "handow --buildstep",
    "parsestory": "handow --parsestory",
    "handow": "handow",
    "teststory": "node ./project/test.js"
}
```

Run the demo task with _**\> npm run \[task\]**_. e.g.

```bash
$ npm run lanPlan_1
```

Can also run plan or story with Handow CLI directly, e.g.

```bash
npx handow --story project/stories/demostory
```

OR

```bash
npx handow --paln project/labPlan_2
```

### Handow documentation

Most stories and plans are lab demos of [Handow Site](http://www.handow.org), reading relevant chapters for more details.
