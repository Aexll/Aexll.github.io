<script>

// Card panel
import { Modal, Card, Button, Label, Input, Checkbox, P } from 'flowbite-svelte';
let modalopened = false;

// Badge
import { Badge, Indicator } from 'flowbite-svelte';
import { CheckCircleSolid,StarSolid } from 'flowbite-svelte-icons';
import { FloatingLabelInput } from 'flowbite-svelte';

export let cardImg;



import db from '../services/firebase.js';
import { addDoc, collection, getDocs, doc, getDoc  } from 'firebase/firestore';


import sjcl from 'sjcl';
import { onMount } from 'svelte';

// import { onMount } from 'svelte';
// onMount(async () => {
//   const ref = doc(db, "flags", "alpha");
//   const docSnap = await getDoc(ref);
//   if (docSnap.exists()) {
//     console.log("Document data:", docSnap.data());
//     input = docSnap.data()["flaghash"]
//   } else {
//     // doc.data() will be undefined in this case
//     console.log("No such document!");
//     input = "no data"
//   }
// });

async function test_flag(flag) {
  // convert flag to utf-8
  const flag_utf8 = sjcl.codec.utf8String.toBits(flag);
  const hash = sjcl.hash.sha256.hash(flag_utf8);
  // convert hash to string
  const hash_string = sjcl.codec.hex.fromBits(hash)

  const ref = doc(db, "flags", "alpha");
  const docSnap = await getDoc(ref);
  if (docSnap.exists()) {
    if (docSnap.data()["sha256"] == String(hash_string)) {
      done = true;
      alert("Flag found!");
    }
  } else {
    // alert("unable to find the value");
  }
  // alert("Flag found!");
}


let done = false;
let input;

const default_card_class = "absolute w-40 rounded-xl ring-2 ring-white/30"; //ring-2  ring-white/30
const todo_card_class = "card"; //  ring-4 ring-red-400
const done_card_class = "card_done outline outline-2 outline-green-500 outline-offset-4"; //  ring-4 ring-green-400

$: current_card_class = done ? default_card_class + ' ' + done_card_class : todo_card_class + ' ' + default_card_class;

onMount(async () => {







});

function set_done() {
  test_flag(input);
}


</script>



<div class="static w-40 h-56 m-4" > 
  <button class="w-fit h-fit" on:click={(event)=>(modalopened=true)}>
    <img src={cardImg}
    alt="card"
    class="{current_card_class}" />
  </button>
<!-- <br><br><br><br><br><br><br><br><br><br>
<h1 class="cardo">{current_card_class}</h1> -->
</div>

<Modal title="Alpha" bind:open={modalopened} autoclose outsideclose>
  <Badge rounded class="px-2.5 py-0.5 ring-1 ring-white/30">
    <Indicator size="xs" class="me-2" >
      <StarSolid class="w-4 h-4 text-primary-600 dark:text-primary-300" />
    </Indicator>10
  </Badge>
    <p class="text-base leading-relaxed text-gray-500 dark:text-gray-400">This is the first challenge !</p>
    <p class="text-base leading-relaxed text-gray-500 dark:text-gray-400">Try typing "flag"</p>
    <svelte:fragment slot="footer">
      <!-- <FloatingLabelInput id="floating_outlined" name="floating_outlined" type="text" bind:value={input}>
        flag
      </FloatingLabelInput> -->
      <Input type="text" id="first_name" placeholder="flag ?" bind:value={input} />
      <Button color="alternative" on:click={set_done}>Auth</Button>
    </svelte:fragment>
</Modal>

<style>
.card {
  transition: 100ms;
  filter: drop-shadow(0 0 1em #ffffff94);
}

.card:hover {
  z-index: 1;
  filter: drop-shadow(0 0 1em #ffffff94);
  scale: 108%;
  /* animation: float 0.1s ease-in-out infinite;  */
  /* box-shadow: 10px 10px 0px 0.1em #000000; */
  transform: translate(0px, -10px);
}

.card_done {
  transition: 100ms;
  /* filter: drop-shadow(0 0 calc(var(--theme-base-exp) * 1em) var(--theme-color)); */
  filter: drop-shadow(0 0 1em #44ff4494);
}

.card_done:hover {
  z-index: 1;
  filter: drop-shadow(0 0 2em #44ff4494);
  scale: 108%;
  transform: translate(0px, -10px);
}

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