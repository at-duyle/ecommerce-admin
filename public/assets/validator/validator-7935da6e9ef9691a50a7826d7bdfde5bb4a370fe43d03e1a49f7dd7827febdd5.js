var validator=function(e){function t(e,t){return"tel"==e&&(v=v||"phone"),e&&"password"!=e&&"tel"!=e&&"search"!=e&&"file"!=e||(e="text"),!s[e]||s[e](t,!0)}function a(t){u=e(t),u.data("valid",!0),u.data("type",u.attr("type")),v=u.attr("pattern")}function n(e){if(a(this),e.charCode)return t(this.type,this.value)}function i(){if("hidden"!=this.type&&e(this).is(":hidden"))return!0;if(a(this),u.data("val",u[0].value.replace(/^\s+|\s+$/g,"")),b=u.data(),g=r[u.prop("name")]||r.invalid,"select"===u[0].nodeName.toLowerCase()?b.type="select":"textarea"===u[0].nodeName.toLowerCase()&&(b.type="text"),m=b.validateWords||0,p=b.validateLengthRange?(b.validateLengthRange+"").split(","):[1],f=!!b.validateLength&&(b.validateLength+"").split(","),c=b.validateMinmax?(b.validateMinmax+"").split(","):"",b.valid=s.hasValue(b.val),u.hasClass("optional")&&!b.valid&&(b.valid=!0),"checkbox"===u[0].type)b.valid=u[0].checked,g=r.checked;else if(b.valid)if(s.sameAsPlaceholder(u)&&(g=r.empty,b.valid=!1),b.validateLinked){var n=e(0==b.validateLinked.indexOf("#")?b.validateLinked:":input[name="+b.validateLinked+"]");b.valid=s.linked(b.val,n.val())}else(b.valid||"select"==b.type)&&(b.valid=t(b.type,b.val));return b.valid?d(u):(o(u,g),submit=!1),b.valid}function l(t){if(t=e(t),0==t.length)return console.warn("element not found"),!1;var a=!0;return t.find(":input").filter("[required=required], .required, .optional").not("[disabled=disabled]").each(function(){a*=i.apply(this)}),!!a}var r,s,i,o,d,u,c,h,m,p,f,v,g,b,y=/[\(\)\<\>\,\;\:\\\/\"\[\]]/,k=/^.+@.+\..{2,6}$/;return r={invalid:"invalid input",checked:"must be checked",empty:"please put something here",min:"input is too short",max:"input is too long",number_min:"too low",number_max:"too high",url:"invalid URL",number:"not a number",email:"email address is invalid",email_repeat:"emails do not match",password_repeat:"passwords do not match",repeat:"no match",complete:"input is not complete",select:"Please select an option"},window.console||(console={},console.log=console.warn=function(){}),h={alerts:!0,classes:{item:"item",alert:"alert",bad:"bad"}},s={sameAsPlaceholder:function(t){return e.fn.placeholder&&t.attr("placeholder")!==undefined&&b.val==t.prop("placeholder")},hasValue:function(e){return!!e||(g=r.empty,!1)},linked:function(e,t){return t==e||(g=r[b.type+"_repeat"]||r.no_match,!1)},email:function(e){return!(!k.test(e)||e.match(y))||(g=e?r.email:r.empty,!1)},text:function(e,t){if(m){var a=e.split(" "),n=function(e){for(var t=a.length;t--;)if(a[t].length<e)return!1;return!0};return!(a.length<m||!n(2))||(g=r.complete,!1)}if(!t&&p&&e.length<p[0])return g=r.min,!1;if(p&&p[1]&&e.length>p[1])return g=r.max,!1;if(f&&f.length)for(;f.length;)if(f.pop()==e.length)return g=r.complete,!1;if(v){var i,l;switch(v){case"alphanumeric":i=/^[a-zA-Z0-9]+$/i;break;case"numeric":i=/^[0-9]+$/i;break;case"phone":i=/^\+?([0-9]|[-|' '])+$/i;break;default:i=v}try{if(l=new RegExp(i).test(e),e&&!l)return!1}catch(e){return console.log(e,u,"regex is invalid"),!1}}return!0},number:function(e){return isNaN(parseFloat(e))&&!isFinite(e)?(g=r.number,!1):p&&e.length<p[0]?(g=r.min,!1):p&&p[1]&&e.length>p[1]?(g=r.max,!1):c[0]&&(0|e)<c[0]?(g=r.number_min,!1):!(c[1]&&(0|e)>c[1])||(g=r.number_max,!1)},date:function(e){var t,a,n=e.split(/[-.\/]/g);if(u[0].valueAsNumber)return!0;for(a=n.length;a--;)if(isNaN(parseFloat(e))&&!isFinite(e))return!1;try{return t=new Date(n[2],n[1]-1,n[0]),t.getMonth()+1==n[1]&&t.getDate()==n[0]&&t}catch(e){return console.log("date test: ",err),!1}},url:function(e){function t(e){return/^(https?:\/\/)?([\w\d\-_]+\.+[A-Za-z]{2,})+\/?/.test(e)}return!!t(e)||(g=e?r.url:r.empty,!1)},hidden:function(e){if(p&&e.length<p[0])return g=r.min,!1;if(v){var t;if("alphanumeric"==v&&(t=/^[a-z0-9]+$/i,!t.test(e)))return!1}return!0},select:function(e){return!!s.hasValue(e)||(g=r.select,!1)}},o=function(t,a){if(!a||!t||!t.length)return!1;var n,i=t.closest("."+h.classes.item);i.hasClass(h.classes.bad)?h.alerts&&i.find("."+h.classes.alert).html(a):h.alerts&&(n=e('<div class="'+h.classes.alert+'">').html(a),i.append(n)),i.removeClass(h.classes.bad),setTimeout(function(){i.addClass(h.classes.bad)},0)},d=function(e){if(!e||!e.length)return console.warn('no "field" argument, null or DOM object not found'),!1;e.closest("."+h.classes.item).removeClass(h.classes.bad).find("."+h.classes.alert).remove()},{defaults:h,checkField:i,keypress:n,checkAll:l,mark:o,unmark:d,message:r,tests:s}}(jQuery);