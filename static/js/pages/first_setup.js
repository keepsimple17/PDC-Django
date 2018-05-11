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
    const requestNewTokenBtn = $('#request_new_token');
    const requestTokenForm = $('#request_token_form');

    requestNewTokenBtn.click(() => {
        requestTokenForm.show();
        requestNewTokenBtn.hide();
    });
});
