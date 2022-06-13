import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = []


  connect() {
    console.log("connected");
  }

  shortlist(){
    if(this.element.classList.contains('button-outline')){
      this.element.classList.remove('button-outline');
      this.element.classList.add('button-primary');
    }else{
      this.element.classList.remove('button-primary');
      this.element.classList.add('button-outline');
    }
  }

}
