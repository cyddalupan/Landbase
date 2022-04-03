$(document).ready(function(){
    cyd_exp_cnt = $('.prev_work_cnt').val();

    //get cyd-exam-date original value
    cydExamDate = $('.cyd-exam-date').val();
    //get cyd-visa-date original value
    cydVisaDate = $('.cyd-visa-date').val();
    

    //run a script every second
    window.setInterval(function(){
        //if param1 change, get value of param2, add 90 days and put to param3
        add90days2result(cydExamDate,'.cyd-exam-date','.cyd-medical-expiration');
        //if param1 change, get value of param2, add 90 days and put to param3
        add90days2result(cydVisaDate,'.cyd-visa-date','.cyd-visa-expired');
    }, 1000);
});

//add 90 days to resultClass from gclass, and test orinal if change
function add90days2result(orinal,gclass,resultClass){
    //check if original value of orinal change
    if(orinal != $(gclass).val()){
        //update new value of orinal
        orinal = $(gclass).val();
        //add 90 days to orinal
        orinal = addDays(orinal,90);
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

// Anonymous functions
var addWorkExperience = function (event) {
    cyd_exp_cnt++;
	
    event.preventDefault();
	
	var row = $('<div>').attr({
		'class': 'row work-experience'
	}).appendTo( $('.work-experience-start') );
	
	var col = $('<div>').addClass('col-sm-2');
	
	var companyGroup = $('<div>').addClass('form-group');	
	var companyLabel = $('<label>').text('Company / Employer Name').appendTo(companyGroup);	
	var company	= $('<input>').attr({
		'type': 'text',
		'name': 'applicant[work-experience][company][]',
		'class': 'form-control',
	}).appendTo(companyGroup);

    var nationalityGroup = $('<div>').addClass('form-group');   
    var nationalityLabel = $('<label>').text('Nationality / Country').appendTo(nationalityGroup); 
    var nationality = $('<input>').attr({
        'type': 'text',
        'name': 'applicant[work-experience][nationality][]',
        'class': 'form-control',
    }).appendTo(nationalityGroup);
	
	
	
	
	
	var positionGroup = $('<div>').addClass('form-group');	
	var positionLabel = $('<label>').text('Position').appendTo(positionGroup);	
	var position	= $('<input>').attr({
		'type': 'text',
		'name': 'applicant[work-experience][position][]',
		'class': 'form-control',
	}).appendTo(positionGroup);

	
	var NoFamilyMembersGroup = $('<div>').addClass('form-group');  
    var NoFamilyMembersLabel = $('<label>').text('No. of Family Members').appendTo(NoFamilyMembersGroup);  
    var NoFamilyMembers    = $('<input>').attr({
        'type': 'text',
        'name': 'applicant[work-experience][NoFamilyMembers][]',
        'class': 'form-control',
    }).appendTo(NoFamilyMembersGroup);
	
	var typeOfResidenceGroup = $('<div>').addClass('form-group');  
    var typeOfResidenceLabel = $('<label>').text('Type of Residence').appendTo(typeOfResidenceGroup);  
    var typeOfResidence    = $('<input>').attr({
        'type': 'text',
        'name': 'applicant[work-experience][typeOfResidence][]',
        'class': 'form-control',
    }).appendTo(typeOfResidenceGroup);
	
	var salaryGroup = $('<div>').addClass('form-group');	
	var salaryLabel = $('<label>').text('Salary').appendTo(salaryGroup);	
	var salary	= $('<input>').attr({
		'type': 'text',
		'name': 'applicant[work-experience][salary][]',
		'class': 'form-control',
		'placeholder': '0.00'
	}).appendTo(salaryGroup);

    var countryGroup = $('<div>').addClass('form-group');   
    var countryLabel = $('<label>').text('Country / Address').appendTo(countryGroup); 
    var country = $('<input>').attr({
        'type': 'text',
        'name': 'applicant[work-experience][country][]',
        'class': 'form-control',
    }).appendTo(countryGroup);
	
	var fromGroup = $('<div>').addClass('form-group'); 
    var fromLabel = $('<label>').text('From').appendTo(fromGroup);  
    var from    = $('<input>').attr({
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
    var to  = $('<input>').attr({
        'name': 'applicant[work-experience][to][]',
        'type': 'text',
        'data-date-format': 'yyyy-mm-dd',
        'class': 'form-control input-sm date-picker work-ended cyd-work-ended-'+cyd_exp_cnt,
        'placeholder': 'yyyy-mm-dd',
        'value': '',
    }).appendTo(toGroup);
    
    to.on('keyup', computeWorkExperienceYears );

    var reasonOfLeavingGroup = $('<div>').addClass('form-group');  
    var reasonOfLeavingLabel = $('<label>').text('Reason of Leaving').appendTo(reasonOfLeavingGroup);  
    var reasonOfLeaving    = $('<input>').attr({
        'type': 'text',
        'name': 'applicant[work-experience][reasonOfLeaving][]',
        'class': 'form-control',
    }).appendTo(reasonOfLeavingGroup);
	
	var yearGroup = $('<div>').addClass('form-group');	
	var yearLabel = $('<label>').text('Years').appendTo(yearGroup);	
	var year	= $('<input>').attr({
		'type': 'text',
		'name': 'applicant[work-experience][years][]',
		'class': 'form-control work-years',
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
    row.append(col.clone().attr('class', 'col-sm-4').append(nationalityGroup));
	 row.append(col.clone().attr('class', 'col-sm-2').append(fromGroup));
    row.append(col.clone().attr('class', 'col-sm-2').append(toGroup));
	row.append(col.clone().attr('class', 'col-sm-8').append(countryGroup));
    row.append(col.clone().attr('class', 'col-sm-4').append(positionGroup));
	row.append(col.clone().attr('class', 'col-sm-4').append(NoFamilyMembersGroup));
    row.append(col.clone().attr('class', 'col-sm-4').append(typeOfResidenceGroup));
    row.append(col.clone().attr('class', 'col-sm-4').append(salaryGroup));
 
    row.append(col.clone().attr('class', 'col-sm-8').append(reasonOfLeavingGroup));
    row.append(col.clone().attr('class', 'col-sm-1').append(remove));
    
    $('.work-experience-start').append( separator );
    $('.date-picker').datepicker();
}; 


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
                                                                                                                        
var populateJobOffers = function ( appId ) {

    $.ajax({
        async: false,
        url:  siteUrl + 'admin/ajax/applicants/job-offers',
        data: {
            'ai': appId
        },
        type: 'POST',
        dataType: 'json',
        success: function( response) {
            document.data = response;
            console.log(response);
            
            var select      = $('select[name="applicant[requirement][job-offer]"]');
            var emptyOption = $('<option>').attr('value', '0').text('-- No job offer --');
            var selectedVal = select.val();

            select.html('');
            select.append( emptyOption );

            $.each(response.jobs, function( index, job ) {
                var option = $('<option>').attr('value', job.job_id).text(job.job_name);

                if ( selectedVal == job.job_id ) {
                    option.attr('selected', 'selected');
                }

                option.appendTo(select);
            });

        }
    });
    
};

var previewImage = function() {
    var $input = $(this);
    
    var allowedTypes = [ "image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp" ];
    
    if ( typeof this.files[0] == 'undefined' || this.files[0].size == 0 || $.inArray(this.files[0].type, allowedTypes ) < 0) { 
        alert('Invalid image file');
        return false;
    }
    
    var file = this.files[0];
    var reader = new FileReader();
    
    reader.onload = function(event) {
        $('.profile-photo').attr("src", event.target.result);

        $('.button-container').addClass('hide');
        $('.form-container').hide().removeClass('hide').show();
    }; 
    reader.onerror = function(event) {
        alert("Error: " + event.target.error.code);
    };
    reader.readAsDataURL(file);  
}

//Page script
$('button.btn-file-browse').on('click', function( event ) {
    event.preventDefault();
    $('input[name="applicant[file][file]"]').click();
});

$('input[name="applicant[file][file]"]').on('change', function( event ) {
    $('input[name="applicant[file][name]"]').val( $(this).val() );
});

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

//--Fuelux Spinner--
//$('.spinner').spinner();

$('#btn-add-work-experience').on('click', addWorkExperience);
$('.row.work-experience a.btn').on('click', function(event) {
    event.preventDefault();
    $(this).closest('.row.work-experience').fadeOut(function() { $(this).remove(); });
});

$('.btn-change-designation, .btn-change-education, .btn-change-experience, .btn-change-visa').on('click', function( event ) {
    event.preventDefault();
    $( $(this).attr('data-target') ).hide().removeClass('hide').slideDown();
    $(this).closest('span').remove();
}); 

//Scroll to page tab
$('.tabbable ul.nav.nav-tabs li a').on('click', function( event ) {
    var $container = $(this).closest('.tabbable');
    $("html, body").animate({ scrollTop: $container.offset().top }, "fast");
});

$('.work-experience .work-started, .work-experience .work-ended').on('keyup', computeWorkExperienceYears );

$('.chk-visible').on('change', function( event ) {
    var visible = $(this).is(':checked');
    var scope   = $(this).attr('data-scope');
    var appId   = $(this).attr('data-applicant');
     
    $.ajax({
        url: siteUrl + 'admin/ajax/applicants/update-visibility/',
        type:'POST',
        data: {
            'ai':      appId,
            'scope':   scope,
            'visible': visible ? 1 : 0
        },
        success: function( response) {
            console.log(response);
        }
    });
    
});

$('.cyd_file_delete').click(function(){
    fileid = $(this).attr('file-id');
    $.post( siteUrl + 'page/delete_file',{fileid:fileid},function(result){
        console.log(result);
        $('.file_row_'+fileid).fadeOut('slow');
    })
    .fail(function() {
        alert( "error" );
    });
});

$('#modalApplicantReview form:not(.form-except)').on('submit', function( event ) {
    event.preventDefault();
    
    var form  = $(this);
    var modal = $(this).closest('#modalApplicantReview');
    
    var appId = form.find('input[name="applicant_id"]:hidden').val();
    form.find(':submit').text('Please wait...');
    
    form.ajaxSubmit({
        async:      false,
        url:        siteUrl + 'admin/applicants/review/' + appId,
        type:       'POST',
        dataType:   'json',
        beforeSubmit: function() {},
        success:    function(response) {
            document.data = response;
            console.log(response);
            
            if ( response.status && response.scope == 'file' ) {
                
                //alert( response.message );
                //modal.find('.modal-body').html('');
                //modal.modal('hide');

                cyd_date = new Date();
                cyd_filename = $('.cyd_filename').val();
                $('.cyd_filename').val(' ');
                cyd_img_path = response.name;
                cyd_path = response.path;
                cyd_type = $('.cyd_type').val();
                $('.cyd_upload').text('Upload');
                cyd_illu_add_me = '<tr><td>'+cyd_date+'</td><td>'+cyd_filename+'</td><td>'+cyd_type+'</td><td>32 871 kb</td><td style="word"><a style="word-wrap:break-word" href="#" title="Open file""><code>'+cyd_img_path+'</code></a></td><td align="center"><a href="#" data-lightbox="preview-slide" data-title="#"><img src="'+siteUrl+"/"+cyd_path+'" alt="Resume" class="img-rounded" height="80"></a></td><td><small>[loading...]</small></td><td>Refresh Page<br/>to remove<br/>photo</td></tr>';
                $('.cyd_illu').prepend(cyd_illu_add_me);

                $('.hideme_'+cyd_type).css('display','none');
                $('.cyd_type').val('');

                return false;
            } else if ( response.status && response.scope == 'status'  ) {                

                form.find(':submit').text( form.find(':submit').attr('data-text') );

                populateJobOffers( appId );

                alert( response.message );

                return;

            } else if ( response.status  ) {
                form.find(':submit').text( form.find(':submit').attr('data-text') );
                
                alert( response.message );

                return;
            }
            
            alert( response.message );
            return;
        }
    });
});


$('a.btn-photo-browse').on('click', function(event) {
    event.preventDefault();
    $('input[name="applicant[photo]"]').click();
});

$('input[name="applicant[photo]"]').change(previewImage);

$('form#frmUploadPhoto').on('submit', function( event ) {
    var form  = $(this);
    var modal = $(this).closest('#modalApplicantReview');
    
    var appId = form.find('input[name="applicant_id"]:hidden').val();
    form.find(':submit').text('Please wait...');
});

$('#chk-accounting-status').on('click', function() {

    if ( $(this).is(':checked') ) {
        if ( ! confirm( 'Do you want to mark it as paid?' ) ) {
            alert('test');
            return false;
        }
    }

    var applicantId = $(this).attr( 'data-applicant' );
    var isChecked   = $(this).is( ':checked' ) ? 1 : 0;

    $.ajax({
        async: false,
        url:  siteUrl + 'admin/ajax/applicants/accounting-status',
        type: 'POST',
        data: {
            'ai'         : applicantId,
            'is-checked' : isChecked
        },
        dataType: 'json',
        success: function( response ) {
            
            console.log( response );

            if ( response.status == 'success' ) {
                alert( 'Accounting status has been saved!' );
                return true;
            }

            alert( 'Server is currently not available. Please try again.' );
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(thrownError);
        }
    });

});

$('.cyd_load_js').click(function(){
    console.log('Designation clicked --asset/script/admin/pages/applicants/review.js');
    
    var applicantId = $('#chk-accounting-status').attr( 'data-applicant' );
    
    $.post(base_url + 'page/get_currency',{applicant_id:applicantId})
    .done(function(result) {
        console.log(result);
        $('.cyd_show_currency').html(result);
    });

});