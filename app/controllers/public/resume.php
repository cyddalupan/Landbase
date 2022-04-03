<?php //-->
use \Application\Message as Message;
use \Application\Pagination as Pagination;

require_once __DIR__.'/../../third_party/mpdf60/mpdf.php';

defined('BASEPATH') OR exit('No direct script access allowed');

class Resume  extends Public_Controller {
	
	public function __construct() 
	{
		parent::__construct();
		
		//make sure page has a settings
		if(!isset($_SESSION["settings"])){
			$this->session->set_flashdata('prev_url', current_url());
			redirect('add_settings');
		}

		$this->load->model( 'm_applicant' );
	}

	public function applicant( $applicantId )
	{
		if ( empty( $applicantId ) ) { 
            show_404(); 
        }
        
        $applicant           = ( new m_applicant )->getApplicantById( $applicantId );
        $applicant_raw		 = ( new m_applicant )->getApplicantRawById( $applicantId ); 	
        $applicant_alphatomo = ( new Cyd_Applicants_Alphatomo )->getApplicantsAlphatomoById( $applicantId );	
		$survey_alphatomo    = ( new Cyd_Survey_Alphatomo )->getSurveyAlphatomoById( $applicantId );	
        $applicant_currency  = ( new m_applicant )->getCurrencyById( $applicantId );
        $fileWholeBody       = ( new m_applicant )->getApplicantFileByType( $applicantId, 'Whole Body Picture' );

		$fileOptions['where'][] =      	"NOT `file_type` IN ('Whole Body Picture', 'Agency File 1', 'Agency File 2', 'Agency File 3', 'Agency File 4', 'Agency File 4', 'Agency File 5', 'Agency File 6', 'Agency File 7', 'Agency File 8')";

        $files              = ( new m_applicant )->getApplicantFiles( $applicantId, $fileOptions );

        $profilePicture = $banner = $wholeBody = $documents = null;

		if ( is_file( DIR_UPLOADS.'applicant'.DIRECTORY_SEPARATOR.$applicant['applicant_photo'] ) ) {
			$profilePicture = base_url().'files/applicant/'.$applicant['applicant_photo'];
		} else {
			$profilePicture = $this->getPath()['images'].'avatars/no-picture.jpg';
		}
		
		$banner = $this->getPath()['images'].'logo.jpg';

		if ( ! empty( $fileWholeBody ) ) {
			$wholeBody = '<div>
			        <div style="float: right; margin-top:0px;height:12	0px;border:0px solid red;margin-left:-15px;padding:10px">
						<img src="'.base_url().$fileWholeBody['file_path'].'" style="height:500px;width:95% ;float:right;border:1px solid black" />
					
			        </div>
				
		    </div>';
		}
	
		$contact='	<div class="white" style="float: left;padding:5px">
		<div style="FONT-SIZE:13PXborder:0px solid black;float: left;">Mobile: '.$applicant['applicant_contacts'].'<b></b></div>	
		</div>
		';
		
		foreach ( $files as $key => $file ) {
			if ( strpos( $file['file_mime'], 'image/' ) !== false ) {
				$documents .= 
					'<div class="clearfix"></div>
					<div class="" style="margin-bottom: 12pt; height:100% ">
			    		<p>'.strtoupper( $file['file_type'] ).'</p>
						<div style="border:1px solid #ccc">
					        <div class="gradient" style="margin-bottom: 0pt; ">
					        	<img src="'.base_url().$file['file_path'].'" style="width:100%;" />
					        </div>
					    </div>
			    	</div>';
				
			}
			
		}
 
		array_walk( $applicant , function( &$value ) {
			$value = empty( $value ) ? '&nbsp;' : $value;
		});

		$education = 
			'<table cellspacing="0" cellpadding="1">
		    	<tr >
	                <th width="">MBA</th>
	                <th width="">Course</th>
	                <th width="10%">Year</th>
		        </tr>
		        <tr>
					<td>'.$applicant['education_mba'].'</td>
					<td>'.$applicant['education_mba_course'].'</td>
					<td>'.$applicant['education_mba_year'].'</td>					
		        </tr>
		        <tr >
	                <th width="">College</th>
	                <th width="">Skills</th>
	                <th width="10%">Year</th>
		        </tr>
		        <tr>
					<td>'.$applicant['education_college'].'</td>
					<td>'.$applicant['education_college_skills'].'</td>
					<td>'.$applicant['education_college_year'].'</td>					
		        </tr>
		        <tr >
	                <th width="" colspan="2">Others</th>
	                <th width="10%">Year</th>
		        </tr>
		        <tr>
					<td colspan="2">'.$applicant['education_others'].'</td>
					<td>'.$applicant['education_others_year'].'</td>					
		        </tr>
				<tr >
	                <th width="" colspan="2">Highschool</th>
	                <th width="10%">Year</th>
		        </tr>
		        <tr>
					<td colspan="2">'.$applicant['education_highschool'].'</td>
					<td>'.$applicant['education_highschool_year'].'</td>					
		        </tr>
		    </table>';

		$workExperiences = 
			'<tr>
            	<td colspan="4">-- No experiences --</td>
            </tr>';

		if ( ! empty( $applicant['experiences'] ) && is_array( $applicant['experiences'] ) ) {

			$workExperiences = '';

			foreach ( $applicant['experiences'] as $experience ) {
				$workExperiences .= 
				'<tr>
	            	<td>'.$experience['experience_company'].'</td>
	            	<td>'.$experience['experience_position'].'</td>
	            	<td>'.fdate( 'd M Y', $experience['experience_from'], '0000-00-00' ).' - '.fdate( 'd M Y', $experience['experience_to'], '0000-00-00' ).'</td>
	            	<td>'.number_format( $experience['experience_salary'], 2 ).'</td>
	            </tr>'.sprintf("\n");
			}			
		}

			
		
		$workExperiences = 
			'<table cellspacing="0" cellpadding="1">
		    	<thead>
		            <tr >
		                <th width="28%">Company</th>
		                <th width="24%">Position</th>
		                <th width="31%">Years</th>
		                <th width="17%">Salary</th>
		            </tr>
		        </thead>
		        <tbody>'.$workExperiences.'</tbody>
		    </table>';
			
	
		
			//$personalAbilities = $applicant_raw->personalAbilities;
			//$personal='<div style="border:1px solid red;padding:5px">'.$personalAbilities .'</div>';		
		//get children count
		if($applicant_raw->applicant_children != '')
			$children_count = count(explode(',', $applicant_raw->applicant_children));
		else
			$children_count = 'none';

		//get json arrays 
		$survey_array = cydGetJson("survey.json");
		$wexp_array = cydGetJson("working_experience.json");
		$wabl_array = cydGetJson("working_ability.json");

		//Get gen_info_html
		$gen_info_html = '';
        foreach ($survey_array->survey as $survey_value) {
        	$srv_ans = $survey_alphatomo[$survey_value->string];
        	if($srv_ans == 1)
        		$srv_ans = 'Yes';
        	else
        		$srv_ans = 'No';
			$gen_info_html .= '
			<div class="white" style="float: left;">
				<div style="FONT-SIZE:13PX;float: left;width:80%;border-right:1px solid black">'.$survey_value->name.'</div>	
				<div style="FONT-SIZE:13PX;float: left;width:15%;text-align:center"><b>'.$srv_ans.'</b></div>	
			</div>';
        }

        $wexp_html = '';
        foreach ($wexp_array->working_experience as $wexp_value) {

			$wexp_html .= '
			<div class="" style="float: left;BORDER:1PX Solid black;HEIGHT:100PX;PADDING:10PX;width:100%">
					<div style="FONT-SIZE:13PX;float: left;width:100%;">'.$wexp_value->name.'</div>
					<div STyle="clear:both;HEIGHT:10PX"></div>			
					<div style="FONT-SIZE:13PX;float: left;width:100%"><b>'.$survey_alphatomo[$wexp_value->string].'</b></div>	
			</div>
			<div style="clear:both"></div>
			';
		}

		foreach ($wabl_array->working_ability as $wabl_value) {
			if($survey_alphatomo[$wabl_value->exp] == 1){
				$wabl_exp = 'YES';
				$wabl_will = '-';
			}else{
				$wabl_will = 'YES';
				$wabl_exp = '-'; 
			}
			$wabl_html .= '
			<div class="white" style="float: left;">
				<div style="FONT-SIZE:13PX;float: left;width:50%;TEXT-ALIGN:left">'.$wabl_value->name.'</div>	
				<div style="FONT-SIZE:13PX;float: left;width:20%;TEXT-ALIGN:center"><b>'.$wabl_exp.'</b></div>
				<div style="FONT-SIZE:13PX;float: left;width:20%;TEXT-ALIGN:center"><b>'.$wabl_will.'</b></div>			
			</div>
			';
		}

    	$data = array_merge(
    		$applicant,
    		$fileWholeBody,
		
    		[
    			'ref_no'                   => 'ATP-'.str_pad( $applicant['applicant_id'], 7, '0', STR_PAD_LEFT ),
    			'applicant_date_applied'   => fdate( 'd M Y', $applicant['applicant_date_applied'], '0000-00-00' ),
    			'contact'       => $contact,
				'requirement_offer_salary' => $applicant_currency.' '.number_format( (int) $applicant['requirement_offer_salary'], 2),
    			'applicant_name'           => strtoupper( $applicant['applicant_name'] ),
    			'applicant_birthdate'      => fdate( 'd M Y', $applicant['applicant_birthdate'], '0000-00-00' ),
    			'passport_issue'           => fdate( 'M. d, Y', $applicant['passport_issue'], '0000-00-00' ),
    			'passport_expiration'      => fdate( 'M. d, Y', $applicant['passport_expiration'], '0000-00-00' ),
	    		'profile_picture'          => $profilePicture,
	    		'applicant_languages'      => empty( $applicant['applicant_languages'] ) ? '&nbsp;' : $applicant['applicant_languages'],
	    		'applicant_other_skills'   => empty( $applicant['applicant_other_skills'] ) ? '&nbsp;' : str_replace( ',', ',', $applicant['applicant_other_skills'] ),
	    		'education'                => $education,
	    		'work_experiences'         => $workExperiences,
 	    		'banner'                   => $banner,
    			'whole_body'               => $wholeBody,
    			'documents'                => $documents,
    			'children_count'           => $children_count,
    			'age'           		   => $this->emptest($applicant_raw->applicant_children),
    			'no_of_bro'           	   => $this->emptest($applicant_alphatomo->no_of_bro,'0'),
    			'no_of_sis'           	   => $this->emptest($applicant_alphatomo->no_of_sis,'0'),
    			'pos_in_fam'           	   => $this->emptest($applicant_alphatomo->pos_in_fam,'0'),
    			'partner_husband'          => $this->emptest($applicant_alphatomo->partner_husband),
    			'partner_occupation'       => $this->emptest($applicant_alphatomo->partner_occupation),
    			'nam_of_fat'           	   => $this->emptest($applicant_alphatomo->nam_of_fat),
    			'occ_of_fat'           	   => $this->emptest($applicant_alphatomo->occ_of_fat),
    			'applicant_mothers'        => $this->emptest($applicant_raw->applicant_mothers),
    			'occ_of_mom'           	   => $this->emptest($applicant_alphatomo->occ_of_mom),
    			'relative_name'            => $this->emptest($applicant_alphatomo->relative_name),
    			'relative_mobile'          => $this->emptest($applicant_alphatomo->relative_mobile),
    			'applicant_expected_salary' => $this->emptest($applicant_raw->applicant_expected_salary),
    			'gen_info_html'				=> $gen_info_html,
    			'wexp_html'					=> $wexp_html,
    			'wabl_html'					=> $wabl_html,
				'personal'					=>empty( $applicant_raw->personalAbilities ) ? '&nbsp;' : str_replace( ',', '<br>', $applicant_raw->personalAbilities ),
    			'future_plans'           	=> $this->emptest($survey_alphatomo['future_plans']),
    		]
    	);

    	$html = file_get_contents( __DIR__.'/../../views/public/applicants/pdf.php' );

    	foreach ($data as $key => $value) {
    		$html = str_replace( '{'.$key.'}' , $value, $html );
    	} 

		$mpdf = new mPDF(); 

		$mpdf->SetDisplayMode('fullpage');
		$mpdf->WriteHTML($html);
		$mpdf->Output(); 

		exit;
	}
}
/* End of file applicants.php */
/* Location: ./app/controllers/public/applicants.php */