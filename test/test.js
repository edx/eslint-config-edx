(function() {
    'use strict';

    var propertyQuote = {
            bar: 'buzz',
            'mixed-quote-prop': 'mixed quotes are ok!'
        },
        simpleESLintTest = 'This file should have no errors';

    if (propertyQuote.bar === 'X') {
        return false;
    }

    if (simpleESLintTest.charAt(0) === 'X') {
        return false;
    }

    return true;
}());
