/*!
 * Cropper v0.8.0
 * https://github.com/fengyuanchen/cropper
 *
 * Copyright 2014-2015 Fengyuan Chen
 * Released under the MIT license
 *
 * Date: 2015-02-19T06:49:29.144Z
 */

!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):a("object"==typeof exports?require("jquery"):jQuery)}(function(a){"use strict";function b(a){return"number"==typeof a}function c(a){return"string"==typeof a}function d(a){return"undefined"==typeof a}function e(a,c){var d=[];return b(c)&&d.push(c),d.slice.apply(a,d)}function f(a,b){var c=e(arguments,2);return function(){return a.apply(b,c.concat(e(arguments)))}}function g(a){var b=a.match(/^(https?:)\/\/([^\:\/\?#]+):?(\d*)/i);return!b||b[1]===o.protocol&&b[2]===o.hostname&&b[3]===o.port?!1:!0}function h(a){var b="timestamp="+(new Date).getTime();return a+(-1===a.indexOf("?")?"?":"&")+b}function i(a){return a?"rotate("+a+"deg)":"none"}function j(a){var b=Q(a.degree)%180,c=(b>90?180-b:b)*Math.PI/180;return{width:a.width*S(c)+a.height*R(c),height:a.width*R(c)+a.height*S(c)}}function k(b,c){var d=a("<canvas>")[0],e=d.getContext("2d"),f=c.naturalWidth,g=c.naturalHeight,h=c.rotate,i=j({width:f,height:g,degree:h});return h?(d.width=i.width,d.height=i.height,e.save(),e.translate(i.width/2,i.height/2),e.rotate(h*Math.PI/180),e.drawImage(b,-f/2,-g/2,f,g),e.restore()):(d.width=f,d.height=g,e.drawImage(b,0,0,f,g)),d}function l(b,c){this.$element=a(b),this.options=a.extend({},l.DEFAULTS,a.isPlainObject(c)&&c),this.ready=!1,this.built=!1,this.cropped=!1,this.disabled=!1,this.load()}var m=a(window),n=a(document),o=window.location,p="directive",q=".cropper",r=/^(e|n|w|s|ne|nw|sw|se|all|crop|move|zoom)$/,s="cropper-modal",t="cropper-hide",u="cropper-hidden",v="cropper-invisible",w="cropper-move",x="cropper-crop",y="cropper-disabled",z="cropper-bg",A="mousedown touchstart",B="mousemove touchmove",C="mouseup mouseleave touchend touchleave touchcancel",D="wheel mousewheel DOMMouseScroll",E="dblclick",F="resize"+q,G="build"+q,H="built"+q,I="dragstart"+q,J="dragmove"+q,K="dragend"+q,L={canvas:a.isFunction(a("<canvas>")[0].getContext)},M=Math.round,N=Math.sqrt,O=Math.min,P=Math.max,Q=Math.abs,R=Math.sin,S=Math.cos,T=parseFloat,U={};U.load=function(){var b,c,d,e=this,f=this.options,i=this.$element,j="";i.is("img")?d=i.prop("src"):i.is("canvas")&&L.canvas&&(d=i[0].toDataURL()),d&&(b=a.Event(G),i.one(G,f.build).trigger(b),b.isDefaultPrevented()||(f.checkImageOrigin&&g(d)&&(j=" crossOrigin",d=h(d)),this.$clone=c=a("<img"+j+' src="'+d+'">'),c.one("load",function(){var a=this.naturalWidth||c.width(),b=this.naturalHeight||c.height();e.image={naturalWidth:a,naturalHeight:b,aspectRatio:a/b,rotate:0},e.url=d,e.ready=!0,e.build()}),c.addClass(t).prependTo("body")))},U.build=function(){var b,c,d=this.$element,e=this.options;this.ready&&(this.built&&this.unbuild(),this.$cropper=b=a(l.TEMPLATE),d.addClass(u),this.$clone.removeClass(t).prependTo(b),this.$container=d.parent(),this.$container.append(b),this.$canvas=b.find(".cropper-canvas"),this.$cropBox=c=b.find(".cropper-cropbox"),this.$viewer=b.find(".cropper-viewer"),this.addListeners(),this.initPreview(),e.aspectRatio=Q(T(e.aspectRatio))||0/0,e.autoCrop?(this.cropped=!0,e.modal&&this.$canvas.addClass(s)):c.addClass(u),e.background&&b.addClass(z),!e.highlight&&c.find(".cropper-face").addClass(v),!e.guides&&c.find(".cropper-dashed").addClass(u),!e.movable&&c.find(".cropper-face").data(p,"move"),!e.resizable&&c.find(".cropper-line, .cropper-point").addClass(u),this.setDragMode(e.dragCrop?"crop":"move"),this.built=!0,this.render(),d.one(H,e.built).trigger(H))},U.unbuild=function(){this.built&&(this.built=!1,this.removeListeners(),this.$preview.empty(),this.$preview=null,this.$cropBox=null,this.$canvas=null,this.$container=null,this.$cropper.remove(),this.$cropper=null)},a.extend(U,{render:function(){this.initContainer(),this.initImage(),this.initCropBox()},initContainer:function(){var a=this.$element,b=this.$container,c=this.$cropper,d=this.options;c.addClass(u),a.removeClass(u),c.css(this.container={width:P(b.width(),T(d.minContainerWidth)||350),height:P(b.height(),T(d.minContainerHeight)||150)}),a.addClass(u),c.removeClass(u)},initImage:function(){var b=this.container,c=this.image,d=c.aspectRatio,e=b.width,f=b.height,g=c.naturalWidth,h=c.naturalHeight,i=0,j=0;f*d>e?(g=e,h=g/d,j=(f-h)/2):(h=f,g=h*d,i=(e-g)/2),a.extend(c,{width:g,height:h,left:i,top:j}),this.defaultImage=a.extend({},c),this.renderImage()},renderImage:function(b){var c,d=this.options,e=this.image,f=e.width,g=e.height,h=e.rotate;h&&(c=j({width:f,height:g,degree:h})),a.extend(e,{rotatedWidth:c?c.width:e.width,rotatedHeight:c?c.height:e.height,rotatedLeft:c?e.left-(c.width-f)/2:e.left,rotatedTop:c?e.top-(c.height-g)/2:e.top}),this.$clone.css({width:f,height:g,marginLeft:e.left,marginTop:e.top,transform:i(h)}),b&&(this.preview(),a.isFunction(d.crop)&&d.crop.call(this.$element,this.getData()))},initCropBox:function(){var b=this.options,c=this.container,d=this.image,e=b.aspectRatio,f=c.width,g=c.height,h=Q(T(b.minCropBoxWidth))||0,i=Q(T(b.minCropBoxHeight))||0,j=Q(T(b.autoCropArea))||.8,k={width:d.width,height:d.height,minWidth:h,minHeight:i,maxWidth:f,maxHeight:g};e&&(g*e>f?(k.height=k.width/e,k.maxHeight=f/e):(k.width=d.height*e,k.maxWidth=g*e),h?k.minHeight=k.minWidth/e:i&&(k.minWidth=k.minHeight*e)),k.minWidth=O(k.maxWidth,k.minWidth),k.minHeight=O(k.maxHeight,k.minHeight),k.width=P(k.minWidth,k.width*j),k.height=P(k.minHeight,k.height*j),k.left=(f-k.width)/2,k.top=(g-k.height)/2,k.oldLeft=k.left,k.oldTop=k.top,this.defaultCropBox=a.extend({},k),this.cropBox=k,this.cropped&&this.renderCropBox()},renderCropBox:function(){var b=this.options,c=this.container,d=this.$cropBox,e=this.cropBox;e.width>e.maxWidth?(e.width=e.maxWidth,e.left=e.oldLeft):e.width<e.minWidth&&(e.width=e.minWidth,e.left=e.oldLeft),e.height>e.maxHeight?(e.height=e.maxHeight,e.top=e.oldTop):e.height<e.minHeight&&(e.height=e.minHeight,e.top=e.oldTop),e.left=O(P(e.left,0),c.width-e.width),e.top=O(P(e.top,0),c.height-e.height),e.oldLeft=e.left,e.oldTop=e.top,b.movable&&d.find(".cropper-face").data(p,e.width===c.width&&e.height===c.height?"move":"all"),d.css({width:e.width,height:e.height,left:e.left,top:e.top}),this.disabled||(this.preview(),a.isFunction(b.crop)&&b.crop.call(this.$element,this.getData()))}}),U.initPreview=function(){var b=this.url;this.$preview=a(this.options.preview),this.$viewer.html('<img src="'+b+'">'),this.$preview.each(function(){var c=a(this);c.data({width:c.width(),height:c.height()}).html('<img src="'+b+'" style="display:block;width:100%;min-width:0!important;min-height:0!important;max-width:none!important;max-height:none!important;">')})},U.preview=function(){var b=this.image,c=this.cropBox,d=b.width,e=b.height,f=c.left-b.left,g=c.top-b.top,h=b.rotate;this.cropped&&!this.disabled&&(this.$viewer.find("img").css({width:d,height:e,marginLeft:-f,marginTop:-g,transform:i(h)}),this.$preview.each(function(){var b=a(this),j=b.data(),k=j.width/c.width,l=j.width,m=c.height*k;m>j.height&&(k=j.height/c.height,l=c.width*k,m=j.height),b.width(l).height(m).find("img").css({width:d*k,height:e*k,marginLeft:-f*k,marginTop:-g*k,transform:i(h)})}))},U.addListeners=function(){var b=this.options;this.$element.on(I,b.dragstart).on(J,b.dragmove).on(K,b.dragend),this.$cropper.on(A,a.proxy(this.dragstart,this)).on(E,a.proxy(this.dblclick,this)),b.zoomable&&b.mouseWheelZoom&&this.$cropper.on(D,a.proxy(this.wheel,this)),b.global?n.on(B,this._dragmove=f(this.dragmove,this)).on(C,this._dragend=f(this.dragend,this)):this.$cropper.on(B,a.proxy(this.dragmove,this)).on(C,a.proxy(this.dragend,this)),b.responsive&&m.on(F,this._resize=f(this.resize,this))},U.removeListeners=function(){var a=this.options;this.$element.off(I,a.dragstart).off(J,a.dragmove).off(K,a.dragend),this.$cropper.off(A,this.dragstart).off(E,this.dblclick),a.zoomable&&a.mouseWheelZoom&&this.$cropper.off(D,this.wheel),a.global?n.off(B,this._dragmove).off(C,this._dragend):this.$cropper.off(B,this.dragmove).off(C,this.dragend),a.responsive&&m.off(F,this._resize)},a.extend(U,{resize:function(){var b=this.$container,c=this.container;this.disabled||(b.width()!==c.width||b.height()!==c.height)&&(clearTimeout(this.resizing),this.resizing=setTimeout(a.proxy(function(){var a=this.getImageData(),b=this.getCropBoxData();this.render(),this.setImageData(a),this.setCropBoxData(b)},this),200))},dblclick:function(){this.disabled||this.setDragMode(this.$canvas.hasClass(x)?"move":"crop")},wheel:function(a){var b=a.originalEvent,c=1;this.disabled||(a.preventDefault(),b.deltaY?c=b.deltaY>0?1:-1:b.wheelDelta?c=-b.wheelDelta/120:b.detail&&(c=b.detail>0?1:-1),this.zoom(.1*c))},dragstart:function(b){var c,d,e,f=this.options,g=b.originalEvent,h=g&&g.touches,i=b;if(!this.disabled){if(h){if(e=h.length,e>1){if(!f.zoomable||!f.touchDragZoom||2!==e)return;i=h[1],this.startX2=i.pageX,this.startY2=i.pageY,c="zoom"}i=h[0]}if(c=c||a(i.target).data(p),r.test(c)){if(b.preventDefault(),d=a.Event(I),this.$element.trigger(d),d.isDefaultPrevented())return;this.directive=c,this.cropping=!1,this.startX=i.pageX,this.startY=i.pageY,"crop"===c&&(this.cropping=!0,this.$canvas.addClass(s))}}},dragmove:function(b){var c,d,e=this.options,f=b.originalEvent,g=f&&f.touches,h=b;if(!this.disabled){if(g){if(d=g.length,d>1){if(!e.zoomable||!e.touchDragZoom||2!==d)return;h=g[1],this.endX2=h.pageX,this.endY2=h.pageY}h=g[0]}if(this.directive){if(b.preventDefault(),c=a.Event(J),this.$element.trigger(c),c.isDefaultPrevented())return;this.endX=h.pageX,this.endY=h.pageY,this.change()}}},dragend:function(b){var c;if(!this.disabled&&this.directive){if(b.preventDefault(),c=a.Event(K),this.$element.trigger(c),c.isDefaultPrevented())return;this.cropping&&(this.cropping=!1,this.$canvas.toggleClass(s,this.cropped&&this.options.modal)),this.directive=""}}}),a.extend(U,{reset:function(){this.cropped&&!this.disabled&&(this.image=a.extend({},this.defaultImage),this.renderImage(),this.cropBox=a.extend({},this.defaultCropBox),this.renderCropBox())},clear:function(){var a=this.cropBox;this.cropped&&!this.disabled&&(this.cropped=!1,a.left=0,a.top=0,a.width=0,a.height=0,this.renderCropBox(),this.$canvas.removeClass(s),this.$cropBox.addClass(u))},destroy:function(){var a=this.$element;this.ready||this.$clone.off("load").remove(),this.unbuild(),a.removeClass(u).removeData("cropper")},replace:function(b){var c,d,e=this,f=this.$element;!this.disabled&&b&&b!==this.url&&b!==f.attr("src")&&(f.is("img")?(f.attr("src",b),this.load()):f.is("canvas")&&L.canvas&&(c=f[0],d=c.getContext("2d"),a('<img src="'+b+'"">').one("load",function(){c.width=this.width,c.height=this.height,d.clearRect(0,0,c.width,c.height),d.drawImage(this,0,0),e.load()})))},enable:function(){this.built&&(this.disabled=!1,this.$cropper.removeClass(y))},disable:function(){this.built&&(this.disabled=!0,this.$cropper.addClass(y))},move:function(a,c){var d=this.image;!this.disabled&&b(a)&&b(c)&&(d.left+=a,d.top+=c,this.renderImage(!0))},zoom:function(a){var b,c,d=this.image;a=T(a),a&&this.built&&!this.disabled&&this.options.zoomable&&(a=-1>=a?1/(1-a):1>=a?1+a:a,b=d.width*a,c=d.height*a,d.left-=(b-d.width)/2,d.top-=(c-d.height)/2,d.width=b,d.height=c,this.renderImage(!0),this.setDragMode("move"))},rotate:function(a){var b=this.image;a=T(a)||0,0!==a&&this.built&&!this.disabled&&this.options.rotatable&&(b.rotate=(b.rotate+a)%360,this.renderImage(!0))},getData:function(b){var c,d,e=this.cropBox,f=this.image,g=f.rotate;return this.built&&this.cropped?(d={x:e.left-(g?f.rotatedLeft:f.left),y:e.top-(g?f.rotatedTop:f.top),width:e.width,height:e.height},c=f.width/f.naturalWidth,a.each(d,function(a,e){e/=c,d[a]=b?M(e):e}),d.rotate=g):d={x:0,y:0,width:0,height:0,rotate:g},d},getImageData:function(b){var c=this.image,d={};return this.built&&a.extend(d,b?c:{left:c.left,top:c.top,width:c.width,height:c.height}),d},setImageData:function(c){var d=this.image;this.built&&!this.disabled&&a.isPlainObject(c)&&(b(c.left)&&(d.left=c.left),b(c.top)&&(d.top=c.top),b(c.width)?(d.width=c.width,d.height=d.width/d.aspectRatio):b(c.height)&&(d.height=c.height,d.width=d.height*d.aspectRatio),this.renderImage(!0))},getCropBoxData:function(){var a,b={};return this.cropped&&(a=this.cropBox,b={left:a.left,top:a.top,width:a.width,height:a.height}),b},setCropBoxData:function(c){var d=this.cropBox,e=this.options.aspectRatio;this.cropped&&!this.disabled&&a.isPlainObject(c)&&(b(c.left)&&(d.left=c.left),b(c.top)&&(d.top=c.top),e?b(c.width)?(d.width=c.width,d.height=d.width/e):b(c.height)&&(d.height=c.height,d.width=d.height*e):(b(c.width)&&(d.width=c.width),b(c.height)&&(d.height=c.height)),this.renderCropBox())},getDataURL:function(d,e,f){var g,h,i,j,l,m,n,o,p,q,r;return this.cropped&&L.canvas&&(q=this.getData(),g=q.width,h=q.height,n=a.isPlainObject(d),n?(l=d.width||g,m=d.height||h):(f=e,e=d),i=n?l:g,j=n?m:h,o=a("<canvas>")[0],o.width=i,o.height=j,p=o.getContext("2d"),"image/jpeg"===e&&(p.fillStyle="#fff",p.fillRect(0,0,i,j)),p.drawImage.apply(p,function(){var a,b,c,d,e,f,i,j=k(this.$clone[0],this.image),m=j.width,o=j.height,p=[j],r=q.x,s=q.y;return-g>=r||r>m?r=a=c=e=0:0>=r?(c=-r,r=0,a=e=O(m,g+r)):m>=r&&(c=0,a=e=O(g,m-r)),0>=a||-h>=s||s>o?s=b=d=f=0:0>=s?(d=-s,s=0,b=f=O(o,h+s)):o>=s&&(d=0,b=f=O(h,o-s)),p.push(r,s,a,b),n&&(i=g/l,c/=i,d/=i,e/=i,f/=i),e>0&&f>0&&p.push(c,d,e,f),p}.call(this)),r=o.toDataURL.apply(o,function(){var a=[];return c(e)&&a.push(e),b(f)&&a.push(f),a}.call(this))),r||""},setAspectRatio:function(a){var b=this.options;this.disabled||d(a)||(b.aspectRatio=Q(T(a))||0/0,this.built&&this.initCropBox())},setDragMode:function(a){var b=this.$canvas,c=!1,d=!1;if(this.ready&&!this.disabled){switch(a){case"crop":this.options.dragCrop?(c=!0,b.data(p,a)):d=!0;break;case"move":d=!0,b.data(p,a);break;default:b.removeData(p)}b.toggleClass(x,c).toggleClass(w,d)}}}),U.change=function(){var a,b=this.directive,c=this.image,d=this.container,e=d.width,f=d.height,g=this.cropBox,h=g.width,i=g.height,j=g.left,k=g.top,l=j+h,m=k+i,n=!0,o=this.options.aspectRatio,p={x:this.endX-this.startX,y:this.endY-this.startY};switch(o&&(p.X=p.y*o,p.Y=p.x/o),b){case"all":j+=p.x,k+=p.y;break;case"e":if(p.x>=0&&(l>=e||o&&(0>=k||m>=f))){n=!1;break}h+=p.x,o&&(i=h/o,k-=p.Y/2),0>h&&(b="w",h=0);break;case"n":if(p.y<=0&&(0>=k||o&&(0>=j||l>=e))){n=!1;break}i-=p.y,k+=p.y,o&&(h=i*o,j+=p.X/2),0>i&&(b="s",i=0);break;case"w":if(p.x<=0&&(0>=j||o&&(0>=k||m>=f))){n=!1;break}h-=p.x,j+=p.x,o&&(i=h/o,k+=p.Y/2),0>h&&(b="e",h=0);break;case"s":if(p.y>=0&&(m>=f||o&&(0>=j||l>=e))){n=!1;break}i+=p.y,o&&(h=i*o,j-=p.X/2),0>i&&(b="n",i=0);break;case"ne":if(o){if(p.y<=0&&(0>=k||l>=e)){n=!1;break}i-=p.y,k+=p.y,h=i*o}else p.x>=0?e>l?h+=p.x:p.y<=0&&0>=k&&(n=!1):h+=p.x,p.y<=0?k>0&&(i-=p.y,k+=p.y):(i-=p.y,k+=p.y);0>h&&0>i?(b="sw",i=0,h=0):0>h?(b="nw",h=0):0>i&&(b="se",i=0);break;case"nw":if(o){if(p.y<=0&&(0>=k||0>=j)){n=!1;break}i-=p.y,k+=p.y,h=i*o,j+=p.X}else p.x<=0?j>0?(h-=p.x,j+=p.x):p.y<=0&&0>=k&&(n=!1):(h-=p.x,j+=p.x),p.y<=0?k>0&&(i-=p.y,k+=p.y):(i-=p.y,k+=p.y);0>h&&0>i?(b="se",i=0,h=0):0>h?(b="ne",h=0):0>i&&(b="sw",i=0);break;case"sw":if(o){if(p.x<=0&&(0>=j||m>=f)){n=!1;break}h-=p.x,j+=p.x,i=h/o}else p.x<=0?j>0?(h-=p.x,j+=p.x):p.y>=0&&m>=f&&(n=!1):(h-=p.x,j+=p.x),p.y>=0?f>m&&(i+=p.y):i+=p.y;0>h&&0>i?(b="ne",i=0,h=0):0>h?(b="se",h=0):0>i&&(b="nw",i=0);break;case"se":if(o){if(p.x>=0&&(l>=e||m>=f)){n=!1;break}h+=p.x,i=h/o}else p.x>=0?e>l?h+=p.x:p.y>=0&&m>=f&&(n=!1):h+=p.x,p.y>=0?f>m&&(i+=p.y):i+=p.y;0>h&&0>i?(b="nw",i=0,h=0):0>h?(b="sw",h=0):0>i&&(b="ne",i=0);break;case"move":c.left+=p.x,c.top+=p.y,this.renderImage(!0),n=!1;break;case"zoom":this.zoom(function(a,b,c,d,e,f){return(N(e*e+f*f)-N(c*c+d*d))/N(a*a+b*b)}(c.width,c.height,Q(this.startX-this.startX2),Q(this.startY-this.startY2),Q(this.endX-this.endX2),Q(this.endY-this.endY2))),this.endX2=this.startX2,this.endY2=this.startY2,n=!1;break;case"crop":p.x&&p.y&&(a=this.$cropper.offset(),j=this.startX-a.left,k=this.startY-a.top,h=g.minWidth,i=g.minHeight,p.x>0?p.y>0?b="se":(b="ne",k-=i):p.y>0?(b="sw",j-=h):(b="nw",j-=h,k-=i),this.cropped||(this.cropped=!0,this.$cropBox.removeClass(u)))}n&&(g.width=h,g.height=i,g.left=j,g.top=k,this.directive=b,this.renderCropBox()),this.startX=this.endX,this.startY=this.endY},a.extend(l.prototype,U),l.DEFAULTS={aspectRatio:0/0,autoCropArea:.8,crop:null,preview:"",global:!0,responsive:!0,checkImageOrigin:!0,modal:!0,guides:!0,highlight:!0,background:!0,autoCrop:!0,dragCrop:!0,movable:!0,resizable:!0,rotatable:!0,zoomable:!0,touchDragZoom:!0,mouseWheelZoom:!0,minCropBoxWidth:0,minCropBoxHeight:0,minContainerWidth:300,minContainerHeight:150,build:null,built:null,dragstart:null,dragmove:null,dragend:null},l.setDefaults=function(b){a.extend(l.DEFAULTS,b)},l.TEMPLATE=function(a,b){return b=b.split(","),a.replace(/\d+/g,function(a){return b[a]})}('<0 6="5-container"><0 6="5-canvas"></0><0 6="5-cropbox"><1 6="5-viewer"></1><1 6="5-8 8-h"></1><1 6="5-8 8-v"></1><1 6="5-face" 3-2="all"></1><1 6="5-7 7-e" 3-2="e"></1><1 6="5-7 7-n" 3-2="n"></1><1 6="5-7 7-w" 3-2="w"></1><1 6="5-7 7-s" 3-2="s"></1><1 6="5-4 4-e" 3-2="e"></1><1 6="5-4 4-n" 3-2="n"></1><1 6="5-4 4-w" 3-2="w"></1><1 6="5-4 4-s" 3-2="s"></1><1 6="5-4 4-ne" 3-2="ne"></1><1 6="5-4 4-nw" 3-2="nw"></1><1 6="5-4 4-sw" 3-2="sw"></1><1 6="5-4 4-se" 3-2="se"></1></0></0>',"div,span,directive,data,point,cropper,class,line,dashed"),l.other=a.fn.cropper,a.fn.cropper=function(b){var c,f=e(arguments,1);return this.each(function(){var d,e=a(this),g=e.data("cropper");g||e.data("cropper",g=new l(this,b)),"string"==typeof b&&a.isFunction(d=g[b])&&(c=d.apply(g,f))}),d(c)?this:c},a.fn.cropper.Constructor=l,a.fn.cropper.setDefaults=l.setDefaults,a.fn.cropper.noConflict=function(){return a.fn.cropper=l.other,this}});
