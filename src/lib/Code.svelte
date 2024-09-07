<script>
  import Highlight, { LineNumbers } from "svelte-highlight";
  import { Badge } from "flowbite-svelte";
  
  export let code = "const add = (a: number, b: number) => a + b";
  export let lang;
  export let badgetxt = "C++";

  import atomOneDark from "svelte-highlight/styles/atom-one-dark";
</script>

<svelte:head>
  {@html atomOneDark}
</svelte:head>

<div class="relative h-fit w-full  ring-2 ring-white/50 bg-slate-800">
  <Badge color="dark" class="absolute top-2 right-2">{badgetxt}</Badge>
  <Highlight class="w-full" language={lang} {code} let:highlighted>
    <!-- <LineNumbers {highlighted} />
    <LineNumbers
    {highlighted}
    highlightedLines={[0, 2, 3, 14]}
    --highlighted-background="rgba(32, 128, 164, 0.2)"
    /> -->
  </Highlight>
</div>
