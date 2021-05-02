## E2E Test Project With Handow And Handow-SHM

[Online Demo](http://demo.shm.handow.org/)

Clone this project as a seed or demo. It is a template to scaffold an E2E test (UAT) system basing on Handow and Handow-SHM.

[Hoandow Documentation](http://www.handow.org/documents)
(Or refer the brief intrudction [Handow and Handow-SHM](http://www.handow.org/documents/Handow_HandowSHM))

### Summary

The project is a Handow implementation plus a comprehensive web server and powerfull UI, together with sample source files. You can start a Handow UAT project basing on this seed.

+ Demo **Handow CLI** and **Handow-SHM** running.
+ Use it as local tool to develop the Handow test project.
+ Use it as local tool to test target web application.
+ Deploy it as a test server and even join it into your CI/CD pipeline.

[Super-Handow-Managerment Hand Book](http://www.handow.org/documents/HandbookSHM)

### Install

Make sure [Node.js](https://nodejs.org/en/download/) has been installed to your local machine, version >=12.0.0 and <15.0.0 is recommended).

Install dependencies in the project root:

```
$ npm install
```

> Installation need minutes because Handow will load a Chromium instance to your local machine.

### Run demos

Script commans are defined in _package.json_:

```json
"scripts": {
        "start": "cross-env NODE_ENV=development SHM_MODE=public OPEN_BROWSER=true handow-shm",
        "public": "cross-env NODE_ENV=production SHM_MODE=public handow-shm",
        "secure": "cross-env NODE_ENV=production SHM_MODE=secure handow-shm",
        "private": "cross-env NODE_ENV=production SHM_MODE=private handow-shm",
        "hdw-lab-plan": "handow --buildstep && handow --plan project/HandowLab",
        "hdw-buildstep": "handow --buildstep",
        "hdw-parsestory": "handow --parsestory project/stories/table.feature",
        "basic_1": "handow --story -- project/stories/basic_1.feature",
        "basic_2": "handow --story -- project/stories/basic_2.feature",
        "form_1": "handow --buildstep && handow --story project/stories/form_1.feature",
        "table": "handow --buildstep && handow --story project/stories/table.feature",
        "hdw-help": "handow --help"
    }
```

Launch the Handow-SHM server to run test demos or just run them with Handow CLI.

#### SHM running Examples

Mostly you want use SHM to manage the Handow testing.

```bash
$ npm start
```

Run SHM server locally in _development-public_ mode, messages/errors are logged to console, and the UI is opened by your default browser. No permission control when the SHM server run in _development-public_ mode.

```bash
$ npm run private
```

Run SHM server locally in _production-private_ mode, users need signin to access SHM. Address browser "_localhost:3333/_" to open the UI. Two users have been registered already in _shmSetting.json_.

+ admin | admin (username | password) with **admin** role
+ user | user (username | password) with **user** role

```bash
$ npm run secure
```

Run SHM server locally in _production-secure_ mode. All visitors are **user** by default, the **admin** user need to sign up to get the privilege permissions.

```bash
$ npm run public
```

Run SHM server locally in _production-public_ mode, all visitors are **admin** by default.

#### Hnadow CLI Examples

```bash
npx handow --help
```
Show Handow CLI help

```bash
$ npx handow --buildsteps
```

Rebuild all step files

```bash
$ npx handow --parsestory --/project/stories/table.feature
```

Parse a specific story file

```bash
$ npx handow --story --/project/stories/table.feature
```

run a specific story and generate report

```bash
$ npx handow --plan --/project/HandowLab
```
run a plan and generate report


### About Handow and Handow-SHM

**Handow** is an E2E test tool basing on Puppeteer driver, it is an Open Source Project under **MIT** license.

**Handow-SHM** is a test server with SPA UI to manage Handow test impelmentations.

[Handow Site](http://www.handow.org)

[The test target web app in demo](http://www.handow.org/lab)
