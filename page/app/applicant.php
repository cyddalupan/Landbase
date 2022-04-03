<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class applicant extends Model {
	
    protected $table = 'applicant';
    protected $primaryKey = 'applicant_id';
    public $timestamps = false;

}
