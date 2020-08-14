(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["fhir"],{"1a0a":function(n,e,t){"use strict";t.r(e);var i,r,a=function(){var n=this,e=n.$createElement,t=n._self._c||e;return t("ihris-template",{key:n.$route.path},[n._v(" Loading... ")])},o=[],h=(t("d3b7"),t("a026")),u={name:"fhir-page-view",data:function(){return{}},created:function(){this.getTemplate()},methods:{getTemplate:function(){var n=this;fetch("/config/page/"+r).then((function(e){e.json().then((function(e){h["a"].component("ihris-template",{name:"ihris-template",data:function(){return{fhirId:i,isEdit:!1}},components:{"ihris-resource":function(){return t.e("fhir-main").then(t.bind(null,"7372"))},"ihris-codesystem":function(){return t.e("fhir-main").then(t.bind(null,"2d9b"))},"ihris-section":function(){return t.e("fhir-main").then(t.bind(null,"e07f"))},"ihris-secondary":function(){return t.e("fhir-main").then(t.bind(null,"39e1"))},"ihris-array":function(){return t.e("fhir-main").then(t.bind(null,"bb1d"))},"fhir-extension":function(){return t.e("fhir-main").then(t.bind(null,"6b10"))},"fhir-reference":function(){return t.e("fhir-main").then(t.bind(null,"99fa"))},"fhir-string":function(){return t.e("fhir-main").then(t.bind(null,"b78c"))},"fhir-human-name":function(){return t.e("fhir-main").then(t.bind(null,"89c1"))},"fhir-code":function(){return t.e("fhir-main").then(t.bind(null,"1131"))},"fhir-date":function(){return t.e("fhir-main").then(t.bind(null,"7fb0"))},"fhir-date-time":function(){return t.e("fhir-main").then(t.bind(null,"45dd"))},"fhir-period":function(){return t.e("fhir-main").then(t.bind(null,"4807"))},"fhir-identifier":function(){return t.e("fhir-main").then(t.bind(null,"c408"))},"fhir-contact-point":function(){return t.e("fhir-main").then(t.bind(null,"4b80"))},"fhir-address":function(){return t.e("fhir-main").then(t.bind(null,"b248"))},"fhir-codeable-concept":function(){return t.e("fhir-main").then(t.bind(null,"309c"))},"fhir-uri":function(){return t.e("fhir-main").then(t.bind(null,"6d39"))},"fhir-boolean":function(){return t.e("fhir-main").then(t.bind(null,"ff03"))},"fhir-positive-int":function(){return t.e("fhir-main").then(t.bind(null,"b750"))},"fhir-coding":function(){return t.e("fhir-main").then(t.bind(null,"eee9"))},"fhir-attachment":function(){return t.e("fhir-main").then(t.bind(null,"ca33"))}},template:e.template,methods:{setEdit:function(n){this.isEdit=n}}}),n.$forceUpdate()})).catch((function(e){console.log(e),h["a"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),n.$forceUpdate()}))})).catch((function(e){console.log(e),h["a"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),n.$forceUpdate()}))}},components:{},beforeCreate:function(){i=this.$route.params.id,r=this.$route.params.page,h["a"].component("ihris-template",{template:"<div>Loading...</div>"})}},f=u,c=t("2877"),l=Object(c["a"])(f,a,o,!1,null,null,null);e["default"]=l.exports},"9d3d":function(n,e,t){"use strict";t.r(e);var i,r=function(){var n=this,e=n.$createElement,t=n._self._c||e;return t("ihris-template",{key:n.$route.path},[n._v(" Loading... ")])},a=[],o=(t("d3b7"),t("ac1f"),t("841c"),t("a026")),h={name:"fhir-page-search",data:function(){return{}},created:function(){this.getTemplate()},methods:{getTemplate:function(){var n=this;fetch("/config/page/"+i).then((function(e){e.json().then((function(e){o["a"].component("ihris-template",{name:"ihris-template",data:function(){return{fields:e.searchData,terms:{}}},components:{"ihris-search":function(){return t.e("fhir-search").then(t.bind(null,"76e1"))},"ihris-search-code":function(){return t.e("fhir-search").then(t.bind(null,"5f81"))},"ihris-search-term":function(){return t.e("fhir-search").then(t.bind(null,"d604"))}},template:e.search,methods:{searchData:function(n,e){this.$set(this.terms,n,e)}}}),n.$forceUpdate()})).catch((function(e){console.log(e),o["a"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),n.$forceUpdate()}))})).catch((function(e){console.log(e),o["a"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),n.$forceUpdate()}))}},components:{},beforeCreate:function(){i=this.$route.params.page,o["a"].component("ihris-template",{template:"<div>Loading...</div>"})}},u=h,f=t("2877"),c=Object(f["a"])(u,r,a,!1,null,null,null);e["default"]=c.exports},"9d48":function(n,e,t){"use strict";t.r(e);var i,r,a=function(){var n=this,e=n.$createElement,t=n._self._c||e;return t("ihris-template",[n._v(" Loading... ")])},o=[],h=(t("d3b7"),t("a026")),u={name:"fhir-page",data:function(){return{}},created:function(){this.getTemplate()},methods:{getTemplate:function(){var n=this;fetch("/config/questionnaire/"+i).then((function(e){e.json().then((function(e){h["a"].component("ihris-template",{name:"ihris-template",data:function(){return{viewPage:r,isEdit:!0}},components:{"ihris-questionnaire":function(){return t.e("fhir-questionnaire").then(t.bind(null,"f977"))},"ihris-questionnaire-section":function(){return t.e("fhir-questionnaire").then(t.bind(null,"4983"))},"ihris-questionnaire-group":function(){return t.e("fhir-questionnaire").then(t.bind(null,"f43a"))},"ihris-hidden":function(){return t.e("fhir-questionnaire").then(t.bind(null,"5105"))},"ihris-array":function(){return t.e("fhir-main").then(t.bind(null,"bb1d"))},"fhir-reference":function(){return t.e("fhir-main").then(t.bind(null,"99fa"))},"fhir-string":function(){return t.e("fhir-main").then(t.bind(null,"b78c"))},"fhir-text":function(){return t.e("fhir-main").then(t.bind(null,"b813"))},"fhir-date":function(){return t.e("fhir-main").then(t.bind(null,"7fb0"))},"fhir-date-time":function(){return t.e("fhir-main").then(t.bind(null,"45dd"))},"fhir-boolean":function(){return t.e("fhir-main").then(t.bind(null,"ff03"))},"fhir-choice":function(){return t.e("fhir-main").then(t.bind(null,"4972"))},"fhir-attachment":function(){return t.e("fhir-main").then(t.bind(null,"ca33"))}},template:e.template}),n.$forceUpdate()})).catch((function(e){console.log(e),h["a"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),n.$forceUpdate()}))})).catch((function(e){console.log(e),h["a"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),n.$forceUpdate()}))}},beforeCreate:function(){i=this.$route.params.questionnaire,r=this.$route.params.page,h["a"].component("ihris-template",{template:"<div>Loading...</div>"})}},f=u,c=t("2877"),l=Object(c["a"])(f,a,o,!1,null,null,null);e["default"]=l.exports},cd8b:function(n,e,t){"use strict";t.r(e);var i,r=function(){var n=this,e=n.$createElement,t=n._self._c||e;return t("ihris-template",{key:n.$route.path},[n._v(" Loading... ")])},a=[],o=(t("d3b7"),t("a026")),h={name:"fhir-page-add",data:function(){return{}},created:function(){this.getTemplate()},methods:{getTemplate:function(){var n=this;fetch("/config/page/"+i).then((function(e){e.json().then((function(e){o["a"].component("ihris-template",{name:"ihris-template",data:function(){return{isEdit:!0,fhirId:void 0}},components:{"ihris-resource":function(){return t.e("fhir-main").then(t.bind(null,"7372"))},"ihris-codesystem":function(){return t.e("fhir-main").then(t.bind(null,"2d9b"))},"ihris-section":function(){return t.e("fhir-main").then(t.bind(null,"e07f"))},"ihris-secondary":function(){return t.e("fhir-main").then(t.bind(null,"39e1"))},"ihris-array":function(){return t.e("fhir-main").then(t.bind(null,"bb1d"))},"fhir-extension":function(){return t.e("fhir-main").then(t.bind(null,"6b10"))},"fhir-reference":function(){return t.e("fhir-main").then(t.bind(null,"99fa"))},"fhir-string":function(){return t.e("fhir-main").then(t.bind(null,"b78c"))},"fhir-human-name":function(){return t.e("fhir-main").then(t.bind(null,"89c1"))},"fhir-code":function(){return t.e("fhir-main").then(t.bind(null,"1131"))},"fhir-date":function(){return t.e("fhir-main").then(t.bind(null,"7fb0"))},"fhir-date-time":function(){return t.e("fhir-main").then(t.bind(null,"45dd"))},"fhir-period":function(){return t.e("fhir-main").then(t.bind(null,"4807"))},"fhir-identifier":function(){return t.e("fhir-main").then(t.bind(null,"c408"))},"fhir-contact-point":function(){return t.e("fhir-main").then(t.bind(null,"4b80"))},"fhir-address":function(){return t.e("fhir-main").then(t.bind(null,"b248"))},"fhir-codeable-concept":function(){return t.e("fhir-main").then(t.bind(null,"309c"))},"fhir-uri":function(){return t.e("fhir-main").then(t.bind(null,"6d39"))},"fhir-boolean":function(){return t.e("fhir-main").then(t.bind(null,"ff03"))},"fhir-positive-int":function(){return t.e("fhir-main").then(t.bind(null,"b750"))},"fhir-coding":function(){return t.e("fhir-main").then(t.bind(null,"eee9"))},"fhir-attachment":function(){return t.e("fhir-main").then(t.bind(null,"ca33"))}},template:e.template}),n.$forceUpdate()})).catch((function(e){console.log(e),o["a"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),n.$forceUpdate()}))})).catch((function(e){console.log(e),o["a"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),n.$forceUpdate()}))}},components:{},beforeCreate:function(){i=this.$route.params.page,o["a"].component("ihris-template",{template:"<div>Loading...</div>"})}},u=h,f=t("2877"),c=Object(f["a"])(u,r,a,!1,null,null,null);e["default"]=c.exports}}]);
//# sourceMappingURL=fhir.377a13f8.js.map