(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["resource"],{"1a0a":function(e,i,r){"use strict";r.r(i);var n,t,a=function(){var e=this,i=e.$createElement,r=e._self._c||i;return r("ihris-template",{key:e.$route.path},[e._v(" Loading... ")])},h=[],o=(r("d3b7"),r("a026")),f={name:"fhir-page-view",data:function(){return{}},created:function(){this.getTemplate()},methods:{getTemplate:function(){var e=this;fetch("/config/page/"+t).then((function(i){i.json().then((function(i){o["a"].component("ihris-template",{name:"ihris-template",data:function(){return{fhirId:n,isEdit:!1,sectionMenu:i.data.sectionMenu,subFields:i.data.subFields,columns:i.data.columns,actions:i.data.actions}},mounted:function(){console.log("ACTIONS",JSON.stringify(this.actions,null,2))},components:{"ihris-resource":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"7372"))},"ihris-codesystem":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"2d9b"))},"ihris-section":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"e07f"))},"ihris-secondary":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"39e1"))},"ihris-array":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"bb1d"))},"fhir-extension":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"6b10"))},"fhir-reference":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"99fa"))},"fhir-string":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"b78c"))},"fhir-human-name":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"89c1"))},"fhir-code":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"1131"))},"fhir-date":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"7fb0"))},"fhir-date-time":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"45dd"))},"fhir-period":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"4807"))},"fhir-identifier":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"c408"))},"fhir-contact-point":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"4b80"))},"fhir-address":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"b248"))},"fhir-codeable-concept":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"309c"))},"fhir-uri":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"6d39"))},"fhir-boolean":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"ff03"))},"fhir-positive-int":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"b750"))},"fhir-coding":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"eee9"))},"fhir-money":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-main")]).then(r.bind(null,"a6ba"))}},template:i.template,methods:{setEdit:function(e){this.isEdit=e}}}),e.$forceUpdate()})).catch((function(i){console.log(i),o["a"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),e.$forceUpdate()}))})).catch((function(i){console.log(i),o["a"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),e.$forceUpdate()}))}},components:{},beforeCreate:function(){n=this.$route.params.id,t=this.$route.params.page,o["a"].component("ihris-template",{template:"<div>Loading...</div>"})}},l=f,c=r("2877"),m=Object(c["a"])(l,a,h,!1,null,null,null);i["default"]=m.exports},"9d3d":function(e,i,r){"use strict";r.r(i);var n,t=function(){var e=this,i=e.$createElement,r=e._self._c||i;return r("ihris-template",{key:e.$route.path},[e._v(" Loading... ")])},a=[],h=(r("d3b7"),r("a026")),o={name:"fhir-page-search",data:function(){return{}},created:function(){this.getTemplate()},methods:{getTemplate:function(){var e=this;fetch("/config/page/"+n+"/search").then((function(i){i.json().then((function(i){h["a"].component("ihris-template",{name:"ihris-template",data:function(){return{fields:i.data.fields,addLink:i.data.addLink,terms:{}}},components:{"ihris-search":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-search")]).then(r.bind(null,"76e1"))},"ihris-search-code":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-search")]).then(r.bind(null,"5f81"))},"ihris-search-term":function(){return Promise.all([r.e("fhir-main~fhir-search~mhero"),r.e("fhir-search")]).then(r.bind(null,"d604"))}},template:i.template,methods:{searchData:function(e,i){this.$set(this.terms,e,i)}}}),e.$forceUpdate()})).catch((function(i){console.log(i),h["a"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),e.$forceUpdate()}))})).catch((function(i){console.log(i),h["a"].component("ihris-template",{template:"<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>"}),e.$forceUpdate()}))}},components:{},beforeCreate:function(){n=this.$route.params.page,h["a"].component("ihris-template",{template:"<div>Loading...</div>"})}},f=o,l=r("2877"),c=Object(l["a"])(f,t,a,!1,null,null,null);i["default"]=c.exports}}]);
//# sourceMappingURL=resource.3ace9a2e.js.map