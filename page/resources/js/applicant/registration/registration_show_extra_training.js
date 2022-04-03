function registration_show_extra_training(){
	$('.add-training-button').click(function(){
		$('.add-training-button-row').hide(1);
		$('.extra-training').slideDown('slow');
	});
}