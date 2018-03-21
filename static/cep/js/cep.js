$(document).ready(function () {
    $(document).on("change", ".zip-field", function () {
        //$('#loading').show();
        updateCities(0,true,function(){
            //$('#loading').hide();
        });
    });
});
