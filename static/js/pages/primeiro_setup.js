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

'use strict';

$(function () {
  // Show form
  var form = $(".steps-validation").show();

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
    autoFocus: true,
    labels: {
      finish: 'Enviar',
      next: 'Proximo',
      previous: 'Anterior'
    },


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
        form.steps("Próximo");
      }

      // Used to skip the "Warning" step if the user is old enough and wants to the previous step.
      if (currentIndex === 2 && priorIndex === 3) {
        form.steps("Anterior");
      }
    },

    onFinishing: function (event, currentIndex) {
      // console.log(event, currentIndex);
      form.validate().settings.ignore = ":disabled";
      return form.valid();
    },

    onFinished: function (event, currentIndex) {
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
      if (element.parents('div').hasClass("checker") || element.parents('div').hasClass("choice") || element.parent().hasClass('bootstrap-switch-container')) {
        if (element.parents('label').hasClass('checkbox-inline') || element.parents('label').hasClass('radio-inline')) {
          error.appendTo(element.parent().parent().parent().parent());
        } else {
          error.appendTo(element.parent().parent().parent().parent().parent());
        }
      } else if (element.parents('div').hasClass('checkbox') || element.parents('div').hasClass('radio')) {
        // Unstyled checkboxes, radios
        error.appendTo(element.parent().parent().parent());
      } else if (element.parents('div').hasClass('has-feedback') || element.hasClass('select2-hidden-accessible')) {
        // Input with icons and Select2
        error.appendTo(element.parent());
      } else if (element.parents('label').hasClass('checkbox-inline') || element.parents('label').hasClass('radio-inline')) {
        // Inline checkboxes, radios
        error.appendTo(element.parent().parent());
      } else if (element.parent().hasClass('uploader') || element.parents().hasClass('input-group')) {
        // Input group, styled file input
        error.appendTo(element.parent().parent());
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

  // birthday picker
  // we need following operation to enable to input birthday manually
  // type dd/mm/year
  $('#birthday_picker__span').click(function (e) {
    var done = false;
    $('#birthday_picker__input').AnyTime_noPicker().AnyTime_picker({
      format: "%d/%m/%Z",
      labelTitle: "Aniversário"
    }).focus();
    e.preventDefault();
    // creating the hook of hide event
    // couldn't find event hook of anytime plugin in doc
    // doc link: https://www.ama3.com/anytime/#AnyTime.noPicker
    // ref link: https://stackoverflow.com/questions/2857900/onhide-type-event-in-jquery
    var _oldhide = $.fn.hide;
    $.fn.hide = function (speed, callback) {
      $(this).trigger('hide');
      return _oldhide.apply(this, arguments);
    };

    setTimeout(function () {
      $('#AnyTime--birthday_picker__input').bind('hide', function () {
        if (!done) {
          $('#birthday_picker__input').AnyTime_noPicker();
          done = true;
        }
      });
    }, 300);
  });

  // birthday input mask when entering manually
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
      // next year is impossible
      birthString = `${day}/${month}`;
      $(this).val(birthString);
    } else {
      if (num.length === 8) {
        var birthday = new Date(year, month - 1, day);
        day = birthday.getDate();
        month = birthday.getMonth() + 1;
        year = birthday.getFullYear();
        day = (day < 10) ? `0${day}` : day;
        month = (month < 10) ? `0${month}` : month;
      }
      if (num.length < 3) {
        birthString = `${day}/`;
      } else if (num.length > 4) {
        birthString = `${day}/${month}/${year}`;
      } else {
        birthString = `${day}/${month}`;
      }
      $(this).val(birthString);
    }
  }

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
      // creating team member
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
      axios.post('/account/add_team_member', {
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
    }
  });

  $('.team-user-roles_select').change(function () {
    var valueList = $('option:selected', this).attr('data-values');
    console.log('valueList', JSON.parse(valueList)[0]);
    var permissionArray = JSON.parse(valueList);

    var trs = $('#user_permission_table > tr');
    for (var index in Array.from(Array(trs.length).keys())) {
      var tds = $(trs[index]).find('.check-box');
      var str = permissionArray[index].toString();
      var bin = (+str).toString(2);
      if (tds.length === 3) {
        // best experience!!!
        tds[0].checked = bin[0] === '1';
        tds[1].checked = bin[1] === '1';
        tds[2].checked = bin[2] === '1';
      }
    }
  });

  function getInvites() {
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
    var inviteBody = $(".invites_body");
    var htmlString = '';
    for (var invite of invites) {
      console.log(invite);
      htmlString += changeVariable(invite.invited_name, invite.invited_email, invite.invite_status);
    }
    inviteBody.html('');
    inviteBody.append(htmlString);
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
    var inviteBody = $('.invites_body');
    var oldStr = inviteBody.html('');
    var newStr = changeVariable(invite.invited_name, invite.invited_email, invite.invite_status) + oldStr;
    inviteBody.append(newStr);
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
      }
    });
  }

  // photo upload form
  $(".file-styled").uniform({
    fileButtonClass: 'action btn bg-warning-400',
    fileButtonHtml: 'Escolher Arquivo',
    fileDefaultHtml: 'Nenhum Arquivo'
  });

  // tab

    // ========================================
    //
    // Tokenfield
    //
    // ========================================


    // Basic initialization
    $('.tokenfield').tokenfield();


    // Styling
    // ------------------------------

    //
    // Primary
    //

    // Add class on init
    $('.tokenfield-primary').on('tokenfield:initialize', function (e) {
        $(this).parent().find('.token').addClass('bg-primary')
    });

    // Initialize plugin
    $('.tokenfield-primary').tokenfield();

    // Add class when token is created
    $('.tokenfield-primary').on('tokenfield:createdtoken', function (e) {
        $(e.relatedTarget).addClass('bg-primary')
    });


    //
    // Teal
    //

    // Add class on init
    $('.tokenfield-teal').on('tokenfield:initialize', function (e) {
        $(this).parent().find('.token').addClass('bg-teal')
    });

    // Initialize plugin
    $('.tokenfield-teal').tokenfield();

    // Add class when token is created
    $('.tokenfield-teal').on('tokenfield:createdtoken', function (e) {
        $(e.relatedTarget).addClass('bg-teal')
    });


    //
    // Purple
    //

    // Add class on init
    $('.tokenfield-purple').on('tokenfield:initialize', function (e) {
        $(this).parent().find('.token').addClass('bg-purple')
    });

    // Initialize plugin
    $('.tokenfield-purple').tokenfield();

    // Add class when token is created
    $('.tokenfield-purple').on('tokenfield:createdtoken', function (e) {
        $(e.relatedTarget).addClass('bg-purple')
    });


    //
    // Success
    //

    // Add class on init
    $('.tokenfield-success').on('tokenfield:initialize', function (e) {
        $(this).parent().find('.token').addClass('bg-success')
    });

    // Initialize plugin
    $('.tokenfield-success').tokenfield();

    // Add class when token is created
    $('.tokenfield-success').on('tokenfield:createdtoken', function (e) {
        $(e.relatedTarget).addClass('bg-success')
    });


    //
    // Danger
    //

    // Add class on init
    $('.tokenfield-danger').on('tokenfield:initialize', function (e) {
        $(this).parent().find('.token').addClass('bg-danger')
    });

    // Initialize plugin
    $('.tokenfield-danger').tokenfield();

    // Add class when token is created
    $('.tokenfield-danger').on('tokenfield:createdtoken', function (e) {
        $(e.relatedTarget).addClass('bg-danger')
    });


    //
    // Warning
    //

    // Add class on init
    $('.tokenfield-warning').on('tokenfield:initialize', function (e) {
        $(this).parent().find('.token').addClass('bg-warning')
    });

    // Initialize plugin
    $('.tokenfield-warning').tokenfield();

    // Add class when token is created
    $('.tokenfield-warning').on('tokenfield:createdtoken', function (e) {
        $(e.relatedTarget).addClass('bg-warning')
    });



    // Other examples
    // ------------------------------

    //
    // Typeahead support
    //

    // Use Bloodhound engine
    var engine = new Bloodhound({
        local: [
            {value: 'red'},
            {value: 'blue'},
            {value: 'green'} ,
            {value: 'yellow'},
            {value: 'violet'},
            {value: 'brown'},
            {value: 'purple'},
            {value: 'black'},
            {value: 'white'}
        ],
        datumTokenizer: function(d) {
            return Bloodhound.tokenizers.whitespace(d.value);
        },
        queryTokenizer: Bloodhound.tokenizers.whitespace
    });

    // Initialize engine
    engine.initialize();

    // Initialize tokenfield
    $('.tokenfield-typeahead').tokenfield({
        typeahead: [null, { source: engine.ttAdapter() }]
    });



    // Methods
    // ------------------------------

    // Set tokens
    $('#set-tokens').on('click', function() {
        $('#set-tokens-field').tokenfield('setTokens', ['blue','red','white']);
    })


    // Create tokens
    $('#create-token').on('click', function() {
        $('#create-token-field').tokenfield('createToken', { value: 'new', label: 'New token' });
    })


    //
    // Disable, enable
    //

    // Initialize plugin
    $('.tokenfield-disable').tokenfield();

    // Disable on click
    $('#disable').on('click', function() {
        $('.tokenfield-disable').tokenfield('disable');
    });

    // Enabe on click
    $('#enable').on('click', function() {
        $('.tokenfield-disable').tokenfield('enable');
    });


    //
    // Readonly, writeable
    //

    // Initialize plugin
    $('.tokenfield-readonly').tokenfield();

    // Readonly on click
    $('#readonly').on('click', function() {
        $('.tokenfield-readonly').tokenfield('readonly');
    });

    // Writeable on click
    $('#writeable').on('click', function() {
        $('.tokenfield-readonly').tokenfield('writeable');
    });


    //
    // Destroy, create
    //

    // initialize plugin
    $('.tokenfield-destroy').tokenfield();

    // Destroy on click
    $('#destroy').on('click', function() {
        $('.tokenfield-destroy').tokenfield('destroy');
    });

    // Create on click
    $('#create').on('click', function() {
        $('.tokenfield-destroy').tokenfield();
    });




    // ========================================
    //
    // Tags input
    //
    // ========================================


    // Display values
    $('.tags-input, [data-role="tagsinput"], .tagsinput-max-tags, .tagsinput-custom-tag-class').on('change', function(event) {
        var $element = $(event.target),
            $container = $element.parent().parent('.content-group');

        if (!$element.data('tagsinput'))
        return;

        var val = $element.val();
        if (val === null)
        val = "null";

        $('pre.val > code', $container).html( ($.isArray(val) ? JSON.stringify(val) : "\"" + val.replace('"', '\\"') + "\"") );
        $('pre.items > code', $container).html(JSON.stringify($element.tagsinput('items')));
        Prism.highlightAll();
    }).trigger('change');



    // Basic examples
    // ------------------------------

    // Basic initialization
    $('.tags-input').tagsinput();


    // Allow dublicates
    $('.tags-input-dublicates').tagsinput({
        allowDuplicates: true
    });


    // Set maximum allowed tags
    $('.tagsinput-max-tags').tagsinput({
        maxTags: 5
    });


    // Custom tag class
    $('.tagsinput-custom-tag-class').tagsinput({
        tagClass: function(item){
            return 'label bg-success';
        }
    });


    //
    // Typeahead implementation
    //

    // Matcher
    var substringMatcher = function(strs) {
        return function findMatches(q, cb) {
            var matches, substringRegex;

            // an array that will be populated with substring matches
            matches = [];

            // regex used to determine if a string contains the substring `q`
            substrRegex = new RegExp(q, 'i');

            // iterate through the pool of strings and for any string that
            // contains the substring `q`, add it to the `matches` array
            $.each(strs, function(i, str) {
                if (substrRegex.test(str)) {

                    // the typeahead jQuery plugin expects suggestions to a
                    // JavaScript object, refer to typeahead docs for more info
                    matches.push({ value: str });
                }
            });
            cb(matches);
        };
    };

    // Data
    var states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
        'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii',
        'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
        'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
        'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
        'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
        'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
        'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
        'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
    ];

    // Attach typeahead
    // $('.tagsinput-typeahead').tagsinput('input').typeahead(
    //     {
    //         hint: true,
    //         highlight: true,
    //         minLength: 1
    //     },
    //     {
    //         name: 'states',
    //         displayKey: 'value',
    //         source: substringMatcher(states)
    //     }
    // ).bind('typeahead:selected', $.proxy(function (obj, datum) {
    //     this.tagsinput('add', datum.value);
    //     this.tagsinput('input').typeahead('val', '');
    // }, $('.tagsinput-typeahead')));


    //
    // Objects as tags
    //

    // Use Bloodhound engine
    // var countries = new Bloodhound({
    //     datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
    //     queryTokenizer: Bloodhound.tokenizers.whitespace,
    //     limit: 10,
    //     prefetch: {
    //         url: 'assets/demo_data/tags_input/cities.json'
    //     }
    // });
    //
    // // Kicks off the loading/processing of `local` and `prefetch`
    // countries.initialize();

    // Define element
    var elt = $('.tagsinput-tag-objects');

    // Initialize
    // elt.tagsinput({
    //     itemValue: 'value',
    //     itemText: 'text'
    // });
    // elt.tagsinput('add', { "value": 1 , "text": "Amsterdam"   , "continent": "Europe"    });
    // elt.tagsinput('add', { "value": 4 , "text": "Washington"  , "continent": "America"   });
    // elt.tagsinput('add', { "value": 7 , "text": "Sydney"      , "continent": "Australia" });
    // elt.tagsinput('add', { "value": 10, "text": "Beijing"     , "continent": "Asia"      });
    // elt.tagsinput('add', { "value": 13, "text": "Cairo"       , "continent": "Africa"    });
    //
    // // Attach Typeahead
    // elt.tagsinput('input').typeahead(null, {
    //     name: 'countries',
    //     valueKey: 'value',
    //     displayKey: 'text',
    //     source: countries.ttAdapter(),
    //     templates: '<p>{{text}}</p>'
    // }).bind('typeahead:selected', $.proxy(function (obj, datum) {
    //     this.tagsinput('add', datum);
    //     this.tagsinput('input').typeahead('val', '');
    // }, elt));


    //
    // Categorize tags
    //

    // Use Bloodhound engine
    // var continents = new Bloodhound({
    //     datumTokenizer: Bloodhound.tokenizers.obj.whitespace('continent'),
    //     queryTokenizer: Bloodhound.tokenizers.whitespace,
    //     limit: 10,
    //     prefetch: {
    //         url: 'assets/demo_data/tags_input/cities.json'
    //     }
    // });
    //
    // // Kicks off the loading/processing of `local` and `prefetch`
    // continents.initialize();

    // Define element
    var elt2 = $('.tagsinput-tag-categorizing');

    // Initialize
    // elt2.tagsinput({
    //     tagClass: function(item) {
    //         switch (item.continent) {
    //             case 'Europe'   : return 'label bg-indigo-400';
    //             case 'America'  : return 'label bg-danger';
    //             case 'Australia': return 'label bg-success';
    //             case 'Africa'   : return 'label bg-primary';
    //             case 'Asia'     : return 'label bg-pink-400';
    //         }
    //     },
    //     itemValue: 'value',
    //     itemText: 'text'
    // });
    // elt2.tagsinput('add', { "value": 1 , "text": "Amsterdam"   , "continent": "Europe"    });
    // elt2.tagsinput('add', { "value": 4 , "text": "Washington"  , "continent": "America"   });
    // elt2.tagsinput('add', { "value": 7 , "text": "Sydney"      , "continent": "Australia" });
    // elt2.tagsinput('add', { "value": 10, "text": "Beijing"     , "continent": "Asia"      });
    // elt2.tagsinput('add', { "value": 13, "text": "Cairo"       , "continent": "Africa"    });
    //
    // // Attach Typeahead
    // elt2.tagsinput('input').typeahead(null, {
    //     name: 'continents',
    //     valueKey: 'value',
    //     displayKey: 'text',
    //     source: continents.ttAdapter(),
    //     templates: '<p>{{text}}</p>'
    // }).bind('typeahead:selected', $.proxy(function (obj, datum) {
    //     this.tagsinput('add', datum);
    //     this.tagsinput('input').typeahead('val', '');
    // }, elt2));


    //
    // Methods
    //

    // Define elements
    var tagsMethods = $('.tagsinput-add-tag, .tagsinput-remove-tag, .tagsinput-remove-tags, .tagsinput-destroy, .tagsinput-refresh');

    // Initialize
    tagsMethods.tagsinput({
        itemValue: 'id',
        itemText: 'text'
    });

    // Add values
    tagsMethods.tagsinput('add', {id: 1, text: 'Amsterdam'});
    tagsMethods.tagsinput('add', {id: 2, text: 'Washington'});
    tagsMethods.tagsinput('add', {id: 3, text: 'Sydney'});

    // "Add" methos
    $('.add-tag-button').on('click', function() {
        $('.tagsinput-add-tag').tagsinput('add', {id: 4, text: 'Beijing'});
        $(this).addClass('disabled');
    });

    // "Remove" method
    $('.remove-tag-button').on('click', function() {
        $('.tagsinput-remove-tag').tagsinput('remove', {id: 3, text: 'Sydney'});
        $(this).addClass('disabled');
    });

    // "Remove all" method
    $('.remove-all-tags-button').on('click', function() {
        $('.tagsinput-remove-tags').tagsinput('removeAll');
        $(this).addClass('disabled');
    });

    // "Destroy" method
    $('.destroy-tagsinput-button').on('click', function() {
        $('.tagsinput-destroy').tagsinput('destroy');
        $(this).addClass('disabled');
    });
});

// showing the thumbnail of selected image
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
