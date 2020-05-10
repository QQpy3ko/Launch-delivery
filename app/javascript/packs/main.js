import Vue from 'vue'
import TurbolinksAdapter from 'vue-turbolinks'
import BootstrapVue from "bootstrap-vue"

import LaunchMenu from "./components/LaunchMenu.vue";

Vue.use(BootstrapVue)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  var element = document.getElementById("launch-menu")
  var app = new Vue({
    el: element,
    render: h => h(LaunchMenu)
  })
})
