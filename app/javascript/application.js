// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  reset() {
    this.element.reset();
  }
}
