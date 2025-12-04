/**
 * OG Image Generator
 *
 * This script generates the og-image.png from og-image.html
 *
 * Prerequisites:
 *   npm install puppeteer
 *
 * Usage:
 *   node scripts/generate-og-image.js
 *
 * Alternative: Use an online tool like:
 *   - https://htmlcsstoimage.com/
 *   - https://screenshotone.com/
 *   - Open og-image.html in browser, use DevTools to screenshot (Cmd+Shift+P > "Capture screenshot")
 */

import puppeteer from "puppeteer"
import { fileURLToPath } from "url"
import { dirname, join } from "path"

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)

async function generateOGImage() {
  console.log("🎨 Generating OG Image...")

  const browser = await puppeteer.launch()
  const page = await browser.newPage()

  // Set viewport to OG image dimensions
  await page.setViewport({
    width: 1200,
    height: 630,
    deviceScaleFactor: 2, // Retina quality
  })

  // Load the HTML file
  const htmlPath = join(__dirname, "../public/og-image.html")
  await page.goto(`file://${htmlPath}`, {
    waitUntil: "networkidle0",
  })

  // Wait for fonts to load
  await new Promise(resolve => setTimeout(resolve, 1000))

  // Take screenshot
  const outputPath = join(__dirname, "../public/og-image.png")
  await page.screenshot({
    path: outputPath,
    type: "png",
  })

  await browser.close()

  console.log("✅ OG Image generated at:", outputPath)
  console.log("📐 Dimensions: 1200x630px (2x for retina)")
}

generateOGImage().catch(console.error)
