import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["navbar"]

  connect() {
    console.log("Hello Motto")
  }

  menu(){
    console.log("I have been clicked")
    if(this.navbarTarget.classList.contains("show")){
      this.navbarTarget.classList.remove("show")
    } else {
      this.navbarTarget.classList.add("show")
    }
  }
}
