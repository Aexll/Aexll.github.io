<script>

  // import { Navbar, NavBrand, NavHamburger, NavUl, NavLi, MegaMenu } from 'flowbite-svelte';
  // import { ChevronDownOutline } from 'flowbite-svelte-icons';

  // import cardImg from '/CardAlpha.png'
  import img_exo from '/Exo.png'

  // import logo from '/logo.png'

  // import MyCard from '../lib/MyCard.svelte';
  import Project from '../lib/Project.svelte';

  import { Carousel } from 'flowbite-svelte';

  // import { CloseButton } from 'flowbite-svelte';

  // import { Card } from 'flowbite-svelte';

  import Topmenu from '../lib/Topmenu.svelte';


  export const images = [
    {
      alt: 'Screenshot 2',
      src: '/img/screenshots/sc2.png',
      title: 'sc2'
    },
    {
      alt: 'Screenshot 3',
      src: '/img/screenshots/sc3.png',
      title: 'sc3'
    },
    {
      alt: 'Screenshot 4',
      src: '/img/screenshots/sc4.png',
      title: 'sc4'
    },
    {
      alt: 'Screenshot 5',
      src: '/img/screenshots/sc5.png',
      title: 'sc5'
    },
    {
      alt: 'Screenshot 6',
      src: '/img/screenshots/sc6.png',
      title: 'sc6'
    },
    {
      alt: 'Screenshot 7',
      src: '/img/screenshots/sc7.png',
      title: 'sc7'
    },
    {
      alt: 'Screenshot 8',
      src: '/img/screenshots/sc8.png',
      title: 'sc8'
    },
    {
      alt: 'Screenshot 9',
      src: '/img/screenshots/sc9.png',
      title: 'sc9'
    },
    {
      alt: 'Screenshot 1',
      src: '/img/screenshots/sc1.png',
      title: 'sc1'
    },
    {
      alt: 'Screenshot 10',
      src: '/img/screenshots/sc10.png',
      title: 'sc10'
    }
  ];

  export const imagestdtk = [
    {
      alt: 'Screenshot 1',
      src: '/img/tdtk_1.png',
      title: 'tdtk_1'
    },
    {
      alt: 'Screenshot 2',
      src: '/img/tdtk_2.png',
      title: 'tdtk_2'
    },
    {
      alt: 'Screenshot 3',
      src: '/img/tdtk_3.png',
      title: 'tdtk_3'
    },
    {
      alt: 'Screenshot 4',
      src: '/img/tdtk_4.png',
      title: 'tdtk_4'
    }
  ];

  export const imagescutoff = [
    {
      alt: 'Screenshot 1',
      src: '/img/cutoff_v1.png',
      title: 'tdtk_1'
    },
    {
      alt: 'Screenshot 2',
      src: '/img/cutoff_v2.png',
      title: 'tdtk_2'
    },
    {
      alt: 'Screenshot 3',
      src: '/img/cutoff_v3.png',
      title: 'tdtk_3'
    },
    {
      alt: 'Screenshot 4',
      src: '/img/cutoff_v4.png',
      title: 'tdtk_4'
    },
    {
      alt: 'Screenshot 4',
      src: '/img/cutoff_v5.png',
      title: 'tdtk_4'
    }
  ]

</script>





<main>
</main>
<body>

<!-- 
  <Navbar let:hidden let:toggle>
    <NavBrand href="/">
      <img src="/logo2.png" class="me-3 h-6 sm:h-9 logo" alt="Flowbite Logo" />
      <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Axel Lavigne</span>
    </NavBrand>
    <NavHamburger on:click={toggle} />
    <NavUl {hidden}>
      <NavLi href="/">Home</NavLi>
      <NavLi class="cursor-pointer">
        Mega menu<ChevronDownOutline class="w-6 h-6 ms-2 text-primary-800 dark:text-white inline" />
      </NavLi>
      <NavLi href="/doc">Writeups</NavLi>
    </NavUl>
  </Navbar>
  -->
  
  <Topmenu/>
  


  <div class="flex flex-row w-fit-full h-screen">

    <!-- <MySidebar /> -->
    
    <!-- Main content -->
    <div class="flex flex-col w-full h-full overflow-y-auto antialiased text-slate-100 dark:text-slate-400 bg-slate-900">
    
    <!-- content -->
    <div class="bg-grid bg-center bg-fixed w-full h-full">
    
    <!-- title -->
    <!-- <div class='flex max-w-5xl mx-auto pt-20 sm:pt-24 lg:pt-32'>
    </div> -->

    <br>
    <br>
    <br>
    <br>

    <h1 class="title text-slate-900 font-verdana font-extrabold text-4xl sm:text-5xl lg:text-6xl tracking-tight text-center dark:text-white" > 
      My Projects
    </h1>

    <div class="flex flex-row flex-wrap place-items-start justify-center pt-16 pl-32 pr-32 h-fit size-auto m-2xl">
    
    <!-- Exo -->
    <Project 
    cardImg={img_exo} 
    cardTitle="Exo" 
    shadowColor="#555555"
    cardBackground="fixed inset-0 z-40 bg-black/50"
    cardBody="bg-black/70 outline outline-1 outline-white/30"
    >
      
      <!-- <h1 class="flex justify-center font-bold text-8xl">Exo</h1> -->
      <img src="/img/ExoTitle.png" alt="Exo" class="flex mx-auto"/>
      <br>
      <p class="flex justify-center">A terminal based gamebook made in C</p>
      <p class="flex justify-center">We were a group of 5 and I was in charge of programming it</p>
      <p class="flex justify-center">The rest of the group was charged with designing the story</p>
      <a class="flex justify-center font-bold text-2xl text-blue-500 underline" href="https://github.com/Aexll/Exo">Github</a>
      <div class="content-center max-w-2xl mx-auto">
        <!-- min-h-[800px] -->
        <Carousel {images} let:Indicators let:Controls imgClass="object-contain h-full w-fit" class="flex h-full size-full">
          <Controls />
          <!-- <Indicators /> -->
        </Carousel>
      </div>
      <p class="flex justify-center">I had to make tools easy to use for the Game Dizigners</p>
      <br>
      <h1 class="flex justify-center font-bold text-2xl">Reading and Parsing files</h1>
      <p class="flex justify-center">A gamebook is an interactive story with choices and branches</p>
      <p class="flex justify-center">each state of the story is represented with a file</p>
    </Project>

    <!-- Bomber -->
<!-- 
    cardBodyStyle="background-image: url('/img/greengrid.png');" -->

    <Project 
    cardImg="img/Card_Bomber_2.png"
    cardTitle="Project 2"
    shadowColor="#00cc00"
    cardBackground="fixed inset-0 z-40 bg-black/50"
    cardBody="bg-green-950/70 bg-scroll outline outline-2 outline-lime-500 rounded-xl"
    cardClass="absolute w-40 rounded-xl ring-2 ring-lime-500/50"
    >
    <h1 class="flex justify-center font-bold text-8xl title_black text-lime-500 title_green">Super Bomber</h1>
    <br>
    <div class="bg-black/40 mx-auto p-4 rounded-md">
      <p class="flex justify-center text-white">Very quick sideproject</p>
      <p class="flex justify-center text-white">goal was to make a local multiplayer game</p>
      <p class="flex justify-center text-white">(playable on the same computer)</p>
      <p class="flex justify-center text-white">we can go up to 5 players</p>
      <br>
      <p class="flex justify-center text-white">Project is not totaly completed</p>
      <p class="flex justify-center text-white">Still missing some feature</p>
      <p class="flex justify-center text-white">but its playable</p>
      <br>
      <a class="flex justify-center font-bold text-2xl text-blue-500 underline" href="https://github.com/Aexll/SuperBomber">Github</a>
    
    </div>
    
    <br>
    <img src="/img/bombergif.gif" alt="Bomber" class="flex mx-auto rounded-xl drop-shadow-[00px_00px_10px_rgba(0,0,0,0.9)] outline outline-2 outline-white"/>
    </Project>

    <!-- Generand -->
    <Project
    cardImg="img/Card_Generand.png"
    cardTitle="Project 3"
    cardBodyStyle="background-image: url('/img/generand-bg.png');"
    cardBackground="fixed inset-0 z-40 bg-black/50"
    cardBody="bg-center outline outline-2 outline-orange-500">
      <!-- <h1 class="flex justify-center font-bold text-8xl text-orange-500 title_orange">Generand</h1> -->
    
      <div class="flex justify-center items-center pt-12">
        <img src="/img/generand-title.png" 
        alt="Generand" 
        class="object-cover m-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.5)]"/>
      </div>
    
    
      <br>
      <p class="text font-Minecraft">A random mod generator for minecraft</p>
      <p class="text font-Minecraft">Coded in python</p>
      <p class="text font-Minecraft">the program will generate some java files and then build them using gradle into a minecraft mod</p>
      <p class="text font-Minecraft">it will also run a instance of minecraft with the new mod installed</p>
      <a class="flex justify-center font-bold text-2xl text-blue-500 underline font-Minecraft" href="https://github.com/Aexll/Generand?tab=readme-ov-file">Github</a>
      <img src="/img/generand_items.png" alt="img of randomized ores and items" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.9)]"/>
      <img src="/img/generand_ores.png" alt="img of randomized craft and world gen" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.9)]"/>
      <img src="/img/generand_tools.png" alt="img of the tools used" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.9)]"/>
    
      <p class="text font-Minecraft">to modify how to mod is being created</p>
      <p class="text font-Minecraft">Generand is using a specific python syntax with their custom classes</p>
      <p class="text font-Minecraft">Using template files with custom parsing syntax, everything is detailed on the github</p>
      <p class="text font-Minecraft">Generand is highly extensible and can be used to generate new dimensions, mobs, custom gamerules</p>
      <p class="text font-Minecraft">It can also create new textures of blocks or items using the image generator</p>
      <img src="/img/generand_mosaic.png" alt="img of the tools used" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.9)]"/>
      <img src="/img/generand_mosaicitem.png" alt="img of the tools used" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.9)]"/>
    
    </Project>

    <!-- Tower Defense -->
    <Project
    cardImg="img/Card_TowerDefense.png"
    cardTitle="Project 3"
    shadowColor="#00aa00"
    cardBackground="fixed inset-0 z-40 bg-black/50"
    cardBody="bg-black/70 outline outline-1 outline-lime-500"
    cardClass="absolute w-40 rounded-xl ring-2 ring-green-500/50">
    <h1 class="flex justify-center font-bold text-8xl text-lime-500 title_green">Tower defense devkit</h1>
    <a class="flex justify-center font-bold text-2xl text-blue-500 underline" href="https://github.com/Aexll/TowerDefenseDevkit">Github</a>
    
    
    <p class="flex justify-center text-white">A set of tools to make a tower defense on Unreal Engine</p>
    
    <a class="flex justify-center font-bold text-2xl text-blue-500 underline" href="https://drive.google.com/drive/folders/1FX5d2qh1IXuStesv0eUbHCSkTVxApRPw">Link to the documentation</a>
    
    <!-- https://drive.google.com/drive/folders/1FX5d2qh1IXuStesv0eUbHCSkTVxApRPw -->

    <div class="content-center max-w-2xl mx-auto">
      <!-- min-h-[800px] -->
      <Carousel images={imagestdtk} let:Indicators let:Controls imgClass="object-contain h-full w-fit" class="flex h-full size-full">
        <Controls />
        <!-- <Indicators /> -->
      </Carousel>
    </div>

    <!-- <img src="/img/tdtk_1.png" alt="img of randomized ores and items" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.9)]"/>
    <img src="/img/tdtk_2.png" alt="img of randomized ores and items" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.9)]"/>
    <img src="/img/tdtk_3.png" alt="img of randomized ores and items" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.9)]"/>
    <img src="/img/tdtk_4.png" alt="img of randomized ores and items" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.9)]"/> -->
    

    <div class="content-center max-w-2xl mx-auto">

    <p class="flex justify-center text-white">

      In this kit, the user should be able to change:



    </p>
    <br>
    <p class="flex justify-center text-white">Tower</p>
    <li class="flex justify-center">Range</li>
    <li class="flex justify-center">Attack Speed</li>
    <li class="flex justify-center">Priority focus</li>
    <li class="flex justify-center">Price</li>
    <li class="flex justify-center">Projectiles (if used)</li>
    <li class="flex justify-center">Damages</li>
    <li class="flex justify-center">Lifetime</li>
    <li class="flex justify-center">Piercing (how many enemies a single projectile can hit)</li>
    <li class="flex justify-center">Damage type (fire, cold, sharp)</li>
    <li class="flex justify-center">Speed</li>
    <li class="flex justify-center">Event upon death</li>
    <br>
    <p class="flex justify-center text-white">Enemies</p>
    <li class="flex justify-center">Speed</li>
    <li class="flex justify-center">Health</li>
    <li class="flex justify-center">Immunity (fire, cold, …)</li>
    <li class="flex justify-center">Event upon death</li>
    <br>
    <p class="flex justify-center text-white">Map</p>
    <li class="flex justify-center">Number of waves</li>


      <!-- min-h-[800px] -->

    </div>



    </Project>
    
    <!-- Nano -->
    <Project
    cardImg="img/Card_Nano.png"
    cardTitle="Project 3"
    shadowColor="#550055"
    cardBackground="fixed inset-0 z-40 bg-black/50"
    cardBody="bg-black/70 outline outline-2 outline-purple-500"
    cardClass="absolute w-40 rounded-xl ring-2 ring-purple-500/50">
    <!-- <h1 class="flex justify-center font-bold text-8xl text-orange-600 title_orange">Nano</h1> -->
    <!-- <br> -->
      <!-- <p class="flex justify-center text-white">A random mod generator for minecraft</p>
      <p class="flex justify-center text-white">Coded in python</p>
      <a class="flex justify-center font-bold text-2xl text-blue-500 underline" href="https://github.com/Aexll/Generand?tab=readme-ov-file">Github</a> -->
      <img src="/img/Nano.png" alt="img of randomized ores and items" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.9)]"/>
      <div class="bg-black/90 p-4 rounded-md">
        <p class="flex justify-center text-white">Tower defense as the imune system</p>
        <p class="flex justify-center text-white">inspired by the kurgestat youtube chanel</p>
        <p class="flex justify-center text-white">(i didnt make a github repo)</p>
      </div>
    </Project>

    <!-- Skirmish -->
    <Project
    cardImg="img/Skirmish.png"
    cardTitle="Project 3"
    shadowColor="#aa5500"
    cardBackground="fixed inset-0 z-40 bg-black/50"
    cardClass="absolute w-40 rounded-xl ring-2 ring-orange-500/30"
    cardBody="bg-black/70 outline outline-1 outline-orange-600">
    <h1 class="flex justify-center font-bold text-8xl text-orange-600 title_orange">Skirmish</h1>
    <br>
      <p class="flex justify-center text-white">Card/Board game Similar to chess on a cricle-ish board</p>
      <p class="flex justify-center text-white">(currently a private repo)</p>
      <!-- <a class="flex justify-center font-bold text-2xl text-blue-500 underline" href="https://github.com/Aexll/Generand?tab=readme-ov-file">Github</a> -->
      <img src="/img/skirmishUnity.png" alt="img of randomized ores and items" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.9)]"/>
      <!-- <img src="/img/generand_2.png" alt="img of randomizd craft and world gen" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.9)]"/> -->

    </Project>
    <!-- https://aexll.github.io/Skull/skull.html -->
    <!-- Skull -->
    <Project
    cardImg="img/skull.png"
    cardTitle="Project 3"
    shadowColor="#ff0000"
    cardBackground="fixed inset-0 z-40 bg-black/50"
    cardBodyStyle="background-image: url('/img/skull_bg.png');"
    cardBody="bg-center outline outline-2 outline-[#0044ff] rounded-xl">
    <img src="/img/The-revenge-of-the-skull.png" alt="Exo" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.5)]"/>
    
    <iframe
    title="Skull"
    class="flex mx-auto justify-center"
    scrolling="no"
    src="https://aexll.github.io/Skull/skull.html"
    allowfullscreen
    width="1240" height="620"
    style="border:none; overflow:hidden"></iframe>
    
    
    
    <a class="flex justify-center" href="https://aexll.github.io/Skull/skull.html">
      <img src="/img/Play.png" alt="Exo" class="flex p-4 mx-auto hover:scale-110 drop-shadow-[00px_00px_10px_rgba(0,0,0,0.5)]"/>
    </a>
    <div class="bg-black/90 mx-auto p-4 rounded-md">
      <p class="flex justify-center text-white">Result of a 2 weeks gamejam</p>
      <p class="flex justify-center text-white">Contraints were these two words: "achievements" and "wtf"</p>
      <p class="flex justify-center text-white">The goal is to reach the end pipe, every time you reach it another entity spawn</p>
      <p class="flex justify-center text-white">There are two difficulties: Normal and Elite</p>
      <p class="flex justify-center text-white">In Elite difficulties, all entities "upgraded"</p>
      <p class="flex justify-center text-white">There are 18 entities in normal, and 17 in elite</p>
      <p class="flex justify-center text-white">The normal mod is 100% possible</p>
      <p class="flex justify-center text-white">idk about the elite one</p>
    </div>
    <img src="/img/Skull_Apple.png" alt="Exo" class="flex p-4 mx-auto m-2xl drop-shadow-[00px_00px_10px_rgba(0,0,0,0.5)]"/>
    
    <!-- <Card href="/cards" class="flex justify-center">
      <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Noteworthy technology acquisitions 2021</h5>
      <p class="font-normal text-gray-700 dark:text-gray-400 leading-tight">Here are the biggest enterprise technology acquisitions of 2021 so far, in reverse chronological order.</p>
    </Card> -->
    
    
    </Project>

    <!-- Cut-Off -->
    <Project
    cardImg="img/cutoff.png"
    cardTitle="Cut-Off"
    shadowColor="#aa5500"
    cardBackground="fixed bg-cover bg-center w-full h-64 inset-0 z-40 bg-black/50"
    cardBodyStyle="background-image: url('/img/cutoff_1.jpg');"
    cardBody="bg-cover bg-center w-full h-64 outline outline-2 outline-[#0044ff] rounded-xl">
    
    <iframe
    title="YouTube video player"
    width="1200" height="670"
    class="flex mx-auto justify-center"
    src="https://www.youtube.com/embed/PBSmOvrlqPc?autoplay=1">
    </iframe> 

    <img src="/img/cutoff_title.png" alt="Exo" class="flex mx-auto drop-shadow-[00px_00px_10px_rgba(1,1,1,0.5)]"/>
    
    <p class="flex justify-center text-white">final project at Bellecour Ecole</p>
    <!-- <a class="flex justify-center underline" href="https://github.com/Aexll/CUTOFF_Releases/releases"> Github </a> -->
    
    <a class="flex justify-center font-bold text-2xl text-blue-500 underline" href="https://github.com/Aexll/CUTOFF_Releases/releases">Github</a>
    
    
    <div class="content-center max-w-2xl mx-auto">
      <!-- min-h-[800px] -->
      <Carousel images={imagescutoff} let:Indicators let:Controls imgClass="object-contain h-full w-fit" class="flex h-full size-full">
        <Controls />
        <!-- <Indicators /> -->
      </Carousel>
    </div>
    
    <p class="flex justify-center text-white">A turn based strategic game made on unreal engine</p>
    <p class="flex justify-center text-white">Team of 15 dizigners, 3D artists, 3D animators, VFX artists, 2D artists and more !</p>
    



    <img src="/img/cutoff_2.jpg" alt="Exo" class="flex mx-auto drop-shadow-[00px_00px_10px_rgba(1,1,1,0.5)]"/>
    <img src="/img/cutoff_3.jpg" alt="Exo" class="flex mx-auto drop-shadow-[00px_00px_10px_rgba(1,1,1,0.5)]"/>
    <img src="/img/cutoff_H39.jpg" alt="Exo" class="flex mx-auto drop-shadow-[00px_00px_10px_rgba(1,1,1,0.5)]"/>
    <img src="/img/cutoff_bat.png" alt="Exo" class="flex mx-auto drop-shadow-[00px_00px_10px_rgba(1,1,1,0.5)]"/>
    

    </Project>

    <!-- Among Dash -->
    <Project
    cardImg="img/amongdash.png"
    cardTitle="Project 3"
    shadowColor="#0088ff"
    cardBackground="fixed inset-0 z-40 bg-[#000000]"
    cardBody="bg-[#000000] outline outline-1 outline-[#0088ff]">

    <img src="/img/ad_title.png" alt="Among Dash" class="flex mx-auto"/>

    <p class="flex justify-center">A game made with Pico-8</p>
    <p class="flex justify-center">a very simplistic game engine powered in lua</p>
    <a class="flex justify-center underline" href="https://www.lexaloffle.com/bbs/?tid=44993"> Play here </a>
    
    <iframe title="Among Dash" class="flex mx-auto justify-center" scrolling="no" src="https://www.lexaloffle.com/bbs/widget.php?pid=amongdash" allowfullscreen width="620" height="620" style="border:none; overflow:hidden"></iframe>


    <p class="flex justify-center">There are 4 levels</p>
    <p class="flex justify-center">lvl 1 and 2 share the same gamemode</p>
    <p class="flex justify-center">but lvl 3 and 4 have differents mechanics</p>
    <p class="flex justify-center">the game is VERY hard (espetially lvl 4) so good luck !</p>

    <img src="/img/ad_lvl.png" alt="Among Dash" class="flex mx-auto"/>

    </Project>


    <!-- Suika -->
    <Project
    cardImg="img/suika.png"
    cardTitle="Project 3"
    shadowColor="#aa5500"
    cardBackground="fixed inset-0 z-40 bg-black/50"
    cardClass="absolute w-40 rounded-xl ring-2 ring-orange-300/30"
    cardBody="bg-black/70 outline outline-1 outline-orange-300">
    <h1 class="flex justify-center font-bold text-8xl text-orange-300 title_orange">Suika</h1>
    <br>
      <p class="flex justify-center text-white">a suika game made in a hours during lunch time</p>
      <p class="flex justify-center text-white"></p>

    <a class="flex justify-center underline" href="https://aexll.github.io/Suika/suika.html"> Play here </a>

    </Project>
    

    <!-- Suikasteroid -->
    <Project
    cardImg="img/suikasteroid.png"
    cardTitle="Project asteroid"
    shadowColor="#220088"
    cardBackground="fixed inset-0 z-40 bg-black/50"
    cardClass="absolute w-40 rounded-xl ring-2 ring-blue-900"
    cardBody="bg-black/70 outline outline-1 outline-blue-900">
    <h1 class="flex justify-center font-bold text-8xl text-blue-900 title_darkblue">Suikasteroid</h1>
    <br>
      <p class="flex justify-center text-white">a suika game made with the suika template</p>
      <p class="flex justify-center text-white"></p>

    <a class="flex justify-center underline" href="https://aexll.github.io/Suikasteroid/suikasteroid.html"> Play here </a>

    </Project>

    <!-- Demo jump -->
    <Project
    cardImg="img/platformer.png"
    cardTitle="Project 3"
    shadowColor="#0055ff"
    cardBackground="fixed inset-0 z-40 bg-black/50"
    cardClass="absolute w-40 rounded-xl ring-2 ring-blue-400/30"
    cardBody="bg-[#4a97ff] rounded-xl outline outline-1 outline-blue-400">
    <h1 class="flex justify-center font-bold text-8xl text-white title_white">Platformer template</h1>
    
    <br>
    <iframe 
    title="Platformer"
    class="flex mx-auto justify-center"
    scrolling="no"
    src="https://aexll.github.io/platformer/platformer.html"
    allowfullscreen
    width="1200" height="675"
    style="border:none; overflow:hidden"></iframe>
    <a class="flex justify-center underline" href="https://aexll.github.io/platformer/platformer.html"> Fullscreen </a>

      <p class="flex justify-center text-white">a platformer demo on godot, with a lot of smooth features</p>
      <p class="flex justify-center text-white">including:</p>
      <li class="flex justify-center">Coyote jump time</li>
      <li class="flex justify-center">Buffered jump inputs</li>
      <li class="flex justify-center">Variable jump height</li>
      <li class="flex justify-center">Jump apex gravity modifier</li>
      <li class="flex justify-center">...</li>
      <li class="flex justify-center"> and more !</li>
      <p class="flex justify-center text-white"></p>


    </Project>


    <!-- Doodle Jump -->
    <Project
    cardImg="img/doodle.png"
    cardTitle="Project 3"
    shadowColor="#ffff66"
    cardBodyStyle="background-image: url('/img/doodle_bg.png');"
    cardBackground="fixed inset-0 z-40 bg-black/50"
    cardClass="absolute w-40 rounded-xl ring-2 ring-yellow-400/30"
    cardBody="bg-center outline outline-1 outline-gray">

    <img src="/img/doodle_title.png" alt="Exo" class="flex p-4 mx-auto drop-shadow-[00px_00px_10px_rgba(0,0,0,0.5)]"/>
    

    <!-- <h1 class="flex justify-center font-bold text-8xl text-yellow-400 title_orange">Doodle Jump replica</h1> -->

    <br>
    <iframe 
    title="Platformer"
    class="flex mx-auto justify-center"
    scrolling="no"
    src="https://aexll.github.io/Doodle/index.html"
    allowfullscreen
    width="1200" height="680"
    style="border:none; overflow:hidden"></iframe>
      <p class="flex justify-center text-black font-DoodleJump text-xl">very quick project to replicate the game of doodle jump</p>
      <p class="flex justify-center text-gray font-DoodleJump text-xl">I know its very buggy</p>


    </Project>

    

    <!-- Soon -->


    </div>
    </div> <!---->
    </div>

  </div> <!---->
</body>




<style>

  .text {
    display: flex;
    justify-content: center;
    color: white;
    font-size: 1.25rem /* 20px */;
    line-height: 1.75rem /* 28px */;
  }

  .title {
    will-change: filter;
    /* transition: filter 300ms; */
    filter: drop-shadow(0 0 0.3em #ffffff7e);
  }
  .title_orange {
    will-change: filter;
    /* transition: filter 300ms; */
    filter: drop-shadow(0 0 0.3em #ff88007e);
  }
  .title_black {
    will-change: filter;
    /* transition: filter 300ms; */
    filter: drop-shadow(0 0 0.1em #000000d1);
  }
  .title_green {
    will-change: filter;
    /* transition: filter 300ms; */
    filter: drop-shadow(0 0 0.1em #1aff007c);
  }
  .title_blue {
    will-change: filter;
    /* transition: filter 300ms; */
    filter: drop-shadow(0 0 0.1em #00c3ff7c);
  }
  .title_darkblue {
    will-change: filter;
    /* transition: filter 300ms; */
    filter: drop-shadow(0 0 0.1em #2200ff48);
  }
  .title_white {
    will-change: filter;
    /* transition: filter 300ms; */
    filter: drop-shadow(0 0 0.1em #ffffff48);
  }
  .title:hover {
    filter: drop-shadow(0 0 0.3em #ffffff7e);
  }

</style>


<!-- .logo {
  filter: drop-shadow(0 0 0.8em #646cffaa);
} -->
