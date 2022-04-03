cyd_exp_cnt = 0;

$(document).ready(function(){
    //get cyd-exam-date original value
    cydIssueDate = $('.cyd-issue-date').val();

    //run a script every second
    window.setInterval(function(){
    	console.log(cydIssueDate);
        //if param1 change, get value of param2, add 90 days and put to param3
        add90days2result(cydIssueDate,'.cyd-issue-date','.cyd-expired-date');
    }, 1000);
});

//add 90 days to resultClass from gclass, and test orinal if change
function add90days2result(orinal,gclass,resultClass){
    //check if original value of orinal change
    if(orinal != $(gclass).val()){
        //update new value of orinal
        orinal = $(gclass).val();
        //add 90 days to orinal
        orinal = addDays(orinal,1824);
        //change resultClass value to orinal with 90 days addition
        $(resultClass).val(orinal);
    }
}

//date day adder
function addDays(date, days) {
    var result = new Date(date);
    result.setDate(result.getDate() + days);
    return formatDate(result);
}

//convert date to Y-m-d
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}

var addWorkExperience = function(event) {
	cyd_exp_cnt++;
	console.log('prev work count = '+cyd_exp_cnt);
	event.preventDefault();
	
	var row = $('<div>').attr({
		'class': 'row work-experience'
	}).appendTo( $('.work-experience-start') );
	
	var col = $('<div>').addClass('col-sm-2');
	
	var companyGroup = $('<div>').addClass('form-group');	
	var companyLabel = $('<label>').text('Company').appendTo(companyGroup);	
	var company	= $('<input>').attr({
		'type': 'text',
		'name': 'applicant[work-experience][company][]',
		'class': 'form-control',
	}).appendTo(companyGroup);
	
	var positionGroup = $('<div>').addClass('form-group');	
	var positionLabel = $('<label>').text('Position').appendTo(positionGroup);
	var position	= $('<div>').attr({
		'class': 'cyd-posi-'+cyd_exp_cnt,
	}).appendTo(positionGroup);
	/*
	var position	= $('<input>').attr({
		'type': 'text',
		'name': 'applicant[work-experience][position][]',
		'class': 'form-control',
	}).appendTo(positionGroup);
	*/
	
	var salaryGroup = $('<div>').addClass('form-group');	
	var salaryLabel = $('<label>').text('Salary').appendTo(salaryGroup);	
	var salary	= $('<input>').attr({
		'type': 'text',
		'name': 'applicant[work-experience][salary][]',
		'class': 'form-control',
		'placeholder': '0.00'
	}).appendTo(salaryGroup);

    var hospitalLevelGroup = $('<div>').addClass('form-group');    
    var salaryLabel = $('<label>').text('').appendTo(hospitalLevelGroup);  
    var salary  = $('<input>').attr({
        'type': 'hidden',
        'name': 'applicant[work-experience][hospital_level][]',
        'class': 'form-control',
        'placeholder': '0.00'
    }).appendTo(hospitalLevelGroup);

	var countryGroup = $('<div>').addClass('form-group');	
	var countryLabel = $('<label>').text('Country').appendTo(countryGroup);	
	/*var country	= $('<div>').attr({
		'class': 'cyd-country-'+cyd_exp_cnt,
	}).appendTo(countryGroup);
	*/
	var country	= $('<input>').attr({
		'type': 'text',
		'name': 'applicant[work-experience][country][]',
		'class': 'form-control',
	}).appendTo(countryGroup);
	
	
	var fromGroup = $('<div>').addClass('form-group');	
	var fromLabel = $('<label>').text('From').appendTo(fromGroup);	
	var from	= $('<input>').attr({
		'name': 'applicant[work-experience][from][]',
		'type': 'text',
		'data-date-format': 'yyyy-mm-dd',
		'class': 'form-control input-sm date-picker work-started cyd-work-started-'+cyd_exp_cnt,
		'placeholder': 'yyyy-mm-dd',
		'value': '',
	}).appendTo(fromGroup);
    
    from.on('keyup', computeWorkExperienceYears );
	
	var toGroup = $('<div>').addClass('form-group');	
	var toLabel = $('<label>').text('To').appendTo(toGroup);	
	var to	= $('<input>').attr({
		'name': 'applicant[work-experience][to][]',
		'type': 'text',
		'data-date-format': 'yyyy-mm-dd',
		'class': 'form-control input-sm date-picker work-ended cyd-work-ended-'+cyd_exp_cnt,
		'placeholder': 'yyyy-mm-dd',
		'value': '',
	}).appendTo(toGroup);
    
    to.on('keyup', computeWorkExperienceYears );
	
	var yearGroup = $('<div>').addClass('form-group');	
	var yearLabel = $('<label>').text('Years').appendTo(yearGroup);	
	var year	= $('<input>').attr({
		'type': 'text',
		'name': 'applicant[work-experience][years][]',
		'class': 'form-control cyd-work-years-'+cyd_exp_cnt,
		'placeholder': '0',
        'readonly':'readonly'
	}).appendTo(yearGroup);
	
	var remove = $('<a>').attr({
		'href': '#',
		'role': 'button',
		'class': 'btn btn-danger btn-xs'
	}).text('Remove').on('click', function(event) {
		event.preventDefault();
		row.fadeOut(function() { $(this).remove(); });
	});

	var separator = $('<div>').addClass('work-experience-separator');
	
	row.append(col.clone().attr('class', 'col-sm-4').append(companyGroup));
	row.append(col.clone().attr('class', 'col-sm-2').append(positionGroup));
	row.append(col.clone().attr('class', 'col-sm-2').append(salaryGroup));
    row.append(col.clone().attr('class', 'col-sm-2').append(hospitalLevelGroup));
	row.append(col.clone().attr('class', 'col-sm-4').append(countryGroup));
	row.append(col.clone().attr('class', 'col-sm-2').append(fromGroup));
	row.append(col.clone().attr('class', 'col-sm-2').append(toGroup));
	row.append(col.clone().attr('class', 'col-sm-1').append(yearGroup));
	row.append(col.clone().attr('class', 'col-sm-1').append(remove));
	
	$('.work-experience-start').append( separator );
    $('.date-picker').datepicker();

    positionDropHtml = $('.cyd-copy-posi').html(); //get position from the init form
    positionDropHtml = positionDropHtml.replace(/(\r\n|\n|\r)/gm,""); //clean break and tab
    $('.cyd-posi-'+cyd_exp_cnt).html(positionDropHtml); //show all position drop down
 
    countryDropHtml = $('.cyd-copy-country').html(); //get position from the init form
    countryDropHtml = countryDropHtml.replace(/(\r\n|\n|\r)/gm,""); //clean break and tab
    $('.cyd-country-'+cyd_exp_cnt).html(countryDropHtml); //show all position drop down
}; 

var computeWorkExperienceYears = function() {
    var totalYears = 0;
    
    $('.work-experience').each(function(index, element) {
        
        var row = $(this);
        
        var years = 0;    
        var from  = row.find('.work-started');
        var to    = row.find('.work-ended');
        
        from = $.isNumeric( parseFloat( from.val() ) ) ? parseFloat( from.val() ) : 0;
        to   = $.isNumeric( parseFloat( to.val() ) ) ? parseFloat( to.val() ) : 0;
        
        years       = ( to - from ) <= 0 ? 0 : ( to - from );        
        totalYears += years;
        
        row.find('.work-years').val( years );
    });
    
    $('.work-experience-years').text( totalYears );
};

var previewImage = function() {
	var $input = $(this);
	
	var allowedTypes = [ "image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp" ];
	
	if ( typeof this.files[0] == 'undefined' || this.files[0].size == 0 || !$.inArray(this.files[0].type, allowedTypes ) ) { 
		alert('Invalid image file');
		return false;
	}
	
	var file = this.files[0];
	var reader = new FileReader();
	
	reader.onload = function(event) {
		$('.profile-photo').attr("src", event.target.result);
	}; 
	reader.onerror = function(event) {
		alert("Error: " + event.target.error.code);
	};
	reader.readAsDataURL(file);  
}

$(document).ready(function() {
	
	$('button.btn-photo-browse').on('click', function(event) {
		event.preventDefault();
		$('input[name="applicant[photo]"]').click();
	});
	
	$('input[name="applicant[photo]"]').change(previewImage);
	
    //--Bootstrap Date Picker--
    $('.date-picker').datepicker();
	
	$('select[name="applicant[position]"]').select2({
		placeholder: "Select a position",
		allowClear: true
	});
	
	$('select[name="applicant[other-preferred-countries][]"]').select2({
		placeholder: "Select country",
		allowClear: true
	});
	
	$('select[name="applicant[other-preferred-positions][]"]').select2({
		placeholder: "Select position",
		allowClear: true
	});
	
	$('#btn-add-work-experience').on('click', addWorkExperience);
	$('.row.work-experience a.btn').on('click', function(event) {
		event.preventDefault();
		$(this).closest('.row.work-experience').fadeOut(function() { $(this).remove(); });
	});
    
    $('.work-experience .work-started, .work-experience .work-ended').on('keyup', computeWorkExperienceYears );
});

//cyd Javascript
//Count User Experience
window.setInterval(function(){
	//total work years
	rgtrWrkStr = $('.cyd-work-started-1').val();
	rgtrWrEnd = $('.cyd-work-ended-'+cyd_exp_cnt).val();

	rgtrWrkStrYr  = rgtrWrkStr.substring(0,4);
	rgtrWrEndYr  = rgtrWrEnd.substring(0,4);

	rgtrWrkStrMn = rgtrWrkStr.substring(5,7);
	rgtrWrEndMn = rgtrWrEnd.substring(5,7);

	cydTotalYr = rgtrWrEndYr - rgtrWrkStrYr;

	cydRegMsg = cydTotalYr + " Year(s)";

	if(rgtrWrkStrMn < rgtrWrEndMn){
		cydRegMsg = cydRegMsg+" And "+(rgtrWrEndMn - rgtrWrkStrMn)+" Month(s)";
	}
	$('.cyd-work-experience-years').html(cydRegMsg);

	for(wrx = 1; wrx <= cyd_exp_cnt; wrx++){
		//console.log('wrx = '+ wrx + '.cyd-work-years-'+wrx);
		srgtrWrkStr = $('.cyd-work-started-'+wrx).val();
		srgtrWrEnd = $('.cyd-work-ended-'+wrx).val();
		srgtrWrkStrYr  = srgtrWrkStr.substring(0,4);
		srgtrWrEndYr  = srgtrWrEnd.substring(0,4);
		stotal =  srgtrWrEndYr - srgtrWrkStrYr;
		$('.cyd-work-years-'+wrx).val(stotal);	
	}

}, 5000);

