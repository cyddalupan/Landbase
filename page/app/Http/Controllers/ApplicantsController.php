<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Request;

use App\applicant;
use App\applicant_files;
use App\multiple_lineup;

class ApplicantsController extends Controller {
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy()
	{
		$id = Request::input('fileid');
		applicant_files::destroy($id);
		return 'file deleted';
	}

	public function applicant_files()
	{
		$applicant_id = Request::input('applicant_id');
		$files = applicant_files::filesOf($applicant_id)->get()->toJson();
		echo $files;
	}

	public function multiple_lineup(){
		$applicant_ids = Request::input('applicant_ids');
		$employer = Request::input('employer');

		foreach ($applicant_ids as $applicant_id) {	
			$multiple_lineup = new multiple_lineup;
			$multiple_lineup->applicant_id = $applicant_id;
			$multiple_lineup->applicant_employer = $employer;
			$multiple_lineup->save();
		}
		
		echo 'multiple lineup inserted';
	}

	public function get_currency(){
		$applicant_id = Request::input('applicant_id');
		$applicant = applicant::find($applicant_id);
		return $applicant->currency;
	}

}
