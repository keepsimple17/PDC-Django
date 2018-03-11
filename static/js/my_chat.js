/* ------------------------------------------------------------------------------
 *
 *  # Message Board JS
 *
 *  Mike Jin Javascript code assets here
 *
 *  Version: 1.0
 *  Latest update: September 20, 2016
 *
 * ---------------------------------------------------------------------------- */
function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) == (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
var csrftoken = getCookie('csrftoken');

var join_url	 = "/message/join/";
var leave_url	 = "/message/leave/";
var sync_url	 = "/message/sync/";
var send_url	 = "/message/send/";
var send_attachment_url = "/message/send_attachment/";
var receive_url	 = "/message/receive/";

var last_msg_received = 0;
var last_att_received = 0;
var last_log_received = 0;

/**
 * Tells the chat app that we are joining	
 */
function chat_join() {
	$.ajax({
		async: false,
        type: 'POST',
        data: {'csrfmiddlewaretoken':csrftoken},
        url: join_url,
    });
}

/**
 * Tells the chat app that we are leaving
 */
function chat_leave() {
	$.ajax({
		async: false,
        type: 'POST',
        data: {'csrfmiddlewaretoken':csrftoken},
        url: leave_url,
    });
}

// attach join and leave events and init chat
$(window).load(function(){chat_join()});
$(window).unload(function(){chat_leave()});
$(window).on( "beforeunload", function(){chat_leave()} );
$(window).ready(function(){init_chat()});

/**
 * Initialize chat:
 * - Set the room id
 * - Generate the html elements (chat box, forms & inputs, etc)
 * - Sync with server
 * @param chat_room_id the id of the chatroom
 * @param html_el_id the id of the html element where the chat html should be placed
 * @return
 */
function init_chat() {
	layout_and_bind();
	sync_messages();
}

var img_dir = "/static/img/";

var attached_file;

/**
 * Generate the Chat box's HTML and bind the ajax events
 * @param target_div_id the id of the html element where the chat will be placed 
 */
function layout_and_bind() {
	// layout stuff
	
	// send msg event stuff
	$("#chat-form").submit( function (event) {
		event.preventDefault();

        var values = {};
    /*
        var $inputs = $(this).children('input');			            
        values['message'] = $('#enter-message').val();			
        $inputs.each(function(i,el) { 
        	values[el.name] = $(el).val();
        	//console.log(el.name);
        });
	*/
        values['csrfmiddlewaretoken'] = csrftoken;
        values['message'] = $('#enter-message').val();

    	$.ajax({
            data: values,
            dataType: 'json',
            type: 'post',
            url: send_url
        });

        $('#enter-message').val('');
        return false;
	});


	//file upload icon click event
	$("#iconAttachment").on('click',function(){
		$('input[type=file]').trigger('click');
	});
	// attachment file select event stuff
	$('input[type=file]').on('change', prepareUpload);
	// submit attachment event
	$("#attach-form").submit( function (event) {
        event.preventDefault();
		
        // Create a jQuery object from the form
	    //$form = $(event.target);
        var data = new FormData();
        data.append('csrfmiddlewaretoken', csrftoken);
	    data.append('fileAttachment', attached_file);

	    $.ajax({
	        url: send_attachment_url,
	        type: 'POST',
	        data: data,
	        cache: false,
	        processData: false,
	        contentType: false,
	        success: function (json) {
        		$('#fileAttachment').val('');
			}
	    });
        return false;
	});
};

function prepareUpload(event)
{  	
  	attached_file = event.target.files[0];
  	$("#attach-form").submit();
}

/**
 * Asks the server which was the last message sent to the room, and stores it's id.
 * This is used so that when joining the user does not request the full list of
 * messages, just the ones sent after he logged in. 
 * @return
 */
function sync_messages() {
    $.ajax({
        type: 'POST',
        data: {'csrfmiddlewaretoken':csrftoken},
        url: sync_url,
		dataType: 'json',
		success: function (json) {
        	last_msg_received = json.last_message_id;
        	last_att_received = json.last_attachment_id;
        	last_log_received = json.last_log_id;
        	//console.log(last_att_received);
		}
    });
	
	setTimeout("get_messages()", 2000);
}

/**
 * Gets the list of messages from the server and appends the messages to the chatbox
 */
function get_messages() {
    $.ajax({
        type: 'POST',
        data: {offset: window.last_msg_received, 'csrfmiddlewaretoken':csrftoken, offset_attachment: window.last_att_received, offset_log: window.last_log_received},
        url: receive_url,
		dataType: 'json',
		success: function (json) {
			// add messages
			$('#userList').empty();

			$.each(json, function(i,m){

				switch(m.object_type) {

				    case "member":
						$('#userList').append(
								'<li class="media">\
									<a href="#" class="media-link">\
										<div class="media-left media-middle">\
											<span class="status-mark bg-success"></span>\
										</div>\
										<div class="media-body">\
											<span class="media-heading text-semibold"> '+m.first_name+' '+m.last_name+' </span>\
										</div>\
									</a>\
								</li>'
							);
				        break;

				    case "message":
				        var msg_date = new Date(m.created_date.replace(' ', 'T'));
				        //console.log(m.created_date.replace(' ', 'T'));
					
						if(m.me.toString() == m.sender.toString()){

							$('#chatList').append(
								'<li class="media reversed">\
									<div class="media-body">\
										<div class="media-content">' + m.message + '</div>\
										<span class="media-annotation display-block mt-10">Posted by <span class="text-primary">'
										+ m.sender_first_name + ' ' + m.sender_last_name  +'</span> : '+ otherdayFormat(msg_date) 
										+ '<a href="#"><i class="icon-pin-alt position-right text-muted"></i></a></span>\
									</div>\
								</li>'
							);

						}else{

							$('#chatList').append(
								'<li class="media">\
									<div class="media-body">\
										<div class="media-content">' + m.message + '</div>\
										<span class="media-annotation display-block mt-10">Posted by <span class="text-primary">'
										+ m.sender_first_name + ' ' + m.sender_last_name  +'</span> : '+ otherdayFormat(msg_date) 
										+ '<a href="#"><i class="icon-pin-alt position-right text-muted"></i></a></span>\
									</div>\
								</li>'
							);

						}
						
						last_msg_received = m.id;
						// scroll to bottom
						$('#chatList').scrollTop($('#chatList').prop("scrollHeight"));
				        break;

				    case "attachment":
				        var filename = get_filename(m.attachment);
				        var ext_css = get_fileicon(m.attachment);
				        $('#attachmentList').append(
				        	'<li class="media">\
								<a href="/abcmedia/'+m.attachment+'" class="media-link" target="_blank">\
									<div class="media-left text-pink"><i class="'+ext_css+'"></i></div>\
									<div class="media-body">\
										<span class="media-heading text-semibold">'+filename+'</span>\
										<span class="media-annotation">Attached by <span class="text-primary-300"> '+m.sender_first_name + ' ' + m.sender_last_name  +' </span> :  '+m.created_date+' </span>\
									</div>\
								</a>\
							</li>'
				        );

				        last_att_received = m.id;
				        // scroll to bottom
						$('#attachmentList').scrollTop($('#attachmentList').prop("scrollHeight"));
				        break;

				    case "log":
				    	var css_icon = "";
				    	var css_color = "";
				    	switch(m.log_type) {
				    		case "SN_JOIN":
				    			css_icon = "icon-plus3";
				    			css_color = "text-primary-300";//border-primary 
				    			break;
				    		case "SN_LEFT":
				    			css_icon = "icon-cross2";
				    			css_color = "text-danger-300";//border-danger 
				    			break;
				    		case "SN_ATTACH":
				    			css_icon = "icon-checkmark3";
				    			css_color = "text-success-300";//border-success 	    			
				    			break;
				    		default:
				    			css_icon = "icon-infinite";
				    			css_color = "text-slate";//border-slate 		    			
				    	}
				        $('#chatList').append(
							'<li class="media-annotation">\
								<a href="#" class="btn '+css_color+' btn-xs btn-rounded">\
									<i class="'+css_icon+'"></i></a>  <span class="text-semibold">'+m.comment+'</span> : <span class="text-muted">'+m.created_date+'</span> '+
								''+
							'</li>'
						);

				        last_log_received = m.id;
				        // scroll to bottom
						$('#chatList').scrollTop($('#chatList').prop("scrollHeight"));
				        break;

				    default:
				        ////console.log("default");
				}// end switch
			});//end each loop
		}// end success function
    });//end ajax call
	// wait for next
	setTimeout("get_messages()", 2000);
}


// emoticons
var emoticons = {                 
	'>:D' : 'emoticon_evilgrin.png',
	':D' : 'emoticon_grin.png',
	'=D' : 'emoticon_happy.png',
	':\\)' : 'emoticon_smile.png',
	':O' : 'emoticon_surprised.png',
	':P' : 'emoticon_tongue.png',
	':\\(' : 'emoticon_unhappy.png',
	':3' : 'emoticon_waii.png',
	';\\)' : 'emoticon_wink.png',
	'\\(ball\\)' : 'sport_soccer.png'
}

/**
 * Regular expression maddness!!!
 * Replace the above strings for their img counterpart
 */
function replace_emoticons(text) {
	$.each(emoticons, function(char, img) {
		re = new RegExp(char,'g');
		// replace the following at will
		text = text.replace(re, '<img src="'+img_dir+img+'" />');
	});
	return text;
}