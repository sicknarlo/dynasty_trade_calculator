
google.load('visualization', '1.1', {packages: ['line']});
google.setOnLoadCallback(drawChart);

function drawChart() {

  var data = new google.visualization.DataTable();
  var player_name = $("#pname").text();
  var pID = $("#pid").text();
  var pDataUrl = "/players/" + pID;
  data.addColumn('string', 'Month');
  data.addColumn('number', player_name);

  var pData = $.get( pDataUrl, function( response ) {
  }, "json").success(function(response){
    console.log(response)
    addChartData();
    chart.draw(data, options);
  })

  var addChartData = function(){
    for (var i = 0; i < pData.responseJSON.length; i++) {
      data.addRow([pData.responseJSON[i][1], pData.responseJSON[i][0]])
    }
  }

  var options = {
    chart: {
      title: 'ADP for ' + player_name
    },
    width: 900,
    height: 500,
    vAxis: {
      direction: 1,
    }
  };

  var chart = new google.charts.Line(document.getElementById('line_top_x'));

  chart.draw(data, options);
}