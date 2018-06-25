/**
 * Created by paul on 03/05/2018.
 */
$(function () {
  /* candidate dropdown */
  $('.candidate-menu li').on('click', function() {
    console.log('changing candidate...', $(this));
    $('.candidate-toggle').html($(this).find('a').html() + `<span class="caret"></span>`);
  });

  // solid gauge start
  var names = ['Bolsonaro', 'Ciro Gomes', 'Alckmin', 'Marina Silva', 'Joaquim Barbosa', 'Collor', 'Paulino'];
  var data = [22, 15, 6, 5, 7, 10, 65];
  var dataSet = anychart.data.set(data);
  var palette = anychart.palettes.distinctColors().items(['#64b5f6', '#1976d2', '#ef6c00', '#ffd54f', '#455a64', '#96a6a6', '#dd2c00', '#00838f', '#00bfa5', '#ffa000']);

  var makeBarWithBar = function (gauge, radius, i, width, without_stroke) {
    var stroke = '1 #e5e4e4';
    if (without_stroke) {
      stroke = null;
      gauge.label(i)
        .text(names[i] + ', <span style="">' + data[i] + '%</span>')// color: #7c868e
        .useHtml(true);
      gauge.label(i)
        .hAlign('center')
        .vAlign('middle')
        .anchor('right-center')
        .padding(0, 10)
        .height(width / 2 + '%')
        .offsetY(radius + '%')
        .offsetX(0);
    }

    gauge.bar(i).dataIndex(i)
      .radius(radius)
      .width(width)
      .fill(palette.itemAt(i))
      .stroke(null)
      .zIndex(5);
    gauge.bar(i + 100).dataIndex(5)
      .radius(radius)
      .width(width)
      .fill('#F5F4F4')
      .stroke(stroke)
      .zIndex(4);

    return gauge.bar(i);
  };

  anychart.onDocumentReady(function () {
    var gauge = anychart.gauges.circular();
    gauge.data(dataSet);
    gauge.fill('#fff')
      .stroke(null)
      .padding(0)
      .margin(100)
      .startAngle(0)
      .sweepAngle(270);

    var axis = gauge.axis().radius(100).width(1).fill(null);
    axis.scale()
      .minimum(0)
      .maximum(100)
      .ticks({interval: 1})
      .minorTicks({interval: 1});

    axis.labels().enabled(false);
    axis.ticks().enabled(false);
    axis.minorTicks().enabled(false);
    makeBarWithBar(gauge, 100, 0, 17, true);
    makeBarWithBar(gauge, 80, 1, 17, true);
    makeBarWithBar(gauge, 60, 2, 17, true);
    makeBarWithBar(gauge, 40, 3, 17, true);
    makeBarWithBar(gauge, 20, 4, 17, true);

    gauge.margin(50);
    gauge.title().text('Lideranças em Pesquisas de Voto' +
      '<br/><span style="color:#929292; font-size: 12px;">(Densidade de Citações - 94.6% precisão       )</span>').useHtml(true);
    gauge.title()
      .enabled(true)
      .hAlign('center')
      .padding(0)
      .margin([0, 0, 20, 0]);

    gauge.container('gauge_container');
    gauge.draw();
  });
  // solid gauge end
});

$(function () {
  // brazil map start
  anychart.onDocumentReady(function () {
    var dataSet = [
      {
        'id': 'BR.GO',
        'value': 0
      },
      {
        'id': 'BR.SP',
        'value': 1
      },
      {
        'id': 'BR.PE',
        'value': 2
      },
      {
        'id': 'BR.1099',
        'value': 3
      },
      {
        'id': 'BR.AM',
        'value': 4
      },
      {
        'id': 'BR.MA',
        'value': 5
      },
      {
        'id': 'BR.PA',
        'value': 6
      },
      {
        'id': 'BR.153',
        'value': 7
      },
      {
        'id': 'BR.TO',
        'value': 8
      },
      {
        'id': 'BR.DF',
        'value': 9
      },
      {
        'id': 'BR.MS',
        'value': 10
      },
      {
        'id': 'BR.MG',
        'value': 11
      },
      {
        'id': 'BR.MT',
        'value': 12
      },
      {
        'id': 'BR.RS',
        'value': 13
      },
      {
        'id': 'BR.PR',
        'value': 14
      },
      {
        'id': 'BR.SC',
        'value': 15
      },
      {
        'id': 'BR.CE',
        'value': 16
      },
      {
        'id': 'BR.PI',
        'value': 17
      },
      {
        'id': 'BR.AL',
        'value': 18
      },
      {
        'id': 'BR.BA',
        'value': 19
      },
      {
        'id': 'BR.ES',
        'value': 20
      },
      {
        'id': 'BR.PB',
        'value': 21
      },
      {
        'id': 'BR.RJ',
        'value': 22
      },
      {
        'id': 'BR.RN',
        'value': 23
      },
      {
        'id': 'BR.SE',
        'value': 24
      },
      {
        'id': 'BR.RR',
        'value': 25
      },
      {
        'id': 'BR.AP',
        'value': 26
      }
    ];

    //
    var map = anychart.map();
    map.geoData(anychart.maps.brazil);

    // set the series
    var series = map.choropleth(dataSet);

    // disable labels
    series.labels(false);

    // set the container
    map.container('svg_map_container');
    map.draw();
  });
  // brazil map end
});

$(function () {
  anychart.onDocumentReady(function () {

    // get data
    var data = getData();
    // create a storage for the data tree
    treeData = anychart.data.tree(data, "as-tree");

    // create a chart and set the data
    chart = anychart.treeMap(treeData);

    // set the depth of hints
    chart.hintDepth(2);

    // configure labels
    chart.labels().format("{%name}");

    /* listen to the chartDraw event
    and add the drilldown path to the chart title */
    chart.listen("chartDraw", function () {
      // get the drilldown path and convert it to a string
      var text = printPath(chart.getDrilldownPath());
      // set the chart title
      chart.title().useHtml(true);
      chart.title("Treemap: Interactivity (Drilling Down and Up)<br><br>Path: " +
        "<span style = 'color:#990000; font-style:italic'>" +
        text + "</span>");
    });

    // set the container id
    chart.container("tree_map_container");

    // initiate drawing the chart
    chart.draw();
  });

  // a function for getting data
  function getData() {
    // create data
    var data = [
      {
        name:
          "Root", children: [
          {
            name: "Item 1", children: [
              {
                name: "Item 1-1", children: [
                  {name: "Item 1-1-1", value: 1000},
                  {name: "Item 1-1-2", value: 600},
                  {name: "Item 1-1-3", value: 550},
                  {name: "Item 1-1-4", value: 300},
                  {name: "Item 1-1-5", value: 150}
                ]
              },
              {name: "Item 1-2", value: 2300},
              {name: "Item 1-3", value: 1500}
            ]
          },
          {
            name: "Item 2", children: [
              {
                name: "Item 2-1", children: [
                  {name: "Item 2-1-1", value: 2100},
                  {name: "Item 2-1-2", value: 1000},
                  {name: "Item 2-1-3", value: 800},
                  {name: "Item 2-1-4", value: 750}
                ]
              },
              {
                name: "Item 2-2", children: [
                  {name: "Item 2-2-1", value: 560},
                  {name: "Item 2-2-2", value: 300},
                  {name: "Item 2-2-3", value: 150},
                  {name: "Item 2-2-4", value: 90}
                ]
              },
              {name: "Item 2-3", value: 400}
            ]
          },
          {
            name: "Item 3", children: [
              {
                name: "Item 3-1", children: [
                  {name: "Item 3-1-1", value: 850},
                  {name: "Item 3-1-2", value: 400},
                  {name: "Item 3-1-3", value: 150}
                ]
              },
              {name: "Item 3-2", value: 1350},
              {name: "Item 3-3", value: 1300},
              {
                name: "Item 3-4", children: [
                  {name: "Item 3-4-1", value: 400},
                  {name: "Item 3-4-2", value: 300},
                  {name: "Item 3-4-3", value: 250},
                  {name: "Item 3-4-4", value: 150}
                ]
              }
            ]
          }
        ]
      }
    ];
    return data;
  }

  /* a function for converting the current
  drilldown path to a string */
  function printPath(path) {
    /* go through the array of data items
    and use the get() method to obtain the "name" field */
    var text = "";
    for (var i = 0; i < path.length; i++) {
      text += path[i].get("name") + "\\";
    }
    return text;
  }

  // drill down to a data item
  function drillToItem() {
    /* locate an item in the data tree
    and get it as an object */
    var item = treeData.search("name", "Item 3-4");
    // drill down to the item
    chart.drillTo(item);
  }

  // drill up a level
  function drillUpALevel() {
    chart.drillUp();
  }
});

/* barchart, 3d funnel chart */
$(function () {

  // Set paths
  // ------------------------------
  /* bar chart */
  require.config({
    paths: {
      echarts: '../../static/js/plugins/visualization/echarts'
    }
  });

  // Configuration
  // ------------------------------

  require(
    [
      'echarts',
      'echarts/theme/limitless',
      'echarts/chart/bar',
      'echarts/chart/line',
      'echarts/chart/pie'
    ],

    // Charts setup
    function (ec, limitless) {

      axios.get('/elections/dispute/', {
        params: {}
      })
        .then((res) => {
          console.log('dispute', res.data);
        })
        .catch((err) => {
          console.error('dispute', err);
        });

      const basic_bars = ec.init(document.getElementById('basic_bars'), limitless);
      const pie_timeline = ec.init(document.getElementById('pie_timeline'), limitless);

      const basic_bars_options = {

        // Setup grid
        grid: {
          x: 75,
          x2: 35,
          y: 35,
          y2: 25
        },

        // Add tooltip
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },

        // Add legend
        legend: {
          data: ['Taxa de Rejeição', 'Intenções de Voto']
        },

        // Enable drag recalculate
        calculable: true,

        // Horizontal axis
        xAxis: [{
          type: 'value',
          boundaryGap: [0, 0.01]
        }],

        // Vertical axis
        yAxis: [{
          type: 'category',
          data: ['Aldo Rebelo','Alvaro Dias', 'Ciro Gomes', 'C. Buarque', 'Collor', 'Flávio Rocha',
          'H. Meirelles', 'J. Bolsonaro', 'J. Amoedo', 'Lula', 'Marina Silva', 'Bcos/Nulos', 'Nenhum']
        }],

        // Add series
        series: [
          {
            name: 'Taxa de Rejeição',
            type: 'bar',
            itemStyle: {
              normal: {
                color: '#EF5350'
              }
            },
            data: [1 ,0.2, 14, 0.1, 0.7, 0.02, 4, 20.5, 0.2, 39.5, 16, 0, 0 ]
          },
          {
            name: 'Intenções de Voto',
            type: 'bar',
            itemStyle: {
              normal: {
                color: '#66BB6A'
              }
            },
            data: [0.8 , 3, 12, 0.7, 0.9, 0.8, 1.1, 24.6, 1.7, 19, 5, 19, 12 ]
          }
        ]
      };

      var idx = 1;
      pie_timeline_options = {

        // Add timeline
        timeline: {
          x: 10,
          x2: 10,
          data: [
            '2018-01-01', '2018-01-15', '2018-02-01', '2018-02-15', '2018-03-01',
            {name: '2018-03-15', symbol: 'emptyStar2', symbolSize: 8},
            '2018-04-01', '2018-04-15', '2018-05-01', '2018-05-15', '2018-06-01',
            {name: '2018-06-18', symbol: 'star2', symbolSize: 8}
          ],
          label: {
            formatter: function (s) {
              return s.slice(0, 7);
            }
          },
          autoPlay: true,
          playInterval: 3000
        },

        // Set options
        options: [
          {

            // Add title
            title: {
              text: 'Estatística de Citações',
              subtext: 'Baseada em temas relacionados ao Candidato',
              x: 'center'
            },

            // Add tooltip
            tooltip: {
              trigger: 'item',
              formatter: "{a} <br/>{b}: {c} ({d}%)"
            },

            // Add legend
            legend: {
              x: 'left',
              orient: 'vertical',
              data: ['Facebook', 'Twitter', 'Google', 'Youtube', 'Instagram']
            },

            // Display toolbox
            toolbox: {
              show: true,
              orient: 'vertical',
              feature: {
                mark: {
                  show: true,
                  title: {
                    mark: 'Markline switch',
                    markUndo: 'Undo markline',
                    markClear: 'Clear markline'
                  }
                },
                dataView: {
                  show: true,
                  readOnly: false,
                  title: 'View data',
                  lang: ['View chart data', 'Close', 'Update']
                },
                magicType: {
                  show: true,
                  title: {
                    pie: 'Switch to pies',
                    funnel: 'Switch to funnel'
                  },
                  type: ['pie', 'funnel'],
                  option: {
                    funnel: {
                      x: '25%',
                      width: '50%',
                      funnelAlign: 'left',
                      max: 1700
                    }
                  }
                },
                restore: {
                  show: true,
                  title: 'Restore'
                },
                saveAsImage: {
                  show: true,
                  title: 'Same as image',
                  lang: ['Save']
                }
              }
            },

            // Add series
            series: [{
              name: 'Browser',
              type: 'pie',
              center: ['50%', '50%'],
              radius: '60%',
              data: [
                {value: idx * 128 + 80, name: 'Facebook'},
                {value: idx * 64 + 160, name: 'Twitter'},
                {value: idx * 32 + 320, name: 'Google'},
                {value: idx * 16 + 640, name: 'Youtube'},
                {value: idx++ * 8 + 1280, name: 'Instagram'}
              ]
            }]
          },

          {
            series: [{
              name: 'Browser',
              type: 'pie',
              data: [
                {value: idx * 128 + 80, name: 'Facebook'},
                {value: idx * 64 + 160, name: 'Twitter'},
                {value: idx * 32 + 320, name: 'Google'},
                {value: idx * 16 + 640, name: 'Youtube'},
                {value: idx++ * 8 + 1280, name: 'Instagram'}
              ]
            }]
          },
          {
            series: [{
              name: 'Browser',
              type: 'pie',
              data: [
                {value: idx * 128 + 80, name: 'Facebook'},
                {value: idx * 64 + 160, name: 'Twitter'},
                {value: idx * 32 + 320, name: 'Google'},
                {value: idx * 16 + 640, name: 'Youtube'},
                {value: idx++ * 8 + 1280, name: 'Instagram'}
              ]
            }]
          },
          {
            series: [{
              name: 'Browser',
              type: 'pie',
              data: [
                {value: idx * 128 + 80, name: 'Facebook'},
                {value: idx * 64 + 160, name: 'Twitter'},
                {value: idx * 32 + 320, name: 'Google'},
                {value: idx * 16 + 640, name: 'Youtube'},
                {value: idx++ * 8 + 1280, name: 'Instagram'}
              ]
            }]
          },
          {
            series: [{
              name: 'Browser',
              type: 'pie',
              data: [
                {value: idx * 128 + 80, name: 'Facebook'},
                {value: idx * 64 + 160, name: 'Twitter'},
                {value: idx * 32 + 320, name: 'Google'},
                {value: idx * 16 + 640, name: 'Youtube'},
                {value: idx++ * 8 + 1280, name: 'Instagram'}
              ]
            }]
          },
          {
            series: [{
              name: 'Browser',
              type: 'pie',
              data: [
                {value: idx * 128 + 80, name: 'Facebook'},
                {value: idx * 64 + 160, name: 'Twitter'},
                {value: idx * 32 + 320, name: 'Google'},
                {value: idx * 16 + 640, name: 'Youtube'},
                {value: idx++ * 8 + 1280, name: 'Instagram'}
              ]
            }]
          },
          {
            series: [{
              name: 'Browser',
              type: 'pie',
              data: [
                {value: idx * 128 + 80, name: 'Facebook'},
                {value: idx * 64 + 160, name: 'Twitter'},
                {value: idx * 32 + 320, name: 'Google'},
                {value: idx * 16 + 640, name: 'Youtube'},
                {value: idx++ * 8 + 1280, name: 'Instagram'}
              ]
            }]
          },
          {
            series: [{
              name: 'Browser',
              type: 'pie',
              data: [
                {value: idx * 128 + 80, name: 'Facebook'},
                {value: idx * 64 + 160, name: 'Twitter'},
                {value: idx * 32 + 320, name: 'Google'},
                {value: idx * 16 + 640, name: 'Youtube'},
                {value: idx++ * 8 + 1280, name: 'Instagram'}
              ]
            }]
          },
          {
            series: [{
              name: 'Browser',
              type: 'pie',
              data: [
                {value: idx * 128 + 80, name: 'Facebook'},
                {value: idx * 64 + 160, name: 'Twitter'},
                {value: idx * 32 + 320, name: 'Google'},
                {value: idx * 16 + 640, name: 'Youtube'},
                {value: idx++ * 8 + 1280, name: 'Instagram'}
              ]
            }]
          },
          {
            series: [{
              name: 'Browser',
              type: 'pie',
              data: [
                {value: idx * 128 + 80, name: 'Facebook'},
                {value: idx * 64 + 160, name: 'Twitter'},
                {value: idx * 32 + 320, name: 'Google'},
                {value: idx * 16 + 640, name: 'Youtube'},
                {value: idx++ * 8 + 1280, name: 'Instagram'}
              ]
            }]
          },
          {
            series: [{
              name: 'Browser',
              type: 'pie',
              data: [
                {value: idx * 128 + 80, name: 'Facebook'},
                {value: idx * 64 + 160, name: 'Twitter'},
                {value: idx * 32 + 320, name: 'Google'},
                {value: idx * 16 + 640, name: 'Youtube'},
                {value: idx++ * 8 + 1280, name: 'Instagram'}
              ]
            }]
          },
          {
            series: [{
              name: 'Browser',
              type: 'pie',
              data: [
                {value: idx * 128 + 80, name: 'Facebook'},
                {value: idx * 64 + 160, name: 'Twitter'},
                {value: idx * 32 + 320, name: 'Google'},
                {value: idx * 16 + 640, name: 'Youtube'},
                {value: idx++ * 8 + 1280, name: 'Instagram'}
              ]
            }]
          }
        ]
      };

      basic_bars.setOption(basic_bars_options);
      pie_timeline.setOption(pie_timeline_options);
      // Resize charts
      // ------------------------------

      window.onresize = function () {
        setTimeout(function () {
          basic_bars.resize();
          pie_timeline.resize();
        }, 200);
      };
    }
  );

  /* 3d funnel */
  const chart = AmCharts.makeChart("chartdiv", {
    "type": "funnel",
    "theme": "light",
    "dataProvider": [{
      "title": "Public",
      "value": 3678909
    }, {
      "title": "Pessoas",
      "value": 2345012
    }, {
      "title": "Classificadas",
      "value": 987765
    }],
    "balloon": {
      "fixedPosition": true
    },
    "valueField": "value",
    "titleField": "title",
    "marginRight": 130,
    "marginLeft": 20,
    "startX": -100,
    "depth3D": 70,
    "angle": 80,
    "outlineAlpha": 1,
    "outlineColor": "#FFFFFF",
    "outlineThickness": 5,
    "labelPosition": "right",
    "balloonText": "[[title]]: [[value]]n[[description]]",
    "export": {
      "enabled": true
    }
  });
});
