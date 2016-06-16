module.exports = {
  "env": {
    "browser": true,
    "jasmine": true,
    "jquery": true,
    "amd": true
  },
  "extends": "airbnb-base/legacy",
  "globals": {
    "edx": true,
    "RequireJS": true
  },
  "parserOptions": {
      "ecmaVersion": 5
  },
  "rules": {
    "camelcase": ["error", {"properties": "always"}],
    "func-names": "off",
    "global-require": "off",
    "indent": ["error", 4],
    "max-len": ["error", 120],
    "new-cap": "off",
    "no-console": "off",
    "no-else-return": "off",
    "no-invalid-this": "error",
    "no-shadow": "error",
    "object-curly-spacing": ["error", "never"],
    "one-var": ["error", "always"],
    "space-before-function-paren": ["error", "never"],
    "strict": "off"
  }
}
