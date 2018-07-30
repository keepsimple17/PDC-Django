/**
 * Created by paul on 03/05/2018.
 */

$(function () {
  const posts = new Posts();
  const tagCloud = new TagCloud();

  /* candidate dropdown */
  $('.candidate-menu li').on('click', function () {
    console.log('changing candidate...');
    onChangeCandidato($(this).attr('data-json'));
    $('.candidate-toggle').html($(this).find('a').html() + ` <span class="caret"></span>`);
  });

  const onChangeCandidato = (jsonStr) => {
    const candidator = JSON.parse(jsonStr);
    tagCloud.render(candidator);
    console.log(candidator);
    $('#candidate_nickname').html(candidator.candidate_political_nickname);
    $('#candidate_political_nickname').html(candidator.candidate_political_nickname);
    const facebookid = candidator.facebook.startsWith('@') ? candidator.facebook.substr(1) : candidator.facebook;
    const iframe_src = `http://18.218.2.246/topic_modeling/api/v1.0/posts?name=${facebookid}&type=facebook`;
    document.getElementById('segment_iframe').src = iframe_src;
    // $('#segment_iframe').src = iframe_src;
    // change candidate info
    $('#candidate_desited_position').html(candidator.campaign_desired_position.position);
    $('#candidate_state_campaign').html(candidator.state_campaign || 'PR');

    getCandidates(candidator)
      .then(res => {
        console.log('candiate res...', res.data);
        const candidates = res.data.results;
        renderBarChart(candidates);
        posts.render(candidates);
      })
      .catch(err => {});
  };

  const candidates = [];
  const nick_name_list = [];
  $('.candidate-menu li').each((index, item) => {
    candidates.push(JSON.parse($(item).attr('data-json')));
  });

  // console.log(candidates);
  // first candidate init
  tagCloud.render(candidates[0]);
  getCandidates(candidates[0])
    .then(res => {
      console.log('candiate res...', res.data);
      const candidates = res.data.results;
      renderBarChart(candidates);
      posts.render(candidates);
    })
    .catch(err => {});

  for (const item of candidates) {
    nick_name_list.push(item.candidate_political_nickname);
  }

  function getCandidates(candidate) {
    console.log('getCandidates', candidate);
    const position = candidate.campaign_desired_position.position;
    const state_campaign = candidate.state_campaign;
    if (candidate.campaign_desired_position.kind_of_position === 'Federal') {
      return axios.get('/candidato/candidate/', {
        params: {campaign_desired_position__position: position}
      });
    } else {
      return axios.get('/candidato/candidate/', {
        params: {
          campaign_desired_position__position: position,
          state_campaign: state_campaign,
        }
      });
    }
  }

  function renderBarChart(candidate_list) {
    const name_list = [];
    const x_list = [];
    const y_list = [];
    const usefulList = candidate_list.slice(0, 7);

    for (const candidate of usefulList) {
      name_list.push(candidate.candidate_political_nickname);
      x_list.push(Math.floor(Math.random() * 30));
      y_list.push(Math.floor(Math.random() * 30));
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
      ],

      // Charts setup
      function (ec, limitless) {
        const basic_bars = ec.init(document.getElementById('basic_bars'), limitless);
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
            data: name_list,
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
              data: x_list,
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
              data: y_list,
              // data: [0.8 , 3, 12, 0.7, 0.9, 0.8, 1.1, 24.6, 1.7, 19, 5, 19, 12 ]
            }
          ]
        };

        basic_bars.setOption(basic_bars_options);

        window.onresize = function () {
          setTimeout(function () {
            basic_bars.resize();
          }, 200);
        };
      }
    );
  }
});
