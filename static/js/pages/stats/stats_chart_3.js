/**
 * Created by paul on 03/05/2018.
 */

/* barchart, 3d funnel chart */
$(function () {

  const candidates = [];
  const nick_name_list = [];
  $('.candidate-menu li').each((index, item) => {
    candidates.push(JSON.parse($(item).attr('data-json')));
  });
  console.log(candidates);
  for (const item of candidates) {
    nick_name_list.push(item.candidate_political_nickname);
  }

  /* bar chart */
  require.config({
    paths: {
      echarts: '../../static/js/plugins/visualization/echarts'
    }
  });

  require(
    [
      'echarts',
      'echarts/theme/limitless',
      'echarts/chart/bar',
      'echarts/chart/line',
      'echarts/chart/pie',
      'echarts/chart/funnel'
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

      axios.post('http://18.218.2.246/postagens/api/v1.0/get/', {
        type: 'twitter',
      })
        .then((res) => {
          console.log('pie chart', res.data);
        })
        .catch((err) => {
          console.error('pie chart', err);
        });

      const basic_bars = ec.init(document.getElementById('basic_bars'), limitless);
      const pie_timeline = ec.init(document.getElementById('pie_timeline'), limitless);
      const pie_basic_element = ec.init(document.getElementById('pie_basic'), limitless);

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
          data: nick_name_list.reverse()
          // data:   ['Aldo Rebelo','Alvaro Dias', 'Ciro Gomes', 'C. Buarque', 'Collor', 'Flávio Rocha',
          // 'H. Meirelles', 'J. Bolsonaro', 'J. Amoedo', 'Lula', 'Marina Silva', 'Bcos/Nulos', 'Nenhum']
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
            data: [1, 0.2, 14, 0.1, 0.7]
            // data: [1 ,0.2, 14, 0.1, 0.7, 0.02, 4, 20.5, 0.2, 39.5, 16, 0, 0 ]
          },
          {
            name: 'Intenções de Voto',
            type: 'bar',
            itemStyle: {
              normal: {
                color: '#66BB6A'
              }
            },
            data: [0.8, 3, 12, 0.7, 0.9]
            // data: [0.8 , 3, 12, 0.7, 0.9, 0.8, 1.1, 24.6, 1.7, 19, 5, 19, 12 ]
          }
        ]
      };

      let idx = 1;
      const pie_timeline_options = {

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
                {value: (idx + 2) * 8 + 1280, name: 'Instagram'}
              ]
            }]
          }
        ]
      };

      const basic_pie_options = {

        // Add title
        title: {
          text: "Candidator's posts",
          subtext: 'twitter information',
          x: 'center'
        },

        // Add tooltip
        tooltip: {
          trigger: 'item',
          formatter: "{a} <br/>{b}: {c} ({d}%)"
        },

        // Add legend
        legend: {
          orient: 'vertical',
          x: 'left',
          data: [
            'coronai',
            'jairbolsonaro',
            'alvarodias_',
            'FrejatOficial',
            'joaoamoedonovo',
            'BetoRicha',
            'paulrs',
            'wildermorais',
            'requiaopmdb',
            'ratinho_jr',
            'Collor',
            'gleisi',
            'PRabello',
            'romerojuca',
            'GuilhermeBoulos',
            'Ciro2018',
            'jdoriajr',
            'cidaborghetti_',
            'paulobauer45',
            'kimpkat',
            'cirogomes',
            'neyleprevost',
            'deputado_aureo',
            'PaulOOctavioDF',
            'Sen_JoseSarney',
            'Francischini_',
            'IzalciLucas',
            'EderMauroPA',
            'alexandrefdf',
            'partidonovo30',
            'jbolsonaro2018',
            'democratas',
            'leandrolyra30',
            'mtrindadenovo',
          ]
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
                  y: '20%',
                  width: '50%',
                  height: '70%',
                  funnelAlign: 'left',
                  max: 1548
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

        // Enable drag recalculate
        calculable: true,

        // Add series
        series: [{
          name: 'Posts',
          type: 'pie',
          radius: '70%',
          center: ['50%', '57.5%'],
          data: [
            {value: 178, name: 'coronai'},
            {value: 3496, name: 'jairbolsonaro'},
            {value: 84920, name: 'alvarodias_'},
            {value: 61, name: 'FrejatOficial'},
            {value: 3233, name: 'joaoamoedonovo'},
            {value: 19128, name: 'BetoRicha'},
            {value: 6402, name: 'paulrs'},
            {value: 2907, name: 'wildermorais'},
            {value: 416, name: 'requiaopmdb'},
            {value: 5064, name: 'ratinho_jr'},
            {value: 2905, name: 'Collor'},
            {value: 8479, name: 'gleisi'},
            {value: 365, name: 'PRabello'},
            {value: 4135, name: 'romerojuca'},
            {value: 1378, name: 'GuilhermeBoulos'},
            {value: 1749, name: 'Ciro2018'},
            {value: 17921, name: 'jdoriajr'},
            {value: 1211, name: 'cidaborghetti_'},
            {value: 4704, name: 'paulobauer45'},
            {value: 0, name: 'kimpkat'},
            {value: 318, name: 'cirogomes'},
            {value: 21137, name: 'neyleprevost'},
            {value: 3554, name: 'deputado_aureo'},
            {value: 349, name: 'PaulOOctavioDF'},
            {value: 7, name: 'Sen_JoseSarney'},
            {value: 13877, name: 'Francischini_'},
            {value: 2704, name: 'IzalciLucas'},
            {value: 819, name: 'EderMauroPA'},
            {value: 22, name: 'alexandrefdf'},
            {value: 5937, name: 'partidonovo30'},
            {value: 173, name: 'jbolsonaro2018'},
            {value: 612, name: 'democratas'},
            {value: 0, name: 'leandrolyra30'},
            {value: 14, name: 'mtrindadenovo'},
          ],
        }]
      };

      basic_bars.setOption(basic_bars_options);
      pie_timeline.setOption(pie_timeline_options);
      pie_basic_element.setOption(basic_pie_options);
      // Resize charts
      // ------------------------------

      window.onresize = function () {
        setTimeout(function () {
          basic_bars.resize();
          pie_timeline.resize();
          pie_basic_element.resize();
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
      "value": 3678909,
      "description": "Pessoas ...",
    }, {
      "title": "Pessoas",
      "value": 2345012,
      "description": "Pessoas ...",
    }, {
      "title": "Classificadas",
      "value": 987765,
      "description": "Pessoas ...",
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
  console.log('chart...', chart);
});
