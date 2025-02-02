import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["passenger", "template"];

  addPassenger(event) {
    event.preventDefault();
    const content = this.templateTarget.innerHTML.replace(
      /TEMPLATE_RECORD/g,
      new Date().getTime()
    );
    this.passengerTarget.insertAdjacentHTML("beforeend", content);
  }

  removePassenger(event) {
    event.preventDefault();
    if (this.passengerTarget.children.length > 1) {
      event.target.closest(".nested-fields").remove();
    }
  }
}
