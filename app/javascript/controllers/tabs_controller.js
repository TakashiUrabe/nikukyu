import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["menu", "content"]


  menuClick(event){
    const menus = this.menuTargets
    const current = event.currentTarget
    const currentIndex = menus.indexOf(current)
    const contents = this.contentTargets

    menus.forEach((menu, index)=>{
      if(current.classList.contains("not-active")){
        menu.classList.remove("tab-active")
        menu.classList.add("not-active")
        contents[index].classList.add("hidden")
      }
    })

    if(current.classList.contains("not-active")){
      current.classList.remove("not-active")
      current.classList.add("tab-active")
      contents[currentIndex].classList.remove("hidden")
    }
  }
}
