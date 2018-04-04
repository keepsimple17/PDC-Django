    function append_cities(data){
        $("#id_cidade").html(data);
    }
    function updateCities(state, next){
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
            next();
            // replace the contents of the city input with the data that came from the server
        }
      });
    }

    function update_with_zipcode(state,next){
                var arr;
                // validates CEP
                var regex = /^([0-9]{5})[-. ]?([0-9]{3})$/;
                if (regex.test($(".zip-field").val())) {
                    $.get('/cep/' + $(".zip-field").val() + '/', function (data, status) {
                        if (data.indexOf("not_found_error_message") >= 0){
                            if($(".zip-field").val() != ""){
                            window.alert("enter correct zipcode");
                            next();
                        }}
                        else if (data.indexOf("url_error_message") >= 0){
                            if($(".zip-field").val() != ""){
                            window.alert("sorry, could not get details of zipcode...please try again");
                            next();
                        }}
                        else {
                            updateCities(state, function(){
                                eval("var arr = " + data);
                                //console.log(address.state)
                                //$("#" + address.street).val(arr.street);
                                $("#address").val(arr.district+arr.street);
                                $('#id_cidade option[data='+arr.city+']').attr('selected','selected');
                                $('#id_cidade option').filter(function () {
                                    return this.text == arr.city;
                                }).attr('selected', 'selected');
                                $("#id_estado").val(arr.state);
                                $('#id_estado option[value='+arr.state+']').attr('selected','selected');
                                })
                            next();
                        }
                    });
                }
                else
                if($(".zip-field").val() != ""){
                    window.alert("enter correct zipcode format")
                    next();
                }
            }


    $('select#id_estado').change(function(){
        updateCities(this.value)
    });

    function validateForm(){
        var state = document.forms["user-form"]["estado"].value;
        var city = document.forms["user-form"]["cidade"].value;
        var zip = document.forms["user-form"]["cep"].value;
        var regex = /^\(?([0-9]{2})\)? ([0-9]{4,5})[-. ]?([0-9]{4})$/;


        if (! regex.test($("#telephone").val()))
        {
            alert("enter contact in format (NN) NNNNN-NNNN or (NN) NNNN-NNNN ");
            return false;
        }

        if (state == "") {
            alert("State must be filled out");
            return false;
        } else if(city == ""){
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
