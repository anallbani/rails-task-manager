import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { id: Number, completed: Boolean }
  static targets = ["icon", "status"]

  toggle(event) {
    event.preventDefault()
    fetch(`/tasks/${this.idValue}/toggle`, {
      method: "PATCH",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": this.csrfToken()
      }
    })
      .then(response => response.json())
      .then(data => {
        this.completedValue = data.completed
        this.update()
      })
  }

  update() {
    if (this.hasIconTarget) {
      this.iconTarget.textContent = this.completedValue ? "✅" : "⬜"
    }
    if (this.hasStatusTarget) {
      this.statusTarget.textContent = this.completedValue ? "✅ This task is completed" : "❌ This task is not completed yet"
    }
  }

  csrfToken() {
    const element = document.querySelector('meta[name="csrf-token"]')
    return element ? element.getAttribute('content') : ''
  }
}
