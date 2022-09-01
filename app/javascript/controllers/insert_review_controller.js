import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-review"
export default class extends Controller {
  static targets = ["items", "form"]

  connect() {
    console.log(this.itemsTarget)
  }

  send(event) {
    event.preventDefault()
    console.log(this.formTarget.action)

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
  }

}
