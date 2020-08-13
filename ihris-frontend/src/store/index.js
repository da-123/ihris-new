import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    message: {
      type: "info",
      text: null,
      timeout: 5000,
      active: false
    }
  },
  mutations: {
    closeMessage( state ) {
      state.message.active = false
    },
    setMessage( state, data ) {
      if ( typeof data === "string" ) {
        state.message.type = "info"
        state.message.timeout = 5000
        state.message.text = data
        state.message.active = true
      } else {
        state.message.type = data.type || "info"
        state.message.timeout = data.timeout || 5000
        state.message.text = data.text
        state.message.active = true
      }
    }
  },
  actions: {},
  modules: {}
});