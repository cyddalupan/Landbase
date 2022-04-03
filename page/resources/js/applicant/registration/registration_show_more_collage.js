/*
 * Show more Collage When 
 * Click [Add More]
 */
function registration_show_more_collage(){
	console.log('function applicant/registration/registration_show_more_collage()');
	$('.add-collage-button').click(function(){
		$('.add-collage-button-row').fadeOut(1);
		$('.extra-collage').fadeIn('slow');
	});
}