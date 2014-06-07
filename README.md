alright
=======

[![Build Status](https://secure.travis-ci.org/hifivejs/alright.png?branch=master)](https://travis-ci.org/hifivejs/alright)
[![NPM version](https://badge.fury.io/js/alright.png)](http://badge.fury.io/js/alright)
[![Dependencies Status](https://david-dm.org/hifivejs/alright.png)](https://david-dm.org/hifivejs/alright)
[![stable](http://badges.github.io/stability-badges/dist/stable.svg)](http://github.com/badges/stability-badges)

[![browser support](http://ci.testling.com/hifivejs/alright.png)](http://ci.testling.com/hifivejs/alright)


Beautiful assertion library.


## Philosophy

  - **Straight-forward**: Alright should get out of your way and just let you
    define your tests with what you already know: plain JavaScript.

  - **No verbosity**: We don't want `expect(x).to.eventually.be.boring...`

  - **Helpful error messages**: When things go wrong, Alright should do its
    best to show you exactly what's wrong and how you might fix it.

  - **Test-framework agnostic**: Alright should work with anything that expect
    Errors to be thrown when assertions fail.

  - **Extensible**: It should be easy to extend the built-in assertions with
    plain JavaScript.

  - **Work with older Browsers**: Some people still need to support old IEs,
    Alright should work on them.


## Example

Using the Sweet.js macros:

```js
// for macros to work, you need to use 'alright' as your identifier
var alright = require('alright')

// simple assertions
add(a)(b) => a + b
add(a)(b) => not a + b

// anything goes assertions
add(a)(b) should equal(a + b)
add(a)(b) should not equal(a + b)

// asynchronous assertions with pure fantasy-land monads, or Promises/A+
asyncAdd(a)(b) will equal(a + b)
asyncAdd(a)(b) will not equal(a + b)
```

Using vanilla JavaScript:

```js
var _ = require('alright')

// Use verify for synchronous assertions
_.verify(add(a)(b))(_.equals(a + b))
_.verify(add(a)(b))(_.not(_.equals(a + b)))

// use verifyFuture for monadic Futures, and verifyPromise for Promises/A+
_.verifyMonad(asyncAdd(a)(b))(_.equals(a + b))
```


## Installing

The easiest way is to grab it from NPM. If you're running in a Browser
environment, you can use [Browserify][]

    $ npm install alright


### Using with CommonJS

If you're not using NPM, [Download the latest release][release], and require
the `alright.umd.js` file:

```js
var Alright = require('alright')
```


### Using with AMD

[Download the latest release][release], and require the `alright.umd.js`
file:

```js
require(['alright'], function(Alright) {
  ( ... )
})
```


### Using without modules

[Download the latest release][release], and load the `alright.umd.js`
file. The properties are exposed in the global `Alright` object:

```html
<script src="/path/to/alright.umd.js"></script>
```


### Compiling from source

If you want to compile this library from the source, you'll need [Git][],
[Make][], [Node.js][], and run the following commands:

    $ git clone git://github.com/hifivejs/alright.git
    $ cd alright
    $ npm install
    $ make bundle
    
This will generate the `dist/alright.umd.js` file, which you can load in
any JavaScript environment.

    
## Documentation

You can [read the documentation online][docs] or build it yourself:

    $ git clone git://github.com/hifivejs/alright.git
    $ cd alright
    $ npm install
    $ make documentation

Then open the file `docs/index.html` in your browser.


## Platform support

This library assumes an ES5 environment, but can be easily supported in ES3
platforms by the use of shims. Just include [es5-shim][] :)


## Licence

Copyright (c) 2014 Quildreen Motta.

Released under the [MIT licence](https://github.com/hifivejs/alright/blob/master/LICENCE).

<!-- links -->
[Fantasy Land]: https://github.com/fantasyland/fantasy-land
[Browserify]: http://browserify.org/
[Git]: http://git-scm.com/
[Make]: http://www.gnu.org/software/make/
[Node.js]: http://nodejs.org/
[es5-shim]: https://github.com/kriskowal/es5-shim
[docs]: http://alright.readthedocs.org/
<!-- [release: https://github.com/hifivejs/alright/releases/download/v$VERSION/alright-$VERSION.tar.gz] -->
[release]: https://github.com/hifivejs/alright/releases/download/v1.0.0-alpha2/alright-1.0.0-alpha2.tar.gz
<!-- [/release] -->
