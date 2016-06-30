(function() {
    'use strict';

    var simpleESLintTest = 'This file should have no errors';

    if (simpleESLintTest.charAt(0) === 'X') {
        return false;
    }
    return true;
}());
