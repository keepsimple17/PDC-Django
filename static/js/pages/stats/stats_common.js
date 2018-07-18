/**
 * Created by paul on 03/05/2018.
 */
$(function () {
  /* candidate dropdown */
  $('.candidate-menu li').on('click', function () {
    console.log('changing candidate...');
    onChangeCandidato($(this).attr('data-json'));
    $('.candidate-toggle').html($(this).find('a').html() + ` <span class="caret"></span>`);
  });

  const onChangeCandidato = (jsonStr) => {
    const candidator = JSON.parse(jsonStr);
    console.log(candidator);
    $('#candidate_nickname').html(candidator.candidate_political_nickname);
    const facebookid = candidator.facebook.startsWith('@') ? candidator.facebook.substr(1) : candidator.facebook;
    const iframe_src = `http://18.218.2.246/topic_modeling/api/v1.0/posts?name=${facebookid}&type=facebook`;
    document.getElementById('segment_iframe').src = iframe_src;
    // $('#segment_iframe').src = iframe_src;
    // change candidate info
    $('#candidate_desited_position').html(candidator.campaign_desired_position.position);
    $('#candidate_state_campaign').html(candidator.state_campaign || 'PR');
  };
});
