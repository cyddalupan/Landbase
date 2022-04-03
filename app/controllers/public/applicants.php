<?php //-->
use \Application\Message as Message;
use \Application\Pagination as Pagination;

require_once __DIR__.'/../../third_party/mpdf60/mpdf.php';

defined('BASEPATH') OR exit('No direct script access allowed');

class Applicants  extends Public_Controller {
	
	public function __construct() 
	{
		parent::__construct();
		
		$this->load->model( 'm_applicant' );
		$this->load->model( 'Cyd_Applicants_Alphatomo' );
		$this->load->model( 'Cyd_Survey_Alphatomo' );
	}
	
	public function index()
	{
		redirect( 'public/applicants/registration' );
		exit;
	}

	public function pdf( $applicantId )
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
			        <div style="float: right; margin-top:0px;height:12	0px;border:0px solid red;margin-left:-15px;">
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
					'<DIV style="page-break-after:always"></DIV>	
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
					<th>Educational Details</th>
	                <th>Name of School</th>
	                <th>Year</th>
		        </tr>
				
				<tr >
	                <td>Elementary School</td>
	                <td>'.$applicant['education_others'].'</td>
					<td>'.$applicant['education_others_year'].'</td>
		        </tr>
				
				
				<tr >
	                <td>Secondary School</td>
	                <td>'.$applicant['education_highschool'].'</td>
					<td>'.$applicant['education_highschool_year'].'</td>
		        </tr>
				
		        
		     
		        <tr>
					<td>College / University</td>
					<td>'.$applicant['education_college'].'</td>
					<td>'.$applicant['education_college_year'].'</td>					
		        </tr>
		       
				<tr>
					<td>What degree did you graduated in?</td>
					<td>'.$applicant['education_mba_course'].'</td>
					<td>'.$applicant['education_mba_year'].'</td>					
		        </tr>
				
		       
		    </table>';

		$workExperiences = 
			'<tr>
            	<td colspan="4">-- No experiences --</td>
            </tr>';

		if ( ! empty( $applicant['experiences'] ) && is_array( $applicant['experiences'] ) ) {

			$workExperiences = '';
	
			foreach ( $applicant['experiences'] as $experience ) {
			


$year1 = $experience['experience_from'];
$year2 = $experience['experience_to'];



$diff = $year2 - $year1;

				$workExperiences .= 
				'
						<div style="margin-bottom:10px;">	
						<div class="title">
						<div style="FONT-SIZE:16PX;color:White;float: left;TEXT-align:center">EMPLOYMENT HISTORY</div>
						</div>			
						<table cellspacing="0" cellpadding="1">
						<tr >
						<td colspan="2">>Company / Employer:  	<p style="font-weight:bold">'.$experience['experience_company'].'</p></th>
						<td>Nationality / Country:   <p style="font-weight:bold">'.$experience['nationality'].'</p></td>
						<td>Duration of Employment: <p style="font-weight:bold">'.$experience['experience_from'].' - '.$experience['experience_to'].'</p></td>
						</tr>
						<tr>		
						<td colspan="3">Address:  <p style="font-weight:bold">'.$experience['experience_country'].'</p></td>
						<td>Position: <p style="font-weight:bold">'.$experience['experience_position'].'</td>
						<tr>
						
						<tr >
						<td>No. of Family Members: <p style="font-weight:bold">'.$experience['NoFamilyMembers'].'</p></th>
						<td>Type of residences: <p style="font-weight:bold">'.$experience['typeOfResidence'].'</p></td>
						<td>Salary: <p style="font-weight:bold">'.number_format( $experience['experience_salary'], 2 ).'</p></td>
						<td><b>Year(s)</b> <p style="font-weight:bold">'.$diff.' </p></td>
						</tr>

						<tr>		
						<td colspan="4">Reason of leaving:  <b>'.$experience['reasonOfLeaving'].' </b></td>
						<tr>

						</table>
						<div STyle="clear:both"></div>		
						</div>
		'.sprintf("\n");

			}	
		
		}	

			
		
		$workExperiences = 
			'
		      '.$workExperiences.' ';
			
	
		
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

	function emptest($key, $default = NULL) {
	    if(isset($key)) 
	    	$res = $key;
	    else 
	    	$res = $default;
	    return $res;
	}
 
	public function registration()
	{
		$this->load->model( 'm_position');
		$this->load->model( 'm_country');
        $this->load->model( 'm_recruitment_agent');
		
		//Form Submitted
		if ( isset( $_POST['applicant'], $_POST['applicant']['basic'], $_POST['applicant']['education'] ) ) {

			$_SESSION['post']['public']['applicants/registration'] = $_POST;
		
			self::checkDataAdd();
			
			$applicant = $this->m_applicant->addApplicant();
			
			if ( !empty( $applicant ) ) {
				Message::addModalSuccess('Your records has been successfully added.', 'Thank you!');
                Message::addSuccess('New applicant record has been added successfully.', false, 'Success');
				
				redirect( site_url( 'public/applicants/registration' ) );
				exit;
			}
			
			Message::addWarning('An unknown error has occur. Server not available. Please try again.', 'Oops!');
			redirect( site_url( 'public/applicants/registration' ) );
			exit;
		}
		//endOf: Form Submitted
		
		$categories = $this->m_position->getActivePositionsGroupByCategory();
		$countries  = $this->m_country->getCountries();	
        $agents     = $this->m_recruitment_agent->getRecruitmentAgents();
		
		$post = isset( $_SESSION['post']['public']['applicants/registration'] ) ? $_SESSION['post']['public']['applicants/registration'] : [];

		$this->styles[] = $this->getPath()['styles'] . 'pages/applicants/add.css';
		$this->scripts  = [			
			$this->getPath()['plugins'] . 'select2/select2.js',
			$this->getPath()['plugins'] . 'tagsinput/bootstrap-tagsinput.js',
			$this->getPath()['plugins'] . 'datetime/bootstrap-datepicker.js',
			$this->getPath()['scripts'] . 'pages/applicants/add.js',
		];

		$this->setVariables([
				'categories' => $categories,
				'countries'  => $countries,
                'agents'     => $agents,
				'post'       => $post,
			])
			->setTitle('Online Applicant Registration')
			->renderPage('applicants/registration', true);
	}
	
	protected static function checkDataAdd()
	{
		$errors 	= [];
		$returnUrl 	= site_url( 'public/applicants/registration' );
		$applicant 	= $_POST['applicant'];
 
		if ( empty( $applicant['preferred-position']  ) ) {
			$errors[] = '* <strong>Preferred position</strong> is required.';
		}
		
		if ( empty( $applicant['preferred-country']  ) ) {
			$errors[] = '* <strong>Preferred country</strong> is required.';
		}

		/*
		if ( empty( $applicant['expected-salary']  ) ) {
			$errors[] = '* <strong>Expected salary</strong> is required.';
		}
		*/

		if ( empty( $applicant['basic']['first']  ) || empty( $applicant['basic']['last']  ) ) {
			$errors[] = '* <strong>First</strong> and <strong>last name</strong> is required.';
		}

		if ( empty( $applicant['basic']['birthdate']  ) ) {
			$errors[] = '* <strong>Date of birth</strong> is required.';
		} else {

			//Birthdate format: mm-dd-yyyy
			list( $year, $month, $day ) = explode( '-', $applicant['basic']['birthdate'] );

			if ( ! checkdate( $month, $day, $year) ) {
				$errors[] = '* <strong>Date of birth</strong> format is invalid.';
			}
		}
		
		if ( empty( $applicant['date-applied']  ) ) {
			$errors[] = '* <strong>Date applied</strong> is required.';
		} else {
			//Birthdate format: mm-dd-yyyy
			list( $year, $month, $day ) = explode( '-', $applicant['date-applied'] );

			if ( ! checkdate( $month, $day, $year) ) {
				$errors[] = '* <strong>Date applied</strong> format is invalid.';
			}
		}

		if ( empty( $applicant['basic']['address']  ) || empty( $applicant['basic']['address']  ) ) {
			$errors[] = '* <strong>Address</strong> is required.';
		}

		if ( count( $errors ) > 0 ) {
			Message::addWarning('Please check the following requirements:<br><br>' . implode( '<br>', $errors ), false, 'Oops!');

			redirect( $returnUrl );
			exit;
		}		
	}
}

/* End of file applicants.php */
/* Location: ./app/controllers/public/applicants.php */