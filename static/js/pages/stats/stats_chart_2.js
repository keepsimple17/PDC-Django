/**
 * Created by paul on 07/18/2018.
 */

class TestClass {
  constructor() {
    console.log('this is test class constructor...');
  }

  render() {}
}

class Demography {
  constructor() {}

  render() {
    const demography_28_24 = AmCharts.makeChart( "demography_28_24", {
      "type": "pie",
      "theme": "light",
      "dataProvider": [ {
        "title": "YES",
        "value": 685
      }, {
        "title": "NO",
        "value": 254
      } ],
      "titleField": "title",
      "valueField": "value",
      "labelRadius": 5,

      "radius": "42%",
      "innerRadius": "60%",
      "labelText": "[[title]]",
      "export": {
        "enabled": true
      }
    });
    const demography_25_34 = AmCharts.makeChart( "demography_25_34", {
      "type": "pie",
      "theme": "light",
      "dataProvider": [ {
        "title": "YES",
        "value": 365
      }, {
        "title": "NO",
        "value": 2154
      } ],
      "titleField": "title",
      "valueField": "value",
      "labelRadius": 5,

      "radius": "42%",
      "innerRadius": "60%",
      "labelText": "[[title]]",
      "export": {
        "enabled": true
      }
    });
    const demography_35_59 = AmCharts.makeChart( "demography_35_59", {
      "type": "pie",
      "theme": "light",
      "dataProvider": [{
        "title": "YES",
        "value": 326
      }, {
        "title": "NO",
        "value": 658
      } ],
      "titleField": "title",
      "valueField": "value",
      "labelRadius": 5,

      "radius": "42%",
      "innerRadius": "60%",
      "labelText": "[[title]]",
      "export": {
        "enabled": true
      }
    });
    const demography_60 = AmCharts.makeChart( "demography_60", {
      "type": "pie",
      "theme": "light",
      "dataProvider": [ {
        "title": "YES",
        "value": 4852
      }, {
        "title": "NO",
        "value": 9899
      } ],
      "titleField": "title",
      "valueField": "value",
      "labelRadius": 5,

      "radius": "42%",
      "innerRadius": "60%",
      "labelText": "[[title]]",
      "export": {
        "enabled": true
      }
    });
  }
}
