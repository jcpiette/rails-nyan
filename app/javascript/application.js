// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
console.log("yoohoo");
import "./controllers"
import * as bootstrap from "bootstrap";
import "./channels"
import "./components"
import { autocompleteSearch } from "./components/autocomplete";
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
console.log("hello!")
autocompleteSearch()

const runOdometer = (e) => {
  console.log('Inside Method');
	const element = document.querySelector('#odometer');
	const position = element.getBoundingClientRect();

	// checking whether fully visible
	if(position.top >= 0 && position.bottom <= window.innerHeight) {
		console.log('Element is fully visible in screen');
    odometer.innerHTML = 34567899;
	} else {
    element.innerHTML = 0;
  }
}

window.addEventListener('scroll', runOdometer);
