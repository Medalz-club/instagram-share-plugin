import { WebPlugin } from '@capacitor/core';

import type { InstagramSharePlugin } from './definitions';

export class InstagramShareWeb extends WebPlugin implements InstagramSharePlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
