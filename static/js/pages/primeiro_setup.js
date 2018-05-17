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

$(() => {
  // Show form
  const form = $(".steps-validation").show();
  const proposalSaveBtn = $('#save_proposal');
  const campaignTab = $('#campaign_tab');

  // page init
  // disable campaign tab as default
  campaignTab.addClass('disable_event');
  const availCampaignIdList = [1, 2, 3, 7];

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


    onStepChanging(event, currentIndex, newIndex) {
      // Allways allow previous action even if the current form is not valid!
      if (currentIndex === 1 && newIndex === 2) {
        getInvites();
      }

      if (newIndex === 3) {
        checkCampaignAvaility();
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
        form.find(`.body:eq(${newIndex}) label.error`).remove();
        form.find(`.body:eq(${newIndex}) .error`).removeClass("error");
      }

      form.validate().settings.ignore = ":disabled,:hidden";
      return form.valid();
    },

    onStepChanged(event, currentIndex, priorIndex) {
      // Used to skip the "Warning" step if the user is old enough.
      if (currentIndex === 2 && Number($("#age-2").val()) >= 18) {
        form.steps("Próximo");
      }

      // Used to skip the "Warning" step if the user is old enough and wants to the previous step.
      // if (currentIndex === 2 && priorIndex === 3) {
      //   form.steps("Anterior");
      // }
    },

    onFinishing(event, currentIndex) {
      // console.log(event, currentIndex);
      form.validate().settings.ignore = ":disabled";
      return form.valid();
    },

    onFinished(event, currentIndex) {
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
    highlight(element, errorClass) {
      $(element).removeClass(errorClass);
    },
    unhighlight(element, errorClass) {
      $(element).removeClass(errorClass);
    },

    // Different components require proper error label placement
    errorPlacement(error, element) {
      // Styled checkboxes, radios, bootstrap switch
      if (element.parents('div').hasClass("checker") || element.parents('div').hasClass("choice")
        || element.parent().hasClass('bootstrap-switch-container')) {
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
      } else if (element.parents('label').hasClass('checkbox-inline')
        || element.parents('label').hasClass('radio-inline')) {
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
  $('#birthday_picker__span').click((e) => {
    let done = false;
    $('#birthday_picker__input').AnyTime_noPicker().AnyTime_picker({
      format: "%d/%m/%Z",
      labelTitle: "Aniversário"
    }).focus();
    e.preventDefault();
    // creating the hook of hide event
    // couldn't find event hook of anytime plugin in doc
    // doc link: https://www.ama3.com/anytime/#AnyTime.noPicker
    // ref link: https://stackoverflow.com/questions/2857900/onhide-type-event-in-jquery
    const _oldhide = $.fn.hide;
    $.fn.hide = function (speed, callback) {
      $(this).trigger('hide');
      return _oldhide.apply(this, arguments);
    };

    setTimeout(() => {
      $('#AnyTime--birthday_picker__input').bind('hide', () => {
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
    const num = $(this).val().replace(/\D/g, '');
    let birthString = '';
    let day = num.substring(0, 2);
    let month = num.substring(2, 4);
    let year = num.substring(4, 8);
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
        const birthday = new Date(year, month - 1, day);
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
    callback(instance) {
      // creating team member
      $('#team_member_name').addClass('required');
      $('#team_member_email').addClass('required');
      $('#team_member_role').addClass('required');
      form.validate().settings.ignore = ":disabled,:hidden";

      const team_member_name = $("input[name=team_member_name]").val();
      const team_member_email = $("input[name=team_member_email]").val();
      const team_member_cel = $("input[name=team_member_cel]").val();
      const invitor_email = $("input[name=campaign_email]").val();
      console.log('team_member_name', team_member_name);
      console.log('team_member_email', team_member_email);
      console.log('team_member_cel', team_member_cel);

      if (!form.valid()) {
        instance.stop();
        return;
      }

      const trs = $('#user_permission_table > tr');
      // console.log('cliecked', trs);
      const permissionArray = [];

      for (const index in Array.from(Array(trs.length).keys())) {
        const tds = $(trs[index]).find('.check-box');
        // console.log('tds', tds);
        if (tds.length === 3) {
          const value = calcPermissionValue(tds);
          permissionArray.push(value);
        }
      }

      function calcPermissionValue(_tds) {
        let val = 0;
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
        team_member_name,
        team_member_email,
        team_member_cel,
        permission_list: permissionArray,
        invitor_email,
      })
        .then((response) => {
          instance.stop();
          // console.log(response.data.message);
          notify(response.data.message);
          const _status = response.data.status;
          if ((_status === 'invited' || _status === 'created') && response.data.body) {
            pushInvit(response.data.body);
          }
        })
        .catch((error) => {
          instance.stop();
          console.log(error);
        });
    }
  });

  $('.team-user-roles_select').change(function () {
    const valueList = $('option:selected', this).attr('data-values');
    console.log('valueList', JSON.parse(valueList)[0]);
    const permissionArray = JSON.parse(valueList);

    const trs = $('#user_permission_table > tr');
    for (const index in Array.from(Array(trs.length).keys())) {
      const tds = $(trs[index]).find('.check-box');
      const str = permissionArray[index].toString();
      const bin = (+str).toString(2);
      if (tds.length === 3) {
        // best experience!!!
        tds[0].checked = bin[0] === '1';
        tds[1].checked = bin[1] === '1';
        tds[2].checked = bin[2] === '1';
      }
    }
  });

  function getInvites() {
    const invitor_email = $("input[name=campaign_email]").val();
    axios.get('/candidato/invites/', {
      params: {
        invitator_email: invitor_email,
        limit: 4,
      },
    })
      .then((response) => {
        renderInvites(response.data.results);
      })
      .catch((error) => {
        console.log(error);
      });
  }

  function renderInvites(invites) {
    const inviteBody = $(".invites_body");
    let htmlString = '';
    for (const invite of invites) {
      console.log(invite);
      htmlString += changeVariable(invite.invited_name, invite.invited_email, invite.invite_status);
    }
    inviteBody.html('');
    inviteBody.append(htmlString);
  }

  function changeVariable(name, email, status) {
    const template = `
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
      let htmlStr = '';
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
    const inviteBody = $('.invites_body');
    const oldStr = inviteBody.html('');
    const newStr = changeVariable(invite.invited_name, invite.invited_email, invite.invite_status) + oldStr;
    inviteBody.append(newStr);
  }

  // update candidate cicies
  $('select#candidate_state').change(function () {
    updateCandidateCities(this.value, () => {
      console.log('updating cities');
    });
  });

  function updateCandidateCities(state, next) {
    const url = '/updateCities';
    // initialize an AJAX request
    $.ajax({
      url,
      data: {
        stateId: state
      },
      success(data) {
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

  // Add class on init
  $('.tokenfield-success').on('tokenfield:initialize', function (e) {
    $(this).parent().find('.token').addClass('bg-success');
  });

  // Initialize plugin
  $('.tokenfield-success').tokenfield();

  // Add class when token is created
  $('.tokenfield-success').on('tokenfield:createdtoken', function (e) {
    processKeyword('save', 'P', e.attrs.value);
    $(e.relatedTarget).addClass('bg-success');
  });

  $('.tokenfield-success').on('tokenfield:removetoken', function (e) {
    processKeyword('remove', 'P', e.attrs.value);
  });

  // Add class on init
  $('.tokenfield-danger').on('tokenfield:initialize', function (e) {
      $(this).parent().find('.token').addClass('bg-danger')
  });

  // Initialize plugin
  $('.tokenfield-danger').tokenfield();

  // Add class when token is created
  $('.tokenfield-danger').on('tokenfield:createdtoken', function (e) {
    processKeyword('save', 'N', e.attrs.value);
    $(e.relatedTarget).addClass('bg-danger')
  });

  $('.tokenfield-danger').on('tokenfield:removetoken', function (e) {
    processKeyword('remove', 'N', e.attrs.value);
    console.log('removed', e.attrs.value);
  });

  const processKeyword = (process_type, keyword_type, keyword) => {
    const userId = $('input[name=user_id]').val();
    axios.post('/candidato/process_keyword/', {
      process_type,
      keyword_type,
      keyword,
      user_id: userId
    })
      .then(res => {
        notify('Your keyword is changed successfully.');
      })
      .catch(_err => {
        notify(`Occured any error ${_err}.`);
      });
  };

  $('#save_proposal').click(() => {
    const name = $('input[name=proposal_name]').val();
    const description = $('textarea[name=proposal_description]').val();
    const scope = $('select[name=proposal_scope]').val();
    const candidator = $('input[name=user_id]').val();
    console.log(name, description, scope, 'candidator:', candidator);
    if (name === '' || description === '' || scope === '') {
      notify('Please fill the all fields.');
      return false;
    }

    axios.post('/candidato/save_proposal/', {
      name,
      description,
      scope,
      candidator,
    })
      .then(res => {
        appendProposal(res.data.body);
        notify('Your proposal is saved successfully.');
        $('input[name=proposal_name]').val('');
        $('textarea[name=proposal_description]').val('');
        $('select[name=proposal_scope]').val('');
      })
      .catch(_err => {
        notify(`Occured any error ${_err}.`);
      });
  });

  const appendProposal = (proposal) => {
    const body = $('#proposals_body');
    const tpl = `
    <tr role="row" class="odd">
      <td class="sorting_1">${proposal.name}</td>
      <td>${proposal.scope.name}</td>
      <td class="text-center">
        <ul class="icons-list">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="icon-menu9"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-right">
              <li><a href="#"><i class="icon-pencil3"></i> Editar</a></li>
              <li><a href="#"><i class="icon-cross3"></i> Excluir</a></li>
            </ul>
          </li>
        </ul>
      </td>
    </tr>
    `;
    body.append(tpl);
  };

  const checkCampaignAvaility = () => {
    const campaignRole = $('select[name=user_roles_list]').val();
    const isAvail = availCampaignIdList.includes(parseInt(campaignRole, 10));
    if (isAvail) {
      $('#campaign_tab').removeClass('disable_event');
    }
  };

  $('#proposal_select').change(() => {
    const val = $('#proposal_select').val();
    if (val === 'create') {
      bootbox.prompt("Please enter Scope Name", function(result) {
        console.log(result);
        if (result === null) {
          notify('Please enter scope name');
        } else {
          addScope(result);
        }
      });
    }
  });

  const addScope = (_name) => {
    const userId = $('input[name=user_id]').val();
    axios.post('/candidato/scope_list/', {
      name: _name,
      user: userId
    })
      .then(res => {
        notify('Your new scope is added successfully.');
        const tmp = `<option value="${res.data.id}">${res.data.name}</option>`;
        $('#proposal_select').append(tmp);
      })
      .catch(_err => {
        notify(`Occured any error ${_err}.`);
      });
  };

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
