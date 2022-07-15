// playwright.config.ts
import type { PlaywrightTestConfig } from '@playwright/test';

const config: PlaywrightTestConfig = {
  testDir: './e2e-playwright',
  // webServer: {
  //   command: 'npm run start',
  //   url: 'http://localhost:4200/'
  // },
  use: {
    //   browserName: 'chromium',
    headless: true
  },
};
export default config;
