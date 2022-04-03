<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class RecruitmentAgentSeeder extends Seeder {

    public function run()
    {
        DB::table('recruitment_agent')->truncate();
        for ($x = 0; $x <= 10; $x++) {	
	        DB::table('recruitment_agent')->insert([
			    'agent_first' => str_random(10),
			    'agent_last' => str_random(10),
			    'agent_contacts' => str_random(25),
			    'agent_email' => str_random(10).'@'.str_random(5).'.com',
			    'agent_commission' => rand(3000,9000),
			    'cash_advance' => rand(1000,6000),
			    'balance' => rand(0,9000),
			    'agent_createdby' => 1,
			    'agent_updatedby' => 1,
			    'agent_created' => date('Y-m-d H:i'),
			    'agent_updated' => date('Y-m-d H:i'),
			]);
        }
    }

}