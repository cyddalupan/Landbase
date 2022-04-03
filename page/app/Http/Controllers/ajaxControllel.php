<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Request;

use App\position;

class ajaxControllel extends Controller {

	public function update_position()
	{
		$pos_id = Request::input('pos_id');
		$pos_val = Request::input('pos_val');

		$position = position::find($pos_id);
		$position->position_name = $pos_val;
		$position->save();
	}

}
