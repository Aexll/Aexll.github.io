/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{html,js,svelte,ts}', './node_modules/flowbite-svelte/**/*.{html,js,svelte,ts}', './node_modules/flowbite-svelte-icons/**/*.{html,js,svelte,ts}'],
  
  plugins: [require('flowbite/plugin')],

  theme: {
    extend: {
      backgroundImage: {
        'grid':'url("https://tailwindcss.com/_next/static/media/hero-dark@90.dba36cdf.jpg")'
      }
    },
    fontFamily: {
      'ubuntu': "UbuntuMono-Regular, monospace", 
      'VCR': "VCR, monospace",
      'Minecraft': "Minecraft, monospace",
      'DoodleJump': "DoodleJump, monospace",
      'verdana': "Helvetica, monospace",
    }
  },
  plugins: [],
}

