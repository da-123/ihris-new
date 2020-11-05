(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["fhir-search"],{"10db":function(e,t,r){"use strict";r.r(t);var n=function(){var e=this,t=e.$createElement,r=e._self._c||t;return e.isDropDown?r("v-autocomplete",{attrs:{loading:e.loading,label:e.label,items:e.items,outlined:"","error-messages":e.err_messages,error:e.error,shaped:"",clearable:"","hide-details":"","small-chips":"",dense:"",multiple:"","item-text":"display","item-value":"code"},on:{change:function(t){return e.updateSearch()},"click:clear":function(t){return e.clearSearch()}},model:{value:e.value,callback:function(t){e.value=t},expression:"value"}}):r("v-text-field",{attrs:{label:e.label,dense:"",outlined:"","hide-details":"",shaped:"",clearable:""},on:{change:function(t){return e.updateSearch()},"click:clear":function(t){return e.clearSearch()}},model:{value:e.value,callback:function(t){e.value=t},expression:"value"}})},a=[],i=(r("99af"),r("7db0"),r("d3b7"),r("b85c")),s={name:"ihris-search-term",props:["label","expression","isDropDown","reportData"],data:function(){return{loading:!1,items:[],error:!1,err_messages:null,value:[]}},mounted:function(){var e=this;if(this.loading=!0,this.isDropDown){var t=this.reportData.filters.find((function(t){return t.field===e.expression})),r=t.dataType,n="/es/populateFilter/".concat(this.reportData.indexName,"/").concat(this.expression,"?dataType=").concat(r);fetch(n,{method:"GET"}).then((function(t){t.json().then((function(t){e.loading=!1;var r,n=Object(i["a"])(t);try{for(n.s();!(r=n.n()).done;){var a=r.value;e.items.push(a.key.value)}}catch(s){n.e(s)}finally{n.f()}})).catch((function(t){e.loading=!1,e.error_message="Unable to load results.",console.log(t)}))})).catch((function(t){e.loading=!1,e.error_message="Unable to load results.",console.log(t)}))}},methods:{updateSearch:function(){this.$emit("termChange",this.expression,this.value)},clearSearch:function(){this.$emit("termChange",this.expression,[])}}},o=s,c=r("2877"),l=r("6544"),u=r.n(l),h=r("c6a6"),d=r("8654"),f=Object(c["a"])(o,n,a,!1,null,null,null);t["default"]=f.exports;u()(f,{VAutocomplete:h["a"],VTextField:d["a"]})},"1da1":function(e,t,r){"use strict";r.d(t,"a",(function(){return a}));r("d3b7"),r("e6cf");function n(e,t,r,n,a,i,s){try{var o=e[i](s),c=o.value}catch(l){return void r(l)}o.done?t(c):Promise.resolve(c).then(n,a)}function a(e){return function(){var t=this,r=arguments;return new Promise((function(a,i){var s=e.apply(t,r);function o(e){n(s,a,i,o,c,"next",e)}function c(e){n(s,a,i,o,c,"throw",e)}o(void 0)}))}}},"2bfd":function(e,t,r){},"2e2c":function(e,t,r){"use strict";r.r(t);var n=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("v-container",{staticClass:"py-5"},[r("v-card",[r("v-card-title",[e._v(" "+e._s(e.label)+" "),r("v-spacer"),e._t("default")],2),e.error_message?r("v-card-subtitle",{staticClass:"white--text error"},[e._v(e._s(e.error_message))]):e._e(),r("v-data-table",{staticClass:"elevation-1",staticStyle:{cursor:"pointer"},attrs:{headers:e.headers,items:e.results,options:e.options,"server-items-length":e.total,"footer-props":{"items-per-page-options":[5,10,20,50]},loading:e.loading,"show-select":e.reportData.displayCheckbox},on:{"update:options":function(t){e.options=t},"click:row":e.clickIt},model:{value:e.selected,callback:function(t){e.selected=t},expression:"selected"}})],1)],1)},a=[],i=(r("7db0"),r("c975"),r("45fc"),r("b64b"),r("d3b7"),r("ac1f"),r("5319"),r("1276"),r("9911"),r("b85c")),s=r("56d7"),o={name:"ihris-report",props:["profile","reportData","label","terms","dataURL","page"],data:function(){return{debug:"",headers:[],results:[],options:{itemsPerPage:10},loading:!1,total:0,prevPage:-1,link:[],selected:[],error_message:null}},watch:{selected:function(){s["eventBus"].$emit("ihris-report-selections",this.selected,this.reportData)},terms:{handler:function(){this.getData(!0)},deep:!0},options:{handler:function(){this.getData()},deep:!0}},created:function(){var e,t=this,r=Object(i["a"])(this.reportData.fieldsDetails);try{for(r.s();!(e=r.n()).done;){var n,a=e.value,o=Object(i["a"])(a.fields);try{for(o.s();!(n=o.n()).done;){var c=n.value,l=a.resourceType+"."+c[1];this.headers.push({text:c[0],value:l})}}catch(u){o.e(u)}finally{o.f()}}}catch(u){r.e(u)}finally{r.f()}s["eventBus"].$on("reload-report",(function(){t.getData()}))},mounted:function(){this.getData(!0)},methods:{clickIt:function(e){this.$router.push({name:"resource_view",params:{page:this.page,id:e.id}})},getData:function(e){var t=this;this.loading=!0,this.error_message=null;var r="";if(e&&(this.options.page=1),this.options.page>1&&(this.options.page===this.prevPage-1?r=this.link.find((function(e){return"previous"===e.relation})).url:this.options.page===this.prevPage+1&&(r=this.link.find((function(e){return"next"===e.relation})).url),r=r.substring(r.indexOf("/fhir/"))),""===r){var n=this.options.itemsPerPage||10,a="";for(var s in this.options.sortBy)a&&(a+=","),this.options.sortDesc[s]&&(a+="-"),a+=this.options.sortBy[s];r="/fhir/"+this.dataURL+"_count="+n+"&_total=accurate";for(var o=Object.keys(this.terms),c=0,l=o;c<l.length;c++){var u=l[c];r+="&"+u+"="+this.terms[u]}this.debug=r}this.prevPage=this.options.page,fetch(r).then((function(e){e.json().then((function(e){if(t.results=[],e.total>0){t.link=e.link;var r,n=Object(i["a"])(e.entry);try{var a=function(){var e=r.value,n=[];if(e.resource.resourceType!==t.reportData.primaryResource)(function(){var r=t.reportData.resourcesConnections.find((function(t){return t.resourceType===e.resource.resourceType})),a=t.$fhirpath.evaluate(e.resource,r.linkElement.replace(r.resourceType+".",""));if(Array.isArray(a))for(var i in a)2!==a[i].split("/").length&&(a[i]=r.resourceType+"/"+a[i]);else-1===a.indexOf(r.resourceType+"/")&&(a=r.resourceType+"/"+a);for(var s in t.results){var o=t.results[s][r.linkTo];if(Array.isArray(o)&&Array.isArray(a)){var c=o.some((function(e){return a.indexOf(e)>=0}));c&&n.push(s)}else(Array.isArray(o)&&-1!==o.indexOf(a)||Array.isArray(a)&&-1!==a.indexOf(o)||o===a)&&n.push(s)}})();else{var a=t.results.push({id:e.resource.id});n.push(a-1)}var s,o=t.reportData.fieldsDetails.find((function(t){return t.resourceType===e.resource.resourceType})),c=Object(i["a"])(o.fields);try{for(c.s();!(s=c.n()).done;){var l,u=s.value,h=o.resourceType+"."+u[1],d=Object(i["a"])(n);try{for(d.s();!(l=d.n()).done;){var f=l.value;t.results[f][h]?t.results[f][h]+=", "+t.$fhirpath.evaluate(e.resource,h):t.results[f][h]=t.$fhirpath.evaluate(e.resource,h)}}catch(k){d.e(k)}finally{d.f()}}}catch(k){c.e(k)}finally{c.f()}if(o.hiddenFields&&Array.isArray(o.hiddenFields)){var p,v=Object(i["a"])(o.hiddenFields);try{for(v.s();!(p=v.n()).done;){var m=p.value,g=m[1].split("."),b=t.$fhirpath.evaluate(e.resource,m[1]);"id"===g[g.length-1]&&(b=g[0]+"/"+b);var y,x=Object(i["a"])(n);try{for(x.s();!(y=x.n()).done;){var _=y.value;t.results[_][m[1]]=b}}catch(k){x.e(k)}finally{x.f()}}}catch(k){v.e(k)}finally{v.f()}}};for(n.s();!(r=n.n()).done;)a()}catch(s){n.e(s)}finally{n.f()}}t.total=e.total,t.loading=!1})).catch((function(e){t.loading=!1,t.error_message="Unable to load results.",console.log(e)}))})).catch((function(e){t.loading=!1,t.error_message="Unable to load results.",console.log(e)}))}}},c=o,l=r("2877"),u=r("6544"),h=r.n(u),d=r("b0af"),f=r("99d9"),p=r("a523"),v=r("8fea"),m=r("2fa4"),g=Object(l["a"])(c,n,a,!1,null,null,null);t["default"]=g.exports;h()(g,{VCard:d["a"],VCardSubtitle:f["b"],VCardTitle:f["d"],VContainer:p["a"],VDataTable:v["a"],VSpacer:m["a"]})},"2eb5":function(e,t,r){"use strict";r.r(t);var n=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("v-container",{staticClass:"py-5"},[r("v-card",[r("v-card-title",[e._v(" "+e._s(e.label)+" "),r("v-spacer"),e._t("default")],2),e.error_message?r("v-card-subtitle",{staticClass:"white--text error"},[e._v(e._s(e.error_message))]):e._e(),r("v-data-table",{staticClass:"elevation-1",staticStyle:{cursor:"pointer"},attrs:{headers:e.headers,items:e.results,options:e.options,"server-items-length":e.total,"footer-props":{"items-per-page-options":e.itemsPerPage},loading:e.loading,"item-key":"id","show-select":e.reportData.displayCheckbox},on:{"update:options":function(t){e.options=t}},model:{value:e.selected,callback:function(t){e.selected=t},expression:"selected"}})],1)],1)},a=[],i=(r("99af"),r("7db0"),r("b64b"),r("d3b7"),r("ac1f"),r("5319"),r("1276"),r("498a"),r("9911"),r("b85c")),s=r("56d7"),o={name:"ihris-report",props:["profile","reportData","label","terms","dataURL","page"],data:function(){return{debug:"",headers:[],results:[],options:{itemsPerPage:10},loading:!1,total:0,prevPage:-1,link:[],selected:[],error_message:null}},watch:{selected:function(){s["eventBus"].$emit("ihris-report-selections",this.selected,this.reportData)},terms:{handler:function(){this.getTotalRecords(),this.getData(!0)},deep:!0},options:{handler:function(){this.getTotalRecords(),this.getData()},deep:!0}},computed:{itemsPerPage:function(){var e=[5,10,20,50];return this.total>1e4?e.push(1e4):e.push(-1),e}},created:function(){var e,t=this,r=Object(i["a"])(this.reportData.fieldsDetails);try{for(r.s();!(e=r.n()).done;){var n=e.value;this.headers.push({text:n[0],value:n[1]})}}catch(a){r.e(a)}finally{r.f()}s["eventBus"].$on("reload-report",(function(){t.getTotalRecords(),t.getData()}))},mounted:function(){this.getTotalRecords(),this.getData(!0)},methods:{clickIt:function(e){this.$router.push({name:"resource_view",params:{page:this.page,id:e.id}})},buildTerms:function(){var e=this,t={query:{bool:{must:[]}}};if(Object.keys(this.terms).length>0){var r=function(r){if(!e.terms[r]||0===e.terms[r].length)return"continue";var n=e.reportData.filters.find((function(e){return e.field===r}));n.isDropDown||(e.terms[r]=e.terms[r].replace(/\s+/g," ").trim());var a=void 0;if(a=n.isDropDown?r+".keyword":r,Array.isArray(e.terms[r])){var s={terms:{}};s.terms[a]=[];var o,c=Object(i["a"])(e.terms[r]);try{for(c.s();!(o=c.n()).done;){var l=o.value;s.terms[a].push(l)}}catch(m){c.e(m)}finally{c.f()}t.query.bool.must.push(s)}else if(n.isDropDown){var u={terms:{}};u.terms[a]=[e.terms[r]],t.query.bool.must.push(u)}else{var h,d=e.terms[r].split(" "),f=Object(i["a"])(d);try{for(f.s();!(h=f.n()).done;){var p=h.value,v={wildcard:{}};v.wildcard[a]=p+"*",t.query.bool.must.push(v)}}catch(m){f.e(m)}finally{f.f()}}};for(var n in this.terms)r(n)}return t},getTotalRecords:function(){var e=this,t="/es/".concat(this.reportData.indexName,"/_count"),r=this.buildTerms();fetch(t,{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify(r)}).then((function(t){t.json().then((function(t){e.total=t.count}))}))},getData:function(e){var t=this;this.loading=!0,this.error_message=null;var r="";e&&(this.options.page=1);var n=this.options.itemsPerPage||10;-1===n&&(n=this.total);var a=this.options.page*this.options.itemsPerPage-this.options.itemsPerPage;r="/es/".concat(this.reportData.indexName,"/_search?size=").concat(n,"&from=").concat(a),this.prevPage=this.options.page;var s=this.buildTerms();fetch(r,{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify(s)}).then((function(e){e.json().then((function(e){if(t.results=[],e.hits.total.value>0){t.link=e.link;var r,n=Object(i["a"])(e.hits.hits);try{for(n.s();!(r=n.n()).done;){var a=r.value,s={};for(var o in a["_source"])s[o]=a["_source"][o];s.id=a["_id"],t.results.push(s)}}catch(c){n.e(c)}finally{n.f()}}t.loading=!1})).catch((function(e){t.loading=!1,t.error_message="Unable to load results.",console.log(e)}))})).catch((function(e){t.loading=!1,t.error_message="Unable to load results.",console.log(e)}))}}},c=o,l=r("2877"),u=r("6544"),h=r.n(u),d=r("b0af"),f=r("99d9"),p=r("a523"),v=r("8fea"),m=r("2fa4"),g=Object(l["a"])(c,n,a,!1,null,null,null);t["default"]=g.exports;h()(g,{VCard:d["a"],VCardSubtitle:f["b"],VCardTitle:f["d"],VContainer:p["a"],VDataTable:v["a"],VSpacer:m["a"]})},"5f81":function(e,t,r){"use strict";r.r(t);var n=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("v-container",{staticClass:"py-5"},[r("v-card",[r("v-card-title",[e._v(" "+e._s(e.label)+" "),r("v-spacer"),e._t("default"),r("v-text-field",{attrs:{"append-icon":"mdi-magnify",label:"Search","single-line":"","hide-details":""},model:{value:e.search,callback:function(t){e.search=t},expression:"search"}}),r("v-spacer"),r("v-btn",{class:e.addLink&&e.addLink.class||"primary",attrs:{to:e.addLink?e.addLink.url:"/resource/add/"+e.page}},[e.addLink&&e.addLink.icon?r("v-icon",[e._v(e._s(e.addLink.icon))]):r("v-icon",[e._v("mdi-database-plus")]),e._v(" Add "+e._s(e.label)+" ")],1)],2),e.error_message?r("v-card-subtitle",{staticClass:"white--text error"},[e._v(e._s(e.error_message))]):e._e(),r("v-data-table",{staticClass:"elevation-1",staticStyle:{cursor:"pointer"},attrs:{headers:e.headers,items:e.results,"item-key":"code",search:e.search,options:e.options,"footer-props":{"items-per-page-options":[5,10,20,50]},loading:e.loading},on:{"update:options":function(t){e.options=t},"click:row":e.clickIt}})],1)],1)},a=[],i=(r("7db0"),r("baa5"),r("fb6a"),r("d3b7"),r("3ca3"),r("ddb0"),r("96cf"),r("1da1")),s=r("b85c"),o={name:"ihris-search-code",props:["profile","fields","label","terms","page","resource","add-link"],data:function(){return{debug:"",search:"",headers:[],results:[],options:{itemsPerPage:10},loading:!1,total:0,error_message:null}},watch:{},created:function(){var e,t=Object(s["a"])(this.fields);try{for(t.s();!(e=t.n()).done;){var r=e.value;this.headers.push({text:r[0],value:r[1]})}}catch(n){t.e(n)}finally{t.f()}},mounted:function(){this.getData()},methods:{clickIt:function(e){this.$router.push({name:"resource_view",params:{page:this.page,id:e.code}})},getData:function(){var e=this;this.loading=!0,this.error_message=null;var t="/fhir/CodeSystem"+this.profile.substring(this.profile.lastIndexOf("/"));fetch(t).then((function(t){t.ok?t.json().then(function(){var t=Object(i["a"])(regeneratorRuntime.mark((function t(r){var n,a,i,o,c,l,u;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:if(e.results=[],!(r.concept&&r.concept.length>0)){t.next=36;break}n=Object(s["a"])(r.concept),t.prev=3,n.s();case 5:if((a=n.n()).done){t.next=28;break}if(i=a.value,o={code:i.code,display:i.display,definition:i.definition},!i.property||!r.property){t.next=25;break}c=Object(s["a"])(r.property),t.prev=10,u=regeneratorRuntime.mark((function t(){var r,n;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:if(r=l.value,n=i.property.find((function(e){return e.code===r.code})),!n){t.next=24;break}if("code"!==r.type){t.next=13;break}if(!n.valueCode){t.next=10;break}return t.next=7,e.$fhirutils.codeLookup(r.uri,n.valueCode);case 7:o[r.code]=t.sent,t.next=11;break;case 10:o[r.code]="";case 11:t.next=24;break;case 13:if("Coding"!==r.type){t.next=23;break}if(!n.valueCoding){t.next=20;break}return t.next=17,e.$fhirutils.codeLookup(n.valueCoding.system,n.valueCoding.code,r.uri);case 17:o[r.code]=t.sent,t.next=21;break;case 20:o[r.code]="";case 21:t.next=24;break;case 23:o[r.code]=n["value"+r.type.charAt(0).toUpperCase()+r.type.slice(1)];case 24:case"end":return t.stop()}}),t)})),c.s();case 13:if((l=c.n()).done){t.next=17;break}return t.delegateYield(u(),"t0",15);case 15:t.next=13;break;case 17:t.next=22;break;case 19:t.prev=19,t.t1=t["catch"](10),c.e(t.t1);case 22:return t.prev=22,c.f(),t.finish(22);case 25:e.results.push(o);case 26:t.next=5;break;case 28:t.next=33;break;case 30:t.prev=30,t.t2=t["catch"](3),n.e(t.t2);case 33:return t.prev=33,n.f(),t.finish(33);case 36:e.total=r.concept.length,e.loading=!1;case 38:case"end":return t.stop()}}),t,null,[[3,30,33,36],[10,19,22,25]])})));return function(e){return t.apply(this,arguments)}}()).catch((function(t){e.loading=!1,e.error_message="Unable to load results.",console.log(t)})):(e.loading=!1,e.error_message="Unable to load results.",console.log("Invalid response",t),t.text().then((function(e){console.log("body text:",e)})).catch((function(e){console.log("Failed to get text:",e)})))})).catch((function(t){e.loading=!1,e.error_message="Unable to load results.",console.log(t)}))}}},c=o,l=r("2877"),u=r("6544"),h=r.n(u),d=r("8336"),f=r("b0af"),p=r("99d9"),v=r("a523"),m=r("8fea"),g=r("132d"),b=r("2fa4"),y=r("8654"),x=Object(l["a"])(c,n,a,!1,null,null,null);t["default"]=x.exports;h()(x,{VBtn:d["a"],VCard:f["a"],VCardSubtitle:p["b"],VCardTitle:p["d"],VContainer:v["a"],VDataTable:m["a"],VIcon:g["a"],VSpacer:b["a"],VTextField:y["a"]})},"76e1":function(e,t,r){"use strict";r.r(t);var n=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("v-container",{staticClass:"py-5"},[r("v-card",[r("v-card-title",[e._v(" Search "+e._s(e.label)+" "),r("v-spacer"),r("v-btn",{class:e.addLink&&e.addLink.class||"primary",attrs:{to:e.addLink?e.addLink.url:"/resource/add/"+e.page}},[e.addLink&&e.addLink.icon?r("v-icon",[e._v(e._s(e.addLink.icon))]):r("v-icon",[e._v("mdi-database-plus")]),e._v(" Add "+e._s(e.label)+" ")],1)],1),r("v-card-title",[e._t("default")],2),e.error_message?r("v-card-subtitle",{staticClass:"white--text error"},[e._v(e._s(e.error_message))]):e._e(),r("v-card-text",[r("v-container"),r("v-data-table",{staticClass:"elevation-1",staticStyle:{cursor:"pointer"},attrs:{headers:e.headers,items:e.results,"item-key":"id",options:e.options,"server-items-length":e.total,"footer-props":{"items-per-page-options":[5,10,20,50]},loading:e.loading},on:{"update:options":function(t){e.options=t},"click:row":e.clickIt}})],1)],1)],1)},a=[],i=(r("7db0"),r("c975"),r("a15b"),r("b64b"),r("d3b7"),r("ac1f"),r("5319"),r("9911"),r("96cf"),r("1da1")),s=r("b85c"),o={name:"ihris-search",props:["profile","fields","label","terms","page","resource","add-link"],data:function(){return{debug:"",headers:[],results:[],options:{itemsPerPage:10},loading:!1,total:0,prevPage:-1,link:[],error_message:null,update_again:{rerun:!1,restart:!1}}},watch:{terms:{handler:function(){this.getData(!0)},deep:!0},options:{handler:function(){this.getData()},deep:!0}},created:function(){var e,t=Object(s["a"])(this.fields);try{for(t.s();!(e=t.n()).done;){var r=e.value;this.headers.push({text:r[0],value:r[1]})}}catch(n){t.e(n)}finally{t.f()}},mounted:function(){this.getData(!0)},methods:{clickIt:function(e){this.$router.push({name:"resource_view",params:{page:this.page,id:e.id}})},checkRerun:function(){!this.loading&&this.update_again.rerun&&(this.getData(this.update_again.restart),this.update_again={rerun:!1,restart:!1})},getData:function(e){var t=this;if(this.loading)return this.update_again.rerun=!0,void(this.update_again.restart=this.update_again.restart||e);this.loading=!0,this.error_message=null;var r="";if(e&&(this.options.page=1),this.options.page>1&&(this.options.page===this.prevPage-1?r=this.link.find((function(e){return"previous"===e.relation})).url:this.options.page===this.prevPage+1&&(r=this.link.find((function(e){return"next"===e.relation})).url),r=r.replace(/_getpages=[^&]*&*/,"").replace("/fhir?","/fhir/"+this.resource+"?"),r=r.substring(r.indexOf("/fhir/"))),""===r){var n=this.options.itemsPerPage||10,a="";for(var o in this.options.sortBy)a&&(a+=","),this.options.sortDesc[o]&&(a+="-"),a+=this.options.sortBy[o];r="/fhir/"+this.resource+"?_count="+n+"&_total=accurate&_profile="+this.profile;for(var c=Object.keys(this.terms),l=0,u=c;l<u.length;l++){var h=u[l];Array.isArray(this.terms[h])?this.terms[h].length>0&&(r+="&"+h+"="+this.terms[h].join(",")):this.terms[h]&&(r+="&"+h+"="+this.terms[h])}this.debug=r}this.prevPage=this.options.page,fetch(r).then((function(e){e.json().then(function(){var e=Object(i["a"])(regeneratorRuntime.mark((function e(r){var n,a,i,o,c,l,u,h;return regeneratorRuntime.wrap((function(e){while(1)switch(e.prev=e.next){case 0:if(t.results=[],!(r.total>0)){e.next=39;break}t.link=r.link,n=Object(s["a"])(r.entry),e.prev=4,n.s();case 6:if((a=n.n()).done){e.next=31;break}i=a.value,o={id:i.resource.id},c=Object(s["a"])(t.fields),e.prev=10,c.s();case 12:if((l=c.n()).done){e.next=20;break}return u=l.value,h=t.$fhirpath.evaluate(i.resource,u[1]),e.next=17,t.$fhirutils.lookup(h[0],u[2]);case 17:o[u[1]]=e.sent;case 18:e.next=12;break;case 20:e.next=25;break;case 22:e.prev=22,e.t0=e["catch"](10),c.e(e.t0);case 25:return e.prev=25,c.f(),e.finish(25);case 28:t.results.push(o);case 29:e.next=6;break;case 31:e.next=36;break;case 33:e.prev=33,e.t1=e["catch"](4),n.e(e.t1);case 36:return e.prev=36,n.f(),e.finish(36);case 39:t.total=r.total,t.loading=!1,t.checkRerun();case 42:case"end":return e.stop()}}),e,null,[[4,33,36,39],[10,22,25,28]])})));return function(t){return e.apply(this,arguments)}}()).catch((function(e){t.loading=!1,t.error_message="Unable to load results.",t.checkRerun(),console.log(e)}))})).catch((function(e){t.loading=!1,t.error_message="Unable to load results.",t.checkRerun(),console.log(e)}))}}},c=o,l=r("2877"),u=r("6544"),h=r.n(u),d=r("8336"),f=r("b0af"),p=r("99d9"),v=r("a523"),m=r("8fea"),g=r("132d"),b=r("2fa4"),y=Object(l["a"])(c,n,a,!1,null,null,null);t["default"]=y.exports;h()(y,{VBtn:d["a"],VCard:f["a"],VCardSubtitle:p["b"],VCardText:p["c"],VCardTitle:p["d"],VContainer:v["a"],VDataTable:m["a"],VIcon:g["a"],VSpacer:b["a"]})},"96cf":function(e,t,r){var n=function(e){"use strict";var t,r=Object.prototype,n=r.hasOwnProperty,a="function"===typeof Symbol?Symbol:{},i=a.iterator||"@@iterator",s=a.asyncIterator||"@@asyncIterator",o=a.toStringTag||"@@toStringTag";function c(e,t,r,n){var a=t&&t.prototype instanceof v?t:v,i=Object.create(a.prototype),s=new C(n||[]);return i._invoke=I(e,r,s),i}function l(e,t,r){try{return{type:"normal",arg:e.call(t,r)}}catch(n){return{type:"throw",arg:n}}}e.wrap=c;var u="suspendedStart",h="suspendedYield",d="executing",f="completed",p={};function v(){}function m(){}function g(){}var b={};b[i]=function(){return this};var y=Object.getPrototypeOf,x=y&&y(y(j([])));x&&x!==r&&n.call(x,i)&&(b=x);var _=g.prototype=v.prototype=Object.create(b);function k(e){["next","throw","return"].forEach((function(t){e[t]=function(e){return this._invoke(t,e)}}))}function w(e,t){function r(a,i,s,o){var c=l(e[a],e,i);if("throw"!==c.type){var u=c.arg,h=u.value;return h&&"object"===typeof h&&n.call(h,"__await")?t.resolve(h.__await).then((function(e){r("next",e,s,o)}),(function(e){r("throw",e,s,o)})):t.resolve(h).then((function(e){u.value=e,s(u)}),(function(e){return r("throw",e,s,o)}))}o(c.arg)}var a;function i(e,n){function i(){return new t((function(t,a){r(e,n,t,a)}))}return a=a?a.then(i,i):i()}this._invoke=i}function I(e,t,r){var n=u;return function(a,i){if(n===d)throw new Error("Generator is already running");if(n===f){if("throw"===a)throw i;return T()}r.method=a,r.arg=i;while(1){var s=r.delegate;if(s){var o=S(s,r);if(o){if(o===p)continue;return o}}if("next"===r.method)r.sent=r._sent=r.arg;else if("throw"===r.method){if(n===u)throw n=f,r.arg;r.dispatchException(r.arg)}else"return"===r.method&&r.abrupt("return",r.arg);n=d;var c=l(e,t,r);if("normal"===c.type){if(n=r.done?f:h,c.arg===p)continue;return{value:c.arg,done:r.done}}"throw"===c.type&&(n=f,r.method="throw",r.arg=c.arg)}}}function S(e,r){var n=e.iterator[r.method];if(n===t){if(r.delegate=null,"throw"===r.method){if(e.iterator["return"]&&(r.method="return",r.arg=t,S(e,r),"throw"===r.method))return p;r.method="throw",r.arg=new TypeError("The iterator does not provide a 'throw' method")}return p}var a=l(n,e.iterator,r.arg);if("throw"===a.type)return r.method="throw",r.arg=a.arg,r.delegate=null,p;var i=a.arg;return i?i.done?(r[e.resultName]=i.value,r.next=e.nextLoc,"return"!==r.method&&(r.method="next",r.arg=t),r.delegate=null,p):i:(r.method="throw",r.arg=new TypeError("iterator result is not an object"),r.delegate=null,p)}function D(e){var t={tryLoc:e[0]};1 in e&&(t.catchLoc=e[1]),2 in e&&(t.finallyLoc=e[2],t.afterLoc=e[3]),this.tryEntries.push(t)}function O(e){var t=e.completion||{};t.type="normal",delete t.arg,e.completion=t}function C(e){this.tryEntries=[{tryLoc:"root"}],e.forEach(D,this),this.reset(!0)}function j(e){if(e){var r=e[i];if(r)return r.call(e);if("function"===typeof e.next)return e;if(!isNaN(e.length)){var a=-1,s=function r(){while(++a<e.length)if(n.call(e,a))return r.value=e[a],r.done=!1,r;return r.value=t,r.done=!0,r};return s.next=s}}return{next:T}}function T(){return{value:t,done:!0}}return m.prototype=_.constructor=g,g.constructor=m,g[o]=m.displayName="GeneratorFunction",e.isGeneratorFunction=function(e){var t="function"===typeof e&&e.constructor;return!!t&&(t===m||"GeneratorFunction"===(t.displayName||t.name))},e.mark=function(e){return Object.setPrototypeOf?Object.setPrototypeOf(e,g):(e.__proto__=g,o in e||(e[o]="GeneratorFunction")),e.prototype=Object.create(_),e},e.awrap=function(e){return{__await:e}},k(w.prototype),w.prototype[s]=function(){return this},e.AsyncIterator=w,e.async=function(t,r,n,a,i){void 0===i&&(i=Promise);var s=new w(c(t,r,n,a),i);return e.isGeneratorFunction(r)?s:s.next().then((function(e){return e.done?e.value:s.next()}))},k(_),_[o]="Generator",_[i]=function(){return this},_.toString=function(){return"[object Generator]"},e.keys=function(e){var t=[];for(var r in e)t.push(r);return t.reverse(),function r(){while(t.length){var n=t.pop();if(n in e)return r.value=n,r.done=!1,r}return r.done=!0,r}},e.values=j,C.prototype={constructor:C,reset:function(e){if(this.prev=0,this.next=0,this.sent=this._sent=t,this.done=!1,this.delegate=null,this.method="next",this.arg=t,this.tryEntries.forEach(O),!e)for(var r in this)"t"===r.charAt(0)&&n.call(this,r)&&!isNaN(+r.slice(1))&&(this[r]=t)},stop:function(){this.done=!0;var e=this.tryEntries[0],t=e.completion;if("throw"===t.type)throw t.arg;return this.rval},dispatchException:function(e){if(this.done)throw e;var r=this;function a(n,a){return o.type="throw",o.arg=e,r.next=n,a&&(r.method="next",r.arg=t),!!a}for(var i=this.tryEntries.length-1;i>=0;--i){var s=this.tryEntries[i],o=s.completion;if("root"===s.tryLoc)return a("end");if(s.tryLoc<=this.prev){var c=n.call(s,"catchLoc"),l=n.call(s,"finallyLoc");if(c&&l){if(this.prev<s.catchLoc)return a(s.catchLoc,!0);if(this.prev<s.finallyLoc)return a(s.finallyLoc)}else if(c){if(this.prev<s.catchLoc)return a(s.catchLoc,!0)}else{if(!l)throw new Error("try statement without catch or finally");if(this.prev<s.finallyLoc)return a(s.finallyLoc)}}}},abrupt:function(e,t){for(var r=this.tryEntries.length-1;r>=0;--r){var a=this.tryEntries[r];if(a.tryLoc<=this.prev&&n.call(a,"finallyLoc")&&this.prev<a.finallyLoc){var i=a;break}}i&&("break"===e||"continue"===e)&&i.tryLoc<=t&&t<=i.finallyLoc&&(i=null);var s=i?i.completion:{};return s.type=e,s.arg=t,i?(this.method="next",this.next=i.finallyLoc,p):this.complete(s)},complete:function(e,t){if("throw"===e.type)throw e.arg;return"break"===e.type||"continue"===e.type?this.next=e.arg:"return"===e.type?(this.rval=this.arg=e.arg,this.method="return",this.next="end"):"normal"===e.type&&t&&(this.next=t),p},finish:function(e){for(var t=this.tryEntries.length-1;t>=0;--t){var r=this.tryEntries[t];if(r.finallyLoc===e)return this.complete(r.completion,r.afterLoc),O(r),p}},catch:function(e){for(var t=this.tryEntries.length-1;t>=0;--t){var r=this.tryEntries[t];if(r.tryLoc===e){var n=r.completion;if("throw"===n.type){var a=n.arg;O(r)}return a}}throw new Error("illegal catch attempt")},delegateYield:function(e,r,n){return this.delegate={iterator:j(e),resultName:r,nextLoc:n},"next"===this.method&&(this.arg=t),p}},e}(e.exports);try{regeneratorRuntime=n}catch(a){Function("r","regeneratorRuntime = r")(n)}},c6a6:function(e,t,r){"use strict";r("4de4"),r("7db0"),r("c975"),r("d81d"),r("45fc"),r("498a");var n=r("5530"),a=(r("2bfd"),r("b974")),i=r("8654"),s=r("d9f7"),o=r("80d2"),c=Object(n["a"])(Object(n["a"])({},a["b"]),{},{offsetY:!0,offsetOverflow:!0,transition:!1});t["a"]=a["a"].extend({name:"v-autocomplete",props:{allowOverflow:{type:Boolean,default:!0},autoSelectFirst:{type:Boolean,default:!1},filter:{type:Function,default:function(e,t,r){return r.toLocaleLowerCase().indexOf(t.toLocaleLowerCase())>-1}},hideNoData:Boolean,menuProps:{type:a["a"].options.props.menuProps.type,default:function(){return c}},noFilter:Boolean,searchInput:{type:String,default:void 0}},data:function(){return{lazySearch:this.searchInput}},computed:{classes:function(){return Object(n["a"])(Object(n["a"])({},a["a"].options.computed.classes.call(this)),{},{"v-autocomplete":!0,"v-autocomplete--is-selecting-index":this.selectedIndex>-1})},computedItems:function(){return this.filteredItems},selectedValues:function(){var e=this;return this.selectedItems.map((function(t){return e.getValue(t)}))},hasDisplayedItems:function(){var e=this;return this.hideSelected?this.filteredItems.some((function(t){return!e.hasItem(t)})):this.filteredItems.length>0},currentRange:function(){return null==this.selectedItem?0:String(this.getText(this.selectedItem)).length},filteredItems:function(){var e=this;return!this.isSearching||this.noFilter||null==this.internalSearch?this.allItems:this.allItems.filter((function(t){var r=Object(o["q"])(t,e.itemText,void 0),n=null!=r?String(r):"";return e.filter(t,String(e.internalSearch),n)}))},internalSearch:{get:function(){return this.lazySearch},set:function(e){this.lazySearch=e,this.$emit("update:search-input",e)}},isAnyValueAllowed:function(){return!1},isDirty:function(){return this.searchIsDirty||this.selectedItems.length>0},isSearching:function(){return this.multiple&&this.searchIsDirty||this.searchIsDirty&&this.internalSearch!==this.getText(this.selectedItem)},menuCanShow:function(){return!!this.isFocused&&(this.hasDisplayedItems||!this.hideNoData)},$_menuProps:function(){var e=a["a"].options.computed.$_menuProps.call(this);return e.contentClass="v-autocomplete__content ".concat(e.contentClass||"").trim(),Object(n["a"])(Object(n["a"])({},c),e)},searchIsDirty:function(){return null!=this.internalSearch&&""!==this.internalSearch},selectedItem:function(){var e=this;return this.multiple?null:this.selectedItems.find((function(t){return e.valueComparator(e.getValue(t),e.getValue(e.internalValue))}))},listData:function(){var e=a["a"].options.computed.listData.call(this);return e.props=Object(n["a"])(Object(n["a"])({},e.props),{},{items:this.virtualizedItems,noFilter:this.noFilter||!this.isSearching||!this.filteredItems.length,searchInput:this.internalSearch}),e}},watch:{filteredItems:"onFilteredItemsChanged",internalValue:"setSearch",isFocused:function(e){e?(document.addEventListener("copy",this.onCopy),this.$refs.input&&this.$refs.input.select()):(document.removeEventListener("copy",this.onCopy),this.updateSelf())},isMenuActive:function(e){!e&&this.hasSlot&&(this.lazySearch=void 0)},items:function(e,t){t&&t.length||!this.hideNoData||!this.isFocused||this.isMenuActive||!e.length||this.activateMenu()},searchInput:function(e){this.lazySearch=e},internalSearch:"onInternalSearchChanged",itemText:"updateSelf"},created:function(){this.setSearch()},methods:{onFilteredItemsChanged:function(e,t){var r=this;e!==t&&(this.setMenuIndex(-1),this.$nextTick((function(){r.internalSearch&&(1===e.length||r.autoSelectFirst)&&(r.$refs.menu.getTiles(),r.setMenuIndex(0))})))},onInternalSearchChanged:function(){this.updateMenuDimensions()},updateMenuDimensions:function(){this.isMenuActive&&this.$refs.menu&&this.$refs.menu.updateDimensions()},changeSelectedIndex:function(e){this.searchIsDirty||(this.multiple&&e===o["x"].left?-1===this.selectedIndex?this.selectedIndex=this.selectedItems.length-1:this.selectedIndex--:this.multiple&&e===o["x"].right?this.selectedIndex>=this.selectedItems.length-1?this.selectedIndex=-1:this.selectedIndex++:e!==o["x"].backspace&&e!==o["x"].delete||this.deleteCurrentItem())},deleteCurrentItem:function(){if(!this.readonly){var e=this.selectedItems.length-1;if(-1!==this.selectedIndex||0===e){var t=this.selectedItems[this.selectedIndex];if(!this.getDisabled(t)){var r=this.selectedIndex===e?this.selectedIndex-1:this.selectedItems[this.selectedIndex+1]?this.selectedIndex:-1;-1===r?this.setValue(this.multiple?[]:void 0):this.selectItem(t),this.selectedIndex=r}}else this.selectedIndex=e}},clearableCallback:function(){this.internalSearch=void 0,a["a"].options.methods.clearableCallback.call(this)},genInput:function(){var e=i["a"].options.methods.genInput.call(this);return e.data=Object(s["a"])(e.data,{attrs:{"aria-activedescendant":Object(o["o"])(this.$refs.menu,"activeTile.id"),autocomplete:Object(o["o"])(e.data,"attrs.autocomplete","off")},domProps:{value:this.internalSearch}}),e},genInputSlot:function(){var e=a["a"].options.methods.genInputSlot.call(this);return e.data.attrs.role="combobox",e},genSelections:function(){return this.hasSlot||this.multiple?a["a"].options.methods.genSelections.call(this):[]},onClick:function(e){this.isDisabled||(this.selectedIndex>-1?this.selectedIndex=-1:this.onFocus(),this.isAppendInner(e.target)||this.activateMenu())},onInput:function(e){if(!(this.selectedIndex>-1)&&e.target){var t=e.target,r=t.value;t.value&&this.activateMenu(),this.internalSearch=r,this.badInput=t.validity&&t.validity.badInput}},onKeyDown:function(e){var t=e.keyCode;a["a"].options.methods.onKeyDown.call(this,e),this.changeSelectedIndex(t)},onSpaceDown:function(e){},onTabDown:function(e){a["a"].options.methods.onTabDown.call(this,e),this.updateSelf()},onUpDown:function(e){e.preventDefault(),this.activateMenu()},selectItem:function(e){a["a"].options.methods.selectItem.call(this,e),this.setSearch()},setSelectedItems:function(){a["a"].options.methods.setSelectedItems.call(this),this.isFocused||this.setSearch()},setSearch:function(){var e=this;this.$nextTick((function(){e.multiple&&e.internalSearch&&e.isMenuActive||(e.internalSearch=!e.selectedItems.length||e.multiple||e.hasSlot?null:e.getText(e.selectedItem))}))},updateSelf:function(){(this.searchIsDirty||this.internalValue)&&(this.valueComparator(this.internalSearch,this.getValue(this.internalValue))||this.setSearch())},hasItem:function(e){return this.selectedValues.indexOf(this.getValue(e))>-1},onCopy:function(e){if(-1!==this.selectedIndex){var t=this.selectedItems[this.selectedIndex],r=this.getText(t);e.clipboardData.setData("text/plain",r),e.clipboardData.setData("text/vnd.vuetify.autocomplete.item+plain",r),e.preventDefault()}}}})},d604:function(e,t,r){"use strict";r.r(t);var n=function(){var e=this,t=e.$createElement,r=e._self._c||t;return e.binding?r("v-select",{attrs:{loading:e.loading,label:e.label,items:e.items,outlined:"","error-messages":e.err_messages,error:e.error,shaped:"",clearable:"","hide-details":"","small-chips":"",dense:"",multiple:"","item-text":"display","item-value":"code"},on:{change:function(t){return e.updateSearch()},"click:clear":function(t){return e.clearSearch()}},model:{value:e.value,callback:function(t){e.value=t},expression:"value"}}):r("v-text-field",{attrs:{label:e.label,dense:"",outlined:"","hide-details":"",shaped:"",clearable:""},on:{change:function(t){return e.updateSearch()},"click:clear":function(t){return e.clearSearch()}},model:{value:e.value,callback:function(t){e.value=t},expression:"value"}})},a=[],i={name:"ihris-search-term",props:["label","expression","binding"],data:function(){return{loading:!1,items:[],error:!1,err_messages:null,value:[]}},mounted:function(){var e=this;this.loading=!0,this.$fhirutils.expand(this.binding).then((function(t){e.items=t,e.loading=!1})).catch((function(t){e.error=!0,e.err_messages=t.message,e.loading=!1}))},methods:{updateSearch:function(){this.$emit("termChange",this.expression,this.value)},clearSearch:function(){this.$emit("termChange",this.expression,[])}}},s=i,o=r("2877"),c=r("6544"),l=r.n(c),u=r("b974"),h=r("8654"),d=Object(o["a"])(s,n,a,!1,null,null,null);t["default"]=d.exports;l()(d,{VSelect:u["a"],VTextField:h["a"]})}}]);
//# sourceMappingURL=fhir-search.be7a7771.js.map