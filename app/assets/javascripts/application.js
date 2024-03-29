// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require pusher
//= require jquery
//= require jquery_ujs
//= require HTML5DesktopNotif
//= require bootstrap
//= require bootstrap-datetimepicker.min
//= require transit
//= require chosen.jquery
//= require d3.v2
//= require d3.layout.min
//= require rickshaw
//= require_self
$(document).ready(function(){
	$('select').chosen();
  var notifPermission = window.webkitNotifications.checkPermission()
  console.log(notifPermission)
  if (notifPermission == 1 ) { //  PERMISSION_NOT_ALLOWED
	// create notification request
	notif_req = '<div class="notif-wizard"><div class="row-fluid"><div class="span10 offset1"><div class="alert alert-info center-text">System membutuhkan izin anda <br/>untuk mempublikasikan notifikasi<br/> <span class="btn btn-mini" id="notifReqTrig">Set Notication Permission</span> </di></div></di></div>'
	$('.root-container .inner').prepend(notif_req)
  }
  function checkNotificationPersmissionCallback(){
	   $('.notif-wizard').remove()
  }
  $('#notifReqTrig').click(function(){
	window.webkitNotifications.requestPermission(checkNotificationPersmissionCallback);
  })

})
Notif.config({
		icon: "/assets/icon_brand.png",
})
function playSound(){
	$('body').append('<audio id="sound"><source src="/assets/iphone_original_tone.mp3" type="audio/mp3"/></audio>')
	document.getElementById('sound').play()
}
function stopSound(){
	document.getElementById('sound').src = ""   
	$('#sound').remove();
}
var pusher = new Pusher('3cfe36bf65b49929fe2a');


// director subscribe to channel
// var nasabah_channel = pusher.subscribe('nasabah_channel');
// nasabah_channel.bind('new', function(data){
//     Notif.show({
//         msg : data.message,
//         title : 'Nasabah Baru',
//         ondisplay : function(){
//             playSound()
//         },
//         onclick : function(){
//             stopSound()
//             window.location.href = data.location
//         }

//     })
// })




function number_format(number, decimals, dec_point, thousands_sep) {
	// http://kevin.vanzonneveld.net
	// +   original by: Jonas Raoni Soares Silva (http://www.jsfromhell.com)
	// +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
	// +     bugfix by: Michael White (http://getsprink.com)
	// +     bugfix by: Benjamin Lupton
	// +     bugfix by: Allan Jensen (http://www.winternet.no)
	// +    revised by: Jonas Raoni Soares Silva (http://www.jsfromhell.com)
	// +     bugfix by: Howard Yeend
	// +    revised by: Luke Smith (http://lucassmith.name)
	// +     bugfix by: Diogo Resende
	// +     bugfix by: Rival
	// +      input by: Kheang Hok Chin (http://www.distantia.ca/)
	// +   improved by: davook
	// +   improved by: Brett Zamir (http://brett-zamir.me)
	// +      input by: Jay Klehr
	// +   improved by: Brett Zamir (http://brett-zamir.me)
	// +      input by: Amir Habibi (http://www.residence-mixte.com/)
	// +     bugfix by: Brett Zamir (http://brett-zamir.me)
	// +   improved by: Theriault
	// *     example 1: number_format(1234.56);
	// *     returns 1: '1,235'
	// *     example 2: number_format(1234.56, 2, ',', ' ');
	// *     returns 2: '1 234,56'
	// *     example 3: number_format(1234.5678, 2, '.', '');
	// *     returns 3: '1234.57'
	// *     example 4: number_format(67, 2, ',', '.');
	// *     returns 4: '67,00'
	// *     example 5: number_format(1000);
	// *     returns 5: '1,000'
	// *     example 6: number_format(67.311, 2);
	// *     returns 6: '67.31'
	// *     example 7: number_format(1000.55, 1);
	// *     returns 7: '1,000.6'
	// *     example 8: number_format(67000, 5, ',', '.');
	// *     returns 8: '67.000,00000'
	// *     example 9: number_format(0.9, 0);
	// *     returns 9: '1'
	// *    example 10: number_format('1.20', 2);
	// *    returns 10: '1.20'
	// *    example 11: number_format('1.20', 4);
	// *    returns 11: '1.2000'
	// *    example 12: number_format('1.2000', 3);
	// *    returns 12: '1.200'
	var n = !isFinite(+number) ? 0 : +number, 
		prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
		sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
		dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
		s = '',
		toFixedFix = function (n, prec) {
			var k = Math.pow(10, prec);
			return '' + Math.round(n * k) / k;
		};
	// Fix for IE parseFloat(0.55).toFixed(0) = 0;
	s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	if (s[0].length > 3) {
		s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	}
	if ((s[1] || '').length < prec) {
		s[1] = s[1] || '';
		s[1] += new Array(prec - s[1].length + 1).join('0');
	}
	return s.join(dec);
}