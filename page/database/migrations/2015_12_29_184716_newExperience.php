<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class NewExperience extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('applicant_experiences', function($table)
		{
		    $table->string('reasonOfLeaving')->after('experience_country');
		    $table->string('salary')->after('experience_country');
		    $table->string('typeOfResidence')->after('experience_country');
		    $table->string('nationality')->after('experience_country');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('applicant_experiences', function($table)
		{
		    $table->dropColumn('nationality');
		    $table->dropColumn('typeOfResidence');
		    $table->dropColumn('salary');
		    $table->dropColumn('reasonOfLeaving');
		});
	}

}
