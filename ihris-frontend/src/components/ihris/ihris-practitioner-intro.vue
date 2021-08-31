<style scoped>
.ihris-intro-container{
    display: flex;
    flex-direction: row;
    position: fixed;
    background-color: #d06f1a;
    width: 30vw;
    z-index: 1;
    top: 15%;
    padding: 5px;
    color: #fff;
    font-size: smaller;
    padding-left: 5px;
    border-radius: 0 0 10px 10px;
    left: 50%;
    transform: translate(-50%,-50%);
}
.ihris-intro{
    display: flex;
    flex-direction: column;
    padding: 5px;
}

.hide {
    opacity:0;
}
.show {
    opacity:1;
}
.photo{
  max-width: 30%;
}
</style>

<template>
<div v-if="intro.fullname !== ''" :class="['ihris-intro-container',(hasScrolled || this.isQuestionnaire) ? 'show':'hide']">
     <v-img :src="intro.photoURL" contain :max-height="150" class="photo" position="left" />
     <div class="ihris-intro">
          <span>Employee ID : {{intro.employeeID}}</span>
          <span>Full name : {{intro.fullname}}</span>
          <span>Date of Birth : {{intro.birthDate}}</span>
          <span>Gender : {{intro.gender}}</span>
    </div>
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
        fullname:"",
        photoURL:"",
        birthDate:"",
        gender:"",
        employeeID:""
      },
      hasScrolled:false,
    }
  },
  components:{
     
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
    },
  },
  methods: {
    setupData() {

      if ( this.slotProps && this.slotProps.source ) {

          let practitioner = this.slotProps.source.data

          let firstName = (practitioner.name)?practitioner.name[0].given[0]:"";

          this.intro.gender = practitioner.gender;

          this.intro.birthDate = practitioner.birthDate

          this.intro.employeeID = (practitioner.identifier)?practitioner.identifier[0].value:""

          let extensions =  (practitioner.extension)?practitioner.extension[0]:null//.filter(ext => ext.url === 'http://ihris.org/fhir/StructureDefinition/ihris-practitioner-familynames')

          extensions = (extensions)?extensions.extension:[]

          let fatherName = extensions.filter(ext => ext.url === 'fathers')

          let grandFatherLastName = extensions.filter(ext => ext.url === 'grandfatherslastname')
          
          let photo = ""
          if(practitioner.photo) photo = practitioner.photo[0]
          fatherName = (fatherName.length>0)?fatherName[0].valueString:""
          grandFatherLastName = (grandFatherLastName.length>0)?grandFatherLastName[0].valueString:""

          this.intro.fullname = firstName+" "+fatherName+" "+grandFatherLastName
         /*if ( this.photoURL ) {
            URL.revokeObjectURL( this.photoURL )
          }*/
          if ( photo.data && photo.contentType ) {
            let dataURL = "data:"+photo.contentType+";base64,"+photo.data
            fetch(dataURL).then( res => res.blob() ).then( blob => {
              this.intro.photoURL = URL.createObjectURL( blob ) 
              //URL.revokeObjectURL(this.photoURL)
              }).catch( e => {
              console.log("Failed to get data from base64.",e)
            } )
          }

        }
    },
    handleScroll(event) {
      // Any code to be executed when the window is scrolled
      console.log(window.top.scrollY);
      this.hasScrolled = (window.top.scrollY >= 100);
      console.log(event);
    },
    toggleContent(){
      this.showMore = !this.showMore;
    }
  }
}
</script>
