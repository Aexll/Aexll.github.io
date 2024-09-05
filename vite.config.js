import { defineConfig } from 'vite'
import { svelte } from '@sveltejs/vite-plugin-svelte'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [svelte()],
  build: {
    outDir: 'C:/Users/Axel/Documents/Main/Web/Websites/Aexll.github.io/home', // Specify your desired output directory here
  },
})

