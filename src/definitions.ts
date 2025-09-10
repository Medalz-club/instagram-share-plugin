export interface InstagramSharePlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
