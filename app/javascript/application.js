// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "trix"
import "@rails/actiontext"


// confirm for forms, tooltips
document.addEventListener("turbo:load", () => {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })

  var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })
})
document.addEventListener("turbo:submit-start", (event) => {
  const button = event.target.querySelector("[data-confirm]")
  const message = button?.dataset?.confirm

  return new Promise(resolve => {
    if (!message || confirm(message)) {
      resolve()
    } else {
      event.detail.formSubmission.stop()
      event.preventDefault()
      event.stopImmediatePropagation()
    }
  })
})
