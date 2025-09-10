import { registerPlugin } from '@capacitor/core';

import type { InstagramSharePlugin } from './definitions';

const InstagramShare = registerPlugin<InstagramSharePlugin>('InstagramShare', {
  web: () => import('./web').then((m) => new m.InstagramShareWeb()),
});

export * from './definitions';
export { InstagramShare };
