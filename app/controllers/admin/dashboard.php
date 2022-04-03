<?php
use \Application\Message as Message;

defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends Admin_Controller {
	const PAGE_ACCESS = parent::PAGE_PRIVATE;

	public function __construct() 
	{
		parent::__construct();

		$this->load->driver('cache');
		
		//Check page permission
		$this->checkPageAccess( self::PAGE_ACCESS );
	}
	
	public function index()
	{ 
        $this->load->model( 'm_applicant' );


        if ( ! $applicantLogs = $this->cache->file->get('applicantLogs'))
		{
        	$applicantLogs = $this->m_applicant->getAllLogs( [], 10);
			$this->cache->file->save('applicantLogs', $applicantLogs, 300);
		}

        if ( ! $status = $this->cache->file->get('status'))
		{
        	$status = $this->m_applicant->status;
			$this->cache->file->save('status', $status, 550);
		}

        if ( ! $statusText = $this->cache->file->get('statusText'))
		{
        	$statusText = $this->m_applicant->statusText;
			$this->cache->file->save('statusText', $statusText, 550);
		}
        
        if ( ! $statusColors = $this->cache->file->get('statusColors'))
		{
        	$statusColors    = $this->m_applicant->statusColors;
			$this->cache->file->save('statusColors', $statusColors, 550);
		}

		$this->scripts = [            
            $this->getPath()['plugins'] . 'charts/morris/raphael-2.0.2.min.js',
            $this->getPath()['plugins'] . 'charts/morris/morris.js"',

            $this->getPath()['plugins'] . 'charts/flot/jquery.flot.js',
			$this->getPath()['plugins'] . 'charts/sparkline/jquery.sparkline.js',
			$this->getPath()['plugins'] . 'charts/sparkline/sparkline-init.js',
			$this->getPath()['scripts'] . 'pages/dashboard.js',
		];

		$this->setVariables([
                'applicantLogs' => $applicantLogs,
                'status'        => $status,
                'statusText'    => $statusText,
                'statusColors'  => $statusColors,
            ])
            ->setTitle('My Dashboard')
			->renderPage('dashboard');	
	}
}

/* End of file dashboard.php */
/* Location: ./app/controllers/dashboard.php */