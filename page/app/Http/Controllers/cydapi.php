<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

//models
use App\applicant;
class cydapi extends Controller {

	public function getApplicantByID($applicantID){
		$applicant = applicant::find($applicantID);
		echo json_encode($applicant);
	}

}
