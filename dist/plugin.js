var capacitorInstagramShare = (function (exports, core) {
    'use strict';

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

    return exports;

})({}, capacitorExports);
//# sourceMappingURL=plugin.js.map
