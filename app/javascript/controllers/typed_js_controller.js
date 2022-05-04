import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Create lists", "Choose your movies", "Create bookmarks!"],
      typeSpeed: 40,
      loop: true,
      loopCount: Infinity,
      showCursor: false
    });
  }
}


// strings: ["Drama", "Classic", "Comedy", "Action", "Romantic", "Thriller", "Horror", "Slasher"],
