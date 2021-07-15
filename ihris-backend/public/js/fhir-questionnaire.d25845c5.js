(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["fhir-questionnaire"],{"0bc6":function(e,t,r){},4983:function(e,t,r){"use strict";r.r(t);var a=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"ihris-section",attrs:{id:"section-"+e.id}},[r("v-card",{staticClass:"mx-auto",attrs:{"max-width":"700",outlined:""}},[r("v-card-title",{staticClass:"primary darken-1 white--text text-uppercase font-weight-bold"},[e._v(e._s(e.label))]),e._l(e.errors,(function(t,a){return r("v-card-text",{key:a,staticClass:"error white--text font-weight-bold"},[e._v(e._s(t))])})),r("v-card-text",{staticClass:"my-3"},[e._t("default")],2)],2)],1)},i=[],s={name:"ihris-questionnaire-section",props:["id","label","description","path","constraints"],data:function(){return{isQuestionnaireGroup:!0,errors:[]}}},n=s,o=r("2877"),c=r("6544"),l=r.n(c),d=r("b0af"),u=r("99d9"),h=Object(o["a"])(n,a,i,!1,null,null,null);t["default"]=h.exports;l()(h,{VCard:d["a"],VCardText:u["c"],VCardTitle:u["d"]})},5105:function(e,t,r){"use strict";r.r(t);var a=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"d-none"},[r("v-text-field",{attrs:{readonly:"","hide-details":"",dense:"",disabled:""},model:{value:e.hiddenValue,callback:function(t){e.hiddenValue=t},expression:"hiddenValue"}})],1)},i=[],s={name:"ihris-hidden",props:["label","path","hiddenType","hiddenValue"],data:function(){return{qField:"value"+this.hiddenType,value:this.hiddenValue}}},n=s,o=r("2877"),c=r("6544"),l=r.n(c),d=r("8654"),u=Object(o["a"])(n,a,i,!1,null,null,null);t["default"]=u.exports;l()(u,{VTextField:d["a"]})},"8ce9":function(e,t,r){},ce7e:function(e,t,r){"use strict";var a=r("5530"),i=(r("8ce9"),r("7560"));t["a"]=i["a"].extend({name:"v-divider",props:{inset:Boolean,vertical:Boolean},render:function(e){var t;return this.$attrs.role&&"separator"!==this.$attrs.role||(t=this.vertical?"vertical":"horizontal"),e("hr",{class:Object(a["a"])({"v-divider":!0,"v-divider--inset":this.inset,"v-divider--vertical":this.vertical},this.themeClasses),attrs:Object(a["a"])({role:"separator","aria-orientation":t},this.$attrs),on:this.$listeners})}})},e0c7:function(e,t,r){"use strict";var a=r("5530"),i=(r("0bc6"),r("7560")),s=r("58df");t["a"]=Object(s["a"])(i["a"]).extend({name:"v-subheader",props:{inset:Boolean},render:function(e){return e("div",{staticClass:"v-subheader",class:Object(a["a"])({"v-subheader--inset":this.inset},this.themeClasses),attrs:this.$attrs,on:this.$listeners},this.$slots.default)}})},f43a:function(e,t,r){"use strict";r.r(t);var a=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("v-card",{staticClass:"mx-auto",attrs:{"max-width":"700",outlined:""}},[r("v-card-title",{staticClass:"primary white--text text-uppercase font-weight-bold"},[e._v(e._s(e.label))]),e._l(e.errors,(function(t,a){return r("v-card-text",{key:a,staticClass:"error white--text font-weight-bold"},[e._v(e._s(t))])})),r("v-card-text",{staticClass:"my-3"},[e._t("default")],2)],2)},i=[],s={name:"ihris-questionnaire-group",props:["label","path","constraints"],data:function(){return{isQuestionnaireGroup:!0,errors:[]}}},n=s,o=r("2877"),c=r("6544"),l=r.n(c),d=r("b0af"),u=r("99d9"),h=Object(o["a"])(n,a,i,!1,null,null,null);t["default"]=h.exports;l()(h,{VCard:d["a"],VCardText:u["c"],VCardTitle:u["d"]})},f977:function(e,t,r){"use strict";r.r(t);var a=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("v-container",{staticClass:"my-3"},[r("ihris-practitioner-intro",{attrs:{slotProps:e.source}}),r("v-form",{ref:"form",model:{value:e.valid,callback:function(t){e.valid=t},expression:"valid"}},[e._t("default"),r("v-overlay",{attrs:{value:e.overlay}},[r("v-progress-circular",{attrs:{size:"50",color:"primary",indeterminate:""}}),r("v-btn",{attrs:{icon:""},on:{click:function(t){e.overlay=!1}}},[r("v-icon",[e._v("mdi-close")])],1)],1),r("v-navigation-drawer",{staticClass:"primary darken-1 white--text",staticStyle:{"z-index":"3"},attrs:{app:"",right:"",permanent:"",clipped:""}},[r("v-list",{staticClass:"white--text"},[r("v-list-item",[r("v-btn",{staticClass:"secondary",attrs:{dark:""},on:{click:function(t){return e.$router.go(-1)}}},[r("v-icon",{attrs:{light:""}},[e._v("mdi-pencil-off")]),r("span",[e._v("Cancel")])],1),r("v-spacer"),e.valid?r("v-btn",{staticClass:"success darken-1",attrs:{dark:"",disabled:!e.valid},on:{click:function(t){return e.processFHIR()}}},[r("v-icon",{attrs:{light:""}},[e._v("mdi-content-save")]),r("span",[e._v("Save")])],1):r("v-btn",{staticClass:"warning",attrs:{dark:""},on:{click:function(t){return e.$refs.form.validate()}}},[r("v-icon",{attrs:{light:""}},[e._v("mdi-content-save")]),r("span",[e._v("Save")])],1)],1),r("v-divider",{attrs:{color:"white"}}),e.sectionMenu?r("v-subheader",{staticClass:"white--text"},[r("h2",[e._v("Sections")])]):e._e(),e._l(e.sectionMenu,(function(t){return r("v-list-item",{key:t.id,attrs:{href:"#section-"+t.id}},[r("v-list-item-content",{staticClass:"white--text"},[r("v-list-item-title",{staticClass:"text-uppercase"},[r("h4",[e._v(e._s(t.title))])]),r("v-list-item-subtitle",{staticClass:"white--text"},[e._v(e._s(t.desc))])],1)],1)}))],2)],1)],2)],1)},i=[],s=(r("7db0"),r("a630"),r("a15b"),r("d81d"),r("d3b7"),r("ac1f"),r("6062"),r("3ca3"),r("1276"),r("ddb0"),r("b85c")),n=(r("96cf"),r("1da1")),o=r("b383"),c={name:"ihris-questionnaire",props:["id","url","title","description","purpose","section-menu","view-page","edit","constraints"],data:function(){return{fhir:{},loading:!1,overlay:!1,isEdit:!1,valid:!0,advancedValid:!0,source:{path:"",data:{}}}},components:{"ihris-practitioner-intro":function(){return Promise.all([r.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),r.e("fhir-main~fhir-primary~fhir-search~mhero"),r.e("fhir-primary~fhir-search~mhero"),r.e("fhir-primary")]).then(r.bind(null,"6dbd"))}},created:function(){var e=this,t=4732;this.$route.query&&fetch("/fhir/Practitioner/"+t).then((function(t){t.json().then((function(t){e.source={source:{data:t,path:"Practitoner"}},console.log("SOURCE ",e.source)})).catch((function(e){console.log(e)}))})).catch((function(e){console.log(e)}))},methods:{processFHIR:function(){var e=Object(n["a"])(regeneratorRuntime.mark((function e(){var t,r=this;return regeneratorRuntime.wrap((function(e){while(1)switch(e.prev=e.next){case 0:if(this.$refs.form.validate(),this.valid){e.next=3;break}return e.abrupt("return");case 3:return this.advancedValid=!0,this.overlay=!0,this.loading=!0,t=function(){var e=Object(n["a"])(regeneratorRuntime.mark((function e(a,i,n){var o,c,l,d,u,h,v,f;return regeneratorRuntime.wrap((function(e){while(1)switch(e.prev=e.next){case 0:n||(n={}),o=Object(s["a"])(i),e.prev=2,o.s();case 4:if((c=o.n()).done){e.next=67;break}if(l=c.value,d=a,u={},!l.isArray){e.next=11;break}e.next=39;break;case 11:if(!l.isQuestionnaireGroup){e.next=17;break}h={linkId:l.path,text:l.label,item:[]},d.push(h),d=h.item,e.next=39;break;case 17:if(!l.qField){e.next=39;break}if(v=void 0,n.hasOwnProperty(l.path)?v=n[l.path]:(v={linkId:l.path,answer:[]},n[l.path]=v,d.push(v)),f={},f[l.qField]=l.value,v.answer.push(f),!l.constraints){e.next=39;break}if(l.errors=[],e.prev=25,e.t0=r.advancedValid,!e.t0){e.next=31;break}return e.next=30,r.$fhirutils.checkConstraints(l.constraints,r.constraints,l.value,l.errors);case 30:e.t0=e.sent;case 31:r.advancedValid=e.t0,e.next=39;break;case 34:e.prev=34,e.t1=e["catch"](25),r.advancedValid=!1,l.errors.push("An unknown error occurred."),console.log(e.t1);case 39:if(!l.$children){e.next=49;break}return e.prev=40,e.next=43,t(d,l.$children,u);case 43:e.next=49;break;case 45:e.prev=45,e.t2=e["catch"](40),r.advancedValid=!1,console.log(e.t2);case 49:if(!l.isQuestionnaireGroup||!l.constraints){e.next=65;break}if(l.errors=[],e.prev=51,e.t3=r.advancedValid,!e.t3){e.next=57;break}return e.next=56,r.$fhirutils.checkConstraints(l.constraints,r.constraints,d,l.errors);case 56:e.t3=e.sent;case 57:r.advancedValid=e.t3,e.next=65;break;case 60:e.prev=60,e.t4=e["catch"](51),r.advancedValid=!1,l.errors.push("An unknown error occurred."),console.log(e.t4);case 65:e.next=4;break;case 67:e.next=72;break;case 69:e.prev=69,e.t5=e["catch"](2),o.e(e.t5);case 72:return e.prev=72,o.f(),e.finish(72);case 75:case"end":return e.stop()}}),e,null,[[2,69,72,75],[25,34],[40,45],[51,60]])})));return function(t,r,a){return e.apply(this,arguments)}}(),this.fhir={resourceType:"QuestionnaireResponse",questionnaire:this.url,status:"completed",item:[]},e.prev=8,e.next=11,t(this.fhir.item,this.$children);case 11:e.next=17;break;case 13:e.prev=13,e.t0=e["catch"](8),this.advancedValid=!1,console.log(e.t0);case 17:if(this.advancedValid){e.next=22;break}return this.overlay=!1,this.loading=!1,this.$store.commit("setMessage",{type:"error",text:"There were errors on the form."}),e.abrupt("return");case 22:console.log("SAVE",this.fhir),fetch("/fhir/QuestionnaireResponse?"+o.stringify(this.$route.query),{method:"POST",headers:{"Content-Type":"application/fhir+json"},redirect:"manual",body:JSON.stringify(this.fhir)}).then((function(e){201===e.status?(e.json().then((function(e){var t;if(r.overlay=!1,r.loading=!1,r.viewPage){if(e.meta.tag){var a=e.meta.tag.find((function(e){return"http://ihris.org/fhir/tags/resource"===e.system}));a&&a.code&&(t=a.code)}if(!t&&e.subject&&e.subject.reference&&(t=e.subject.reference),t){var i=t.split("/");i=i[1]?i[1]:t,r.$router.push({name:"resource_view",params:{page:r.viewPage,id:i}})}}t||r.$router.push({name:"home"})})),r.$store.commit("setMessage",{type:"success",text:"Update successful."})):(r.overlay=!1,r.loading=!1,e.json().then((function(e){var t;if("OperationOutcome"==e.resourceType)try{t=Array.from(new Set(e.issue.map((function(e){return e.diagnostics})))).join(", ")}catch(a){console.log("Unable to retrieve errors from ",e)}else t="Unknown";r.$store.commit("setMessage",{type:"error",text:"An error occurred trying to save this record: "+t})})).catch((function(e){r.$store.commit("setMessage",{type:"error",text:"An unknown error occurred trying to save this record."}),console.log("Error on retrieving error status",e)})))})).catch((function(e){console.log(e),r.overlay=!1,r.loading=!1,r.$store.commit("setMessage",{type:"error",text:"Failed to update data."})}));case 24:case"end":return e.stop()}}),e,this,[[8,13]])})));function t(){return e.apply(this,arguments)}return t}()}},l=c,d=r("2877"),u=r("6544"),h=r.n(u),v=r("8336"),f=r("a523"),p=r("ce7e"),m=r("4bd4"),b=r("132d"),x=r("8860"),g=r("da13"),y=r("5d23"),k=r("f774"),w=r("a797"),V=r("490a"),C=r("2fa4"),_=r("e0c7"),$=Object(d["a"])(l,a,i,!1,null,null,null);t["default"]=$.exports;h()($,{VBtn:v["a"],VContainer:f["a"],VDivider:p["a"],VForm:m["a"],VIcon:b["a"],VList:x["a"],VListItem:g["a"],VListItemContent:y["a"],VListItemSubtitle:y["b"],VListItemTitle:y["c"],VNavigationDrawer:k["a"],VOverlay:w["a"],VProgressCircular:V["a"],VSpacer:C["a"],VSubheader:_["a"]})}}]);
//# sourceMappingURL=fhir-questionnaire.d25845c5.js.map