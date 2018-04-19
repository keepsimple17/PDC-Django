$(function () {
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

});
