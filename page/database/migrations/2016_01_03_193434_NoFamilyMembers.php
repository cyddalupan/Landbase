<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class NoFamilyMembers extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('applicant_experiences', function($table)
		{
		    $table->string('NoFamilyMembers')->after('experience_country');
		    
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
		    $table->dropColumn('NoFamilyMembers');
		});
	}

}
