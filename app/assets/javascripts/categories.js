// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var handleDataTableButtons = function() {
  "use strict";
  0 !== $("#datatable-buttons-category").length && $("#datatable-buttons-category").DataTable({
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
  $("#datatable-buttons-category").DataTable().destroy();
});
