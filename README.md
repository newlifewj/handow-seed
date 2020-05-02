## E2E Test Project With Handow And Handow-SHM

Clone this project as a seed or demo. It is a template to scaffold an E2E test (UAT) system basing on Handow and Handow-SHM.

[Hoandow Documentation](http://www.handow.org/documents)
(Or refer the brief intrudction [Handow and Handow-SHM](http://www.handow.org/documents/Handow_And_SHM))

### Summary

The project is a Handow implementation plus a comprehensive web server and powerfull UI, tgether with sample files. You can start a Handow UAT project basing on this seed.

+ Run the demos to see **Handow** and **Handow-SHM** running.
+ Use it as local tool to develop the Handow test project.
+ Use it as local tool to test target web application.
+ Deploy it as a test server and even join it into your CI/CD pipeline.

[Super-Handow-Managerment Hand Book](http://www.handow.org/documents/SHM_Hand_Book)

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

You can launch the Handow-SHM server to run test demos or just run them by CLI.

#### SHM running Examples

Mostly you want use SHM to manage Handow.

```bash
$ npm start
```

Run SHM server locally in _development-public_ mode, output log messages to console and the UI is opening when server startup. There isn't permission control when SHM server run in public mode.

```bash
$ npm run private
```

Run SHM server locally in _production-private_ mode, users need signin to access SHM. Address browser "_localhost:3333/_" to open the UI. There are 2 users existed already.

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

You can also call Handow CLI to run test story and plans, running info showing on console and the reports are presented by Handow built-in renderer.

```bash
$ npm run hdw-lab-plan
```

Run a test plan. You can modify the script to run others existed demo plans (in '/project' directory).

```bash
$ npm run hdw-form-story
```

Run a single test story. You can modify the command to run others existed demo story (in '/project/stories' directory).

```bash
$ npm run hdw-buildstep
$ npm run hdw-parsestory
```

Run Handow internal task. Properly you need versify the Handow APIs when you want use Handow as a module in your own application.

```bash
$ npm run hdw
```

Print Handow CLI help info.

> [The test target web app in demo stories](http://www.handow.org/lab)

### About Handow and Handow-SHM

Handow is an E2E test tool basing on Puppeteer driver, it is an Open Source Project under MIT license.
Handow-SHM is a test server with SPA UI to manage Handow impelmentation.

[Handow Site](http://www.handow.org)
