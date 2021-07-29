(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["fhir-codesystem"],{"0bc6":function(t,e,i){},"2d9b":function(t,e,i){"use strict";i.r(e);var a=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-container",{staticClass:"my-3"},[t._t("default",null,{source:t.source}),i("v-overlay",{attrs:{value:t.overlay}},[i("v-progress-circular",{attrs:{size:"50",color:"primary",indeterminate:""}})],1),i("v-navigation-drawer",{staticClass:"primary darken-1 white--text",staticStyle:{"z-index":"3"},attrs:{app:"",right:"",permanent:"",clipped:""}},[i("v-list",{staticClass:"white--text"},[i("v-list-item",[t.edit?i("v-btn",{staticClass:"secondary",attrs:{dark:""},on:{click:function(e){t.fhirId?t.$router.go(0):t.$router.go(-1)}}},[i("v-icon",{attrs:{light:""}},[t._v("mdi-pencil-off")]),i("span",[t._v("Cancel")])],1):i("v-btn",{staticClass:"secondary",attrs:{dark:""},on:{click:function(e){return t.$emit("set-edit",!t.edit)}}},[i("v-icon",{attrs:{light:""}},[t._v("mdi-pencil")]),i("span",[t._v("Edit")])],1),i("v-spacer"),t.edit?i("v-btn",{staticClass:"success darken-1",attrs:{dark:""},on:{click:function(e){return t.processFHIR()}}},[i("v-icon",{attrs:{light:""}},[t._v("mdi-content-save")]),i("span",[t._v("Save")])],1):t._e()],1),i("v-divider",{attrs:{color:"white"}}),i("v-subheader",{staticClass:"white--text"},[i("h2",[t._v("Sections")])]),t._l(t.sectionMenu,(function(e){return i("v-list-item",{key:e.name,attrs:{href:"#section-"+e.name}},[t.edit&&e.secondary?t._e():i("v-list-item-content",{staticClass:"white--text"},[i("v-list-item-title",{staticClass:"text-uppercase"},[i("h4",[t._v(t._s(e.title))])]),i("v-list-item-subtitle",{staticClass:"white--text"},[t._v(t._s(e.desc))])],1)],1)}))],2)],1)],2)},s=[],r=(i("7db0"),i("4160"),i("caad"),i("baa5"),i("fb6a"),i("b64b"),i("d3b7"),i("ac1f"),i("5319"),i("2ca0"),i("159b"),i("b85c")),n={name:"ihris-codesystem",props:["title","field","fhir-id","page","profile","section-menu","edit"],data:function(){return{fhir:{},source:{data:{},path:""},loading:!1,overlay:!1,isEdit:!1}},created:function(){var t=this;if(this.fhirId){this.loading=!0;var e=this.profile.substring(this.profile.lastIndexOf("/")+1);fetch("/fhir/"+this.field+"/"+e).then((function(e){e.ok?e.json().then((function(e){var i={};if(e.property){var a,s=Object(r["a"])(e.property);try{for(s.s();!(a=s.n()).done;){var n=a.value;i[n.code]="value"+n.type.charAt(0).toUpperCase()+n.type.slice(1)}}catch(h){s.e(h)}finally{s.f()}}var o=e.concept.find((function(e){return e.code===t.fhirId}));if(o&&o.property){var c,l=Object(r["a"])(o.property);try{for(l.s();!(c=l.n()).done;){var d=c.value;o[d.code]=d[i[d.code]]}}catch(h){l.e(h)}finally{l.f()}delete o.property}t.source={data:o,path:t.field},t.loading=!1})).catch((function(i){t.loading=!1,console.log(t.field,t.fhirId,i,e)})):(t.loading=!1,console.log("Invalid response",e),e.text().then((function(t){console.log("body text:",t)})).catch((function(t){console.log("Failed to get text:",t)})))})).catch((function(e){t.loading=!1,console.log(t.field,t.fhirId,e)}))}},computed:{hasFhirId:function(){return""==this.fhirId?(console.log("blank"),!1):this.fhirId?(console.log("fhirid else"),!0):(console.log("fhirid is falsy"),!1)}},methods:{processFHIR:function(){var t=this;this.overlay=!0,this.loading=!0,this.fhir={},c(this.field,this.fhir,this.$children);var e=this.profile.substring(this.profile.lastIndexOf("/")+1),i="/fhir/"+this.field+"/"+e,a={method:"PATCH",headers:{"Content-Type":"application/fhir+json"},redirect:"manual"};i+="/"+this.fhir.code;for(var s=["code","display","definition","property"],r=0,n=Object.keys(this.fhir);r<n.length;r++){var o=n[r];s.includes(o)||delete this.fhir[o]}a.body=JSON.stringify(this.fhir),console.log("SAVE",i,this.fhir),fetch(i,a).then((function(e){200===e.status&&(t.overlay=!1,t.loading=!1,t.fhirId?t.$router.go(0):t.$router.push({name:"resource_view",params:{page:t.page,id:t.fhir.code}})),t.$store.commit("setMessage",{type:"success",text:"Added successfully."})})).catch((function(e){console.log("FAILED TO SAVE",i,e),t.overlay=!1,t.loading=!1,t.$store.commit("setMessage",{type:"error",text:"Failed to update data."})}))}}},o=function(t){var e="value"+t.substring(4);return e.replace(/(-[a-z])/gi,(function(t){return t.toUpperCase().replace("-","")}))},c=function t(e,i,a){a.forEach((function(a){var s=e,r=i;if(a.field&&!a.fieldType){var n;if(a.sliceName?a.field.startsWith("value[x]")?(n=a.field.substring(9),s+="."+n):(n=a.field.replace(":"+a.sliceName,""),s+="."+n):(n=a.field,s+="."+n),"1"!==a.max||"1"!==a.baseMax?i.hasOwnProperty(n)||(r[n]=[]):r[n]={},a.hasOwnProperty("value"))if(a.path.startsWith("CodeSystem.property.")){r.property||(r.property=[]);var c={code:n},l=o(a.$vnode.componentOptions.tag);a.value&&(!a.value.hasOwnProperty("system")||(a.value.code||a.value.value))&&(c[l]=a.value,r.property.push(c))}else r[n]=a.value;r=r[n]}a.$children&&t(s,r,a.$children)}))},l=n,d=i("2877"),h=i("6544"),f=i.n(h),u=i("8336"),v=i("a523"),p=i("ce7e"),y=i("132d"),m=i("8860"),g=i("da13"),b=i("5d23"),C=i("f774"),x=i("a797"),I=i("490a"),$=i("2fa4"),w=i("e0c7"),_=Object(d["a"])(l,a,s,!1,null,null,null);e["default"]=_.exports;f()(_,{VBtn:u["a"],VContainer:v["a"],VDivider:p["a"],VIcon:y["a"],VList:m["a"],VListItem:g["a"],VListItemContent:b["a"],VListItemSubtitle:b["b"],VListItemTitle:b["c"],VNavigationDrawer:C["a"],VOverlay:x["a"],VProgressCircular:I["a"],VSpacer:$["a"],VSubheader:w["a"]})},"8ce9":function(t,e,i){},ce7e:function(t,e,i){"use strict";var a=i("5530"),s=(i("8ce9"),i("7560"));e["a"]=s["a"].extend({name:"v-divider",props:{inset:Boolean,vertical:Boolean},render:function(t){var e;return this.$attrs.role&&"separator"!==this.$attrs.role||(e=this.vertical?"vertical":"horizontal"),t("hr",{class:Object(a["a"])({"v-divider":!0,"v-divider--inset":this.inset,"v-divider--vertical":this.vertical},this.themeClasses),attrs:Object(a["a"])({role:"separator","aria-orientation":e},this.$attrs),on:this.$listeners})}})},e0c7:function(t,e,i){"use strict";var a=i("5530"),s=(i("0bc6"),i("7560")),r=i("58df");e["a"]=Object(r["a"])(s["a"]).extend({name:"v-subheader",props:{inset:Boolean},render:function(t){return t("div",{staticClass:"v-subheader",class:Object(a["a"])({"v-subheader--inset":this.inset},this.themeClasses),attrs:this.$attrs,on:this.$listeners},this.$slots.default)}})}}]);
//# sourceMappingURL=fhir-codesystem.c349f9f6.js.map