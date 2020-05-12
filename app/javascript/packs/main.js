import Vue from 'vue'
import axios from "axios";
import TurbolinksAdapter from 'vue-turbolinks'
import BootstrapVue from "bootstrap-vue"

import LaunchMenu from "./components/LaunchMenu.vue";

Vue.use(BootstrapVue)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  var element = document.getElementById("launch-menu")
  var app = new Vue({
    el: element,
    render: h => h(LaunchMenu)
  })
})
