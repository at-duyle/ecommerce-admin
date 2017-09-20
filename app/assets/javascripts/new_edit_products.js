
$(document).ready(function(){
  $("#images").fileinput({
    uploadUrl: "/file-upload-batch/2",
    allowedFileExtensions: ["jpg", "png", "gif"],
    minImageWidth: 50,
    minImageHeight: 50,
    showUpload: false,
  });
})