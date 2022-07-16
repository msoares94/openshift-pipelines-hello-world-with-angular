// project-url-example.spec.ts
//
// Test your own Application
//
import pkg from '../package.json';
import { test, expect } from '@playwright/test';

test('Main page find title', async ({ page }) => {
  await page.goto('http://localhost:4200/');
  const title = page.locator('div.card.highlight-card.card-small > span');
  await expect(title).toHaveText(`${pkg.name} app is running!`);
});
