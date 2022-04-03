<?php namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CashAdvanceLog extends Model {
	
    use SoftDeletes;

    protected $dates = ['deleted_at'];

}
