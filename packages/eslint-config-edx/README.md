## `eslint-config-edx`
[![npm version](https://badge.fury.io/js/eslint-config-edx.svg)](https://badge.fury.io/js/eslint-config-edx)

This is the edX ESLint shareable config for linting ES2015+ JavaScript. See [`eslint-config-edx-es5`](https://npmjs.com/package/eslint-config-edx-es5) if you need to lint ES5 code.

Note that versions of eslint-config-edx-es5 prior to v2.0.0 are INCOMPATIBLE with this config.

edX maintains high-level documentation on the [Open edX Developer's Guide](http://edx.readthedocs.io/projects/edx-developer-guide/en/latest/user_interface_development.html?highlight=ux#adding-a-ui-page) on how we write new JavaScript features, including our use of RequireJS, Underscore and Backbone. This document and config seeks to be a lower-level guide on the semantics of how we write ES2015+ JavaScript, including nuts and bolts about spacing, syntax, and variable naming.

For the most part, edX follows the thoroughly documented [Airbnb JavaScript Style Guide for ES2015](http://airbnb.io/javascript/). In addition to the base Airbnb rules, edX adds or extends several of our own. They are described below.

####[`dollar-sign`](https://github.com/erikdesjardins/eslint-plugin-dollar-sign)
- **Setting**: `["error", "ignoreProperties"]`
- **Explanation**: All variables that represent jQuery objects should be named starting with a `$`. Object properties may ignore this rule.
- **Example**:

    ```javascript
    // Correct pattern
    const $fooSpan = $('span#foo');

    const ignoreProps = {};
    ignoreProps.fooSpan = $('span#foo');

    // Linter error
    const fooSpan = $('span#foo');
    ```
