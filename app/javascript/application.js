// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap";
import "./channels"
import "./components"
import { autocompleteSearch } from "./components/autocomplete";
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
autocompleteSearch()


// const sports = document.querySelectorAll('.clickable');

// const toggleActiveClass = (event) => {
//   event.currentTarget.classList.toggle('active');
// };

// const toggleActiveOnClick = (sport) => {
//   sport.addEventListener('click', toggleActiveClass);
// };

// sports.forEach(toggleActiveOnClick);
