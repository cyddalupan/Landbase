function zoom_file(){
    $('.cyd_each_document').click(function(){
		console.log('function employer/applicant/resume/zoom_file');
    	$('.cyd_back').show(1);
		$('.cyd_each_document').fadeOut('slow');
		$(this).fadeIn(1);
		$(this).css('width','100%');
		$('.cyd_each_document img').css('width','100%');
	});
	
}