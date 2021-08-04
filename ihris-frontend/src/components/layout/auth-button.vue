<template>
  <div class="text-xs-center">
    <a v-if="data.method=='get'" :href="data.link">
      <img v-if="image" :src="'/images/' + image" :alt="data.btn.text" width="191" height="46"/>
    </a>
    <v-dialog v-if="data.method=='post'" v-model="dialog" width="800" height="200">
      <template v-slot:activator="{ on }">
        <a v-on="on">
          <img v-if="image" :src="'/images/' + image" :alt="data.btn.text" width="191" height="46"/>
        </a>
      </template>
      <v-form>
        <v-card class="d-flex align-stretch" >
        <v-card width="400" min-height="280">
          <v-card-text align="center" justify="center">
          <v-img :src="'/images/MOH_logo.c29ce52c.png'"  align="center" justify="center" max-width="150" max-height="132" contain/>
          </v-card-text>
            <v-card-text align="center" justify="center">
              <div class="text--primary font-weight-medium">
              ወደ HRIS እንኳን በደህና መጡ!
              </div>
              <div class="text--primary font-weight-medium">
              Welcome to HRIS!<br>
            </div>
            </v-card-text>
        </v-card>
        <v-card width="400" min-height="280" color="#34495E">
          <v-card-text align="center" justify="center">
              <div class="white--text display-1">
              Login<br>
            </div>
            </v-card-text>
          <v-card-text>
            <v-text-field 
              color="white"
              dark
              v-model="username" 
              label="Email Address" 
              required 
              prepend-icon="mdi-email"
            ></v-text-field>
            <v-text-field 
              color="white"
              dark
              v-model="password" 
              label="Password" 
              required 
              :append-icon="show_pass ? 'mdi-eye' : 'mdi-eye-off'"
              :type="show_pass ? 'text' : 'password'"
              @click:append="show_pass = !show_pass"
              prepend-icon="mdi-form-textbox-password"
              @keyup.native.enter="submit"
              ></v-text-field>
          </v-card-text>
          <!--<v-divider></v-divider>-->
          <v-card-actions>
            <v-snackbar v-model="snackbar" :absolute="absolute" color="secondary">
              {{ message }}
              <v-btn color="warning" text @click="snackbar = false">Close</v-btn>
            </v-snackbar>
            <v-btn color="success" :loading="loggingin" :disabled="loggingin" @click="submit">Sign In</v-btn>
          </v-card-actions>
          </v-card>
       </v-card>
      </v-form>
    </v-dialog>
  </div>
</template>

<script>
export default {
  name: "auth-button",
  props: ["data", "big"],
  data: function() {
    return {
      dialog: false,
      username: "",
      password: "",
      show_pass: false,
      loggingin: false,
      message: "",
      snackbar: false,
      absolute: true,
      notificationDays :5,
      monthNames : ["January", "February", "March", "April", "May", "June",
                    "July", "August", "September", "October", "November", "December"
                  ],
      notificationMessage: "Please send your HR report to assigned juridiction or facility."
    }
  },
  computed: {
    image: function() {
      if ( this.big ) {
        return this.data.btn.image2x
      } else {
        return this.data.btn.image
      }
    }
  },
  methods: {
    submit () {
      this.loggingin = true
      var formData = new URLSearchParams()
      formData.append("username", this.username)
      formData.append("password", this.password)
      fetch( this.data.link, { 
        method: "POST", 
        headers: {"Content-Type": "application/x-www-form-urlencoded"}, 
        body: formData
      } ).then(response => {
          this.loggingin = false
          if ( response.ok ) {
            response.json().then(data => {
              this.dialog = false
              //this.absolute=false
              this.snackbar=true
              this.message="Login successful"
              //Check the report message date for notification
              fetch("/fhir/CodeSystem/ihris-report-notification-codesystem",{
                method: "GET",
              }).then(response =>{
                if(response.ok){
                  response.json().then(data =>{
                    const today = new Date()
                    let currentMonth = this.monthNames[today.getMonth()]
                    let found = data.concept.find(m => m.display === currentMonth)
                    if(found){
                      let currentYear = today.getFullYear()
                      let currentDay = today.getDay()
                      let daysInMonth = new Date(currentYear, today.getMonth()+1,0).getDate()
                      if(currentDay >= (daysInMonth - this.notificationDays) && currentDay <= daysInMonth){
                        this.$store.commit('setMessage', { type: 'warning', text: this.notificationMessage,timeout:100000} )
                      }
                    }
                  })
                }
              })

              this.$emit("loggedin", data.user)
            }).catch(err => {
              this.loggingin = false
              this.snackbar=true
              this.message=err.message
            })
          } else {
            //this.absolute=true
            this.message="Username or password are incorrect"
            this.snackbar=true
            this.loggingin = false
          }
      } ).catch(err => {
        console.log(err)
        //this.absolute=true
        this.loggingin = false
        this.snackbar=true
        this.message="Login failed: "+err.message
      } )
    }
  }
}
</script>
