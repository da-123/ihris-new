(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["fhir-questionnaire"],{"0bc6":function(t,e,i){},4983:function(t,e,i){"use strict";i.r(e);var r=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"ihris-section",attrs:{id:"section-"+t.id}},[i("v-card",{staticClass:"mx-auto",attrs:{"max-width":"700",outlined:""}},[i("v-card-title",{staticClass:"primary darken-1 white--text text-uppercase font-weight-bold"},[t._v(t._s(t.label))]),i("v-card-text",{staticClass:"my-3"},[t._t("default")],2)],1)],1)},a=[],n={name:"ihris-questionnaire-section",props:["id","label","description","path"],data:function(){return{isQuestionnaireGroup:!0}}},s=n,o=i("2877"),c=i("6544"),l=i.n(c),u=i("b0af"),d=i("99d9"),p=Object(o["a"])(s,r,a,!1,null,null,null);e["default"]=p.exports;l()(p,{VCard:u["a"],VCardText:d["c"],VCardTitle:d["d"]})},5105:function(t,e,i){"use strict";i.r(e);var r=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"d-none"},[i("v-text-field",{attrs:{readonly:"","hide-details":"",dense:"",disabled:""},model:{value:t.hiddenValue,callback:function(e){t.hiddenValue=e},expression:"hiddenValue"}})],1)},a=[],n={name:"ihris-hidden",props:["label","path","hiddenType","hiddenValue"],data:function(){return{qField:"value"+this.hiddenType,value:this.hiddenValue}}},s=n,o=i("2877"),c=i("6544"),l=i.n(c),u=i("8654"),d=Object(o["a"])(s,r,a,!1,null,null,null);e["default"]=d.exports;l()(d,{VTextField:u["a"]})},"8ce9":function(t,e,i){},"91dd":function(t,e,i){"use strict";function r(t,e){return Object.prototype.hasOwnProperty.call(t,e)}t.exports=function(t,e,i,n){e=e||"&",i=i||"=";var s={};if("string"!==typeof t||0===t.length)return s;var o=/\+/g;t=t.split(e);var c=1e3;n&&"number"===typeof n.maxKeys&&(c=n.maxKeys);var l=t.length;c>0&&l>c&&(l=c);for(var u=0;u<l;++u){var d,p,h,v,f=t[u].replace(o,"%20"),m=f.indexOf(i);m>=0?(d=f.substr(0,m),p=f.substr(m+1)):(d=f,p=""),h=decodeURIComponent(d),v=decodeURIComponent(p),r(s,h)?a(s[h])?s[h].push(v):s[h]=[s[h],v]:s[h]=v}return s};var a=Array.isArray||function(t){return"[object Array]"===Object.prototype.toString.call(t)}},b383:function(t,e,i){"use strict";e.decode=e.parse=i("91dd"),e.encode=e.stringify=i("e099")},ce7e:function(t,e,i){"use strict";var r=i("5530"),a=(i("8ce9"),i("7560"));e["a"]=a["a"].extend({name:"v-divider",props:{inset:Boolean,vertical:Boolean},render:function(t){var e;return this.$attrs.role&&"separator"!==this.$attrs.role||(e=this.vertical?"vertical":"horizontal"),t("hr",{class:Object(r["a"])({"v-divider":!0,"v-divider--inset":this.inset,"v-divider--vertical":this.vertical},this.themeClasses),attrs:Object(r["a"])({role:"separator","aria-orientation":e},this.$attrs),on:this.$listeners})}})},e099:function(t,e,i){"use strict";var r=function(t){switch(typeof t){case"string":return t;case"boolean":return t?"true":"false";case"number":return isFinite(t)?t:"";default:return""}};t.exports=function(t,e,i,o){return e=e||"&",i=i||"=",null===t&&(t=void 0),"object"===typeof t?n(s(t),(function(s){var o=encodeURIComponent(r(s))+i;return a(t[s])?n(t[s],(function(t){return o+encodeURIComponent(r(t))})).join(e):o+encodeURIComponent(r(t[s]))})).join(e):o?encodeURIComponent(r(o))+i+encodeURIComponent(r(t)):""};var a=Array.isArray||function(t){return"[object Array]"===Object.prototype.toString.call(t)};function n(t,e){if(t.map)return t.map(e);for(var i=[],r=0;r<t.length;r++)i.push(e(t[r],r));return i}var s=Object.keys||function(t){var e=[];for(var i in t)Object.prototype.hasOwnProperty.call(t,i)&&e.push(i);return e}},e0c7:function(t,e,i){"use strict";var r=i("5530"),a=(i("0bc6"),i("7560")),n=i("58df");e["a"]=Object(n["a"])(a["a"]).extend({name:"v-subheader",props:{inset:Boolean},render:function(t){return t("div",{staticClass:"v-subheader",class:Object(r["a"])({"v-subheader--inset":this.inset},this.themeClasses),attrs:this.$attrs,on:this.$listeners},this.$slots.default)}})},f43a:function(t,e,i){"use strict";i.r(e);var r=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-card",{staticClass:"mx-auto",attrs:{"max-width":"700",outlined:""}},[i("v-card-title",{staticClass:"primary white--text text-uppercase font-weight-bold"},[t._v(t._s(t.label))]),i("v-card-text",{staticClass:"my-3"},[t._t("default")],2)],1)},a=[],n={name:"ihris-questionnaire-group",props:["label","path"],data:function(){return{isQuestionnaireGroup:!0}}},s=n,o=i("2877"),c=i("6544"),l=i.n(c),u=i("b0af"),d=i("99d9"),p=Object(o["a"])(s,r,a,!1,null,null,null);e["default"]=p.exports;l()(p,{VCard:u["a"],VCardText:d["c"],VCardTitle:d["d"]})},f977:function(t,e,i){"use strict";i.r(e);var r=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-container",{staticClass:"my-3"},[t._t("default"),i("v-overlay",{attrs:{value:t.overlay}},[i("v-progress-circular",{attrs:{size:"50",color:"primary",indeterminate:""}}),i("v-btn",{attrs:{icon:""},on:{click:function(e){t.overlay=!1}}},[i("v-icon",[t._v("mdi-close")])],1)],1),i("v-navigation-drawer",{staticClass:"primary darken-1 white--text",staticStyle:{"z-index":"3"},attrs:{app:"",right:"",permanent:"",clipped:""}},[i("v-list",{staticClass:"white--text"},[i("v-list-item",[t.isEdit?i("v-btn",{staticClass:"accent darken-1",attrs:{dark:""},on:{click:function(e){return t.$router.go(-1)}}},[i("v-icon",{attrs:{light:""}},[t._v("mdi-content-save")]),i("span",[t._v("Back")])],1):t._e(),i("v-spacer"),i("v-btn",{staticClass:"success darken-1",attrs:{dark:""},on:{click:function(e){return t.processFHIR()}}},[i("v-icon",{attrs:{light:""}},[t._v("mdi-content-save")]),i("span",[t._v("Save")])],1)],1),i("v-divider",{attrs:{color:"white"}}),t.sectionMenu?i("v-subheader",{staticClass:"white--text"},[i("h2",[t._v("Sections")])]):t._e(),t._l(t.sectionMenu,(function(e){return i("v-list-item",{key:e.id,attrs:{href:"#section-"+e.id}},[i("v-list-item-content",{staticClass:"white--text"},[i("v-list-item-title",{staticClass:"text-uppercase"},[i("h4",[t._v(t._s(e.title))])]),i("v-list-item-subtitle",{staticClass:"white--text"},[t._v(t._s(e.desc))])],1)],1)}))],2)],1)],2)},a=[],n=(i("4160"),i("d3b7"),i("ac1f"),i("1276"),i("159b"),i("b383")),s={name:"ihris-questionnaire",props:["id","url","title","description","purpose","section-menu","view-page","edit"],data:function(){return{fhir:{},loading:!1,overlay:!1,isEdit:!1}},created:function(){},methods:{processFHIR:function(){var t=this;this.overlay=!0,this.loading=!0,this.fhir={resourceType:"QuestionnaireResponse",questionnaire:this.url,status:"completed",item:[]},o(this.fhir.item,this.$children),console.log("SAVE",this.fhir),fetch("/fhir/QuestionnaireResponse?"+n.stringify(this.$route.query),{method:"POST",headers:{"Content-Type":"application/fhir+json"},redirect:"manual",body:JSON.stringify(this.fhir)}).then((function(e){201===e.status&&(e.json().then((function(e){if(t.overlay=!1,t.loading=!1,t.viewPage&&e.subject&&e.subject.reference){var i=e.subject.reference.split("/");i=i[1]?i[1]:e.subject.reference,t.$router.push({name:"resource_view",params:{page:t.viewPage,id:i}})}else t.$router.push({name:"home"})})),t.$store.commit("setMessage",{type:"success",text:"Update successful."}))})).catch((function(e){console.log(e),t.overlay=!1,t.loading=!1,t.$store.commit("setMessage",{type:"error",text:"Failed to update data."})}))}}},o=function t(e,i,r){r||(r={}),i.forEach((function(i){var a=e,n={};if(i.isArray);else if(i.isQuestionnaireGroup){var s={linkId:i.path,text:i.label,item:[]};a.push(s),a=s.item}else if(i.qField){var o;r.hasOwnProperty(i.path)?o=r[i.path]:(o={linkId:i.path,answer:[]},r[i.path]=o,a.push(o));var c={};c[i.qField]=i.value,o.answer.push(c)}i.$children&&t(a,i.$children,n)}))},c=s,l=i("2877"),u=i("6544"),d=i.n(u),p=i("8336"),h=i("a523"),v=i("ce7e"),f=i("132d"),m=i("8860"),b=i("da13"),y=i("5d23"),C=i("f774"),x=i("a797"),g=i("490a"),w=i("2fa4"),_=i("e0c7"),V=Object(l["a"])(c,r,a,!1,null,null,null);e["default"]=V.exports;d()(V,{VBtn:p["a"],VContainer:h["a"],VDivider:v["a"],VIcon:f["a"],VList:m["a"],VListItem:b["a"],VListItemContent:y["a"],VListItemSubtitle:y["b"],VListItemTitle:y["c"],VNavigationDrawer:C["a"],VOverlay:x["a"],VProgressCircular:g["a"],VSpacer:w["a"],VSubheader:_["a"]})}}]);
//# sourceMappingURL=fhir-questionnaire.87efa0d3.js.map