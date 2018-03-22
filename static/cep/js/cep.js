$(document).ready(function () {
    $(document).on("change", ".zip-field", function () {
        if($(".zip-field").val() != ""){
        $('#loading').show();
        update_with_zipcode(0,function(){
            $('#loading').hide();
        });}
    });
});
