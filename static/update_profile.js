    function append_cities(data){
        $("#id_cidade").html(data);
    }
    function updateCities(state,zipcode){
        var state = state;
        var url= '/updateCities'
      // initialize an AJAX request
        $.ajax({
        url: url,
        data: {
          'stateId': state       // add the state id to the GET parameters
        },
        success: function (data) {
            $("#id_cidade").html(data);
            // replace the contents of the city input with the data that came from the server
            if (zipcode==true){
                var arr;
                // validates CEP
                var regex = /^([0-9]{5})[-. ]?([0-9]{3})$/;
                if (regex.test($(".zip-field").val())) {
                    $.get('/cep/' + $(".zip-field").val() + '/', function (data, status) {
                        eval("var arr = " + data);
                        $("#" + address.street).val(arr.street);
                        $("#" + address.district).val(arr.district);
                        $('#'+address.city+' option[data='+arr.city+']').attr('selected','selected');
                        $('#' + address.city + ' option').filter(function () {
                            return this.text == arr.city;
                        }).attr('selected', 'selected');
                        $("#" + address.state).val(arr.state);
                    });
                }
            }
        }
      });
    }

    $('select#id_estado').change(function(){
        updateCities(this.value,false)
    });
