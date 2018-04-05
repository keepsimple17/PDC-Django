function append_cities(data){
  $("#id_cidade").html(data);
}

function updateCities(state, next){
  var state = state;
  var url = '/updateCities';
  // initialize an AJAX request
  $.ajax({
    url: url,
    data: {
      stateId: state  // add the state id to the GET parameters
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
        if($(".zip-field").val() != "") {
          alert("enter correct zipcode");
          next();
        }
      } else if (data.indexOf("url_error_message") >= 0) {
        if ($(".zip-field").val() != ""){
          alert("sorry, could not get details of zipcode...please try again");
          next();
        }
      } else {
        updateCities(state, function() {
          eval("var arr = " + data);
          //console.log(address.state)
          //$("#" + address.street).val(arr.street);
          $("#address").val(arr.district+arr.street);
          $('#id_cidade option[data='+arr.city+']').attr('selected', 'selected');
          $('#id_cidade option').filter(function () {
            return this.text == arr.city;
          }).attr('selected', 'selected');
          $("#id_estado").val(arr.state);
          $('#id_estado option[value='+arr.state+']').attr('selected', 'selected');
        });
        next();
      }
    });
  } else if ($(".zip-field").val() !== "") {
    alert("enter correct zipcode format");
    next();
  }
}

$('select#id_estado').change(function () {
  updateCities(this.value);
});

function validateForm() {
  var state = document.forms["user-form"]["estado"].value;
  var city = document.forms["user-form"]["cidade"].value;
  var zip = document.forms["user-form"]["cep"].value;
  var regex_landline = /^\(?([0-9]{2})\)? ([0-9]{4})[-. ]?([0-9]{4})$/;
  var regex_cellular = /^\(?([0-9]{2})\)? ([0-9]{1})? ([0-9]{4})[-. ]?([0-9]{4})$/;

  var valueString = $("#telephone").val();
  if (!regex_landline.test(valueString) && !regex_cellular.test(valueString)) {
    alert("enter contact in format (NN) N NNNN-NNNN or (NN) NNNN-NNNN");
    return false;
  }

  if (state === "") {
    alert("State must be filled out");
    return false;
  } else if (city === "") {
    alert("City must be filled out");
    return false;
  } else if (zip === "") {
    alert("Zipcode must be filled out");
    return false;
  } else {
    return true;
  }
}

function phoneNumberMask() {
  var num = $(this).val().replace(/\D/g, '');
  // console.log(num);
  // console.log(num.length);
  var telString = '';
  if (num.length > 10) {
    telString = '(' + num.substring(0, 2) + ') ' + num.substring(2, 3) + ' ' + num.substring(3, 7) + '-' + num.substring(7, 11);
  } else {
    telString = '(' + num.substring(0, 2) + ') ' + num.substring(2, 6) + '-' + num.substring(6, 10);
  }
  $(this).val(telString);
}

$('#telephone').keyup(phoneNumberMask);
