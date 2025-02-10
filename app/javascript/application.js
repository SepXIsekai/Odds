// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import { Controller } from "@hotwired/stimulus"

document.addEventListener("turbo:submit-end", function (event) {
  if (event.target && event.target.id === "message-form") {
    event.target.reset();  // ✅ Reset ฟอร์มหลังจากส่งข้อความ
  }
});
