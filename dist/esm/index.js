import { registerPlugin } from '@capacitor/core';
const InstagramShare = registerPlugin('InstagramShare', {
    web: () => import('./web').then((m) => new m.InstagramShareWeb()),
});
export * from './definitions';
export { InstagramShare };
//# sourceMappingURL=index.js.map