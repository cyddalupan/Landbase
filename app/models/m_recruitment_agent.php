<?php //-->
/*
 * This file is part a custom application package.
 * (c) 2014 Clemente Quiñones Jr. <clemquinones@gmail.com>
 */

/**
 * Core Knowledge of all pages
 *
 * @author     Clemente Quiñones Jr. <clemquinones@gmail.com>
 * @version    1.0.0
 */
 
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class m_recruitment_agent extends MY_Model {
 	/* Constants
	-------------------------------*/
	/* Public Properties
	-------------------------------*/
	/* Protected Properties
	-------------------------------*/
	/* Private Properties
	-------------------------------*/
	/* Get
	-------------------------------*/
	/* Magic
	-------------------------------*/ 
	public function __construct() 
	{
		parent::__construct(); 
	}
	
	/* Public Methods
	-------------------------------*/
	/* Protected Methods
	-------------------------------*/
	public function getRecruitmentAgents( $options = [], $limit = 0, $offset = 0, $sort = ['agent_first', 'ASC'] )
	{
		$this->db->flush_cache();
		$this->db->select('*, 
			(SELECT COUNT(*) FROM `applicant` WHERE `applicant_source` = `agent_id`) AS `applicants`', false)
			->from('recruitment_agent');

		$this->setDBQueryOptions( $options )
			->setDBQueryRange( $limit, $offset)
			->setDBQueryOrders( $sort );

		$agents = $this->db->get()->result_array();
        
        return $this->indexArray( $agents, 'agent_id' );
	}

	/**
	 * @param $agent
	 * add all applicant that belongs to the agents
	 * @return $agent with applicants
	 */ 
	public function add_applicants($agents){

		foreach ($agents as $key => $value) {
			$this->db->flush_cache();
   			$this->db->from( 'applicant' ); 
   			$this->db->where('applicant_source', $value['agent_id']);

   			$agents[$key]['applicant'] = $this->db->get()->result();
		}

		return $agents;
	}

	/**
	 * @param agent_id
	 * getting the agents commission using agent_id
	 * @param applicant_id
	 * getting total cash advance from applicant's under using applicant_id's
	 * and subtracting total cash advance to agent commission
	 * @return the remaining value than can be cash advance
	 */ 
	public function get_remaining_cash_advance_remaining($agent_id,$applicant_id){
		$this->db->flush_cache();
		$this->db->from( 'recruitment_agent'); 
		$this->db->where('agent_id', $agent_id);
		$result = $this->db->get()->result();
		$commission = $result[0]->agent_commission;

		$this->db->flush_cache();
		$this->db->from('cash_advance_transactions');
		$this->db->where('agent_id', $agent_id);
		$this->db->where('applicant_id', $applicant_id);
		$transactions = $this->db->get()->result();

		foreach ($transactions as $key => $value) {
			$commission = $commission - $value->cash_advance;
		}
		return $commission;
	}

	public function insert_transaction($agent_id,$applicant_id,$cash_advance){
		$this->db->flush_cache();
		$this->db->from( 'recruitment_agent'); 
		$this->db->where('agent_id', $agent_id);
		$result = $this->db->get()->result();
		$commission = $result[0]->agent_commission;

		$data = array(
			'agent_id' => $agent_id ,
			'applicant_id' => $applicant_id ,
			'current_commission' => $commission,
			'cash_advance' => $cash_advance,
			'created_at' => date('Y-m-d H:i:s')
		);

		$this->db->insert('cash_advance_transactions', $data); 
	}

	public function insert_logs($agent_id,$applicant_id,$cash_advance){

		$this->load->model('m_applicant');
		$statuses = ( new m_applicant )->statusText;

		$this->db->flush_cache();
		$this->db->from( 'recruitment_agent'); 
		$this->db->where('agent_id', $agent_id);
		$result = $this->db->get()->result();
		$commission = $result[0]->agent_commission;
		$agent_balance = $result[0]->balance;
	
		
		$this->db->flush_cache();
		$this->db->from( 'applicant'); 
		$this->db->where('applicant_id', $applicant_id);
		$result = $this->db->get()->result();
		$applicant_status_id = $result[0]->applicant_status;
		$status_text = $statuses[$applicant_status_id];

		$data = array(
			'recruitment_agent_id' => $agent_id ,
			'applicant_id' => $applicant_id ,
			'current_status' => $status_text ,
			'remaining_commission' => ($commission - $cash_advance),
			'cash_advance' => $cash_advance,
			'current_balance' => ($agent_balance + $cash_advance),
			'created_at' => date('Y-m-d H:i:s')
		);

		$this->db->insert('cash_advance_logs', $data); 
	}

	public function update_cash_advance($agent_id,$applicant_id,$cash_advance){
		
		$this->db->flush_cache();
		$this->db->from( 'recruitment_agent'); 
		$this->db->where('agent_id', $agent_id);
		$result = $this->db->get()->result();
		$agent_cash_advance = $result[0]->cash_advance;
		$agent_balance = $result[0]->balance;

		$agent_balance = $agent_balance - $cash_advance;
		$agent_cash_advance = $agent_cash_advance + $cash_advance;

		$data = array(
		   'cash_advance' => $agent_cash_advance,
		   'balance' => $agent_balance
		);

		$this->db->where('agent_id', $agent_id);
		$this->db->update('recruitment_agent', $data); 
    }

	public function getRecruitmentAgentsCount( $options = [])
	{
		$this->db->flush_cache();
		$this->db->from('recruitment_agent');

		$this->setDBQueryOptions( $options );

		$agents = $this->db->count_all_results();

		return $agents;
	}
	
	public function getRecruitmentAgentById( $agentId )
	{
		$this->db->flush_cache();
		$this->db->select( '*, 
			(SELECT COUNT(*) FROM `applicant` WHERE `applicant_source` = `agent_id`) AS `applicants`', false)
			->from('recruitment_agent')
			->where([
				'agent_id'	=> $agentId,
			]);

		$agent = $this->db->get()->row_array();

		return $agent;
	}
	
	public function addRecruitmentAgent()
	{
		$agent = $_POST['agent'];
		$agentData		= [];

		//Start Transaction
		$this->db->trans_begin();
		
		//Insert Recruitment Agency
		$agentData = [
            'agent_first'      => ucwords( $agent['first'] ),
            'agent_last'       => ucwords( $agent['last'] ),
            'agent_contacts'   => $agent['contacts'],
            'agent_email'      => $agent['email'],
            'agent_commission' => $agent['agent_commission'],
            'agent_createdby'  => $_SESSION['admin']['user']['user_id'],
            'agent_updatedby'  => $_SESSION['admin']['user']['user_id'],
            'agent_created'    => date( 'Y-m-d H:i:s', time() ),
            'agent_updated'    => date( 'Y-m-d H:i:s', time() ),
		];
		
		$agentInserted	= $this->db->insert('recruitment_agent', $agentData);
		$agentId 			= $this->db->insert_id();
		//endOf: Insert Recruitment Agency
		
		//Rollback if transaction fails
		if ( ! $this->db->trans_status() || ! $agentInserted) {
			$this->db->trans_rollback();
			return false;
		} 
		
		$this->endProcess();
		
		//Commit transaction
		$this->db->trans_commit();	
		
		$agent = $this->getRecruitmentAgentById( $agentId );
		
		return $agent;
	}

	public function CSTransactions(){
    	$agent_array_return = array();
    	$agent_query = $this->db->get('cash_advance_transactions');
		$agent_results = $agent_query->result();
		foreach ($agent_results as $agent_value) {
			$agent_array_return[$agent_value->agent_id][] = $agent_value;
		}
		return $agent_array_return;
	}
	
	public function updateRecruitmentAgent( $agentId )
	{
		$agent         = $_POST['agent'];
		$agentData		= [];

		//Start Transaction
		$this->db->trans_begin();
		
		//Update Recruitment Agency
		$agentData = [
            'agent_first'      => ucwords( $agent['first'] ),
            'agent_last'       => ucwords( $agent['last'] ),
            'agent_contacts'   => $agent['contacts'],
            'agent_email'      => $agent['email'],
            'agent_commission' => $agent['agent_commission'],
            'agent_updatedby'  => $_SESSION['admin']['user']['user_id'],
            'agent_updated'    => date( 'Y-m-d H:i:s', time() ),
		];
		
		$agentUpdated = 
		$this->db->where([
				'agent_id' => $agentId,
			])
			->update('recruitment_agent', $agentData);
		//endOf: Update Category
		
		//Rollback if transaction fails
		if ( ! $this->db->trans_status() || ! $agentUpdated) {
			$this->db->trans_rollback();
			return false;
		} 
		
		$this->endProcess();
		
		//Commit transaction
		$this->db->trans_commit();	
		
		$agent = $this->getRecruitmentAgentById( $agentId );

		return $agent;
	}
	
	protected function endProcess()
	{
		if ( isset( $_SESSION['post']['admin']['recruitment-agents/add'] ) ) {
			unset( $_SESSION['post']['admin']['recruitment-agents/add'] );
		}
		
		if ( isset( $_SESSION['post']['admin']['recruitment-agents/edit'] ) ) {
			unset( $_SESSION['post']['admin']['recruitment-agents/edit'] );
		}

		return $this;
	}
	
	/* Private Methods
	-------------------------------*/
}
