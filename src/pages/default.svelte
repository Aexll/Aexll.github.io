<script>
  import svelteLogo from '/svelte.svg'
  import tailwindLogo from '/tailwindlogo.svg'
  import viteLogo from '/vite.svg'
  import Code from '../lib/Code.svelte'
  import MySidebar from '../lib/MySidebar.svelte'

  import { Badge } from 'flowbite-svelte';

  // Code
  import atomOneDark from "svelte-highlight/styles/atom-one-dark";
  import cpp from "svelte-highlight/languages/cpp";


  import Topmenu from '../lib/Topmenu.svelte';


</script>


<svelte:head>
  {@html atomOneDark}
</svelte:head>




<main>
</main>
<body>

  
  <Topmenu/>

  <div class="flex flex-row w-fit-full h-screen">

    <MySidebar />
    
    <!-- Main content -->
    <div class="flex flex-col w-full h-full overflow-y-auto antialiased text-slate-100 dark:text-slate-400 bg-slate-900">
    
    <!-- content -->
    <div class="bg-grid bg-center w-full h-full">
    
    <!-- title -->
    <div class='relative max-w-5xl mx-auto pt-20 sm:pt-24 lg:pt-32'>
      <h1 class="text-slate-900 font-verdana font-extrabold text-4xl sm:text-5xl lg:text-6xl tracking-tight text-center dark:text-white title hover:drop-shadow" >
        Default
      </h1>
    </div>
    
    <br>

    <!-- logos -->
    <div class="flex justify-center">
      <a id="a1" href="https://vitejs.dev" target="_blank" rel="noreferrer">
        <img src={viteLogo} class="logo vite " alt="Vite Logo" />
      </a>
      <a id="a2" href="https://svelte.dev" target="_blank" rel="noreferrer">
        <img src={svelteLogo} class="logo svelte" alt="Svelte Logo"/>
      </a>
      <a id="a3" href="https://tailwindcss.com/" target="_blank" rel="noreferrer">
        <img src="https://cdn.worldvectorlogo.com/logos/tailwind-css-2.svg" class="logo tailwind" alt="Tailwind Logo" />
      </a>
    </div>  
    
    <!-- code demo -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 md:px-8 mt-20 sm:mt-24 lg:mt-32 lg:grid lg:gap-8 lg:grid-cols-12 lg:items-center">
    
      <div class="relative row-start-1 col-start-6 xl:col-start-7 col-span-7 xl:col-span-6 h-full overflow-hidden rounded-lg ring-1 ring-white/15 bg-slate-800/10">
      <Badge color="dark" class="absolute top-2 right-2">C++</Badge>
    <Code lang={cpp} code={`int main(){
    printf("Hello, World!");
    
    int a = 0;
    scanf("%d", &a);
    
    if(a == 0 || a < 0){
      exit(0);
    }
    
    for(int i = 0; i < a; i++){
      printf("%d", i);
    }
    
    return 0;
    }`}/>
      </div>
    
      <div class="relative row-start-1 col-start-1 col-span-5 xl:col-span-6 h-full text-left">
        <div class="relative center justify-center h-full">
          <p class="flex flex-column font-ubuntu h-full items-center">
            This is to demonstrate this new page made with svelte and tailwind<br>
            Code content can easily be added to this page by using svelte-highlight
          </p>
        </div>
      </div>
    
      <br>
      <br>
      <br>
      <br>
    
    </div>

    
    </div> <!---->
    



    </div>
    
    
  </div> <!---->
    


</body>




<style>
  .title {
    will-change: filter;
    transition: filter 300ms;
    filter: drop-shadow(0 0 0.2em #ffffff7e);
  }
  .title:hover {
    filter: drop-shadow(0 0 0.3em #ffffff7e);
  }
  .logo {
    height: 6em;
    padding: 1.5em;
    will-change: filter;
    transition: filter 300ms;
  }
  .logo.vite {
    filter: drop-shadow(0 0 0.3em #646cffaa);
  }
  .logo.svelte {
    filter: drop-shadow(0 0 0.3em #ff3e00aa);
  }
  .logo.tailwind {
    filter: drop-shadow(0 0 0.3em #1ea5ffcb);
  }
  .logo:hover {
    filter: drop-shadow(0 0 2em #646cffaa);
  }
  .logo.svelte:hover {
    filter: drop-shadow(0 0 2em #ff3e00aa);
  }
  .logo.tailwind:hover {
    filter: drop-shadow(0 0 2em #1ea5ffcb);
  }
</style>
