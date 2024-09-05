<script>



  import cardImg from '/CardAlpha.png'

  import MyCard from '../lib/MyCard.svelte';

  let mouseX = 0;
  let mouseY = 0;

  function handleMove(event) {
    mouseX = event.clientX;
    mouseY = event.clientY;
  }


</script>





<main>
</main>
<body>


  <div class="flex flex-row w-fit-full h-screen">

    <!-- <MySidebar /> -->
    
    <!-- Main content -->
    <div class="flex flex-col w-full h-full overflow-y-auto antialiased text-slate-100 dark:text-slate-400 bg-slate-900">
    
    <!-- content -->
    <div class="bg-grid bg-center w-full h-full">
    
    <!-- title -->
    <div class='relative max-w-5xl mx-auto pt-20 sm:pt-24 lg:pt-32'>
      <h1 class="title text-slate-900 font-verdana font-extrabold text-4xl sm:text-5xl lg:text-6xl tracking-tight text-center dark:text-white" > 
        Capture the flags !
      </h1>
    </div>

    <div class="flex flex-row flex-wrap place-items-start justify-center p-16 h-fit w-full">

      <MyCard cardImg={cardImg} />
      <MyCard cardImg={cardImg} />
      <MyCard cardImg={cardImg} />
      <MyCard cardImg={cardImg} />


    </div>


    
    </div> <!---->
    



    </div>
    
    
  </div> <!---->
    


</body>




<style>
  .title {
    will-change: filter;
    /* transition: filter 300ms; */
    filter: drop-shadow(0 0 0.3em #ffffff7e);
  }
  .title:hover {
    filter: drop-shadow(0 0 0.3em #ffffff7e);
  }

</style>
