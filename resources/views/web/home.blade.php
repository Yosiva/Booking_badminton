<x-app-layout>
  <x-slot name="mainLogoRoute">
    {{ route('home') }}
  </x-slot>


    <div class="relative">
        {{-- <img class="w-full" src="{{ asset('images\banner-salon.png') }}" alt="Banner image"> --}}
        {{-- <img class="max-h-fit w-full" src="{{ asset('images\salon1.png') }}" alt="Banner image"> --}}
        <!--
  Heads up! 👋

  This component comes with some `rtl` classes. Please remove them if they are not needed in your project.
-->

<section
class="relative bg-cover bg-center bg-no-repeat " style="background-image: url({{ asset('images/dwbadminton.jpeg') }}" ;>
<div class="absolute inset-0 bg-gradient-to-r from-white/95 to-white/0 ltr:bg-gradient-to-r rtl:bg-gradient-to-l sm:bg-transparent sm:from-white/95 sm:to-white/0"></div>

<div
  class="relative mx-auto max-w-screen-xl px-4 py-32 sm:px-6 lg:flex lg:h-screen lg:items-center lg:px-8"
>
  <div class="max-w-xl text-left ltr:sm:text-left rtl:sm:text-right">
    <h1 class="text-3xl font-extrabold sm:text-5xl text-neutral-700">
     Lapangan Badminton
      <strong class="block font-extrabold text-black-500">
        Paqueto.</strong>
    </h1>

    <div class="mt-8 flex flex-wrap gap-4 text-center">
      <a
        href="{{route('services')}}"
        class="block w-full rounded bg-pink-500 px-12 py-3 text-lg font-medium text-white shadow hover:bg-white-700 focus:outline-none focus:ring active:bg-pink-500 sm:w-auto"
      >
Book Now      </a>
<a
          href="{{route('services')}}"
          class="block w-full rounded bg-white px-12 py-3 text-lg font-medium text-pink-500 shadow hover:text-pink-600 focus:outline-none focus:ring-offset-pink-400 active:text-pink-500 sm:w-auto"
        >
          Browse Services
        </a>


    </div>

  </div>
</div>
</section>

        {{-- <img class="w-full bg-cover" src="{{ asset('images\Salon2.jpg') }}" alt="Banner image"> --}}
        {{-- <div class="absolute right-1 top-5 font-black text-pink-600 text-7xl">30% OFF <br>THIS SEASON</div> --}}
 <div>
    <div class="text-center text-4xl font-semibold text-pink-500 m-2 mt-5">Categories</div>

    <div class="container flex gap-10 p-10 pt-3 justify-center mx-auto">
      <a href="#" class="text-center gap-2 duration-300 hover:scale-105">
          <img class="w-60 rounded-xl" src="{{ asset('images/hair.jpg')}}" alt="">
          <span class="text-pink-500 text-2xl">field</span>
      </a>
      <a href="#" class="text-center gap-2 duration-300 hover:scale-105">
        <img class="w-60 rounded-xl" src="{{ asset('images/nails.jpg')}}"  alt="">
        <span class="text-pink-500 text-2xl">ball</span>

      </a>
      <a href="#" class="text-center gap-2 duration-300 hover:scale-105">
        <img class="w-60 rounded-xl" src="{{ asset('images/skin.jpg')}}" alt="">
        <span class="text-pink-500 text-2xl">seat</span>

      </a>
      <a href="#" class="text-center gap-2 duration-300 hover:scale-105">
        <img class="w-60 rounded-xl" src="{{ asset('images/makeup.jpg')}}" alt="">
        <span class="text-pink-500 text-2xl">change room</span>
      </a>
    </div>

    </div>

    <section class="pt-5 bg-white">
      <div class="md:w-4/5 mx-auto">
        <div class="mx-auto text-center md:max-w-xl lg:max-w-3xl">
          <h3 class="mb-6 text-3xl text-pink-500 font-bold">Popular Services</h3>
          <p class="mb-6 pb-2 text-gray-700 md:mb-12 md:pb-0">
            Services Popular among our customers.
          </p>
        </div>

        <div class="flex flex-col md:flex-row mt-3 pb-7 h-max">
            @if($popularServices->count() > 0)
                @foreach ($popularServices as $service)
                    <x-service-card :service="$service"/>
                @endforeach
            @else
                <p class="mx-auto text-center block text-gray-700 md:mb-12 md:pb-0">
                    No Services Found
                </p>
            @endif
        </div>
      </div>

      <div class="flex justify-end mx-auto pb-5 gap-3 md:w-3/4">

        <a href="{{route('services')}}" class="bg-pink-500 hover:bg-pink-600 text-white font-bold py-2 px-4 rounded">
          View All Services
        </a>
      </div>
{{--
      <div class="m-8 text-center w-2"> --}}
        {{-- <x-button>View all services</x-button>   --}}
        {{-- <a
          href="#"
          class="block w-full rounded bg-pink-500 px-12 py-3 text-lg font-medium text-white shadow hover:bg-pink-700 focus:outline-none focus:ring active:bg-pink-500 sm:w-auto"
        >
  Browse Services    </a> --}}

    </section>

<section class=" w-3/4 p-3 mx-auto pt-5">
<div>
  <div class="text-center text-4xl font-semibold text-pink-500 m-2">Offers</div>
</div>
<div class="flex gap-10 ">
    @if($deals->count() > 0)
        @foreach($deals as $deal)
            @if($deal->is_hidden == false)
                <div class="max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow ">
                    <a href="#">
                        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">{{ $deal->name }}</h5>
                    </a>
                    <p class="mb-3 font-normal text-gray-700 ">{{ $deal->description }}</p>
                    <a href="#" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-pink-500 rounded-lg hover:bg-pink-800 focus:ring-4 focus:outline-none focus:ring-pink-300 ">
                        View Offer
                        <svg aria-hidden="true" class="w-4 h-4 ml-2 -mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                    </a>
                </div>
            @endif
        @endforeach
    @else
        <p class="mx-auto text-center block text-gray-700 md:mb-12 md:pb-0">
            No Deals Found
        </p>
    @endif
</div>
    </section>

    {{-- Gallery --}}
    <section class="pt-5 pb-5">
        <div class="mx-auto text-center md:max-w-xl lg:max-w-3xl">
          <h3 class="text-3xl text-pink-500 font-bold">Gallery</h3>
        </div>
        <div class="container mx-auto px-5 py-2 lg:px-32 lg:pt-12">
          <div class="-m-1 flex flex-wrap md:-m-2">
            <div class="flex w-1/3 flex-wrap">
              <div class="w-full p-1 md:p-2">
                <img
                  alt="gallery"
                  class="block h-full w-full rounded-lg object-cover object-center"
                  src="images/gallery/gallery1.jpg" />
              </div>
            </div>
            <div class="flex w-1/3 flex-wrap">
              <div class="w-full p-1 md:p-2">
                <img
                  alt="gallery"
                  class="block h-full w-full rounded-lg object-cover object-center"
                  src="images/gallery/gallery2.jpg" />
              </div>
            </div>
            <div class="flex w-1/3 flex-wrap">
              <div class="w-full p-1 md:p-2">
                <img
                  alt="gallery"
                  class="block h-full w-full rounded-lg object-cover object-center"
                  src="images/gallery/gallery3.jpg" />
              </div>
            </div>
            <div class="flex w-1/3 flex-wrap">
              <div class="w-full p-1 md:p-2">
                <img
                  alt="gallery"
                  class="block h-full w-full rounded-lg object-cover object-center"
                  src="images/gallery/gallery4.jpg" />
              </div>
            </div>
            <div class="flex w-1/3 flex-wrap">
              <div class="w-full p-1 md:p-2">
                <img
                  alt="gallery"
                  class="block h-full w-full rounded-lg object-cover object-center"
                  src="images/gallery/gallery5.jpg" />
              </div>
            </div>
            <div class="flex w-1/3 flex-wrap">
              <div class="w-full p-1 md:p-2">
                <img
                  alt="gallery"
                  class="block h-full w-full rounded-lg object-cover object-center"
                  src="images/gallery/gallery6.jpg" />
              </div>
            </div>
          </div>
        </div>
    </section>
    {{-- Nail Extensions --}}
    <section class="bg-white pt-5">
      <div class="md:w-3/4 mx-auto">
        <div class="mx-auto text-center md:max-w-xl lg:max-w-3xl">
          <h3 class="mb-6 text-3xl text-pink-500 font-bold"></h3>
        </div>

      

    </section>


    <section class="mb-12" id="offer-banner">

            <svg class="w-4 h-4" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512"><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg>
          </div>
        </div>
      </div>

    </section>
    <!-- Footer container -->
<footer
class="bg-pink-500 text-center text-neutral-100 lg:text-left">
<div
  class="flex items-center justify-center border-b-2 border-neutral-200 p-6 lg:justify-between">
  <div class="mr-12 hidden lg:block">
    <span>Get connected with us on social networks:</span>
  </div>
  <!-- Social network icons container -->
  <div class="flex justify-center">
    <a href="#!" class="mr-6 text-neutral-600 dark:text-neutral-200">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        class="h-4 w-4"
        fill="currentColor"
        viewBox="0 0 24 24">
        <path
          d="M9 8h-3v4h3v12h5v-12h3.642l.358-4h-4v-1.667c0-.955.192-1.333 1.115-1.333h2.885v-5h-3.808c-3.596 0-5.192 1.583-5.192 4.615v3.385z" />
      </svg>
    </a>
    <a href="#!" class="mr-6 text-neutral-600 dark:text-neutral-200">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        class="h-4 w-4"
        fill="currentColor"
        viewBox="0 0 24 24">
        <path
          d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z" />
      </svg>
    </a>

    <a href="#!" class="mr-6 text-neutral-600 dark:text-neutral-200">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        class="h-4 w-4"
        fill="currentColor"
        viewBox="0 0 24 24">
        <path
          d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z" />
      </svg>
    </a>


  </div>
</div>

<!-- Main container div: holds the entire content of the footer, including four sections (Tailwind Elements, Products, Useful links, and Contact), with responsive styling and appropriate padding/margins. -->
<div class="mx-6 py-10 text-center md:text-left">
  <div class="grid-1 grid gap-8 md:grid-cols-2 lg:grid-cols-3">
    <!-- Tailwind Elements section -->
    <!-- Contact section -->

    <div>
      <h6
        class="mb-4 flex items-center justify-center font-semibold text-xl md:justify-start">
        <img class="w-8 h-7" src="{{ asset('images/imgg.jpg')}}" alt="">
       PaquetoBadminton
    </h6>
      <p class="mb-4 flex items-center justify-center md:justify-start">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 24 24"
          fill="currentColor"
          class="mr-3 h-5 w-5">
          <path
            d="M11.47 3.84a.75.75 0 011.06 0l8.69 8.69a.75.75 0 101.06-1.06l-8.689-8.69a2.25 2.25 0 00-3.182 0l-8.69 8.69a.75.75 0 001.061 1.06l8.69-8.69z" />
          <path
            d="M12 5.432l8.159 8.159c.03.03.06.058.091.086v6.198c0 1.035-.84 1.875-1.875 1.875H15a.75.75 0 01-.75-.75v-4.5a.75.75 0 00-.75-.75h-3a.75.75 0 00-.75.75V21a.75.75 0 01-.75.75H5.625a1.875 1.875 0 01-1.875-1.875v-6.198a2.29 2.29 0 00.091-.086L12 5.43z" />
        </svg>
        jati
      </p>
      <p class="mb-4 flex items-center justify-center md:justify-start">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 24 24"
          fill="currentColor"
          class="mr-3 h-5 w-5">
          <path
            d="M1.5 8.67v8.58a3 3 0 003 3h15a3 3 0 003-3V8.67l-8.928 5.493a3 3 0 01-3.144 0L1.5 8.67z" />
          <path
            d="M22.5 6.908V6.75a3 3 0 00-3-3h-15a3 3 0 00-3 3v.158l9.714 5.978a1.5 1.5 0 001.572 0L22.5 6.908z" />
        </svg>
        info --> 
      </p>
      <p class="mb-4 flex items-center justify-center md:justify-start">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 24 24"
          fill="currentColor"
          class="mr-3 h-5 w-5">
          <path
            fill-rule="evenodd"
            d="M1.5 4.5a3 3 0 013-3h1.372c.86 0 1.61.586 1.819 1.42l1.105 4.423a1.875 1.875 0 01-.694 1.955l-1.293.97c-.135.101-.164.249-.126.352a11.285 11.285 0 006.697 6.697c.103.038.25.009.352-.126l.97-1.293a1.875 1.875 0 011.955-.694l4.423 1.105c.834.209 1.42.959 1.42 1.82V19.5a3 3 0 01-3 3h-2.25C8.552 22.5 1.5 15.448 1.5 6.75V4.5z"
            clip-rule="evenodd" />
        </svg>
        0812345945945
      </p>

    </div>

    <!-- Services section -->
    <div class="">
      <h6
        class="mb-4 flex justify-center font-semibold uppercase md:justify-start">
        Services
      </h6>
      <p class="mb-4">
        <a href="#!" class="text-neutral-600 dark:text-neutral-200"
          >Field</a
        >
      </p>
      <p class="mb-4">
        <a href="#!" class="text-neutral-600 dark:text-neutral-200"
          >Balls</a
        >
      </p>
      <p class="mb-4">
        <a href="#!" class="text-neutral-600 dark:text-neutral-200"
          >Seat</a
        >
      </p>
      <p>
        <a href="#!" class="text-neutral-600 dark:text-neutral-200"
          >Room Changes</a
        >
      </p>
    </div>
    <!-- Promotions section -->
    <div class="">
      <h6
        class="mb-4 flex justify-center font-semibold uppercase md:justify-start">
       Promotions
      </h6>
      <p class="mb-4">
        <a href="#!" class="text-neutral-600 dark:text-neutral-200"
          >Special Offers</a
        >
      </p>
      <p class="mb-4">
        <a href="#!" class="text-neutral-600 dark:text-neutral-200"
          >Loyalty Program</a
        >
      </p>
      <p class="mb-4">
        <a href="#!" class="text-neutral-600 dark:text-neutral-200"
          >Loyalty teirs</a
        >
      </p>

    </div>

  </div>
</div>

<!--Copyright section-->
<div class="bg-white p-2 text-center">
  <span class="text-neutral-500">© 2023 Copyright:</span>
  <a
    class="font-semibold text-neutral-600"
    href="/"
    >Paqueto
  >
</div>
</footer>
<script>
  // hide offer-banner when user clicks on close
  document.getElementById("offer-banner-close").addEventListener("click", function() {
    document.getElementById("offer-banner").style.display = "none";
  });

</script>

</x-app-layout>
