/**
 * Created by paul on 07/18/2018.
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
      echarts: '../../../../static/js/plugins/visualization/echarts'
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

      // axios.get('/elections/dispute/', {
      //   params: {}
      // })
      //   .then((res) => {
      //     console.log('dispute', res.data);
      //   })
      //   .catch((err) => {
      //     console.error('dispute', err);
      //   });

      const pie_timeline = ec.init(document.getElementById('pie_timeline'), limitless);

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

      pie_timeline.setOption(pie_timeline_options);

      window.onresize = function () {
        setTimeout(function () {
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
});
