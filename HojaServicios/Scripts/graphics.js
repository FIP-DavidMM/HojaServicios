require(["dojox/charting/Chart", "dojox/charting/axis2d/Default", "dojox/charting/plot2d/Lines",
    "dojox/charting/widget/Legend", "dojox/charting/plot2d/Markers", "dojo/ready"],

  function (Chart, Default, Lines, Legend, Markers, ready) {
      ready(function () {
          var chart1 = new Chart("chartOne");
          
          var numWeeks = hfSemanas.value;
          var arrayWeeks = numWeeks.split(",");

          var numDelitos = hfDelitos.value;
          var arrayStringDelitos = numDelitos.split(",");

          var arrayIntDelitos = new Array();
          var i = 0;
          for (i = 0; i < (arrayStringDelitos.length - 1); i++) {

              arrayIntDelitos[i] = parseInt(arrayStringDelitos[i]);
          }

          chart1.addPlot("default", { type: "Lines", markers: true });
          chart1.addAxis("x", {
              labels: [{ value: 1, text: arrayWeeks[0] }, { value: 2, text: arrayWeeks[1] },
                       { value: 3, text: arrayWeeks[2] }, { value: 4, text: arrayWeeks[3] }],
              });
          chart1.addAxis("y", { vertical: true });
          chart1.addSeries(ddlDelitos1.value, [arrayIntDelitos[0], arrayIntDelitos[1], arrayIntDelitos[2], arrayIntDelitos[3]], { stroke: { color: "blue", width: 4, style:"dot" } });
          chart1.addSeries(ddlDelitos2.value, [arrayIntDelitos[4], arrayIntDelitos[5], arrayIntDelitos[6], arrayIntDelitos[7]], { stroke: { color: "#a52a2a", width: 4, style: "dash" } });
          chart1.addSeries(ddlDelitos3.value, [arrayIntDelitos[8], arrayIntDelitos[9], arrayIntDelitos[10], arrayIntDelitos[11]], { stroke: { color: "green", width: 4 } });
          chart1.render();
   
          new Legend({ chartRef: chart1 }, "divLeyenda");

      });
  });
