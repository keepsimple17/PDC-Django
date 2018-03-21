    function append_cities(data){
        $("#id_cidade").html(data);
    }
    function updateCities(state,zipcode,next){
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
                        if(data['message']!="error"){
                            eval("var arr = " + data);
                        $("#" + address.street).val(arr.street);
                        $("#" + address.district).val(arr.district);
                        $('#'+address.city+' option[data='+arr.city+']').attr('selected','selected');
                        $('#' + address.city + ' option').filter(function () {
                            return this.text == arr.city;
                        }).attr('selected', 'selected');
                        $("#" + address.state).val(arr.state);

                        }
                        if (data.indexOf("message") >= 0){
                            if($(".zip-field").val() != ""){
                            window.alert("enter correct zipcode")
                        }}

                    });
                }
                else
                if($(".zip-field").val() != ""){
                    //console.log("error")
                    window.alert("enter correct zipcode")
                }
            }
            //next();
        }
      });
    }

    $('select#id_estado').change(function(){
        updateCities(this.value,false,function(){
        })
    });

    function validateForm(){
        var state = document.forms["user-form"]["estado"].value;
        var city = document.forms["user-form"]["cidade"].value;
        var zip = document.forms["user-form"]["cep"].value;

        if (state == "") {
            alert("State must be filled out");
            return false;
        } else if(city == ""){
            console.log("here2")
            alert("City must be filled out");
            return false;
        }else if(zip == "") {
            alert("Zipcode must be filled out");
            return false;
        }
        else {
            return true;
        }
    }
