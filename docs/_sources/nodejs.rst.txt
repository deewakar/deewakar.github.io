=======
Node JS
=======

.. raw:: org

   #+FILETAGS: nodejs:programming:wiki

.. raw:: org

   #+STARTUP: inlineimages 

Online resources to learn nodejs (beginner)
===========================================

https://nodejs.org/en/docs/
---------------------------

https://nodeschool.io
---------------------

https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs
-------------------------------------------------------------------------

Basics
======

Some practical globals in Node are:
-----------------------------------

global: like the 'window' in the browser
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

\_\ :sub:`dirname` and \_\ :sub:`filename` (not available in ES modules): strings that points to the current directory and filename
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

process: An object that contains all the context about the current program e.g. the environment vars
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

exports, module, require: related to the nodejs modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Modules:
--------

There are two types of modules in nodejs, the older commonjs type and the newer es modules type.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Commonjs type modules uses 'module.exports' and 'require' functions.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ES modules uses import and export statements like shown below:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: javascript


   // utils.js
   export const action = () => {
       // my useful function
   }

   export const run = () => {
       // my another useful function
   }

   // app.js
   // don't forget the braces as they are required for named imports
   import {action, run} from './utils.js';

If we want export only one bit of code, then we can use the default keyword
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: javascript


   // utils.js
   // one module can only have one default export but many named exports
   default export const action = () => {
       // my useful function
   }

   // In app.js, we can use whatever name we want to call the default import
   // and we can omit the braces
   import whatever from './utils.js';

To use ES modules in node we either need to use the .mjs file extension on all files that use import or export statemetns or put 'type': 'module' in the package.json file.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

File System (fs module):
------------------------

The 'fs' module gives access to many functions related to accessing and modifying files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It has asynchronous versions (uses callbacks) and synchronous versions of functions, where synchronous ones have 'sync' suffixes e.g. readFileSync
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can also use asynchronous versions of same functions that return promises from 'fs/promises' submodule
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can use the async/await feature with these promisified functions.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can't access \_\ :sub:`filename` and \_\ :sub:`dirname` globals in ES modules, so alternatively we can use 'import.meta.url' constant which gives the current filename and \`path.dirname(import.meta.url)\` gives the directory.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Error handling:
---------------

Node supports try,catch,throw statements in synchronous and async/await code.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: javascript

   try {
     const result = await asyncAction();
   } catch (e) {
     // handler error
   }

For callback style code, we can use if/else statements to handle error as shown below:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: javascript

   fs.readFile(filePath, (error, result) => {
     if(error) {
       // handle error
     } else {
       // do your work
     }
   });

For promises, we can use .catch() pattern to handle the error
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: javascript

   const promise1 = new Promise((resolve, reject) => {
     throw 'Uh-oh!';
   });

   promise1.catch((error) => {
     console.error(error);
   });

Packages
========

To use packages in node, our code itself should be a package, i.e. it should have a valid package.json file in the directory
----------------------------------------------------------------------------------------------------------------------------

package.json file contains basic information about the project like name, version, scripts, dependencies etc.
-------------------------------------------------------------------------------------------------------------

.. code:: javascript

   // A sample package.json file
   {
   "name": "app",
   "version": "1.0.0",
   "description": "My simple nodejs app",
   "main": "index.js", // entry point of our package
   "scripts": {
     "test": "echo \"Error: no test specified\" && exit 1 "
   },
   "author": "",
   "license": "ISC"
   }

'scripts' field in package.json specify any custom scripts that we might want to run and includes any simple shell command or nodejs scripts
--------------------------------------------------------------------------------------------------------------------------------------------

To run any script we need to type: "npm run myscript"
-----------------------------------------------------

We can install any external packages with "npm install or npm -i" and uninstall packages with 'npm uninstall'
-------------------------------------------------------------------------------------------------------------

The '-g' flag installs/uninstalls the package globally
------------------------------------------------------

'–save' flag makes sure that the packages installed in the project are inserted inside the 'dependencies' field in the package.json file
----------------------------------------------------------------------------------------------------------------------------------------

'–save-dev' flag inserts it in the devDependencies field of package.json
------------------------------------------------------------------------

Dependencies are packages needed to make our package functional, while dev-dependencies are packages we require just for the development purposes
-------------------------------------------------------------------------------------------------------------------------------------------------

The package-lock.json file is automatically generated by npm after an 'npm install'
-----------------------------------------------------------------------------------

It contains the exact versions of each packages installed inside the node\ :sub:`modules`
-----------------------------------------------------------------------------------------

It allows to download the same dependencies in the future without saving the whole node\ :sub:`modules` folder in version management systems.
---------------------------------------------------------------------------------------------------------------------------------------------

We can use the command 'npm clean-install' or 'npm ci' to install the dependencies according to the package-lock.json file.
---------------------------------------------------------------------------------------------------------------------------

It allows us to time-travel to a past state of node\ :sub:`modules` by checking out the older git branch and running the 'npm ci' command.
------------------------------------------------------------------------------------------------------------------------------------------

Servers
=======

Creating servers the hard way – 'http' module
---------------------------------------------

.. code:: javascript


   // import the internal http module
   import http from "http";

   // create a server
   const myserver = http.createServer((req, res) => {
     if (req.method === "POST") {
       let body = "";
       // setup event listener for receiving data
       req.on("data", (chunk) => {
         body += chunk.toString();
       });

       // when the request ends
       req.on("end", () => {
         // send the '201: created success' status code
         res.writeHead(201);
         // send some text as the body of the response to the client
         res.end("Hello, you posted something!");

         // log the data sent by the user
         console.log(`User sent this: ${body}`);
       });
     } else {
       // send the '200: OK success' status code
       res.writeHead(200);
       // send some text in response to the user's GET request
       res.end('Hello, did you "Get" me?');
     }
   });

   myserver.listen(3000, "localhost", () => {
     console.log("Server is listening on port 3000.");
   });

The 'express' framework
-----------------------

.. code:: javascript


   import express from "express"; // for creating server and routes
   import morgan from "morgan"; // request logger middleware

   const app = express();

   // setup middlewares to use
   // the express.urlencoded middleware helps us parse request payloads if it is embedded in the url itself i.e. content_type:application/x-www-form-urlencoded
   // the extended property allows us to parse requests that are complex than strings or arrays like nested objects etc.
   app.use(express.urlencoded({ extended: true }));

   // the express.json middleware helps us access the request if it is in json form
   //app.use(express.json());

   // for logging
   app.use(morgan("dev"));

   // routes our api exposes
   app.post("/", (req, res) => {
     res.writeHead(201);
     res.end("Hello, you posted something!");
     console.log(req.body);
   });

   app.get("/", (req, res) => {
     res.writeHead(200);
     res.end('Hello, did you "Get" me?');
   });

   // listen at port 3000
   app.listen(3000, () => {
     console.log("Server listening on: http://localhost:3000");
   });

Testing
=======

Using 'assert' module
---------------------

Using 'Jest' testing library
----------------------------

Deployment
==========
