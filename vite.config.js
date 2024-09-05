import { defineConfig } from 'vite'
import { svelte } from '@sveltejs/vite-plugin-svelte'
import { viteStaticCopy } from 'vite-plugin-static-copy';


let oldtargets = [

  {
    src: 'old/*', // The source directory containing your HTML files
    dest: '.'  // The directory in the dist folder where files will be copied
  },
  // {
  //   src: 'old/Skull', // The source directory containing your HTML files
  //   dest: '.'  // The directory in the dist folder where files will be copied
  // },
  // {
  //   src: 'old/Suika', // The source directory containing your HTML files
  //   dest: '.'  // The directory in the dist folder where files will be copied
  // },
  // {
  //   src: 'old/Suikasteroid', // The source directory containing your HTML files
  //   dest: '.'  // The directory in the dist folder where files will be copied
  // },
  // {
  //   src: 'old/Suicalculator', // The source directory containing your HTML files
  //   dest: '.'  // The directory in the dist folder where files will be copied
  // },
]



// https://vitejs.dev/config/
export default defineConfig({
  plugins: [svelte(),
    viteStaticCopy({
      targets: oldtargets
    })

  ],

})

