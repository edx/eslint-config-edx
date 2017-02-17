## `eslint-config-edx-es5`
[![npm version](https://badge.fury.io/js/eslint-config-edx-es5.svg)](https://badge.fury.io/js/eslint-config-edx-es5)

This is the edX ESLint shareable config for linting ES5 JavaScript. See [`eslint-config-edx`](https://npmjs.com/package/eslint-config-edx) if you need to lint ES2015+ code.

Note that versions of this config prior to v2.0.0 are INCOMPATIBLE with eslint-config-edx.

edX maintains high-level documentation on the [Open edX Developer's Guide](http://edx.readthedocs.io/projects/edx-developer-guide/en/latest/user_interface_development.html?highlight=ux#adding-a-ui-page) on how we write new JavaScript features, including our use of RequireJS, Underscore and Backbone. This document seeks to be a lower-level guide on the semantics of how we write ES5 JavaScript, including nuts and bolts about spacing, syntax, and variable naming.

For the most part, edX follows the thoroughly documented [Airbnb JavaScript Style Guide for ES5](https://github.com/airbnb/javascript/tree/es5-deprecated/es5). Airbnb's JavaScript style is becoming the community standard, and their `eslint-config-airbnb` is the most-downloaded ESLint config on NPM. Because the main Airbnb ESLint config assumes use of ES6, and edX's JavaScript is primarily written in ES5, this config is an extension of `eslint-config-airbnb-base/legacy`, Airbnb's styleguide for ES5. Some of our rules also reference the [Airbnb ES6 styleguide](http://airbnb.io/javascript/), the more modern and currently supported version.

In addition to the base Airbnb rules, edX adds or extends several of our own. They are described below.

####[`dollar-sign`](https://github.com/erikdesjardins/eslint-plugin-dollar-sign)
- **Setting**: `["error", "ignoreProperties"]`
- **Explanation**: All variables that represent jQuery objects should be named starting with a `$`. Object properties may ignore this rule.
- **Example**:

    ```javascript
    // Correct pattern
    var $fooSpan = $('span#foo');

    var ignoreProps = {};
    ignoreProps.fooSpan = $('span#foo');

    // Linter error
    var fooSpan = $('span#foo');
    ```

####[`func-names`](http://eslint.org/docs/rules/func-names)
- **Setting**: `"off"`
- **Explanation**: Ignore this rule, it doesn't play nicely with RequireJS code.

####[`indent`](http://eslint.org/docs/rules/indent)
- **Setting**: `["error", 4]`
- **Explanation**: edX is standardized on indenting all code with four spaces. The JavaScript community generally prefers two spaces; edX uses four because of our use of Python (see [PEP8](https://www.python.org/dev/peps/pep-0008/)) and the desire to have consistency in our codebases.
- **Example**:

	```javascript
	// Correct pattern
	var example = function() {
	    if (numberOfSpaces !== 4) {
	        throw new Error('Use four spaces for indentation.');
	    }
	};
	```

####[`max-len`](http://eslint.org/docs/rules/max-len)
- **Setting**: `["error", 120]`
- **Explanation**: Use a maximum of 120 characters on a line. (The Airbnb default is 100, which we feel is too low.)

####[`new-cap`](http://eslint.org/docs/rules/new-cap)
- **Setting**: `"off"`
- **Explanation**: Disable the rule stating functions can only start with a capital letter if they are constructors.
- **Example**:

    ```javascript
    // Correct pattern
    var htmlFoo = HtmlUtils.HTML('foo');
    ```

####[`no-else-return`](http://eslint.org/docs/rules/no-else-return)
- **Setting**: `"off"`
- **Explanation**: An `else` block after an `if` which contains a `return` is allowed. Technically the `else` is redundant (and Airbnb disallows it), but this rule allows for more readable control flow.
- **Example**:

    ```javascript
    // Correct pattern
    if (fooString === 'foo') {
        return 30;
    } else {
        return 50;
    }
    ```

####[`no-shadow`](http://eslint.org/docs/rules/no-shadow)
- **Setting**: `"error"`
- **Explanation**: Do not redefine variables in a child scope that are already declared in the upper scope.
- **Example**:

    ```javascript
    // Linter error
    var foo = 'bar';
    if (fizz) {
        var foo = 'buzz';
    }
    ```

####[`object-curly-spacing`](http://eslint.org/docs/rules/object-curly-spacing)
- **Setting**: `["error", "never"]`
- **Explanation**: Do not insert extra spaces inside of curly brackets.
- **Example**:

    ```javascript
    // Correct pattern
    var obj = {foo: 42};

    // Linter error
    var obj2 = { foo: 42 };
    ```

####[`one-var`](http://eslint.org/docs/rules/one-var)
- **Setting**: `"off"`
- **Explanation**: Declare all variables at the top of your scope. You may use a single `var` statement (separating declarations by commas and newlines), or you may use multiple `var` statements. Just don't initialize multiple variables per line (see next rule).
- **Example**:

    ```javascript
    // All correct patterns
    function() {
        var foo, bar, baz,
            fizz = 'buzz',
            foz = 49;

        if (fizz) {
            // No more variable declarations below
        }
    }

    function() {
        var foo, bar, baz;
        var fizz = 'buzz',
            foz = 49;

        if (fizz) {
            // No more variable declarations below
        }
    }

    function() {
        var foo;
        var bar;
        var baz;
        var fizz = 'buzz';
        var foz = 49;

        if (fizz) {
            // No more variable declarations below
        }
    }
    ```

####[`one-var-declaration-per-line`](http://eslint.org/docs/rules/one-var-declaration-per-line)
- **Setting**: `["error", "initializations"]`
- **Explanation**: Variables that are not initialized can be declared on the same line. Only one initialization is allowed per line.
- **Example**:

    ```javascript
    // Correct pattern
    var foo, bar,
        fizz = 'buzz',
        fozz = 'bizz';

    // Linter error
    var foo, bar, fizz = 'buzz', fozz = 'bizz';
    ```

####[`space-before-function-paren`](http://eslint.org/docs/rules/space-before-function-paren)
- **Setting**: `["error", "never"]`
- **Explanation**: Do not add a space between a function and the opening parentheses containing its arguments, whether the function is anonymous or named.
- **Example**:

    ```javascript
    // Correct patterns
    function foo(arg) {

    }

    var bar = function() {

    };

    // Linter errors
    function foo (arg) {

    }

    var bar = function () {

    };
    ```

####[`strict`](http://eslint.org/docs/rules/strict)
- **Setting**: `["error", "safe"]`
- **Explanation**: If you're writing code that will run in the browser (i.e., AMD modules used by RequireJS), every top-level function declaration must have a `'use strict';` in it. Do not use `'use strict';` anywhere else. If you're writing code that will run in Node (i.e., a CommonJS module, Karma config or Gulp task), use a single `'use strict';` at global scope at the top of the module.
- **Example**:
	- For browser code:

	    ```javascript
	    (function(define) {
	        'use strict';

	        define(['foo'], function(foo) {
	            foo();
	        });
	    }());
		```

	- For Node code:

	    ```javascript
	    /* eslint-env node */
	    'use strict';
	    var foo = require('foo');
	    foo();
	    ```

		Instead of a `/* eslint-env node */` directive, you can also tell ESLint that a directory of `.js` files should be treated as Node-specific code with a directory-specific `.eslintrc.json`:

	    ```
	    project
	    ├── .eslintrc.json
	    ├── browser
	    │   └── amd-module.js
	    └── node
	        ├── .eslintrc.json
            ├── commonjs-module-1.js
	        └── commonjs-module-2.js
	    ```

		`project/node/.eslintrc.json`:

	    ```
	    {
	        "env": "node"
	    }
	    ```
