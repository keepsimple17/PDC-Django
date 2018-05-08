/* ------------------------------------------------------------------------------
*
*  # Steps wizard
*
*  Specific JS code additions for wizard_steps.html page
*
*  Version: 1.1
*  Latest update: Dec 25, 2015
*
* ---------------------------------------------------------------------------- */

$(function () {
    // Show form
    var form = $(".steps-validation").show();
    var severUrl = $("meta[name=sever_url]").attr("content");
    // global required message for validator
    jQuery.extend(jQuery.validator.messages, {
        required: "Este campo é obrigatório."
    });


    // Initialize wizard
    $(".steps-validation").steps({
        headerTag: "h6",
        bodyTag: "fieldset",
        transitionEffect: "fade",
        titleTemplate: '<span class="number">#index#</span> #title#',
        labels: {
            finish: 'Enviar',
            next: 'Proximo',
            previous: 'Anterior'
        },
        autoFocus: true,

        onStepChanging: function (event, currentIndex, newIndex) {
            console.log('step chaning', currentIndex, newIndex);
            // Allways allow previous action even if the current form is not valid!
            if (currentIndex === 1 && newIndex === 2) {
                getInvites();
            }

            if (currentIndex === 2 && newIndex === 3) {
                $('#team_member_name').removeClass('required');
                $('#team_member_email').removeClass('required');
                $('#team_member_role').removeClass('required');
            }
            if (currentIndex > newIndex) {
                return true;
            }

            // Forbid next action on "Warning" step if the user is to young
            if (newIndex === 3 && Number($("#age-2").val()) < 18) {
                return false;
            }

            // Needed in some cases if the user went back (clean up)
            // To remove error styles
            if (currentIndex < newIndex) {
                form.find(".body:eq(" + newIndex + ") label.error").remove();
                form.find(".body:eq(" + newIndex + ") .error").removeClass("error");
            }

            form.validate().settings.ignore = ":disabled,:hidden";
            return form.valid();
        },

        onStepChanged: function (event, currentIndex, priorIndex) {
            // Used to skip the "Warning" step if the user is old enough.
            if (currentIndex === 2 && Number($("#age-2").val()) >= 18) {
                form.steps("next");
            }

            // Used to skip the "Warning" step if the user is old enough and wants to the previous step.
            if (currentIndex === 2 && priorIndex === 3) {
                form.steps("previous");
            }
        },

        onFinishing: function (event, currentIndex) {
            // console.log(event, currentIndex);
            form.validate().settings.ignore = ":disabled";
            return form.valid();
        },

        onFinished: function (event, currentIndex) {
            console.log(event, currentIndex);
            console.log($('.steps-validation'));
            // alert("Submitted!!!!!!!");
            $('.steps-validation')[0].submit(function (_event) {
                // alert( "Handler for .submit() called." );
                _event.preventDefault();
            });
        }
    });


    // Initialize validation
    $(".steps-validation").validate({
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
                    error.appendTo( element.parent().parent().parent().parent() );
                } else {
                    error.appendTo( element.parent().parent().parent().parent().parent() );
                }
            } else if (element.parents('div').hasClass('checkbox') || element.parents('div').hasClass('radio')) {
                // Unstyled checkboxes, radios
                error.appendTo( element.parent().parent().parent() );
            } else if (element.parents('div').hasClass('has-feedback') || element.hasClass('select2-hidden-accessible')) {
                // Input with icons and Select2
                error.appendTo( element.parent() );
            } else if (element.parents('label').hasClass('checkbox-inline') || element.parents('label').hasClass('radio-inline')) {
                // Inline checkboxes, radios
                error.appendTo( element.parent().parent() );
            } else if (element.parent().hasClass('uploader') || element.parents().hasClass('input-group')) {
                // Input group, styled file input
                error.appendTo( element.parent().parent() );
            } else {
                error.insertAfter(element);
            }
        },
        // can customize each fields
        messages: {
            name: "Please specify your name"
        }
    });


    // Initialize plugins
    // ------------------------------

    // Select2 selects
    $('.select').select2();


    // Simple select without search
    $('.select-simple').select2({
        minimumResultsForSearch: Infinity
    });

    // Date range picker
    $('#birthday_picker__span').click(function (e) {
        $('#birthday_picker__input').AnyTime_noPicker().AnyTime_picker({
            format: "%d/%m/%Z"
        }).focus();
        e.preventDefault();
    });
    $('#birthday_picker__input').click(function (e) {
        $('#birthday_picker__input').AnyTime_noPicker();
        e.preventDefault();
    });
    $('#birthday_picker__input').keyup(birthDayMask);

    function birthDayMask() {
        const today = new Date();
        var num = $(this).val().replace(/\D/g, '');
        var birthString = '';
        var day = num.substring(0, 2);
        var month = num.substring(2, 4);
        var year = num.substring(4, 8);
        if (day && day > 31) {
            day = 31;
            birthString = `${day}/`;
            $(this).val(birthString);
        } else if (month && month > 12) {
            month = 12;
            birthString = `${day}/${month}`;
            $(this).val(birthString);
        } else if (year && year > today.getFullYear()) {
            birthString = `${day}/${month}`;
            $(this).val(birthString);
        } else {
            if (num.length === 8) {
                var birthday = new Date(year, month - 1, day);
                day = birthday.getDate();
                month = birthday.getMonth() + 1;
                year = birthday.getFullYear();
                day = (day < 10)? `0${day}` : day;
                month = (month < 10)? `0${month}` : month;
            }
            if (num.length < 3) {
                birthString = `${day}/`;
            } else if (num.length > 4) {
                birthString = `${day}/${month}/${year}`;
            } else {
                birthString = `${day}/${month}`
            }
            $(this).val(birthString);
        }
    }
    // $("#anytime-month-numeric").AnyTime_picker({
    //     format: "%d/%m/%Z"
    // });

    function notify(message) {
        noty({
            width: 200,
            text: message,
            type: 'success',
            dismissQueue: true,
            timeout: 4000,
            layout: 'topRight'
        });
        $('#team_member_name').removeClass('required');
        $('#team_member_email').removeClass('required');
        $('#team_member_role').removeClass('required');
    }

    // Button with progress
    Ladda.bind('.btn-ladda-progress', {
        callback: function (instance) {
            $('#team_member_name').addClass('required');
            $('#team_member_email').addClass('required');
            $('#team_member_role').addClass('required');
            form.validate().settings.ignore = ":disabled,:hidden";

            var team_member_name = $("input[name=team_member_name]").val();
            var team_member_email = $("input[name=team_member_email]").val();
            var team_member_cel = $("input[name=team_member_cel]").val();
            var invitor_email = $("input[name=campaign_email]").val();
            console.log('team_member_name', team_member_name);
            console.log('team_member_email', team_member_email);
            console.log('team_member_cel', team_member_cel);

            if (!form.valid()) {
                instance.stop();
                return;
            }

            var trs = $('#user_permission_table > tr');
            // console.log('cliecked', trs);
            var permissionArray = [];

            for (var index in Array.from(Array(trs.length).keys())) {
                var tds = $(trs[index]).find('.check-box');
                // console.log('tds', tds);
                if (tds.length === 3) {
                    var value = calcPermissionValue(tds);
                    permissionArray.push(value);
                }
            }
            function calcPermissionValue(_tds) {
                var val = 0;
                if (_tds[0].checked) {
                    val += 4;
                }
                if (_tds[1].checked) {
                    val += 2;
                }
                if (_tds[2].checked) {
                    val += 1;
                }
                return val;
            }
            console.log(permissionArray);
            var url = 'http://' + severUrl + '/account/add_team_member';
            axios.post(url, {
                team_member_name: team_member_name,
                team_member_email: team_member_email,
                team_member_cel: team_member_cel,
                permission_list: permissionArray,
                invitor_email: invitor_email
            })
                .then(function (response) {
                    instance.stop();
                    // console.log(response.data.message);
                    notify(response.data.message);
                    var _status = response.data.status;
                    if ((_status === 'invited' || _status === 'created') && response.data.body) {
                        pushInvit(response.data.body);
                    }
                })
                .catch(function (error) {
                    instance.stop();
                    console.log(error);
                });
            // var progress = 0;
            // var interval = setInterval(function () {
            //     progress = Math.min(progress + Math.random() * 0.1, 1);
            //     instance.setProgress(progress);
            //
            //     if ( progress === 1 ) {
            //         instance.stop();
            //         clearInterval(interval);
            //     }
            // }, 200);
        }
    });

    $('.team-user-roles_select').change(function () {
        var valueList = $('option:selected', this).attr('data-values');
        console.log('valueList', JSON.parse(valueList)[0]);
        var permissionArray = JSON.parse(valueList);

        var trs = $('#user_permission_table > tr');
        for (var index in Array.from(Array(trs.length).keys())) {
            var tds = $(trs[index]).find('.check-box');
            // console.log('tds', tds);
            var str = permissionArray[index].toString();
            var bin = (+str).toString(2);
            if (tds.length === 3) {
                if (bin[0] === '1') {
                    tds[0].checked = true;
                } else {
                    tds[0].checked = false;
                }
                if (bin[1] === '1') {
                    tds[1].checked = true;
                } else {
                    tds[1].checked = false;
                }
                if (bin[2] === '1') {
                    tds[2].checked = true;
                } else {
                    tds[2].checked = false;
                }
            }
        }
    });

    function getInvites() {
        console.log('getInvites');
        var url = 'http://' + severUrl + '/candidato/invites/';
        var invitor_email = $("input[name=campaign_email]").val();
        axios.get('/candidato/invites/', {
            params: {
                invitator_email: invitor_email,
                limit: 4
            }
        })
            .then(function (response) {
                console.log(response);
                renderInvites(response.data.results);
            })
            .catch(function (error) {
                console.log(error);
            });
    }

    function renderInvites(invites) {
        // console.log('invites', invites);
        var htmlString = '';
        for (var invite of invites) {
            console.log(invite);
            htmlString += changeVariable(invite.invited_name, invite.invited_email, invite.invite_status);
        }
        $( ".invites_body" ).html('');
        $( ".invites_body" ).append(htmlString);
    }

    function changeVariable(name, email, status) {
        var template = `
        <tr role="row" class="odd">
            <td class="sorting_1">${name}</td>
            <td>${email}</td>
            <td>Agência de Marketing</td>
            <td>${getStatus(status)}</td>
            <td class="text-center">
                <ul class="icons-list">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-menu9"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a href="#"><i class="icon-eraser2"></i> Excluir</a></li>
                            <li><a href="#"><i class="icon-pencil"></i> Editar</a></li>
                            <li><a href="#"><i class="icon-envelope"></i> Reenviar Convite</a></li>
                        </ul>
                    </li>
                </ul>
            </td>
        </tr>
        `;

        function getStatus(_status) {
            var htmlStr = '';
            switch (_status) {
            case 'I':
                htmlStr = `<span class="label label-default">INATIVO</span>`;
                break;
            case 'S':
                htmlStr = `<span class="label label-danger">SUSPENSO</span>`;
                break;
            case 'C':
                htmlStr = `<span class="label label-info">CONVIDADO</span>`;
                break;
            case 'A':
                htmlStr = `<span class="label label-success">ATIVO</span>`;
                break;
            default:
                break;
            }
            return htmlStr;
        }
        return template;
    }

    function pushInvit(invite) {
        var oldStr = $( ".invites_body" ).html('');
        var newStr = changeVariable(invite.invited_name, invite.invited_email, invite.invite_status) + oldStr;
        $( ".invites_body" ).append(newStr);
    }

    // update candidate cicies
    $('select#candidate_state').change(function () {
        updateCandidateCities(this.value, function () {
            console.log('updating cities');
        });
    });

    function updateCandidateCities(state, next) {
        var url = '/updateCities';
        // initialize an AJAX request
        $.ajax({
            url: url,
            data: {
                stateId: state  // add the state id to the GET parameters
            },
            success: function (data) {
                $("#candidate_city").html(data);
                next();
            // replace the contents of the city input with the data that came from the server
            }});
    }

    // file input
    $(".file-styled").uniform({
        fileButtonClass: 'action btn bg-pink-400'
    });
});

function readImg(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#avatar_img')
                .attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
