## E2E Test Project With Handow And Handow-SHM

[Online Demo](http://demo.shm.handow.org/)

Clone this project as a seed or demo. It is a template to scaffold an E2E test (UAT) system basing on Handow and Handow-SHM.

[Hoandow Documentation](http://www.handow.org/documents)
(Or refer the brief intrudction [Handow and Handow-SHM](http://www.handow.org/documents/Handow_HandowSHM))

### Summary

The project is a Handow implementation plus a comprehensive web server and powerfull UI, tgether with sample files. You can start a Handow UAT project basing on this seed.

+ Run the demos to see **Handow** and **Handow-SHM** running.
+ Use it as local tool to develop the Handow test project.
+ Use it as local tool to test target web application.
+ Deploy it as a test server and even join it into your CI/CD pipeline.

[Super-Handow-Managerment Hand Book](http://www.handow.org/documents/HandbookSHM)

### Install

Make sure [Node.js](https://nodejs.org/en/download/) has been installed to your local machine. Install dependencies under the project root path:

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
        "hdw-form-story": "handow --buildstep && handow --story project/stories/form_1.feature",
        "hdw-lab-plan": "handow --buildstep && handow --plan project/HandowLab",
        "hdw-buildstep": "handow --buildstep",
        "hdw-parsestory": "handow --parsestory project/stories/Table.feature",
        "hdw": "handow"
    }
```

Launch the Handow-SHM server to run test demos or just run them with Handow CLI.

#### SHM running Examples

Mostly you want use SHM to manage Handow.

```bash
$ npm start
```

Run SHM server locally in _development-public_ mode, messages/errors are logged to console, and the UI is opened when server startup. No permission control when SHM server run in _development-public_ mode.

```bash
$ npm run private
```

Run SHM server locally in _production-private_ mode, users need signin to access SHM. Address browser "_localhost:3333/_" to open the UI. There are 2 users are registered already in _shmSetting.json_.

+ admin | admin (username | password) with "ADMIN" role
+ user | user (username | password) with "USER" role

```bash
$ npm run secure
```

Run SHM server locally in _production-secure_ mode. All users are "USER" by default, "ADMIN" need signin to get the privilege permissions.

```bash
$ npm run public
```

Run SHM server locally in _production-public_ mode. Everybody is "ADMIN" without signin.

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

run a specific story

```bash
$ npx handow --plan --/project/HandowLab
```
run a plan

```
Or you can also define npm scripts to call Handow CLI as examples in _package.json_
```

> Strong recommend using SHM as test runner to get updated report render with good user experience.

### Deploy project as remote test server

[Deploy SHM on cloud](http://www.handow.org/documents/DeploySHMOnCloud)

### About Handow and Handow-SHM

**Handow** is an E2E test tool basing on Puppeteer driver, it is an Open Source Project under **MIT** license.

**Handow-SHM** is a test server with SPA UI to manage Handow impelmentation.

[Handow Site](http://www.handow.org)

[The test target web app in demo stories](http://www.handow.org/lab)
