(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["questionnaire"],{"9d48":function(r,i,e){"use strict";e.r(i);var n,a,h=function(){var r=this,i=r.$createElement,e=r._self._c||i;return e("ihris-template",[r._v(" Loading... ")])},f=[],t=(e("d3b7"),e("a026")),o={name:"fhir-page",data:function(){return{}},created:function(){this.getTemplate()},methods:{getTemplate:function(){var r=this;fetch("/config/questionnaire/"+n).then((function(i){i.json().then((function(i){t["default"].component("ihris-template",{name:"ihris-template",data:function(){return{viewPage:a,isEdit:!0,sectionMenu:i.data.sectionMenu,hidden:i.data.hidden}},components:{"ihris-questionnaire":function(){return e.e("fhir-questionnaire").then(e.bind(null,"f977"))},"ihris-questionnaire-section":function(){return e.e("fhir-questionnaire").then(e.bind(null,"4983"))},"ihris-questionnaire-group":function(){return e.e("fhir-questionnaire").then(e.bind(null,"f43a"))},"ihris-hidden":function(){return e.e("fhir-questionnaire").then(e.bind(null,"5105"))},"ihris-array":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-main~fhir-secondary"),e.e("fhir-main")]).then(e.bind(null,"bb1d"))},"fhir-reference":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-main~fhir-secondary"),e.e("fhir-main")]).then(e.bind(null,"99fa"))},"fhir-string":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-main~fhir-secondary"),e.e("fhir-main")]).then(e.bind(null,"b78c"))},"fhir-text":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-main~fhir-secondary"),e.e("fhir-main")]).then(e.bind(null,"b813"))},"fhir-date":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-main~fhir-secondary"),e.e("fhir-main")]).then(e.bind(null,"7fb0"))},"fhir-date-time":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-main~fhir-secondary"),e.e("fhir-main")]).then(e.bind(null,"45dd"))},"fhir-boolean":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-main~fhir-secondary"),e.e("fhir-main")]).then(e.bind(null,"ff03"))},"fhir-choice":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-main~fhir-secondary"),e.e("fhir-main")]).then(e.bind(null,"4972"))}},template:i.template}),r.$forceUpdate()})).catch((function(i){console.log(i),t["default"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),r.$forceUpdate()}))})).catch((function(i){console.log(i),t["default"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),r.$forceUpdate()}))}},beforeCreate:function(){n=this.$route.params.questionnaire,a=this.$route.params.page,t["default"].component("ihris-template",{template:"<div>Loading...</div>"})}},m=o,c=e("2877"),s=Object(c["a"])(m,h,f,!1,null,null,null);i["default"]=s.exports}}]);
//# sourceMappingURL=questionnaire.e1f111c3.js.map