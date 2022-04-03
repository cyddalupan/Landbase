<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class CashAdvanceLogSeeder extends Seeder {

    public function run()
    {
        DB::table('cash_advance_logs')->truncate();
        for ($x = 0; $x <= 30; $x++) {	
	        DB::table('cash_advance_logs')->insert([
	        	'recruitment_agent_id' => rand(1,5),
			    'applicant_id' => rand(14,30),
			    'current_status' => str_random(10),
			    'remaining_commission' => rand(3000,9000),
			    'cash_advance' => rand(500,2000),
			    'current_balance' => rand (3000,9000),
			]);
        }
    }

}