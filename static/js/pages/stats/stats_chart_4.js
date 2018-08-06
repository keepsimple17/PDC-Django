/**
 * Created by paul on 07/18/2018.
 */

class Posts {
  constructor() {
    this.fullList = [];
  }

  render(candidates) {
    console.log('posts render');
    const This = this;
    if (this.fullList.length === 0) {
      axios.post('http://18.218.2.246/postagens/api/v1.0/get/', {
        type: 'twitter',
      })
        .then((res) => {
          console.log('posts response', res.data.response);
          this.fullList = res.data.response;
          renderPosts();
        })
        .catch((err) => {
          console.error('pie chart', err);
        });
    } else {
      renderPosts();
    }

    function getTwitterName(name) {
      if (name.startsWith('@')) {
        return name.slice(1)
      } else {
        return name;
      }
    }

    function renderPosts() {
      require.config({
        paths: {
          echarts: '../../../../static/js/plugins/visualization/echarts'
        }
      });

      require(
        [
          'echarts',
          'echarts/theme/limitless',
          'echarts/chart/pie',
          'echarts/chart/funnel'
        ],

        // Charts setup
        function (ec, limitless) {
          const dataList = [];
          for (const candidate of candidates) {
            const twittername = getTwitterName(candidate.twitter);
            for (const item of This.fullList) {
              if (twittername === item.name) {
                dataList.push(item);
              }
            }
          }

          renderPieChart(dataList);

          function renderPieChart(lists) {
            const pie_basic_element = ec.init(document.getElementById('pie_basic'), limitless);

            const sortedList = lists.sort((a, b) => b.count - a.count);
            const usefulList = sortedList.slice(0, 10);
            const nameList = [];
            const dataList = [];
            for (const item of usefulList) {
              // nameList.push(item.name);
              nameList.push(item.nick_name);
              dataList.push({name: item.nick_name, value: item.count});
            }

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
                // data: ['coronai',]
                data: nameList,
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
                // data: [{value: 178, name: 'coronai'},],
                data: dataList,
              }]
            };

            pie_basic_element.setOption(basic_pie_options);

            window.onresize = function () {
              setTimeout(function () {
                pie_basic_element.resize();
              }, 200);
            };
          }
        }
      );
    }
  }
}

class TagCloud {
  constructor() {}

  render(candidator) {
    console.log('tag cloud render');
    const twitterName = getTwitterName(candidator.twitter);

    axios.post('http://18.218.2.246/topic_modeling/api/v1.0/posts', {
      // name: 'requiaopmdb',
      name: twitterName,
      type: 'twitter',
    })
      .then((res) => {
        console.log('tag cloud response', res.data.response);
        renderTagCloud(res.data.response);
      })
      .catch((err) => {
        console.error('tag cloud error', err);
      });

    function getTwitterName(name) {
      if (name && name.startsWith('@')) {
        return name.slice(1)
      } else {
        return name;
      }
    }

    function renderTagCloud(dataList) {
      $('#scopo_tag_cloud').html('');
      if (dataList && dataList.length > 0) {
        const wordList = [];
        for (const item of dataList) {
          wordList.push({
            text: item.name,
            weight: item.freqs,
          })
        }
        // var word_list = [
        //   {text: "Lorem", weight: 13, link: "https://github.com/DukeLeNoir/jQCloud"},
        //   {text: "Ipsum", weight: 10.5, html: {title: "My Title", "class": "custom-class"}, link: {href: "http://jquery.com/", target: "_blank"}},
        //   {text: "Dolor", weight: 9.4},
        // ];
        $('#scopo_tag_cloud').jQCloud(wordList);
      }
    }
  }
}

/* barchart, 3d funnel chart */
$(function () {
  // traffic chart init
  trafficSources('#traffic-sources', 330);

  // Chart setup
  function trafficSources(element, height) {
    console.log('traffic sources....');

    // Basic setup
    // ------------------------------

    // Define main variables
    var d3Container = d3.select(element);
    if (!d3Container.node()) {
      return;
    }
    var margin = {top: 5, right: 50, bottom: 40, left: 50},
      width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right,
      height = height - margin.top - margin.bottom,
      tooltipOffset = 30;

    // Tooltip
    var tooltip = d3Container
      .append("div")
      .attr("class", "d3-tip e")
      .style("display", "none");

    // Format date
    var format = d3.time.format("%m/%d/%y %H:%M");
    var formatDate = d3.time.format("%H:%M");

    // Colors
    var colorrange = ['#03A9F4', '#29B6F6', '#4FC3F7', '#81D4FA', '#B3E5FC', '#E1F5FE'];

    // Construct scales
    // ------------------------------

    // Horizontal
    var x = d3.time.scale().range([0, width]);

    // Vertical
    var y = d3.scale.linear().range([height, 0]);

    // Colors
    var z = d3.scale.ordinal().range(colorrange);

    // Create axes
    // ------------------------------

    // Horizontal
    var xAxis = d3.svg.axis()
      .scale(x)
      .orient("bottom")
      .ticks(d3.time.hours, 4)
      .innerTickSize(4)
      .tickPadding(8)
      .tickFormat(d3.time.format("%H:%M")); // Display hours and minutes in 24h format

    // Left vertical
    var yAxis = d3.svg.axis()
      .scale(y)
      .ticks(6)
      .innerTickSize(4)
      .outerTickSize(0)
      .tickPadding(8)
      .tickFormat(function (d) {
        return (d / 1000) + "k";
      });

    // Right vertical
    var yAxis2 = yAxis;

    // Dash lines
    var gridAxis = d3.svg.axis()
      .scale(y)
      .orient("left")
      .ticks(6)
      .tickPadding(8)
      .tickFormat("")
      .tickSize(-width, 0, 0);

    // Create chart
    // ------------------------------

    // Container
    var container = d3Container.append("svg");

    // SVG element
    var svg = container
      .attr('width', width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    // Construct chart layout
    // ------------------------------

    // Stack
    var stack = d3.layout.stack()
      .offset("silhouette")
      .values(function (d) {
        return d.values;
      })
      .x(function (d) {
        return d.date;
      })
      .y(function (d) {
        return d.value;
      });

    // Nest
    var nest = d3.nest()
      .key(function (d) {
        return d.key;
      });

    // Area
    var area = d3.svg.area()
      .interpolate("cardinal")
      .x(function (d) {
        return x(d.date);
      })
      .y0(function (d) {
        return y(d.y0);
      })
      .y1(function (d) {
        return y(d.y0 + d.y);
      });

    // Load data
    // ------------------------------

    d3.csv("/static/demo_data/dashboard/traffic_sources.csv", function (error, data) {

      // Pull out values
      data.forEach(function (d) {
        d.date = format.parse(d.date);
        d.value = +d.value;
      });

      // Stack and nest layers
      var layers = stack(nest.entries(data));

      // Set input domains
      // ------------------------------

      // Horizontal
      x.domain(d3.extent(data, function (d, i) {
        return d.date;
      }));

      // Vertical
      y.domain([0, d3.max(data, function (d) {
        return d.y0 + d.y;
      })]);

      // Add grid
      // ------------------------------

      // Horizontal grid. Must be before the group
      svg.append("g")
        .attr("class", "d3-grid-dashed")
        .call(gridAxis);

      //
      // Append chart elements
      //

      // Stream layers
      // ------------------------------

      // Create group
      var group = svg.append('g')
        .attr('class', 'streamgraph-layers-group');

      // And append paths to this group
      var layer = group.selectAll(".streamgraph-layer")
        .data(layers)
        .enter()
        .append("path")
        .attr("class", "streamgraph-layer")
        .attr("d", function (d) {
          return area(d.values);
        })
        .style('stroke', '#fff')
        .style('stroke-width', 0.5)
        .style("fill", function (d, i) {
          return z(i);
        });

      // Add transition
      var layerTransition = layer
        .style('opacity', 0)
        .transition()
        .duration(750)
        .delay(function (d, i) {
          return i * 50;
        })
        .style('opacity', 1);

      // Append axes
      // ------------------------------

      //
      // Left vertical
      //

      svg.append("g")
        .attr("class", "d3-axis d3-axis-left d3-axis-solid")
        .call(yAxis.orient("left"));

      // Hide first tick
      d3.select(svg.selectAll('.d3-axis-left .tick text')[0][0])
        .style("visibility", "hidden");

      //
      // Right vertical
      //

      svg.append("g")
        .attr("class", "d3-axis d3-axis-right d3-axis-solid")
        .attr("transform", "translate(" + width + ", 0)")
        .call(yAxis2.orient("right"));

      // Hide first tick
      d3.select(svg.selectAll('.d3-axis-right .tick text')[0][0])
        .style("visibility", "hidden");

      //
      // Horizontal
      //

      var xaxisg = svg.append("g")
        .attr("class", "d3-axis d3-axis-horizontal d3-axis-solid")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis);

      // Add extra subticks for hidden hours
      xaxisg.selectAll(".d3-axis-subticks")
        .data(x.ticks(d3.time.hours), function (d) {
          return d;
        })
        .enter()
        .append("line")
        .attr("class", "d3-axis-subticks")
        .attr("y1", 0)
        .attr("y2", 4)
        .attr("x1", x)
        .attr("x2", x);

      // Add hover line and pointer
      // ------------------------------

      // Append group to the group of paths to prevent appearance outside chart area
      var hoverLineGroup = group.append("g")
        .attr("class", "hover-line");

      // Add line
      var hoverLine = hoverLineGroup
        .append("line")
        .attr("y1", 0)
        .attr("y2", height)
        .style('fill', 'none')
        .style('stroke', '#fff')
        .style('stroke-width', 1)
        .style('pointer-events', 'none')
        .style('shape-rendering', 'crispEdges')
        .style("opacity", 0);

      // Add pointer
      var hoverPointer = hoverLineGroup
        .append("rect")
        .attr("x", 2)
        .attr("y", 2)
        .attr("width", 6)
        .attr("height", 6)
        .style('fill', '#03A9F4')
        .style('stroke', '#fff')
        .style('stroke-width', 1)
        .style('shape-rendering', 'crispEdges')
        .style('pointer-events', 'none')
        .style("opacity", 0);

      // Append events to the layers group
      // ------------------------------

      layerTransition.each("end", function () {
        layer
          .on("mouseover", function (d, i) {
            svg.selectAll(".streamgraph-layer")
              .transition()
              .duration(250)
              .style("opacity", function (_d, j) {
                return j !== i ? 0.75 : 1; // Mute all except hovered
              });
          })

          .on("mousemove", function (d, i) {
            var mouse = d3.mouse(this);
            var mousex = mouse[0];
            var mousey = mouse[1];
            var datearray = [];
            var invertedx = x.invert(mousex);
            invertedx = invertedx.getHours();
            var selected = (d.values);
            for (var k = 0; k < selected.length; k++) {
              datearray[k] = selected[k].date;
              datearray[k] = datearray[k].getHours();
            }
            var mousedate = datearray.indexOf(invertedx);
            var pro = d.values[mousedate].value;

            // Display mouse pointer
            hoverPointer
              .attr("x", mousex - 3)
              .attr("y", mousey - 6)
              .style("opacity", 1);

            hoverLine
              .attr("x1", mousex)
              .attr("x2", mousex)
              .style("opacity", 1);

            //
            // Tooltip
            //

            // Tooltip data
            tooltip.html(
              `<ul class='list-unstyled mb-5'>
                  <li><div class='text-size-base mt-5 mb-5'><i class='icon-circle-left2 position-left'></i>${d.key}</div></li>
                  <li>Visits: &nbsp; <span class='text-semibold pull-right'>${pro}</span></li>
                  <li>Time: &nbsp; <span class='text-semibold pull-right'>${formatDate(d.values[mousedate].date)}</span></li>
              </ul>`
            ).style("display", "block");

            // Tooltip arrow
            tooltip.append('div').attr('class', 'd3-tip-arrow');
          })
          .on("mouseout", function (d, i) {
            // Revert full opacity to all paths
            svg.selectAll(".streamgraph-layer")
              .transition()
              .duration(250)
              .style("opacity", 1);

            // Hide cursor pointer
            hoverPointer.style("opacity", 0);

            // Hide tooltip
            tooltip.style("display", "none");

            hoverLine.style("opacity", 0);
          });
      });

      // Append events to the chart container
      // ------------------------------

      d3Container
        .on("mousemove", function (d, i) {
          var mouse = d3.mouse(this);
          var mousex = mouse[0];
          var mousey = mouse[1];

          // Display hover line
          // .style("opacity", 1);
          // Move tooltip vertically
          // Half tooltip height - half arrow width
          tooltip.style("top", (mousey - ($('.d3-tip').outerHeight() / 2)) - 2 + "px");

          // Move tooltip horizontally
          if (mousex >= ($(element).outerWidth() - $('.d3-tip').outerWidth() - margin.right - (tooltipOffset * 2))) {
            tooltip
              .style("left", (mousex - $('.d3-tip').outerWidth() - tooltipOffset) + "px") // Change tooltip direction from right to left to keep it inside graph area
              .attr("class", "d3-tip w");
          } else {
            tooltip
              .style("left", (mousex + tooltipOffset) + "px")
              .attr("class", "d3-tip e");
          }
        });
    });

    // Resize chart
    // ------------------------------

    // Call function on window resize
    $(window).on('resize', resizeStream);

    // Call function on sidebar width change
    $(document).on('click', '.sidebar-control', resizeStream);

    // Resize function
    //
    // Since D3 doesn't support SVG resize by default,
    // we need to manually specify parts of the graph that need to
    // be updated on window resize
    function resizeStream() {
      // Layout
      // -------------------------

      // Define width
      width = d3Container.node().getBoundingClientRect().width - margin.left - margin.right;

      // Main svg width
      container.attr("width", width + margin.left + margin.right);

      // Width of appended group
      svg.attr("width", width + margin.left + margin.right);

      // Horizontal range
      x.range([0, width]);


      // Chart elements
      // -------------------------

      // Horizontal axis
      svg.selectAll('.d3-axis-horizontal').call(xAxis);

      // Horizontal axis subticks
      svg.selectAll('.d3-axis-subticks').attr("x1", x).attr("x2", x);

      // Grid lines width
      svg.selectAll(".d3-grid-dashed").call(gridAxis.tickSize(-width, 0, 0));

      // Right vertical axis
      svg.selectAll(".d3-axis-right").attr("transform", "translate(" + width + ", 0)");

      // Area paths
      svg.selectAll('.streamgraph-layer').attr("d", function (d) {
        return area(d.values);
      });
    }
  }
});
