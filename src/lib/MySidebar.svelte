<script>
import { Sidebar, SidebarBrand, SidebarGroup, SidebarItem, SidebarWrapper, SidebarDropdownItem, SidebarDropdownWrapper } from 'flowbite-svelte';
import { ChartPieSolid, ShareNodesSolid, ChevronDoubleUpOutline, ChevronDownOutline, ChevronUpOutline, ChevronDoubleDownOutline } from 'flowbite-svelte-icons'
let site = {
    name: 'Axel LAVIGNE',
    href: '/',
    img: '/svelte.svg',
  };

</script>




<div class="flex h-full">
  <Sidebar asideClass="fixed inset-0 z-30 flex-none w-64 lg:static lg:h-auto border-e border-gray-200 dark:border-gray-600 lg:overflow-y-visible lg:pt-0 lg:block">
    <SidebarWrapper apper divClass="overflow-y-auto h-full px-4 pt-20 bg-white scrolling-touch max-w-2xs lg:pt-0 lg:block dark:bg-gray-900 lg:me-0 lg:sticky">
      <SidebarGroup ulClass="list-unstyled mt-4 fw-normal small mb-4">
        <SidebarBrand site={site} > </SidebarBrand>
      </SidebarGroup>
      <SidebarGroup border ulClass="list-unstyled fw-normal small mb-4">
        <SidebarItem label="Dashboard" href="/test">
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