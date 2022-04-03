/*
 * Print Age on OnlineApplicantRegistration-ICSIPAC
 * auto compute by age
 */
function registration_age_computer(){
	window.setInterval(function(){
		dateofbirth = $('.dateofbirth').val();

		birthday_timestamp = date_to_timestamp(dateofbirth);
		age = calculateAge(birthday_timestamp);

		$('.cyd_age').val(age);
	}, 3000);
}