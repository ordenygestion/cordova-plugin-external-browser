var exec = require('cordova/exec');

module.exports = {
    open: function (url, success, error) {
        exec(
            success || function(){},
            error || function(){},
            'ExternalBrowser',
            'open',
            [url]
        );
    }
};