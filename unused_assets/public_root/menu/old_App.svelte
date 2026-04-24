<script>
  import svelteLogo from '/svelte.svg'
  import tailwindLogo from '/tailwindlogo.svg'
  import viteLogo from '/vite.svg'
  import Code from '../lib/Code.svelte'
  import { Banner, SpeedDial, SpeedDialButton, Popover, Button, Badge, SidebarBrand  } from 'flowbite-svelte'
  import { ShareNodesSolid, PrinterSolid, DownloadSolid, FileCopySolid } from 'flowbite-svelte-icons'
  // import { ShareNodesSolid } from 'flowbite-svelte-icons';


  import atomOneDark from "svelte-highlight/styles/atom-one-dark";

  import cpp from "svelte-highlight/languages/cpp";

  import { Sidebar, SidebarGroup, SidebarItem, SidebarWrapper, SidebarDropdownItem, SidebarDropdownWrapper } from 'flowbite-svelte';
  import { ChartPieSolid, ChevronDoubleUpOutline, ChevronDownOutline, ChevronUpOutline, ChevronDoubleDownOutline } from 'flowbite-svelte-icons';
  let spanClass = 'flex-1 ms-3 whitespace-nowrap';

  
  import { Navbar, NavBrand, NavLi, NavUl, NavHamburger } from 'flowbite-svelte';

  let activeClass = 'flex items-center p-2 text-base font-normal text-primary-900 bg-primary-200 dark:bg-primary-700 rounded-lg dark:text-white hover:bg-primary-100 dark:hover:bg-gray-700';
  let nonActiveClass = 'flex items-center p-2 text-base font-normal text-green-900 rounded-lg dark:text-white hover:bg-green-100 dark:hover:bg-green-700';

  let site = {
    name: 'Axel LAVIGNE',
    href: '/',
    img: '/svelte.svg',
  };

</script>


<svelte:head>
  {@html atomOneDark}
</svelte:head>




<main>
</main>



<body>

  <!-- Navbar 
  <Navbar class="flex h-fit w-full">
    <NavBrand>
      <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Aexl</span>
    </NavBrand>
    <NavHamburger  />
    <NavUl >
      <NavLi href="/">Home</NavLi>
      <NavLi href="/about">About</NavLi>
      <NavLi href="/docs/components/navbar">Navbar</NavLi>
      <NavLi href="/pricing">Pricing</NavLi>
      <NavLi href="/contact">Contact</NavLi>
    </NavUl>
  </Navbar>
  -->
  
<!-- 
  <div class="text-center">
    <Button on:click={() => (hidden2 = false)}>Show navigation</Button>
  </div>
 -->

<div class="flex flex-row w-fit-full h-screen">

<!-- Sidebar -->
<div class="flex h-full">
<Sidebar asideClass="fixed inset-0 z-30 flex-none w-64 lg:static lg:h-auto border-e border-gray-200 dark:border-gray-600 lg:overflow-y-visible lg:pt-0 lg:block">
  <SidebarWrapper apper divClass="overflow-y-auto h-full px-4 pt-20 bg-white scrolling-touch max-w-2xs lg:pt-0 lg:block dark:bg-gray-900 lg:me-0 lg:sticky">
    <SidebarGroup ulClass="list-unstyled mt-4 fw-normal small mb-4">
      <SidebarBrand site={site} > </SidebarBrand>
    </SidebarGroup>
    <SidebarGroup border ulClass="list-unstyled fw-normal small mb-4">
      <SidebarItem label="Dashboard">
        <svelte:fragment slot="icon">
          <ChartPieSolid class="w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" />
        </svelte:fragment>
      </SidebarItem>
      <SidebarDropdownWrapper label="E-commerce">
        <svelte:fragment slot="icon">
          <ShareNodesSolid class="w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" />
        </svelte:fragment>
        <svelte:fragment slot="arrowup">
          <ChevronUpOutline class="w-5 h-5" />
        </svelte:fragment>
        <svelte:fragment slot="arrowdown">
          <ChevronDownOutline class="w-5 h-5" />
        </svelte:fragment>
        <SidebarDropdownItem label="Products" />
        <SidebarDropdownItem label="Billing" />
        <SidebarDropdownItem label="Invoice" />
      </SidebarDropdownWrapper>
    </SidebarGroup>
  </SidebarWrapper>
</Sidebar>
</div>


<!-- Main content -->
<div class="flex flex-col w-full h-full overflow-y-auto antialiased text-slate-100 dark:text-slate-400 bg-slate-900">

<slot></slot>

<!-- content -->
<div class="bg-grid bg-center w-full h-full">
<!-- title -->
<div class='relative max-w-5xl mx-auto pt-20 sm:pt-24 lg:pt-32'>
  <h1 class="text-slate-900 font-verdana font-extrabold text-4xl sm:text-5xl lg:text-6xl tracking-tight text-center dark:text-white title hover:drop-shadow" >
    Creating my website
  </h1>
</div>
<br>
<!-- logos -->
<div class="flex justify-center">
  <a id="a1" href="https://vitejs.dev" target="_blank" rel="noreferrer">
    <img src={viteLogo} class="logo" alt="Vite Logo" />
  </a>
  <a id="a2" href="https://svelte.dev" target="_blank" rel="noreferrer">
    <img src={svelteLogo} class="logo svelte" alt="Svelte Logo" />
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
</div>


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
  .logo:hover {
    filter: drop-shadow(0 0 2em #646cffaa);
  }
  .logo.svelte:hover {
    filter: drop-shadow(0 0 2em #ff3e00aa);
  }
  .logo.tailwind:hover {
    filter: drop-shadow(0 0 2em #1ea5ffcb);
  }
  .read-the-docs {
    color: #888;
  }
</style>
