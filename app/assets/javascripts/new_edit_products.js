$(document).ready(function(){
  $("#images").fileinput({
    uploadUrl: "/file-upload-batch/2",
    allowedFileExtensions: ["jpg", "png", "gif"],
    minImageWidth: 50,
    minImageHeight: 50,
    showUpload: false,
  });
})

var temp = "";

$("#product_price").keyup(function(event){
  // get pressed key
  let keyCode = (event.keyCode ? event.keyCode : event.which);
  let str = $(this).val();
  let n = temp.indexOf(".");
  // remove key if it is'nt a number
  if ((keyCode < 48) || (keyCode > 57)){
    if(n > -1){
      temp = str.replace(/\D/g,'')
      if((keyCode != 8) && (n < str.length - 1)){
        temp = temp.substr(0, n) + '.' + temp.substr(n);
      }
      if((keyCode == 8) && (n < str.length - 1)){
        temp = temp.substr(0, n) + '.' + temp.substr(n);
      }
      $(this).val(temp);
    } else{
      if((keyCode != 8) && (n < str.length - 1)){
        temp = str + ".";
      }
      if((keyCode == 8) && (n < str.length - 1)){
        temp = temp.substr(0, n) + '.' + temp.substr(n);
      }
      $(this).val();
    }
  }

});