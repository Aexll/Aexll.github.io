<script>

// Card panel
import { Modal, Card, Button, Label, Input, Checkbox, P } from 'flowbite-svelte';
let modalopened = false;

// Badge
import { Badge, Indicator } from 'flowbite-svelte';
import { CheckCircleSolid,StarSolid } from 'flowbite-svelte-icons';
import { FloatingLabelInput } from 'flowbite-svelte';

// popover
import { Popover } from 'flowbite-svelte';


export let cardImg;
export let cardTitle;
export let cardBackground;
export let cardBody = "bg-black/70 outline outline-1 outline-white/30"
export let cardBodyStyle = ""

export let cardClass = "absolute w-40 rounded-xl ring-2 ring-white/30"; //ring-2  ring-white/30
const todo_card_class = "card"; //  ring-4 ring-red-400
const done_card_class = "card_done outline outline-2 outline-green-500 outline-offset-4"; //  ring-4 ring-green-400

export let shadowColor = '#ff3e00';

$: cssVarStyles = `--shadow-color:${shadowColor};`;

</script>



<div id="hover" class="static w-40 h-40 m-4" > 
  <button class="w-fit h-fit" on:click={(event)=>(modalopened=true)}>
    <img src={cardImg}
    alt="card"
    class="card {cardClass}"
    style="{cssVarStyles}"
    />
  </button>
</div>

<!-- bodyClass="{cardBody}" -->

<Modal bind:open={modalopened} autoclose outsideclose dismissable
backdropClass="{cardBackground}"
bodyClass = "{cardBody}"
style="{cardBodyStyle}"
size="xl"
>
  <slot></slot>
</Modal>

<style>
.card {
  transition: 100ms;
  filter: drop-shadow(0 0 0.4em var(--shadow-color));
}

.card:hover {
  z-index: 1;
  filter: drop-shadow(0 0 1em var(--shadow-color));
  scale: 108%;
  /* animation: float 0.1s ease-in-out infinite;  */
  /* box-shadow: 10px 10px 0px 0.1em #000000; */
  transform: translate(0px, -10px);
}
/* 
.card_done {
  transition: 100ms;
  filter: drop-shadow(0 0 calc(var(--theme-base-exp) * 1em) var(--theme-color));
}

.card_done:hover {
  z-index: 1;
  filter: drop-shadow(0 0 2em #44ff4494);
  scale: 108%;
  transform: translate(0px, -10px);
} */

/* @keyframes float {
} */

@keyframes glow {
  0% {
    filter: brightness(0.6);
    transform: translate(0px, 0px) ;
  }
  50% {
    filter: brightness(6.0);
    transform: translate(0px, -10px);
  }
  100% {
    filter: brightness(0.6);
    transform: translate(0px, 0px);
  }
}

</style>