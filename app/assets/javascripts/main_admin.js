// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
  var data = $('#invisible').data('rubyvar');
  let day_data = [];
  for(let d of data){
    day_data.push({"period": d.name, "Hours worked": d.sum })
  }
  formatY = function (period) {
    return '$'+ period;
  },
  Morris.Bar({
    element: 'graph_bar',
    data: day_data,
    hideHover: 'always',
    xkey: 'period',
    barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
    ykeys: ['Hours worked', 'sorned'],
    labels: ['Hours worked', 'SORN'],
    xLabelAngle: 60,
    yLabelFormat:formatY
  });
});