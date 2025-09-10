import { WebPlugin } from "@capacitor/core";

import type { InstagramSharePlugin } from "./definitions";

export class InstagramShareWeb
  extends WebPlugin
  implements InstagramSharePlugin
{
  async shareToInstagramStories(): Promise<void> {
    throw new Error("Not implemented on web");
  }
}
