/*
 * Main JavaScript File
 * Author: Cyd Dalupan (cyddalupan@icloud.com)
 */
$(document).ready(function(){
	page_untrim_title = $(document).find("title").text();
	page_title = page_untrim_title.trim();
	page_title = page_title.replace(/\s/g, '');
	console.log('page title = ',page_title);	

	//Applicant Registration
	if(page_title == "OnlineApplicantRegistration-AlphaTomo(P)Int'lManpowerServices,Inc."){
		registration_age_computer();
		registration_show_more_collage();
		registration_compute_working_experience();
		registration_show_extra_training();
	}

	//admin applicants
	if(page_title == 'Allapplicants-ControlPanel'){
		review();
	}

	//admin Users
	if(page_title == 'Allusers-ControlPanel'){
		users_delete();
	}
	

	//Employer applicants resume
	if (typeof showloading != 'undefined') {
	  showfiles();
	}
	

	
});