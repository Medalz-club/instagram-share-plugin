export interface InstagramSharePlugin {
  shareToInstagramStories(options: {
    appId: string;
    backgroundImagePath?: string;
    stickerImagePath?: string;
  }): Promise<void>;
}
