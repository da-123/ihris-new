(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["resource"],{"1a0a":function(r,i,e){"use strict";e.r(i);var h,n,a=function(){var r=this,i=r.$createElement,e=r._self._c||i;return e("ihris-template",{key:r.$route.path},[r._v(" Loading... ")])},f=[],t=(e("d3b7"),e("a026")),o={name:"fhir-page-view",data:function(){return{}},created:function(){this.getTemplate()},methods:{getTemplate:function(){var r=this;fetch("/config/page/"+n).then((function(i){i.json().then((function(i){t["default"].component("ihris-template",{name:"ihris-template",data:function(){return{fhirId:h,isEdit:!1,sectionMenu:i.data.sectionMenu,subFields:i.data.subFields,columns:i.data.columns,actions:i.data.actions,links:i.data.links,constraints:i.data.constraints}},components:{"ihris-resource":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-primary")]).then(e.bind(null,"7372"))},"ihris-codesystem":function(){return e.e("fhir-codesystem").then(e.bind(null,"2d9b"))},"ihris-section":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-primary")]).then(e.bind(null,"e07f"))},"ihris-secondary":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-primary")]).then(e.bind(null,"39e1"))},"ihris-array":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-primary")]).then(e.bind(null,"bb1d"))},"fhir-extension":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-primary")]).then(e.bind(null,"6b10"))},"fhir-reference":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-questionnaire~fhir-secondary"),e.e("fhir-secondary")]).then(e.bind(null,"99fa"))},"fhir-backbone-element":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-questionnaire~fhir-secondary"),e.e("fhir-secondary")]).then(e.bind(null,"8142"))},"fhir-string":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-primary")]).then(e.bind(null,"b78c"))},"fhir-attachment":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-questionnaire~fhir-secondary"),e.e("fhir-secondary")]).then(e.bind(null,"ca33"))},"fhir-human-name":function(){return e.e("fhir-name").then(e.bind(null,"89c1"))},"fhir-code":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-primary")]).then(e.bind(null,"1131"))},"fhir-date":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-primary")]).then(e.bind(null,"7fb0"))},"fhir-date-time":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-primary")]).then(e.bind(null,"45dd"))},"fhir-period":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-questionnaire~fhir-secondary"),e.e("fhir-secondary")]).then(e.bind(null,"4807"))},"fhir-identifier":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-primary")]).then(e.bind(null,"c408"))},"fhir-contact-point":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-questionnaire~fhir-secondary"),e.e("fhir-secondary")]).then(e.bind(null,"4b80"))},"fhir-address":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-questionnaire~fhir-secondary"),e.e("fhir-secondary")]).then(e.bind(null,"b248"))},"fhir-codeable-concept":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-primary")]).then(e.bind(null,"309c"))},"fhir-uri":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-questionnaire~fhir-secondary"),e.e("fhir-secondary")]).then(e.bind(null,"6d39"))},"fhir-boolean":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-questionnaire~fhir-secondary"),e.e("fhir-secondary")]).then(e.bind(null,"ff03"))},"fhir-positive-int":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-questionnaire~fhir-secondary"),e.e("fhir-secondary")]).then(e.bind(null,"b750"))},"fhir-coding":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-main~fhir-primary~mhero"),e.e("fhir-main~fhir-primary"),e.e("fhir-primary")]).then(e.bind(null,"eee9"))},"fhir-money":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-main~fhir-questionnaire~fhir-secondary"),e.e("fhir-secondary")]).then(e.bind(null,"a6ba"))}},template:i.template,methods:{setEdit:function(r){this.isEdit=r}}}),r.$forceUpdate()})).catch((function(i){console.log(i),t["default"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),r.$forceUpdate()}))})).catch((function(i){console.log(i),t["default"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),r.$forceUpdate()}))}},components:{},beforeCreate:function(){h=this.$route.params.id,n=this.$route.params.page,t["default"].component("ihris-template",{template:"<div>Loading...</div>"})}},m=o,s=e("2877"),c=Object(s["a"])(m,a,f,!1,null,null,null);i["default"]=c.exports},"9d3d":function(r,i,e){"use strict";e.r(i);var h,n=function(){var r=this,i=r.$createElement,e=r._self._c||i;return e("ihris-template",{key:r.$route.path},[r._v(" Loading... ")])},a=[],f=(e("d3b7"),e("a026")),t={name:"fhir-page-search",data:function(){return{}},created:function(){this.getTemplate()},methods:{getTemplate:function(){var r=this;fetch("/config/page/"+h+"/search").then((function(i){i.json().then((function(i){f["default"].component("ihris-template",{name:"ihris-template",data:function(){return{fields:i.data.fields,addLink:i.data.addLink,terms:{}}},components:{"ihris-search":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-search")]).then(e.bind(null,"76e1"))},"ihris-search-code":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-search")]).then(e.bind(null,"5f81"))},"ihris-search-term":function(){return Promise.all([e.e("fhir-main~fhir-primary~fhir-search~fhir-secondary~mhero"),e.e("fhir-primary~fhir-search~mhero"),e.e("fhir-search")]).then(e.bind(null,"d604"))}},template:i.template,methods:{searchData:function(r,i){this.$set(this.terms,r,i)}}}),r.$forceUpdate()})).catch((function(i){console.log(i),f["default"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),r.$forceUpdate()}))})).catch((function(i){console.log(i),f["default"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),r.$forceUpdate()}))}},components:{},beforeCreate:function(){h=this.$route.params.page,f["default"].component("ihris-template",{template:"<div>Loading...</div>"})}},o=t,m=e("2877"),s=Object(m["a"])(o,n,a,!1,null,null,null);i["default"]=s.exports}}]);
//# sourceMappingURL=resource.2fbebde2.js.map