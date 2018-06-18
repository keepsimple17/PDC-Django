/* ------------------------------------------------------------------------------
 *
 *  Dashboard custom configuration
 *  created by Tulga
 *
 *  Version: 1.0
 *  created: Jun 18, 2018
 *
 * ---------------------------------------------------------------------------- */

$(function () {
  /* candidate dropdown */
  $('.candidate-menu li').on('click', function() {
    $('.candidate-toggle').html($(this).find('a').html() + `<span class="caret"></span>`);
  });

  /* language dropdown */
  $('.language-menu li').on('click', function() {
    $('.language-toggle').html($(this).find('a').html() + `<span class="caret"></span>`);
  });
});
