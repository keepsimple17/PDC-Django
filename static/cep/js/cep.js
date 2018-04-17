$(document).ready(function () {
  $(document).on("change", ".zip-field", function () {
    if($(".zip-field").val() != ""){
      $('#loading').show();
      update_with_zipcode(0,function(){
        $('#loading').hide();
      });
    }
  });
});

function zipCodeMask() {
  var num = $(this).val().replace(/\D/g, '');
  // console.log(num);
  // console.log(num.length);
  var telString = '';
  telString = num;
  if (num.length > 5) {
    telString = num.substring(0, 5) + '-' + num.substring(5, 8);
  }

  $(this).val(telString);
}

$('.zip-field').keyup(zipCodeMask);
