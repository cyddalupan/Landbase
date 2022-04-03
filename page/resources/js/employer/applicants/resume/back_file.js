function back_file(){
	$('.cyd_back').click(function(){
		console.log('function employer/applicant/resume/back_file');
    	$('.cyd_back').hide(1);
		$('.cyd_each_document').fadeIn('slow');
		$('.cyd_each_document').css('width','218px');
		$('.cyd_each_document img').css('width','181px');
	});
}