(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["fhir-questionnaire"],{"0bc6":function(t,e,r){},"1da1":function(t,e,r){"use strict";r.d(e,"a",(function(){return i}));r("d3b7"),r("e6cf");function n(t,e,r,n,i,a,o){try{var s=t[a](o),c=s.value}catch(u){return void r(u)}s.done?e(c):Promise.resolve(c).then(n,i)}function i(t){return function(){var e=this,r=arguments;return new Promise((function(i,a){var o=t.apply(e,r);function s(t){n(o,i,a,s,c,"next",t)}function c(t){n(o,i,a,s,c,"throw",t)}s(void 0)}))}}},4983:function(t,e,r){"use strict";r.r(e);var n=function(){var t=this,e=t.$createElement,r=t._self._c||e;return r("div",{staticClass:"ihris-section",attrs:{id:"section-"+t.id}},[r("v-card",{staticClass:"mx-auto",attrs:{"max-width":"700",outlined:""}},[r("v-card-title",{staticClass:"primary darken-1 white--text text-uppercase font-weight-bold"},[t._v(t._s(t.label))]),t._l(t.errors,(function(e,n){return r("v-card-text",{key:n,staticClass:"error white--text font-weight-bold"},[t._v(t._s(e))])})),r("v-card-text",{staticClass:"my-3"},[t._t("default")],2)],2)],1)},i=[],a={name:"ihris-questionnaire-section",props:["id","label","description","path","constraints"],data:function(){return{isQuestionnaireGroup:!0,errors:[]}}},o=a,s=r("2877"),c=r("6544"),u=r.n(c),l=r("b0af"),h=r("99d9"),d=Object(s["a"])(o,n,i,!1,null,null,null);e["default"]=d.exports;u()(d,{VCard:l["a"],VCardText:h["c"],VCardTitle:h["d"]})},5105:function(t,e,r){"use strict";r.r(e);var n=function(){var t=this,e=t.$createElement,r=t._self._c||e;return r("div",{staticClass:"d-none"},[r("v-text-field",{attrs:{readonly:"","hide-details":"",dense:"",disabled:""},model:{value:t.hiddenValue,callback:function(e){t.hiddenValue=e},expression:"hiddenValue"}})],1)},i=[],a={name:"ihris-hidden",props:["label","path","hiddenType","hiddenValue"],data:function(){return{qField:"value"+this.hiddenType,value:this.hiddenValue}}},o=a,s=r("2877"),c=r("6544"),u=r.n(c),l=r("8654"),h=Object(s["a"])(o,n,i,!1,null,null,null);e["default"]=h.exports;u()(h,{VTextField:l["a"]})},6062:function(t,e,r){"use strict";var n=r("6d61"),i=r("6566");t.exports=n("Set",(function(t){return function(){return t(this,arguments.length?arguments[0]:void 0)}}),i)},"8ce9":function(t,e,r){},"91dd":function(t,e,r){"use strict";function n(t,e){return Object.prototype.hasOwnProperty.call(t,e)}t.exports=function(t,e,r,a){e=e||"&",r=r||"=";var o={};if("string"!==typeof t||0===t.length)return o;var s=/\+/g;t=t.split(e);var c=1e3;a&&"number"===typeof a.maxKeys&&(c=a.maxKeys);var u=t.length;c>0&&u>c&&(u=c);for(var l=0;l<u;++l){var h,d,f,p,v=t[l].replace(s,"%20"),m=v.indexOf(r);m>=0?(h=v.substr(0,m),d=v.substr(m+1)):(h=v,d=""),f=decodeURIComponent(h),p=decodeURIComponent(d),n(o,f)?i(o[f])?o[f].push(p):o[f]=[o[f],p]:o[f]=p}return o};var i=Array.isArray||function(t){return"[object Array]"===Object.prototype.toString.call(t)}},"96cf":function(t,e,r){var n=function(t){"use strict";var e,r=Object.prototype,n=r.hasOwnProperty,i="function"===typeof Symbol?Symbol:{},a=i.iterator||"@@iterator",o=i.asyncIterator||"@@asyncIterator",s=i.toStringTag||"@@toStringTag";function c(t,e,r,n){var i=e&&e.prototype instanceof v?e:v,a=Object.create(i.prototype),o=new L(n||[]);return a._invoke=C(t,r,o),a}function u(t,e,r){try{return{type:"normal",arg:t.call(e,r)}}catch(n){return{type:"throw",arg:n}}}t.wrap=c;var l="suspendedStart",h="suspendedYield",d="executing",f="completed",p={};function v(){}function m(){}function y(){}var g={};g[a]=function(){return this};var b=Object.getPrototypeOf,x=b&&b(b(E([])));x&&x!==r&&n.call(x,a)&&(g=x);var w=y.prototype=v.prototype=Object.create(g);function k(t){["next","throw","return"].forEach((function(e){t[e]=function(t){return this._invoke(e,t)}}))}function _(t,e){function r(i,a,o,s){var c=u(t[i],t,a);if("throw"!==c.type){var l=c.arg,h=l.value;return h&&"object"===typeof h&&n.call(h,"__await")?e.resolve(h.__await).then((function(t){r("next",t,o,s)}),(function(t){r("throw",t,o,s)})):e.resolve(h).then((function(t){l.value=t,o(l)}),(function(t){return r("throw",t,o,s)}))}s(c.arg)}var i;function a(t,n){function a(){return new e((function(e,i){r(t,n,e,i)}))}return i=i?i.then(a,a):a()}this._invoke=a}function C(t,e,r){var n=l;return function(i,a){if(n===d)throw new Error("Generator is already running");if(n===f){if("throw"===i)throw a;return $()}r.method=i,r.arg=a;while(1){var o=r.delegate;if(o){var s=j(o,r);if(s){if(s===p)continue;return s}}if("next"===r.method)r.sent=r._sent=r.arg;else if("throw"===r.method){if(n===l)throw n=f,r.arg;r.dispatchException(r.arg)}else"return"===r.method&&r.abrupt("return",r.arg);n=d;var c=u(t,e,r);if("normal"===c.type){if(n=r.done?f:h,c.arg===p)continue;return{value:c.arg,done:r.done}}"throw"===c.type&&(n=f,r.method="throw",r.arg=c.arg)}}}function j(t,r){var n=t.iterator[r.method];if(n===e){if(r.delegate=null,"throw"===r.method){if(t.iterator["return"]&&(r.method="return",r.arg=e,j(t,r),"throw"===r.method))return p;r.method="throw",r.arg=new TypeError("The iterator does not provide a 'throw' method")}return p}var i=u(n,t.iterator,r.arg);if("throw"===i.type)return r.method="throw",r.arg=i.arg,r.delegate=null,p;var a=i.arg;return a?a.done?(r[t.resultName]=a.value,r.next=t.nextLoc,"return"!==r.method&&(r.method="next",r.arg=e),r.delegate=null,p):a:(r.method="throw",r.arg=new TypeError("iterator result is not an object"),r.delegate=null,p)}function V(t){var e={tryLoc:t[0]};1 in t&&(e.catchLoc=t[1]),2 in t&&(e.finallyLoc=t[2],e.afterLoc=t[3]),this.tryEntries.push(e)}function O(t){var e=t.completion||{};e.type="normal",delete e.arg,t.completion=e}function L(t){this.tryEntries=[{tryLoc:"root"}],t.forEach(V,this),this.reset(!0)}function E(t){if(t){var r=t[a];if(r)return r.call(t);if("function"===typeof t.next)return t;if(!isNaN(t.length)){var i=-1,o=function r(){while(++i<t.length)if(n.call(t,i))return r.value=t[i],r.done=!1,r;return r.value=e,r.done=!0,r};return o.next=o}}return{next:$}}function $(){return{value:e,done:!0}}return m.prototype=w.constructor=y,y.constructor=m,y[s]=m.displayName="GeneratorFunction",t.isGeneratorFunction=function(t){var e="function"===typeof t&&t.constructor;return!!e&&(e===m||"GeneratorFunction"===(e.displayName||e.name))},t.mark=function(t){return Object.setPrototypeOf?Object.setPrototypeOf(t,y):(t.__proto__=y,s in t||(t[s]="GeneratorFunction")),t.prototype=Object.create(w),t},t.awrap=function(t){return{__await:t}},k(_.prototype),_.prototype[o]=function(){return this},t.AsyncIterator=_,t.async=function(e,r,n,i,a){void 0===a&&(a=Promise);var o=new _(c(e,r,n,i),a);return t.isGeneratorFunction(r)?o:o.next().then((function(t){return t.done?t.value:o.next()}))},k(w),w[s]="Generator",w[a]=function(){return this},w.toString=function(){return"[object Generator]"},t.keys=function(t){var e=[];for(var r in t)e.push(r);return e.reverse(),function r(){while(e.length){var n=e.pop();if(n in t)return r.value=n,r.done=!1,r}return r.done=!0,r}},t.values=E,L.prototype={constructor:L,reset:function(t){if(this.prev=0,this.next=0,this.sent=this._sent=e,this.done=!1,this.delegate=null,this.method="next",this.arg=e,this.tryEntries.forEach(O),!t)for(var r in this)"t"===r.charAt(0)&&n.call(this,r)&&!isNaN(+r.slice(1))&&(this[r]=e)},stop:function(){this.done=!0;var t=this.tryEntries[0],e=t.completion;if("throw"===e.type)throw e.arg;return this.rval},dispatchException:function(t){if(this.done)throw t;var r=this;function i(n,i){return s.type="throw",s.arg=t,r.next=n,i&&(r.method="next",r.arg=e),!!i}for(var a=this.tryEntries.length-1;a>=0;--a){var o=this.tryEntries[a],s=o.completion;if("root"===o.tryLoc)return i("end");if(o.tryLoc<=this.prev){var c=n.call(o,"catchLoc"),u=n.call(o,"finallyLoc");if(c&&u){if(this.prev<o.catchLoc)return i(o.catchLoc,!0);if(this.prev<o.finallyLoc)return i(o.finallyLoc)}else if(c){if(this.prev<o.catchLoc)return i(o.catchLoc,!0)}else{if(!u)throw new Error("try statement without catch or finally");if(this.prev<o.finallyLoc)return i(o.finallyLoc)}}}},abrupt:function(t,e){for(var r=this.tryEntries.length-1;r>=0;--r){var i=this.tryEntries[r];if(i.tryLoc<=this.prev&&n.call(i,"finallyLoc")&&this.prev<i.finallyLoc){var a=i;break}}a&&("break"===t||"continue"===t)&&a.tryLoc<=e&&e<=a.finallyLoc&&(a=null);var o=a?a.completion:{};return o.type=t,o.arg=e,a?(this.method="next",this.next=a.finallyLoc,p):this.complete(o)},complete:function(t,e){if("throw"===t.type)throw t.arg;return"break"===t.type||"continue"===t.type?this.next=t.arg:"return"===t.type?(this.rval=this.arg=t.arg,this.method="return",this.next="end"):"normal"===t.type&&e&&(this.next=e),p},finish:function(t){for(var e=this.tryEntries.length-1;e>=0;--e){var r=this.tryEntries[e];if(r.finallyLoc===t)return this.complete(r.completion,r.afterLoc),O(r),p}},catch:function(t){for(var e=this.tryEntries.length-1;e>=0;--e){var r=this.tryEntries[e];if(r.tryLoc===t){var n=r.completion;if("throw"===n.type){var i=n.arg;O(r)}return i}}throw new Error("illegal catch attempt")},delegateYield:function(t,r,n){return this.delegate={iterator:E(t),resultName:r,nextLoc:n},"next"===this.method&&(this.arg=e),p}},t}(t.exports);try{regeneratorRuntime=n}catch(i){Function("r","regeneratorRuntime = r")(n)}},b383:function(t,e,r){"use strict";e.decode=e.parse=r("91dd"),e.encode=e.stringify=r("e099")},ce7e:function(t,e,r){"use strict";var n=r("5530"),i=(r("8ce9"),r("7560"));e["a"]=i["a"].extend({name:"v-divider",props:{inset:Boolean,vertical:Boolean},render:function(t){var e;return this.$attrs.role&&"separator"!==this.$attrs.role||(e=this.vertical?"vertical":"horizontal"),t("hr",{class:Object(n["a"])({"v-divider":!0,"v-divider--inset":this.inset,"v-divider--vertical":this.vertical},this.themeClasses),attrs:Object(n["a"])({role:"separator","aria-orientation":e},this.$attrs),on:this.$listeners})}})},e099:function(t,e,r){"use strict";var n=function(t){switch(typeof t){case"string":return t;case"boolean":return t?"true":"false";case"number":return isFinite(t)?t:"";default:return""}};t.exports=function(t,e,r,s){return e=e||"&",r=r||"=",null===t&&(t=void 0),"object"===typeof t?a(o(t),(function(o){var s=encodeURIComponent(n(o))+r;return i(t[o])?a(t[o],(function(t){return s+encodeURIComponent(n(t))})).join(e):s+encodeURIComponent(n(t[o]))})).join(e):s?encodeURIComponent(n(s))+r+encodeURIComponent(n(t)):""};var i=Array.isArray||function(t){return"[object Array]"===Object.prototype.toString.call(t)};function a(t,e){if(t.map)return t.map(e);for(var r=[],n=0;n<t.length;n++)r.push(e(t[n],n));return r}var o=Object.keys||function(t){var e=[];for(var r in t)Object.prototype.hasOwnProperty.call(t,r)&&e.push(r);return e}},e0c7:function(t,e,r){"use strict";var n=r("5530"),i=(r("0bc6"),r("7560")),a=r("58df");e["a"]=Object(a["a"])(i["a"]).extend({name:"v-subheader",props:{inset:Boolean},render:function(t){return t("div",{staticClass:"v-subheader",class:Object(n["a"])({"v-subheader--inset":this.inset},this.themeClasses),attrs:this.$attrs,on:this.$listeners},this.$slots.default)}})},f43a:function(t,e,r){"use strict";r.r(e);var n=function(){var t=this,e=t.$createElement,r=t._self._c||e;return r("v-card",{staticClass:"mx-auto",attrs:{"max-width":"700",outlined:""}},[r("v-card-title",{staticClass:"primary white--text text-uppercase font-weight-bold"},[t._v(t._s(t.label))]),t._l(t.errors,(function(e,n){return r("v-card-text",{key:n,staticClass:"error white--text font-weight-bold"},[t._v(t._s(e))])})),r("v-card-text",{staticClass:"my-3"},[t._t("default")],2)],2)},i=[],a={name:"ihris-questionnaire-group",props:["label","path","constraints"],data:function(){return{isQuestionnaireGroup:!0,errors:[]}}},o=a,s=r("2877"),c=r("6544"),u=r.n(c),l=r("b0af"),h=r("99d9"),d=Object(s["a"])(o,n,i,!1,null,null,null);e["default"]=d.exports;u()(d,{VCard:l["a"],VCardText:h["c"],VCardTitle:h["d"]})},f977:function(t,e,r){"use strict";r.r(e);var n=function(){var t=this,e=t.$createElement,r=t._self._c||e;return r("v-container",{staticClass:"my-3"},[r("ihris-practitioner-intro",{attrs:{slotProps:t.source,isQuestionnaire:!0}}),r("v-form",{ref:"form",model:{value:t.valid,callback:function(e){t.valid=e},expression:"valid"}},[t._t("default"),r("v-overlay",{attrs:{value:t.overlay}},[r("v-progress-circular",{attrs:{size:"50",color:"primary",indeterminate:""}}),r("v-btn",{attrs:{icon:""},on:{click:function(e){t.overlay=!1}}},[r("v-icon",[t._v("mdi-close")])],1)],1),r("v-navigation-drawer",{staticClass:"primary darken-1 white--text",staticStyle:{"z-index":"3"},attrs:{app:"",right:"",permanent:"",clipped:""}},[r("v-list",{staticClass:"white--text"},[r("v-list-item",[r("v-btn",{staticClass:"secondary",attrs:{dark:""},on:{click:function(e){return t.$router.go(-1)}}},[r("v-icon",{attrs:{light:""}},[t._v("mdi-pencil-off")]),r("span",[t._v("Cancel")])],1),r("v-spacer"),t.valid?r("v-btn",{staticClass:"success darken-1",attrs:{dark:"",disabled:!t.valid},on:{click:function(e){return t.processFHIR()}}},[r("v-icon",{attrs:{light:""}},[t._v("mdi-content-save")]),r("span",[t._v("Save")])],1):r("v-btn",{staticClass:"warning",attrs:{dark:""},on:{click:function(e){return t.$refs.form.validate()}}},[r("v-icon",{attrs:{light:""}},[t._v("mdi-content-save")]),r("span",[t._v("Save")])],1)],1),r("v-divider",{attrs:{color:"white"}}),t.sectionMenu?r("v-subheader",{staticClass:"white--text"},[r("h2",[t._v("Sections")])]):t._e(),t._l(t.sectionMenu,(function(e){return r("v-list-item",{key:e.id,attrs:{href:"#section-"+e.id}},[r("v-list-item-content",{staticClass:"white--text"},[r("v-list-item-title",{staticClass:"text-uppercase"},[r("h4",[t._v(t._s(e.title))])]),r("v-list-item-subtitle",{staticClass:"white--text"},[t._v(t._s(e.desc))])],1)],1)}))],2)],1)],2)],1)},i=[],a=(r("7db0"),r("a630"),r("a15b"),r("d81d"),r("d3b7"),r("ac1f"),r("6062"),r("3ca3"),r("1276"),r("ddb0"),r("b85c")),o=(r("96cf"),r("1da1")),s=r("b383"),c={name:"ihris-questionnaire",props:["id","url","title","description","purpose","section-menu","view-page","edit","constraints"],data:function(){return{fhir:{},loading:!1,overlay:!1,isEdit:!1,valid:!0,advancedValid:!0,source:{path:"",data:{}}}},components:{"ihris-practitioner-intro":function(){return Promise.all([r.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),r.e("fhir-main~fhir-primary~fhir-search~mhero"),r.e("fhir-primary~fhir-search~mhero"),r.e("fhir-main~fhir-primary~fhir-search"),r.e("fhir-primary")]).then(r.bind(null,"6dbd"))}},created:function(){var t=this,e=this.$route.query,r=e.practitioner;r&&fetch("/fhir/Practitioner/"+r).then((function(e){e.json().then((function(e){t.source={source:{data:e,path:"Practitioner"}}})).catch((function(t){console.log(t)}))})).catch((function(t){console.log(t)}))},methods:{processFHIR:function(){var t=Object(o["a"])(regeneratorRuntime.mark((function t(){var e,r=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:if(this.$refs.form.validate(),this.valid){t.next=3;break}return t.abrupt("return");case 3:return this.advancedValid=!0,this.overlay=!0,this.loading=!0,e=function(){var t=Object(o["a"])(regeneratorRuntime.mark((function t(n,i,o){var s,c,u,l,h,d,f,p;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:o||(o={}),s=Object(a["a"])(i),t.prev=2,s.s();case 4:if((c=s.n()).done){t.next=67;break}if(u=c.value,l=n,h={},!u.isArray){t.next=11;break}t.next=39;break;case 11:if(!u.isQuestionnaireGroup){t.next=17;break}d={linkId:u.path,text:u.label,item:[]},l.push(d),l=d.item,t.next=39;break;case 17:if(!u.qField){t.next=39;break}if(f=void 0,o.hasOwnProperty(u.path)?f=o[u.path]:(f={linkId:u.path,answer:[]},o[u.path]=f,l.push(f)),p={},p[u.qField]=u.value,f.answer.push(p),!u.constraints){t.next=39;break}if(u.errors=[],t.prev=25,t.t0=r.advancedValid,!t.t0){t.next=31;break}return t.next=30,r.$fhirutils.checkConstraints(u.constraints,r.constraints,u.value,u.errors);case 30:t.t0=t.sent;case 31:r.advancedValid=t.t0,t.next=39;break;case 34:t.prev=34,t.t1=t["catch"](25),r.advancedValid=!1,u.errors.push("An unknown error occurred."),console.log(t.t1);case 39:if(!u.$children){t.next=49;break}return t.prev=40,t.next=43,e(l,u.$children,h);case 43:t.next=49;break;case 45:t.prev=45,t.t2=t["catch"](40),r.advancedValid=!1,console.log(t.t2);case 49:if(!u.isQuestionnaireGroup||!u.constraints){t.next=65;break}if(u.errors=[],t.prev=51,t.t3=r.advancedValid,!t.t3){t.next=57;break}return t.next=56,r.$fhirutils.checkConstraints(u.constraints,r.constraints,l,u.errors);case 56:t.t3=t.sent;case 57:r.advancedValid=t.t3,t.next=65;break;case 60:t.prev=60,t.t4=t["catch"](51),r.advancedValid=!1,u.errors.push("An unknown error occurred."),console.log(t.t4);case 65:t.next=4;break;case 67:t.next=72;break;case 69:t.prev=69,t.t5=t["catch"](2),s.e(t.t5);case 72:return t.prev=72,s.f(),t.finish(72);case 75:case"end":return t.stop()}}),t,null,[[2,69,72,75],[25,34],[40,45],[51,60]])})));return function(e,r,n){return t.apply(this,arguments)}}(),this.fhir={resourceType:"QuestionnaireResponse",questionnaire:this.url,status:"completed",item:[]},t.prev=8,t.next=11,e(this.fhir.item,this.$children);case 11:t.next=17;break;case 13:t.prev=13,t.t0=t["catch"](8),this.advancedValid=!1,console.log(t.t0);case 17:if(this.advancedValid){t.next=22;break}return this.overlay=!1,this.loading=!1,this.$store.commit("setMessage",{type:"error",text:"There were errors on the form."}),t.abrupt("return");case 22:console.log("SAVE",this.fhir),fetch("/fhir/QuestionnaireResponse?"+s.stringify(this.$route.query),{method:"POST",headers:{"Content-Type":"application/fhir+json"},redirect:"manual",body:JSON.stringify(this.fhir)}).then((function(t){201===t.status?(t.json().then((function(t){var e;if(r.overlay=!1,r.loading=!1,r.viewPage){if(t.meta.tag){var n=t.meta.tag.find((function(t){return"http://ihris.org/fhir/tags/resource"===t.system}));n&&n.code&&(e=n.code)}if(!e&&t.subject&&t.subject.reference&&(e=t.subject.reference),e){var i=e.split("/");i=i[1]?i[1]:e,r.$router.push({name:"resource_view",params:{page:r.viewPage,id:i}})}}e||r.$router.push({name:"home"})})),r.$store.commit("setMessage",{type:"success",text:"Added successfully."})):(r.overlay=!1,r.loading=!1,t.json().then((function(t){var e;if("OperationOutcome"==t.resourceType)try{e=Array.from(new Set(t.issue.map((function(t){return t.diagnostics})))).join(", ")}catch(n){console.log("Unable to retrieve errors from ",t)}else e="Unknown";r.$store.commit("setMessage",{type:"error",text:"An error occurred trying to save this record: "+e})})).catch((function(t){r.$store.commit("setMessage",{type:"error",text:"An unknown error occurred trying to save this record."}),console.log("Error on retrieving error status",t)})))})).catch((function(t){console.log(t),r.overlay=!1,r.loading=!1,r.$store.commit("setMessage",{type:"error",text:"Failed to update data."})}));case 24:case"end":return t.stop()}}),t,this,[[8,13]])})));function e(){return t.apply(this,arguments)}return e}()}},u=c,l=r("2877"),h=r("6544"),d=r.n(h),f=r("8336"),p=r("a523"),v=r("ce7e"),m=r("4bd4"),y=r("132d"),g=r("8860"),b=r("da13"),x=r("5d23"),w=r("f774"),k=r("a797"),_=r("490a"),C=r("2fa4"),j=r("e0c7"),V=Object(l["a"])(u,n,i,!1,null,null,null);e["default"]=V.exports;d()(V,{VBtn:f["a"],VContainer:p["a"],VDivider:v["a"],VForm:m["a"],VIcon:y["a"],VList:g["a"],VListItem:b["a"],VListItemContent:x["a"],VListItemSubtitle:x["b"],VListItemTitle:x["c"],VNavigationDrawer:w["a"],VOverlay:k["a"],VProgressCircular:_["a"],VSpacer:C["a"],VSubheader:j["a"]})}}]);
//# sourceMappingURL=fhir-questionnaire.4e52b118.js.map