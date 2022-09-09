import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ['menu'];

  static values = {
    isOpen: { type: Boolean, default: false },
  };

  toggle() {
    this.isOpenValue ? this.hide() : this.show();

    this.isOpenValue = !this.isOpenValue;
  }

  show() {
    this.menuTarget.style.transform = 'translateX(0)';
  }

  hide() {
    this.menuTarget.style.transform = 'translateX(-102%)';
  }
}
