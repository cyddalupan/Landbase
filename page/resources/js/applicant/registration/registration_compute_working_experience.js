function registration_compute_working_experience(){
	console.log('function applicant/registration/registration_compute_working_experience');
	window.setInterval(function(){
		workstarted = $('.work-started').val();
		workended = $('.work-ended').val();
		experience = workended - workstarted;
		$('.work-years').val(experience);
		return false;
	}, 3000);
}