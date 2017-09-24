// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function clickShop(){
  let shopId = $('#shop').val();
  $.ajax({
    method: "GET",
    url: "/revenue/"+ shopId +"/revenue",
    dataType: "json",
    success: function(data){
      var inputs = data.inputs;
      var outputs = data.outputs;
      var myChart9 = echarts.init(document.getElementById('mainb'), theme);
      myChart9.setOption({
        title: {
          x: 'center',
          y: 'top',
          padding: [0, 0, 20, 0],
          text: 'Revenue of Shop " ' + $('#shop').find('option:selected').text() + ' "',
          textStyle: {
            fontSize: 15,
            fontWeight: 'normal'
          }
        },
        tooltip: {
        },
        toolbox: {
          show: true,
          feature: {
            restore: {
              show: true
            },
            saveAsImage: {
              show: true
            }
          }
        },
        calculable: true,
        legend: {
          data: ['Sell', 'Import'],
          y: 'bottom'
        },
        xAxis: [{
          type: 'category',
          data: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        }],
        yAxis: [{
          type: 'value',
          name: 'Amount',
          axisLabel: {
            formatter: '{value} $'
          }
        }],
        series: [{
          name: 'Sell',
          type: 'bar',
          data: outputs
        }, {
          name: 'Import',
          type: 'bar',
          data: inputs
        }]
      });
    },
    error: function(err){
      console.log(err);
    }
  });
}