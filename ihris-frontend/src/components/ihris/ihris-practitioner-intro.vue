<style scoped>
.ihris-intro{
   display: flex;
    flex-direction: row;
    position: fixed;
    background-color: var(--v-warning-base)!important;
    width: 30vw;
    height: 56px;
    z-index: 1;
    top: 9%;
    padding: 7px;
    color: #fff;
    padding-left: 5px;
    border-radius: 0 0 10px 10px;
    left: 50%;
    transform: translate(-50%, -50%);
}

.hide {
    opacity:0;
}
.show {
    opacity:1;
}
</style>

<template>
  <div v-if="intro.value !== ''" :class="['ihris-intro',(hasScrolled || this.isQuestionnaire) ? 'show':'hide']">
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

          let firstName = practitioner.name[0].given[0];

          let gender = practitioner.gender;

          let extensions =  practitioner.extension[0]//.filter(ext => ext.url === 'http://ihris.org/fhir/StructureDefinition/ihris-practitioner-familynames')

          extensions = extensions.extension

          let fatherName = extensions.filter(ext => ext.url === 'fathers')

          let grandFatherLastName = extensions.filter(ext => ext.url === 'grandfatherslastname')


          this.intro.value = firstName+" "+fatherName[0].valueString+" "+grandFatherLastName[0].valueString+" "+gender

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
