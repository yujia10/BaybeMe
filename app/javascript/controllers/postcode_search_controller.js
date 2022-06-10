import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['input']
  static values = {
    apiKey: String,
    appId: String
  }

  connect() {
    var placesAutocomplete = places({
      appId: this.appIdValue,
      apiKey: this.apiKeyValue,
      container: this.inputTarget
    }).configure({
      postcodeSearch: true,
      type: 'city'
    });
  }
}
