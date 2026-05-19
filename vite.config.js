import { defineConfig } from 'vite'
import { svelte } from '@sveltejs/vite-plugin-svelte'
import fs from 'node:fs'
import path from 'node:path'

// GitHub Pages has no SPA fallback — direct hits to /ambiance, /doc, etc.
// return 404. Copying index.html to 404.html makes Pages serve the SPA shell
// for any unknown path; the hand-rolled router in App.svelte then reads
// window.location and renders the right page.
const spaFallback404 = () => ({
  name: 'spa-fallback-404',
  closeBundle() {
    const indexHtml = path.resolve('dist', 'index.html')
    const notFoundHtml = path.resolve('dist', '404.html')
    if (fs.existsSync(indexHtml)) fs.copyFileSync(indexHtml, notFoundHtml)
  }
})

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [svelte(), spaFallback404()]
})
