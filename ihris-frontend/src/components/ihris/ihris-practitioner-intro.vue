<style scoped>
.ihris-intro{
    display: flex;
    flex-direction: row;
    position: fixed;
    background-color: var(--v-warning-base) !important;
    width: 60%;
    z-index: 1;
    top: 65px;
    color: #ffff;
    padding-left: 20px;
    border-radius: 0 0 10px 0;
}

.hide {
    opacity:0;
}
.show {
    opacity:1;
}
</style>

<template>
  <div :class="['ihris-intro',(hasScrolled || this.isQuestionnaire) ? 'show':'hide']">
     <span>{{intro.display}} : {{intro.value}}</span>
  </div>
  
</template>

<script>
export default {
  name: "ihris-practitioner-intro",
  props: ["slotProps", "isQuestionnaire"],
  data: function() {
    return {

      intro:{
        display:"Health Worker",
        value:""
      },
      hasScrolled:false
    }
  },
  components:{
     
  },
  created: function() {
   this.setupData()
  },
  mounted(){

    if(!this.isQuestionnaire){
      window.addEventListener('scroll', this.handleScroll);
    }else{
      window.removeEventListener('scroll', this.handleScroll);
    }
  },
  beforeDestroy() {
    window.removeEventListener('scroll', this.handleScroll);
  },
  watch: {
    slotProps: {
      handler() {
        if ( !this.lockWatch ) {
          this.setupData()
        }
      },
      deep: true
    }
  },
  methods: {
    setupData() {

      if ( this.slotProps && this.slotProps.source ) {

          let practitioner = this.slotProps.source.data

          let extensions =  practitioner.extension.filter(ext => ext.url === 'http://ihris.org/fhir/StructureDefinition/ihris-practitioner-familynames')

          let firstName = practitioner.name[0].given[0];

          let gender = practitioner.gender;

          let fatherName = extensions.filter(ext => ext.url === 'fathers')

          let grandFatherLastName = extensions.filter(ext => ext.url === 'grandfatherslastname')

          this.intro.value = firstName+" "+fatherName+" "+grandFatherLastName+" "+gender

        }
    },
    handleScroll(event) {
      // Any code to be executed when the window is scrolled
      console.log(window.top.scrollY);
      this.hasScrolled = (window.top.scrollY >= 100);
      console.log(event);
    }
  }
}
</script>
