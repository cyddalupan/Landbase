function showfiles(){
	console.log('function employer/applicants/resume/showfiles');

	applicant_id = $('.applicant_id').val();
	$.post( base_url + 'page/get_files',{applicant_id:applicant_id},function(jsonresult){	
		//clear value
		$('.cyd_output_files').html('<div class="cyd_back">Back</div>');
		$('.cyd_back').hide(1);
		jQuery.each( jsonresult, function( i, val ) {
			if(val.file_status == 1 && !is_stepup_files(val.file_type)){
				//design
				cyd_html = 
				'<div class="cyd_each_document">' +
					'<h1>' + 
						val.file_type + 
					'</h1>' +
					'<img src="' + 
						base_url + 
						val.file_path +
					'" />' + 

				'</div>';
			  	$('.cyd_output_files').append(cyd_html);
		  	}
		});
	},"json")
	.fail(function() {
	    alert( "Can't Load Files" );
	})
	.done(function() {
		zoom_file();
		back_file();
	});
}