import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
    connect() {
        console.log("Hello Spree Commerce Stimulus!", this.element);
    }
}