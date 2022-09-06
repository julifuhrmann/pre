import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["alert", "notice"]

  connect() {
    console.log(this.noticeTarget)
    let notice = this.noticeTarget
    setTimeout(function () {
        notice.classList.remove("show");
        notice.remove();
    }, 3000);
  }
}
