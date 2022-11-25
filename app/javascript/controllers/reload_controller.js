import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reload"
export default class extends Controller {
  doReload() {
  setTimeout(() => location.reload(), 7000)
  }
}
