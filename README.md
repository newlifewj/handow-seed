# Handow UAT Demo and Seed Project

```
$ npm install
```

```
$ npm run demostory
OR
$ npm run demoplan
```


```
$ npx handow --story project/stories/demostory
OR
$ npx handow --plan project/demoplan
```

```js
"use strict";

const handow = require('handow');
const storyPath = `${__dirname}/stories/demostory2.feature`;

handow.runStories(storyPath);   // Call Handow API run a story
```

```
npm run teststory
```
