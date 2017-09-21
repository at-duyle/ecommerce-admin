// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var handleDataTableButtons = function() {
  "use strict";
  0 !== $("#datatable-buttons").length && $("#datatable-buttons").DataTable({
    dom: "Bfrtip",
    buttons: [
    {
      extend: "csv",
      className: "btn btn-default btn-sm",
      exportOptions: {
        columns: [ 0, 1, 2, 3, 4, 5 ]
      }
    },
    {
      extend: "excel",
      className: "btn btn-default btn-sm",
      exportOptions: {
        columns: [ 0, 1, 2, 3, 4, 5 ]
      }
    },
    {
      extend: "pdf",
      className: "btn btn-default btn-sm",
      exportOptions: {
        columns: [ 0, 1, 2, 3, 4, 5 ]
      }
    },
    {
      extend: "print",
      className: "btn btn-default btn-sm",
      exportOptions: {
        columns: [ 0, 1, 2, 3, 4, 5 ]
      }
    }
    ]
  })
},
TableManageButtons = function() {
  "use strict";
  return {
    init: function() {
      handleDataTableButtons()
    }
  }
}();

TableManageButtons.init();

document.addEventListener("turbolinks:before-cache", function() {
  $("#datatable-buttons").DataTable().destroy();
});

function clickCategory(){
  categoryID = $("#category").val();
  $.ajax({
    method: "GET",
    url: "/shops/products/sub/"+ categoryID,
    dataType: "script",
    success: function(data){
      if(data !== '$("#sub_category").empty().append(\'\');'){
        $('#sub_category').attr('required', true);
      }
    },
    error: function(err){
      console.log(err);
    }
  });
}
