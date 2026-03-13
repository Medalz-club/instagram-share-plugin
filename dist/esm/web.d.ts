import { WebPlugin } from '@capacitor/core';
import type { InstagramSharePlugin } from './definitions';
export declare class InstagramShareWeb extends WebPlugin implements InstagramSharePlugin {
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
}
