import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['menu', 'burger', 'close', 'view', 'notice']
  static values = { open: { type: Boolean, default:false }, notice: { type: String, default: '' } }

  initialize() {}

  connect() {
    document.addEventListener('click', (e) => {    
      var tag = e.target.closest('a') || '';
      if (tag != '') {
        this.hide();
      }
    }, false);
  }
  
  timeoutNotice() {
    if (this.noticeTarget.textContent != '') {
      setTimeout(() => {
        this.noticeTarget.classList.add('active');
      }, 750);
      setTimeout(() => {
        this.noticeTarget.classList.remove('active');
      }, 3500);
    }
  }

  noticeValueChanged() {
    this.timeoutNotice();
  }

  menu() {
    if (this.openvalue) {
      this.hide();
    } else {
      this.show();
    }
    this.openvalue = !this.openvalue;
  }

  show() {
    this.menuTarget.classList.add('active')
    this.viewTarget.classList.add('active')
    this.burgerTarget.style.display = 'none'
    this.closeTarget.style.display = 'block'
  }

  hide() {
    this.menuTarget.classList.remove('active')
    this.viewTarget.classList.remove('active')
    this.burgerTarget.style.display = 'block'
    this.closeTarget.style.display = 'none'
  }
}