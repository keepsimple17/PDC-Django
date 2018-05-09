/* ------------------------------------------------------------------------------
*
*  # Signup - Create User
*
*  Version: 1.0
*  Created at: May 9, 2018
*  Latest update: May 9, 2018
*
* ---------------------------------------------------------------------------- */

$(() => {
    // Basic initialization, based on Bloodhound
    const termChk = $("#term_checkbox");
    const signupBtn = $("#btncheck");
    const signupForm = $('.signup_form');
    // check to accepting terms of service
    termChk.on('change', function () {
        signupBtn.prop('disabled', !this.checked);
    }).trigger('change');

    signupForm.validate({
        ignore: 'input[type=hidden], .select2-search__field', // ignore hidden fields
        errorClass: 'validation-error-label',
        successClass: 'validation-valid-label',
        highlight: function (element, errorClass) {
            $(element).removeClass(errorClass);
        },
        unhighlight: function (element, errorClass) {
            $(element).removeClass(errorClass);
        },

        // Different components require proper error label placement
        errorPlacement: function (error, element) {
            // Styled checkboxes, radios, bootstrap switch
            if (element.parents('div').hasClass("checker") || element.parents('div').hasClass("choice") || element.parent().hasClass('bootstrap-switch-container') ) {
                if (element.parents('label').hasClass('checkbox-inline') || element.parents('label').hasClass('radio-inline')) {
                    error.appendTo(element.parent().parent().parent().parent());
                } else {
                    error.appendTo(element.parent().parent().parent().parent().parent());
                }
            } else if (element.parents('div').hasClass('has-feedback') || element.hasClass('select2-hidden-accessible')) {
                // Input with icons and Select2
                error.appendTo(element.parent());
            } else if (element.parents('label').hasClass('checkbox-inline') || element.parents('label').hasClass('radio-inline')) {
                // Inline checkboxes, radios
                error.appendTo(element.parent().parent());
            } else {
                error.insertAfter(element);
            }
        },
        // can customize each fields
        messages: {
            username: {
                required: "Please enter your username.",
                remote: jQuery.validator.format("{0} is already taken."),
            },
            email: {
                required: "Please enter your valid email address.",
                remote: jQuery.validator.format("{0} is already taken."),
            },
            password1: {
                required: "Please enter your password.",
            },
        },
        rules: {
            password1: {
                minlength: 8,
            },
            password2: {
                equalTo: "#password1",
            },
            username: {
                required: true,
                remote: {
                    url: "/account/check_username",
                    type: "get",
                },
            },
            email: {
                required: true,
                remote: {
                    url: "/account/check_email",
                    type: "get",
                },
            },
        },
    });
});
