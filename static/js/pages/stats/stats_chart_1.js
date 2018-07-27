/**
 * Created by Paul on 07/18/2018.
 */

$(function () {
  // brazil map start
  // anychart.onDocumentReady(function () {
  //   const dataSet = [
  //     {
  //       'id': 'BR.GO',
  //       'value': 0
  //     },
  //     {
  //       'id': 'BR.SP',
  //       'value': 1
  //     },
  //     {
  //       'id': 'BR.PE',
  //       'value': 2
  //     },
  //     {
  //       'id': 'BR.1099',
  //       'value': 3
  //     },
  //     {
  //       'id': 'BR.AM',
  //       'value': 4
  //     },
  //     {
  //       'id': 'BR.MA',
  //       'value': 5
  //     },
  //     {
  //       'id': 'BR.PA',
  //       'value': 6
  //     },
  //     {
  //       'id': 'BR.153',
  //       'value': 7
  //     },
  //     {
  //       'id': 'BR.TO',
  //       'value': 8
  //     },
  //     {
  //       'id': 'BR.DF',
  //       'value': 9
  //     },
  //     {
  //       'id': 'BR.MS',
  //       'value': 10
  //     },
  //     {
  //       'id': 'BR.MG',
  //       'value': 11
  //     },
  //     {
  //       'id': 'BR.MT',
  //       'value': 12
  //     },
  //     {
  //       'id': 'BR.RS',
  //       'value': 13
  //     },
  //     {
  //       'id': 'BR.PR',
  //       'value': 14
  //     },
  //     {
  //       'id': 'BR.SC',
  //       'value': 15
  //     },
  //     {
  //       'id': 'BR.CE',
  //       'value': 16
  //     },
  //     {
  //       'id': 'BR.PI',
  //       'value': 17
  //     },
  //     {
  //       'id': 'BR.AL',
  //       'value': 18
  //     },
  //     {
  //       'id': 'BR.BA',
  //       'value': 19
  //     },
  //     {
  //       'id': 'BR.ES',
  //       'value': 20
  //     },
  //     {
  //       'id': 'BR.PB',
  //       'value': 21
  //     },
  //     {
  //       'id': 'BR.RJ',
  //       'value': 22
  //     },
  //     {
  //       'id': 'BR.RN',
  //       'value': 23
  //     },
  //     {
  //       'id': 'BR.SE',
  //       'value': 24
  //     },
  //     {
  //       'id': 'BR.RR',
  //       'value': 25
  //     },
  //     {
  //       'id': 'BR.AP',
  //       'value': 26
  //     }
  //   ];
  //
  //   const map = anychart.map();
  //   map.geoData(anychart.maps.brazil);
  //
  //   // set the series
  //   const series = map.choropleth(dataSet);
  //
  //   // disable labels
  //   series.labels(false);
  //
  //   // set the container
  //   map.container('svg_map_container');
  //   map.draw();
  // });
  // brazil map end

  const heatmapDataSet = [
    {
      "id":"BR-AC",
      "value": 0,
    },
    {
      "id":"BR-AL",
      "value": 0,
    },
    {
      "id":"BR-AM",
      "value": 0,
    },
    {
      "id":"BR-AP",
      "value": 0,
    },
    {
      "id":"BR-BA",
      "value": 0,
    },
    {
      "id":"BR-CE",
      "value": 0,
    },
    {
      "id":"BR-DF",
      "value": 0,
    },
    {
      "id":"BR-ES",
      "value": 0,
    },
    {
      "id":"BR-GO",
      "value": 0,
    },
    {
      "id":"BR-MA",
      "value": 0,
    },
    {
      "id":"BR-MG",
      "value": 0,
    },
    {
      "id":"BR-MS",
      "value": 0,
    },
    {
      "id":"BR-MT",
      "value": 0,
    },
    {
      "id":"BR-PA",
      "value": 0,
    },
    {
      "id":"BR-PB",
      "value": 0,
    },
    {
      "id":"BR-PE",
      "value": 0,
    },
    {
      "id":"BR-PI",
      "value": 0,
    },
    {
      "id":"BR-PR",
      "value": 0,
    },
    {
      "id":"BR-RJ",
      "value": 0,
    },
    {
      "id":"BR-RN",
      "value": 0,
    },
    {
      "id":"BR-RO",
      "value": 0,
    },
    {
      "id":"BR-RR",
      "value": 0,
    },
    {
      "id":"BR-RS",
      "value": 0,
    },
    {
      "id":"BR-SC",
      "value": 0,
    },
    {
      "id":"BR-SE",
      "value": 0,
    },
    {
      "id":"BR-SP",
      "value": 0,
    },
    {
      "id":"BR-TO",
      "value": 0,
    }
  ];

  axios.get('http://18.218.2.246/sentiment/api/v1.0/posts', {
    params: {name: 'jairbolsonaro'}
  })
    .then(res => {
      console.log('heat map data', res.data.data.by_location);
      renderHeatMap(res.data.data.by_location);
    })
    .catch(err => {});

  function renderHeatMap(itemList) {
    console.log('redering heat map', itemList);

    for (const item of itemList) {
      const index = heatmapDataSet.findIndex(x => x.id === `BR-${item[0]}`);
      if (index > -1) {
        heatmapDataSet[index].value = item[1];
      }
    }
    const map = AmCharts.makeChart("svg_map_container", {
      titles: [
        {
          text: 'HeatMap for jairbolsonaro',
          size: 15,
          color: '#333333',
        }
      ],
      type: 'map',
      theme: 'light',
      colorSteps: 10,
      dataProvider: {
        // map: 'brazilLow',
        map: 'brazilHigh',
        areas: heatmapDataSet,
      },
      areasSettings: {
        autoZoom: true,
        balloonText: '[[title]]: [[value]]',
      },
      valueLegend: {
        right: 10,
        minValue: 'Low',
        maxValue: 'High'
      },
      export: {
        enabled: true
      },
      smallMap: {},
    });
  }
  // heat map end

  // solid gauge start
  const names = ['Bolsonaro', 'Ciro Gomes', 'Alckmin', 'Marina Silva', 'Joaquim Barbosa', 'Collor', 'Paulino'];
  const data = [22, 15, 6, 5, 7, 10, 65];
  const dataSet = anychart.data.set(data);
  const palette = anychart.palettes.distinctColors().items(
    ['#64b5f6', '#1976d2', '#ef6c00', '#ffd54f', '#455a64', '#96a6a6', '#dd2c00', '#00838f', '#00bfa5', '#ffa000']);

  const makeBarWithBar = (gauge, radius, i, width, without_stroke) => {
    let stroke = '1 #e5e4e4';
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
    const gauge = anychart.gauges.circular();
    gauge.data(dataSet);
    gauge.fill('#fff')
      .stroke(null)
      .padding(0)
      .margin(100)
      .startAngle(0)
      .sweepAngle(270);

    const axis = gauge.axis().radius(100).width(1).fill(null);

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

    gauge.title().text(
      `Lideranças em Pesquisas de Voto<br/><span style="color:#929292; font-size: 12px;">(Densidade de Citações - 94.6% precisão)</span>`
    ).useHtml(true);

    gauge.title()
      .enabled(true)
      .hAlign('center')
      .padding(0)
      .margin([0, 0, 20, 0]);

    gauge.container('gauge_container');

    gauge.draw();
  });
  // solid gauge end

  /* tree chart start */
  anychart.onDocumentReady(function () {
    // get data
    const data = getData();
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
      const text = printPath(chart.getDrilldownPath());
      // set the chart title
      chart.title().useHtml(true);
      chart.title(`Treemap: Interactivity (Drilling Down and Up)<br><br>Path: <span style = 'color:#990000; font-style:italic'>${text}</span>`);
    });

    // set the container id
    chart.container("tree_map_container");

    // initiate drawing the chart
    chart.draw();
  });

  // a function for getting data
  function getData() {
    return [
      {
        name: "Root",
        children: [
          {
            name: "Nenhum", children: [
              {
                name: "Homens", children: [
                  {name: "18 - 25 anos", value: 1800},
                  {name: "26 - 45 anos", value: 6000},
                  {name: "46 - 65 anos", value: 5570},
                  {name: "+65 anos", value: 700}
                ]
              },
              {
                name: "Mulheres", children: [
                  {name: "18 - 25 anos", value: 3000},
                  {name: "26 - 45 anos", value: 1600},
                  {name: "46 - 65 anos", value: 3550},
                  {name: "+65 anos", value: 1300}
                ]
              }
            ]
          },
          {
            name: "Brancos", children: [
              {
                name: "Homens", children: [
                  {name: "18 - 25 anos", value: 5000},
                  {name: "26 - 45 anos", value: 950},
                  {name: "46 - 65 anos", value: 8550},
                  {name: "+65 anos", value: 300}
                ]
              },
              {
                name: "Mulheres", children: [
                  {name: "18 - 25 anos", value: 1200},
                  {name: "26 - 45 anos", value: 8700},
                  {name: "46 - 65 anos", value: 5150},
                  {name: "+65 anos", value: 9800}
                ]
              }
            ]
          },
          {
            name: "Nulos", children: [
              {
                name: "Homens", children: [
                  {name: "18 - 25 anos", value: 5800},
                  {name: "26 - 45 anos", value: 1500},
                  {name: "46 - 65 anos", value: 950},
                  {name: "+65 anos", value: 800}
                ]
              },
              {
                name: "Mulheres", children: [
                  {name: "18 - 25 anos", value: 1900},
                  {name: "26 - 45 anos", value: 5600},
                  {name: "46 - 65 anos", value: 3550},
                  {name: "+65 anos", value: 5300}
                ]
              }
            ]
          }
        ]
      }
    ];
  }

  /* a function for converting the current drilldown path to a string */
  function printPath(path) {
    console.log('path...', path);
    /* go through the array of data items
    and use the get() method to obtain the "name" field */
    let text = "";
    for (let i = 0; i < path.length; i++) {
      text += path[i].get("name") + "\\";
    }
    return text;
  }
});
