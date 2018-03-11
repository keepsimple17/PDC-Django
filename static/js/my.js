/* ------------------------------------------------------------------------------
 *
 *  # Common JS
 *
 *  Mike Jin Javascript code assets here
 *
 *  Version: 1.0
 *  Latest update: August 19, 2016
 *
 * ---------------------------------------------------------------------------- */

// Date Time Control ----------------------------------------------------------
function timeSince(date) {
    var seconds = Math.floor((new Date() - date) / 1000);

    var interval = Math.floor(seconds / 31536000);

    if (interval > 1) {
        return interval + " years";
    }
    interval = Math.floor(seconds / 2592000);
    if (interval > 1) {
        return interval + " months";
    }
    interval = Math.floor(seconds / 86400);
    if (interval > 1) {
        return "In " + interval + " days";
    }
    interval = Math.floor(seconds / 3600);
    if (interval > 1) {
        return interval + " hours ago";
    }
    interval = Math.floor(seconds / 60);
    if (interval > 1) {
        return interval + " minutes ago";
    }
    return Math.floor(seconds) + " seconds ago";
}

function formatAMPM(date) {
	var hours = date.getHours();
	var minutes = date.getMinutes();
	var ampm = hours >= 12 ? 'pm' : 'am';

	hours = hours % 12;
	hours = hours ? hours : 12; // the hour '0' should be '12'
	minutes = minutes < 10 ? '0'+minutes : minutes;

	var strTime = hours + ':' + minutes + ' ' + ampm;	
	return strTime;
}

function todayFormat(date) {
	return timeSince(date);
}
function yesterdayFormat(date) {
	return "Yesterday, " +  formatAMPM(date);
}
function otherdayFormat(date) {
	var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    return date.getDate() + ", " + monthNames[date.getMonth()] + ", " + date.getFullYear() + "  "+ formatAMPM(date);
}
// end of Date Time Control ----------------------------------------------------------


function get_fileicon(filename) {   
    var ext = filename.split('.')[1];
    var ext_arrary = {  "pdf":"icon-file-pdf text-pink",
                        "zip":"icon-file-zip text-slate",
                        "txt":"icon-file-text2 text-slate",
                        "xml":"icon-file-xml text-blue",
                        "doc":"icon-file-word text-blue",
                        "docx":"icon-file-word text-blue",
                        "xls":"icon-file-excel text-green",
                        "xlsx":"icon-file-excel text-green",
                        "ppt":"icon-file-presentation text-pink",
                        "pptx":"icon-file-presentation text-pink",
                        "jpg":"icon-file-picture text-blue",
                        "png":"icon-file-picture text-blue",
                        "gif":"icon-file-picture text-blue" }
    //console.log(ext_arrary[ext]);
    if (ext_arrary[ext]) {
        return ext_arrary[ext];
    } else {
        return "icon-file-empty";
    }
}

function get_filename(fileField) {
    return fileField.replace(/^.*[\\\/]/, '');
}
