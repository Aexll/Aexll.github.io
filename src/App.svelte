<script>
  import Page1 from './pages/cards.svelte';
  import Default from './pages/default.svelte';
  import NotFound from './pages/error.svelte';
  import Portfolio from './pages/portfolio.svelte';
  // import db from './services/firebase.js';


  import { onMount } from 'svelte';
  let url = ``;
  onMount(() => url = window.location.href);

  // simple rooter:
  export const routes = {
  "/": Portfolio,
  "/doc": Default,
  "/ctf": Page1,
  "*": NotFound
  };


</script>

<svelte:component this={routes[url.substring(url.trim().lastIndexOf('/'), url.trim().length)]}/>