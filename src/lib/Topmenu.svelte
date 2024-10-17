<script>

import { Navbar, NavBrand, NavHamburger, NavUl, NavLi, MegaMenu } from 'flowbite-svelte';


let menu = [
    { name: 'About us', href: '/about' },
    { name: 'Blog', href: '/blog' },
    { name: 'Contact us', href: '/contact' },
    { name: 'Library', href: '/library' },
    { name: 'Newsletter', href: '/news' },
    { name: 'Support Center', href: '/support' },
    { name: 'Resources', href: '/resource' },
    { name: 'Playground', href: '/play' },
    { name: 'Terms', href: '/terms' },
    { name: 'Pro Version', href: '/pro' },
    { name: 'License', href: '/license' }
  ];

</script>



<!-- <div id="hover" class="static w-40 h-56 m-4" > 
  <button class="w-fit h-fit" on:click={(event)=>(modalopened=true)}>
    <img src={cardImg}
    alt="card"
    class="card {cardClass}"
    style="{cssVarStyles}"
    />
  </button>
</div> -->


<Navbar let:hidden let:toggle class="border-e border-gray-200">
  <NavBrand href="/">
    <img src="/logo2.png" class="me-3 h-6 sm:h-9 logo " alt="Flowbite Logo" />
    <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Axel Lavigne</span>
  </NavBrand>
  <NavHamburger on:click={toggle} />
  <NavUl {hidden}>
    <NavLi href="/">Home</NavLi>
    <!-- <NavLi class="cursor-pointer">
      Mega menu<ChevronDownOutline class="w-6 h-6 ms-2 text-primary-800 dark:text-white inline" />
    </NavLi> -->
    <!-- <MegaMenu items={menu} let:item>
      <a href={item.href} class="hover:text-primary-600 dark:hover:text-primary-500">{item.name}</a>
    </MegaMenu> -->
    <NavLi href="/notes">Maths</NavLi>
    <!-- <NavLi href="/services">Products</NavLi> -->
    <!-- <NavLi href="/services">Contact</NavLi> -->
  </NavUl>
</Navbar>

<style>

</style>