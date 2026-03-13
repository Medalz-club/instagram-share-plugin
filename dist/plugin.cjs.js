'use strict';

var core = require('@capacitor/core');

const InstagramShare = core.registerPlugin('InstagramShare', {
    web: () => Promise.resolve().then(function () { return web; }).then((m) => new m.InstagramShareWeb()),
});

class InstagramShareWeb extends core.WebPlugin {
    async echo(options) {
        console.log('ECHO', options);
        return options;
    }
}

var web = /*#__PURE__*/Object.freeze({
    __proto__: null,
    InstagramShareWeb: InstagramShareWeb
});

exports.InstagramShare = InstagramShare;
//# sourceMappingURL=plugin.cjs.js.map
