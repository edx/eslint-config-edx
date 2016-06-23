# edX ESLint config
[![Build Status](https://travis-ci.org/edx/eslint-config-edx.svg?branch=master)](https://travis-ci.org/edx/eslint-config-edx) [![npm version](https://badge.fury.io/js/eslint-config-edx.svg)](https://badge.fury.io/js/eslint-config-edx)

ESLint config for edX JavaScript code.

## Table of Contents

1. [Overview](#overview)
2. [License](#license)
3. [Dependencies](#dependencies)
4. [Usage](#usage)
5. [The Config](#the-config)

## Overview

In order to standardize and enforce edX's JavaScript coding style across multiple codebases, edX has adopted ESLint and this shared ESLint config. This document describes the edX JavaScript style and its inspirations.

## License

The code in this repository is released under the Apache 2.0 license unless otherwise
noted. Please see the [LICENSE file](https://github.com/edx/eslint-config-edx/blob/master/LICENSE) for details.

## Dependencies

[ESLint](http://eslint.org) is required to use `eslint-config-edx`, as it is an [ESLint shareable config](http://eslint.org/docs/developer-guide/shareable-configs).

## Usage

To begin using the edX ESLint config in a codebase, first install ESLint and the config:

    npm install --save-dev eslint eslint-config-edx

Then, configure your project's ESLint config to extend `eslint-config-edx` (see the ESLint docs on [Using a Shareable Config](http://eslint.org/docs/developer-guide/shareable-configs#using-a-shareable-config)). If you do not plan on adding custom rules beyond those in `eslint-config-edx` to your project, the easiest place to configure this is probably in your `package.json`:

    "devDependencies": {
        "eslint-config-edx": "^1.0.0"
    },
    "eslintConfig": {
        "extends": "eslint-config-edx"
    }

If you plan on adding additional customization, you can [configure your project with an `.eslintrc.js`/`.eslintrc.json` file](http://eslint.org/docs/user-guide/configuring#configuration-file-formats).

## The Config

edX maintains high-level documentation on the [Open edX Developer's Guide](http://edx.readthedocs.io/projects/edx-developer-guide/en/latest/user_interface_development.html?highlight=ux#adding-a-ui-page) on how we write new JavaScript features, including our use of RequireJS, Underscore and Backbone. This document seeks to be a lower-level guide on the semantics of how we write JavaScript, including nuts and bolts about spacing, syntax, and variable naming.

For the most part, edX follows the thoroughly documented [Airbnb JavaScript Style Guide for ES5](https://github.com/airbnb/javascript/tree/master/es5). Airbnb's JavaScript style is becoming the community standard, and their `eslint-config-airbnb` is the most-downloaded ESLint config on NPM. Because the main Airbnb ESLint config assumes use of ES6, and edX's JavaScript is primarily written in ES5, this config is an extension of `eslint-config-airbnb-base/legacy`, Airbnb's styleguide for ES5.

In addition to the base Airbnb rules, edX adds or extends several of our own. They are described below.

####[`func-names`](http://eslint.org/docs/rules/func-names)
- **Setting**: `"off"`
- **Explanation**: Ignore this rule, it doesn't play nicely with RequireJS code.

####[`indent`](http://eslint.org/docs/rules/indent)
- **Setting**: `["error", 4]`
- **Explanation**: edX is standardized on indenting all code with four spaces. The JavaScript community generally prefers two spaces; edX uses four because of our use of Python (see [PEP8](https://www.python.org/dev/peps/pep-0008/)) and the desire to have consistency in our codebases.
- **Example**:

        // Correct pattern
        var example = function() {
            if (numberOfSpaces !== 4) {
                throw new Error('Use four spaces for indentation.');
            }
        };

####[`max-len`](http://eslint.org/docs/rules/max-len)
- **Setting**: `["error", 120]`
- **Explanation**: Use a maximum of 120 characters on a line. (The Airbnb default is 100, which we feel is too low.)

####[`new-cap`](http://eslint.org/docs/rules/new-cap)
- **Setting**: `"off"`
- **Explanation**: Disable the rule stating functions can only start with a capital letter if they are constructors.
- **Example**:

        // Correct pattern
        var htmlFoo = HtmlUtils.HTML('foo');

####[`no-else-return`](http://eslint.org/docs/rules/no-else-return)
- **Setting**: `"off"`
- **Explanation**: An `else` block after an `if` which contains a `return` is allowed. Technically the `else` is redundant (and Airbnb disallows it), but this rule allows for more readable control flow.
- **Example**:

        // Correct pattern
        if (fooString === 'foo') {
            return 30;
        } else {
            return 50;
        }

####[`no-shadow`](http://eslint.org/docs/rules/no-shadow)
- **Setting**: `"error"`
- **Explanation**: Do not redefine variables in a child scope that are already declared in the upper scope.
- **Example**:

        // Linter error
        var foo = 'bar';
        if (fizz) {
            var foo = 'buzz';
        }

####[`object-curly-spacing`](http://eslint.org/docs/rules/object-curly-spacing)
- **Setting**: `["error", "never"]`
- **Explanation**: Do not insert extra spaces inside of curly brackets.
- **Example**:

        // Correct pattern
        var obj = {foo: 42};

        // Linter error
        var obj2 = { foo: 42 };

####[`one-var`](http://eslint.org/docs/rules/one-var)
- **Setting**: `["off"]`
- **Explanation**: Declare all variables with one `var` statement at the top of your scope, or with many `var`s throughout your scope; your choice. Just don't initialize multiple per line (see next rule).
- **Example**:

        // Both correct patterns
        function() {
            var foo, bar, baz,
                fizz = 'buzz',
                foz = 49;
        }

        function() {
            var fizz = 'buzz';

            if (foo) {
                var baz = 'bar';
            }
        }

####[`one-var-declaration-per-line`](http://eslint.org/docs/rules/one-var-declaration-per-line)
- **Setting**: `["error", "initializations"]`
- **Explanation**: Variables that are not initialized can be declared on the same line. Only one initialization is allowed per line.
- **Example**:

        // Correct pattern
        var foo, bar,
            fizz = 'buzz',
            fozz = 'bizz';

        // Linter error
        var foo, bar, fizz = 'buzz', fozz = 'bizz';

####[`quote-props`](http://eslint.org/docs/rules/quote-props)
- **Setting**: `["error", "consistent-as-needed"]`
- **Explanation**: If no properties of an object need to be wrapped in quotes (i.e., they are all camelCased strings), then they may remain unwrapped by quotes. If any object property requires quotes, then wrap all object properties in quotes regardless of their individual need for it.
- **Example**:

        // Correct patterns
        var foo = {
            bar: 'buzz',
            biff: 'bop'
        };

        var foo2 = {
            'bar': 'buzz',
            'uh-oh-kebab-cased': 'bop'
        };

        // Linter errors
        var foo = {
            'bar': 'buzz',
            'biff': 'bop'
        };

        var foo2 = {
            bar: 'buzz',
            'uh-oh-kebab-cased': 'bop'
        };

        // Syntax error
        var foo2 = {
            bar: 'buzz',
            uh-oh-kebab-cased: 'bop'
        };

####[`space-before-function-paren`](http://eslint.org/docs/rules/space-before-function-paren)
- **Setting**: `["error", "never"]`
- **Explanation**: Do not add a space between a function and the opening parentheses containing its arguments, whether the function is anonymous or named.
- **Example**:

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

####[`strict`](http://eslint.org/docs/rules/strict)
- **Setting**: `["error", "function"]`
- **Explanation**: Every top-level function declaration must have a `'use strict';` in it. Do not use `'use strict';` anywhere else.
- **Example**: See the [ESLint `strict` rule docs](http://eslint.org/docs/rules/strict) and the [MDN strict mode docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode).
