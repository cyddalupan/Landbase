<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

include('RecruitmentAgentSeeder.php');
include('CashAdvanceLogSeeder.php');
include('CashAdvanceTransactionSeeder.php');

class DatabaseSeeder extends Seeder {

	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run()
	{
		Model::unguard();

		$this->call('RecruitmentAgentSeeder');
		$this->call('CashAdvanceLogSeeder');
		$this->call('CashAdvanceTransactionSeeder');

	}

}
