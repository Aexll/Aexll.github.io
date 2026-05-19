<script>
  import Page1 from './pages/cards.svelte';
  import Default from './pages/default.svelte';
  import NotFound from './pages/error.svelte';
  import Portfolio from './pages/portfolio.svelte';
  import Ambiance from './pages/ambiance.svelte';
  // import db from './services/firebase.js';


  import { onMount } from 'svelte';
  let path = '/';
  onMount(() => {
    // Use pathname (not href) and strip a trailing slash so GitHub Pages'
    // directory-redirect (e.g. /ambiance → /ambiance/) still routes correctly.
    let p = window.location.pathname || '/';
    if (p.length > 1 && p.endsWith('/')) p = p.slice(0, -1);
    path = p;
  });

  // simple rooter:
  export const routes = {
  "/": Portfolio,
  "/doc": Default,
  "/ctf": Page1,
  "/ambiance": Ambiance,
  "*": NotFound
  };


</script>

<svelte:component this={routes[path] ?? routes['*']}/>