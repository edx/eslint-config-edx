# edX ESLint config

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

The code in this repository is licensed the Apache 2.0 license unless otherwise
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

Let's talk about what's in this ESLint config. edX maintains high-level documentation on the [Open edX Developer's Guide](http://edx.readthedocs.io/projects/edx-developer-guide/en/latest/user_interface_development.html?highlight=ux#adding-a-ui-page) on how we write new JavaScript features, including our use of RequireJS, Underscore and Backbone. This document seeks to be a lower-level guide on the semantics of how we write JavaScript, including nuts and bolts about spacing, syntax, and variable naming.

For the most part, edX follows the thoroughly documented [Airbnb JavaScript Style Guide for ES5](https://github.com/airbnb/javascript/tree/master/es5). Airbnb's JavaScript style is becoming the community standard, and their `eslint-config-airbnb` is the most-downloaded ESLint config on NPM. Because the main Airbnb ESLint config assumes use of ES6, and edX's JavaScript is primarily written in ES5, this config is an extension of `eslint-config-airbnb-base/legacy`, Airbnb's styleguide for ES5.

In addition to the base Airbnb rules, edX adds or extends several of our own. They are described below.

####[`camelcase`](http://eslint.org/docs/rules/camelcase)
- **Setting**: `["error", {"properties": "always"}]`
- **Explanation**:
- **Example**:

####[`func-names`](http://eslint.org/docs/rules/func-names)
- **Setting**: `"off"`
- **Explanation**:
- **Example**:

####[`global-require`](http://eslint.org/docs/rules/global-require)
- **Setting**: `"off"`
- **Explanation**:
- **Example**:

####[`indent`](http://eslint.org/docs/rules/indent)
- **Setting**: `["error", 4]`
- **Explanation**:
- **Example**:

####[`max-len`](http://eslint.org/docs/rules/max-len)
- **Setting**: `["error", 120]`
- **Explanation**:
- **Example**:

####[`new-cap`](http://eslint.org/docs/rules/new-cap)
- **Setting**: `"off"`
- **Explanation**:
- **Example**:

####[`no-console`](http://eslint.org/docs/rules/no-console)
- **Setting**: `"off"`
- **Explanation**:
- **Example**:

####[`no-else-return`](http://eslint.org/docs/rules/no-else-return)
- **Setting**: `"off"`
- **Explanation**:
- **Example**:

####[`no-invalid-this`](http://eslint.org/docs/rules/no-invalid-this)
- **Setting**: `"error"`
- **Explanation**:
- **Example**:

####[`no-shadow`](http://eslint.org/docs/rules/no-shadow)
- **Setting**: `"error"`
- **Explanation**:
- **Example**:

####[`object-curly-spacing`](http://eslint.org/docs/rules/object-curly-spacing)
- **Setting**: `["error", "never"]`
- **Explanation**:
- **Example**:

####[`one-var`](http://eslint.org/docs/rules/one-var)
- **Setting**: `["error", "always"]`
- **Explanation**:
- **Example**:

####[`space-before-function-paren`](http://eslint.org/docs/rules/space-before-function-paren)
- **Setting**: `["error", "never"]`
- **Explanation**:
- **Example**:

####[`strict`](http://eslint.org/docs/rules/strict)
- **Setting**: `"off"`
- **Explanation**:
- **Example**:
