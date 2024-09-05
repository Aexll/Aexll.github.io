<script>
  import Highlight, { LineNumbers } from "svelte-highlight";
  
  export let code = "const add = (a: number, b: number) => a + b";
  export let lang;
</script>

<div class="flex flex-col shadow-neutral-900 shadow-lg h-fit">
  <Highlight language={lang} {code} let:highlighted>
    <!-- <LineNumbers {highlighted} /> -->
    <!-- <LineNumbers
    {highlighted}
    highlightedLines={[0, 2, 3, 14]}
    --highlighted-background="rgba(32, 128, 164, 0.2)"
    /> -->
  </Highlight>
</div>
