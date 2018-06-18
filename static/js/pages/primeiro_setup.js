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
  const candidatorTab = $('#candidator_tab');
  const availCampaignIdList = [1, 2, 3, 7];
  const availCandidateIdList = [1, 3, 7];

  // utils
  // should change notify type by receiving parameters
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

  const clearRequire = () => {
    $('#team_member_name').removeClass('required');
    $('#team_member_email').removeClass('required');
    $('#team_member_role').removeClass('required');

    $('#committee_res_name').removeClass('required');
    $('#committee_res_email').removeClass('required');
    $('#committee_name').removeClass('required');
    $('#committee_zip').removeClass('required');
  };

  const checkCandidatorAvaility = () => {
    const campaignRole = $('select[name=user_roles_list]').val();
    const isAvail = availCandidateIdList.includes(parseInt(campaignRole, 10));
    if (isAvail) {
      $('#candidator_tab').removeClass('disable_event');
    } else {
      $('#candidator_tab').addClass('disable_event');
    }
  };

  const checkCampaignAvaility = () => {
    const campaignRole = $('select[name=user_roles_list]').val();
    const isAvail = availCampaignIdList.includes(parseInt(campaignRole, 10));
    if (isAvail) {
      $('#campaign_tab').removeClass('disable_event');
    } else {
      $('#campaign_tab').addClass('disable_event');
    }
  };

  // page and plugins init
  // disable campaign tab as default
  campaignTab.addClass('disable_event');
  candidatorTab.addClass('disable_event');

  // global required message for validator
  jQuery.extend(jQuery.validator.messages, {
    required: "Este campo é obrigatório."
  });

  // step wizard init
  $(".steps-validation").steps({
    headerTag: "h6",
    bodyTag: "fieldset",
    startIndex: 0,
    transitionEffect: "fade",
    titleTemplate: '<span class="number">#index#</span> #title#',
    autoFocus: true,
    labels: {
      finish: 'Enviar',
      next: 'Proximo',
      previous: 'Anterior'
    },

    onStepChanging(event, currentIndex, newIndex) {
      clearRequire();
      // getting team invites
      if (currentIndex === 1 && newIndex === 2) {
        getInvites();
      }

      if (newIndex === 3) {
        checkCampaignAvaility();
      }

      if (newIndex === 1) {
        checkCandidatorAvaility();
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
      // $('.steps-validation')[0].submit(function (_event) {
      //   _event.preventDefault();
      // });
    },

    onFinishing(event, currentIndex) {
      form.validate().settings.ignore = ":disabled";
      return form.valid();
    },

    onFinished(event, currentIndex) {
      $('.steps-validation')[0].submit(function (_event) {
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

  // Select2 selects
  $('.select').select2();

  //// Personal data tab
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
        const birthday = new Date(year, month-1, day);
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

  $('#user_photo').change((e) => {
    console.log('hey');
    const input = e.target;
    if (input.files && input.files[0]) {
      const reader = new FileReader();

      reader.onload = function (_e) {
        $('#avatar_img')
          .attr('src', _e.target.result);
      };

      reader.readAsDataURL(input.files[0]);
    }
  });

  //// Candidate tab
  $('#social_twitter').change(function () {
    console.log('twitter', this.value);
    $('#loading').show();
    const url = `https://twitter.com/${this.value}`;
    axios.post('/cors_request/', {
      url,
    })
      .then((res) => {
        $('#loading').hide();
        const el = $('<div></div>');
        el.html(res.data.data);
        const image_src = $('.profile-details img', el).attr('src');
        $('#social_twitter__media img').attr('src', image_src);
        $('#social_twitter__media a').attr('href', url);
        $('#social_twitter__media').addClass('media-show');
        $('#social_twitter-error').hide();
        $('input[name=twitter_img]').val(image_src);
        $('input[name=twitter_url]').val(url);
      })
      .catch((err) => {
        $('#loading').hide();
        $('#social_twitter').val('');
        $('#social_twitter__media').removeClass('media-show');
        $('#social_twitter-error').show();
      });
  });

  $('#social_facebook').change(function () {
    const url = `https://www.facebook.com/${this.value}/`;
    $('#loading').show();
    axios.post('/cors_request/', {
      url,
    })
      .then((res) => {
        $('#loading').hide();
        const el = $('<div></div>');
        el.html(res.data.data);
        const image_src = $('meta[property="og:image"]', el).attr('content');
        console.log('image_src', image_src);
        $('#social_facebook__media img').attr('src', image_src);
        $('#social_facebook__media a').attr('href', url);
        $('#social_facebook__media').addClass('media-show');
        $('#social_facebook-error').hide();
        $('input[name=facebook_img]').val(image_src);
        $('input[name=facebook_url]').val(url);
      })
      .catch((err) => {
        $('#loading').hide();
        $('#social_facebook').val('');
        $('#social_facebook__media').removeClass('media-show');
        $('#social_facebook-error').show();
      });
  });

  $('#social_instagram').change(function () {
    const url = `https://www.instagram.com/${this.value}/`;
    $('#loading').show();
    axios.post('/cors_request/', {
      url,
    })
      .then((res) => {
        $('#loading').hide();
        const el = $('<div></div>');
        el.html(res.data.data);
        const image_src = $('meta[property="og:image"]', el).attr('content');
        console.log('image_src', image_src);
        $('#social_instagram__media img').attr('src', image_src);
        $('#social_instagram__media a').attr('href', url);
        $('#social_instagram__media').addClass('media-show');
        $('#social_instagram-error').hide();
        $('input[name=instagram_img]').val(image_src);
        $('input[name=instagram_url]').val(url);
      })
      .catch((err) => {
        $('#loading').hide();
        $('#social_instagram').val('');
        $('#social_instagram__media').removeClass('media-show');
        $('#social_instagram-error').show();
      });
  });

  $('#social_youtube').change(function () {
    const url = `https://www.youtube.com/user/${this.value}/`;
    $('#loading').show();
    axios.post('/cors_request/', {
      url,
    })
      .then((res) => {
        $('#loading').hide();
        const el = $('<div></div>');
        el.html(res.data.data);
        const image_src = $('meta[property="og:image"]', el).attr('content');
        console.log('image_src', image_src);
        $('#social_youtube__media img').attr('src', image_src);
        $('#social_youtube__media a').attr('href', url);
        $('#social_youtube__media').addClass('media-show');
        $('#social_youtube-error').hide();
        $('input[name=youtube_img]').val(image_src);
        $('input[name=youtube_url]').val(url);
      })
      .catch((err) => {
        $('#loading').hide();
        $('#social_youtube').val('');
        $('#social_youtube__media').removeClass('media-show');
        $('#social_youtube-error').show();
      });
  });

  $('#social_googleplus').change(function () {
    const url = `https://plus.google.com/u/0/+${this.value}/`;
    $('#loading').show();
    axios.post('/cors_request/', {
      url,
    })
      .then((res) => {
        $('#loading').hide();
        const el = $('<div></div>');
        el.html(res.data.data);
        const image_src = $('meta[property="og:image"]', el).attr('content');
        console.log('image_src', image_src);
        $('#social_googleplus__media img').attr('src', image_src);
        $('#social_googleplus__media a').attr('href', url);
        $('#social_googleplus__media').addClass('media-show');
        $('#social_googleplus-error').hide();
        $('input[name=googlep_img]').val(image_src);
        $('input[name=googlep_url]').val(url);
      })
      .catch((err) => {
        $('#loading').hide();
        $('#social_googleplus').val('');
        $('#social_googleplus__media').removeClass('media-show');
        $('#social_googleplus-error').show();
      });
  });

  $('#candidate__holds_political_position').change(function () {
    console.log('changed hold political position', this.value);
    if (this.value === 'N') {
      $('#candidate__candidate_current_position').val('');
    }
  });

  //// Team tab
  // user roles submit
  // can remove this function in the future
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

  Ladda.bind('.btn-user-roles-progress', {
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

  //// Campaign tab
  // positive keywords
  $('.tokenfield-success').on('tokenfield:initialize', (e) => {
    $(e.currentTarget).parent().find('.token').addClass('bg-success');
  });

  $('.tokenfield-success').tokenfield();

  $('.tokenfield-success').on('tokenfield:createdtoken', (e) => {
    processKeyword('save', 'P', e.attrs.value);
    $(e.relatedTarget).addClass('bg-success');
  });

  $('.tokenfield-success').on('tokenfield:removetoken', (e) => {
    processKeyword('remove', 'P', e.attrs.value);
  });

  // negative keywords
  $('.tokenfield-danger').on('tokenfield:initialize', (e) => {
      $(e.currentTarget).parent().find('.token').addClass('bg-danger')
  });

  $('.tokenfield-danger').tokenfield();

  $('.tokenfield-danger').on('tokenfield:createdtoken', (e) => {
    processKeyword('save', 'N', e.attrs.value);
    $(e.relatedTarget).addClass('bg-danger')
  });

  $('.tokenfield-danger').on('tokenfield:removetoken', (e) => {
    processKeyword('remove', 'N', e.attrs.value);
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
    console.log(name, description, 'scope', scope, 'candidator:', candidator);
    if (name === '' || description === '' || scope === '' || scope === 0 || scope === '0') {
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

  // create new keywords
  $('#proposal_select').change(() => {
    const val = $('#proposal_select').val();
    if (val === 'create') {
      bootbox.prompt("Please enter Scope Name", function(result) {
        $('#proposal_select').val('0');
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

  /* Location tab */

  // Committee tab
  $('#committee_zip').change(function () {
    if ($(this).val() !== "") {
        $('#loading').show();
        update_with_zipcode(0, function () {
          $('#loading').hide();
        });
      }
  });

  function update_with_zipcode(state, next) {
    const zipCode = $('#committee_zip').val();
    // validates CEP
    var regex = /^([0-9]{5})[-. ]?([0-9]{3})$/;
    if (regex.test($(".zip-field").val())) {
      $.get('/cep/' + $(".zip-field").val() + '/', function (data, status) {
        if (data.indexOf("not_found_error_message") >= 0) {
          if (zipCode !== "") {
            notify('enter correct zipcode');
            next();
          }
        } else if (data.indexOf("url_error_message") >= 0) {
          if (zipCode !== "") {
            alert("sorry, could not get details of zipcode...please try again");
            next();
          }
        } else {
          var dataObj = JSON.parse(data);
          updateCities(dataObj.state, function () {
            // $("#" + address.street).val(arr.street);
            $("#committee_address").val(`${dataObj.street}`);
            $("#committee_bairro").val(`${dataObj.district}`);
            $("#committee_estado").val(dataObj.state);
            $(`#committee_estado option[value="${dataObj.state}"]`).attr('selected', 'selected');
            $('#committee_cidade option').filter(function () {
              return this.text === dataObj.city;
            }).attr('selected', 'selected');
          });
          next();
        }
      });
    } else if (zipCode !== "") {
      notify('enter correct zipcode format');
      next();
    }
  }

  function updateCities(state, next) {
    var url = '/updateCities';
    // initialize an AJAX request
    $.ajax({
      url: url,
      data: {
        stateId: state  // add the state id to the GET parameters
      },
      success: function (data) {
        $('#committee_cidade').html(data);
        next();
        // replace the contents of the city input with the data that came from the server
      }
    });
  }

  $('#committee_estado').change(function () {
    updateCities(this.value, function () {
      console.log('updating cities');
    });
  });
  // committee submit
  Ladda.bind('.btn-committee-progress', {
    callback(instance) {
      // instance.stop();
      $('#committee_res_name').addClass('required');
      $('#committee_res_email').addClass('required');
      $('#committee_name').addClass('required');
      $('#committee_zip').addClass('required');

      form.validate().settings.ignore = ":disabled,:hidden";

      const res_name = $('#committee_res_name').val() || '';
      const res_email = $('#committee_res_email').val() || '';
      const name = $('#committee_name').val() || '';
      const zip = $('#committee_zip').val() || '';
      const cell_phone = $('#committee_telephone').val() || '';
      const land_phone = $('#committee_landphone').val() || '';
      const state = $('#committee_estado').val() || '';
      const city = $('#committee_cidade').val() || '';
      const address = $('#committee_address').val() || '';
      const bairro = $('#committee_bairro').val() || '';
      const userId = $('input[name=user_id]').val();

      console.log('res_name', res_name);
      console.log('res_email', res_email);
      console.log('name', name);
      console.log('zip', zip);

      if (!form.valid()) {
        instance.stop();
        return;
      }
      axios.post('/account/add_committee', {
        res_name,
        res_email,
        name,
        zip,
        cell_phone,
        land_phone,
        state,
        city,
        address,
        bairro,
        user_id: userId,
      })
        .then((response) => {
          instance.stop();
          clearRequire();
          // console.log(response.data.message);
          appendCommittee(response.data.body);
          notify(response.data.message);
          const _status = response.data.status;
          $('#committee_res_name').val('');
          $('#committee_res_email').val('');
          $('#committee_name').val('');
          $('#committee_zip').val('');
          $('#committee_telephone').val('');
          $('#committee_landphone').val('');
          $('#committee_estado').val('');
          $('#committee_cidade').val('');
          $('#committee_address').val('');
          $('#committee_bairro').val('');
        })
        .catch((error) => {
          clearRequire();
          instance.stop();
          console.log(error);
        });
    }
  });

  function appendCommittee(body) {
    const tem = `
      <tr role="row" class="odd">
        <td class="sorting_1">${body.name}</td>
        <td>${body.resonable_name}</td>
        <td>${body.cell_phone}</td>
        <td>${body.address}</td>
        <td><input title="" type="radio" value=""></td>
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
    $('#committee_body').append(tem);
  }

  $('#committee_telephone').keyup(phoneNumberMask);
  $('#committee_landphone').keyup(landPhoneNumberMask);

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

  function landPhoneNumberMask() {
    var num = $(this).val().replace(/\D/g, '');
    // console.log(num);
    // console.log(num.length);
    var telString = `(${num.substring(0, 2)}) ${num.substring(2, 6)}-${num.substring(6, 10)}`;
    $(this).val(telString);
  }

});
