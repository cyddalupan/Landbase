<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title><?php echo $app->getTitle(); ?></title>
	<?php $app->renderStyles(); ?>
</head>
<style>
table {
	border:1px solid #ccc;
	
	background-color: #fff;
		margin-bottom: 0;
	border-collapse: collapse;
	border-spacing: 0;
	width:90%;

}
table tr td {
	padding:3px;
	font-size:11px;
	white-space: nowrap;
	border: 1px solid #ddd;
}


</style>

<body>
	
    <!-- #wrapper -->
    <div id="wrapper1" style="border:0px solid black">
    
    	<!-- #header -->
    	<div id="header">
        	<h1><?php echo $app->getInfo()['applicationDescription']; ?></h1>
        </div>
    	<!-- endOf: #header -->
        
    	<!-- #header2 -->
        <div id="header2">
        	<h2><?php echo $app->getTitle(); ?></h2>
        	<p>&nbsp;</p>
        	<?php if ( ! $groupByEmployer ): ?>
        	<p class="employer">Employer: <?php echo $employer['employer_name']; ?></p>
        	<?php endif; ?>
        	<p class="date-filter">Filter date start: <?php echo fdate( 'F,d Y', $dateFrom); ?></p>
        	<p class="date-filter">Filter date end: <?php echo fdate( 'F,d Y', $dateTo); ?></p>
        </div>
    	<!-- endOf: #header2 -->   
        
        <!-- #content -->
        <div id="content">
        	<table id="applicants">
            	<tbody>
                	<tr>
                    	<th width="1%">#</th>
                        <th>Applicant #</th>
                        <th>Date applied</th>
						<th>Date Deployed</th>
                        <th>Applicant</th>
                        <th>Recruitment Agent</th>
						<th>Passport</th>
                        <th>Job Offer</th>
						<th>VISA</th>
						<th>OEC</th>
						<th>OWWA</th>
						<th>Ticket</th>
                        <th>Position</th>
                        <th>Country</th>
                        <th>Remarks</th>
                      
                    </tr>
                </tbody>
                <tbody>
                    <?php if ( count( $applicants ) == 0 ): ?>
                    <tr>
                        <td colspan="10" align="center">-- No records --</td>
                    </tr>
                    <?php endif; ?>
                	<?php $ctr = 0; ?>
                	<?php $currentGroup = ''; ?>
                	<?php foreach ( $applicants as $applicantId => $applicant ): ?>
                	<?php if ( $groupByEmployer && $currentGroup != $applicant['applicant_employer'] ): ?>
                	<?php $currentGroup = $applicant['applicant_employer']; ?>
                	<tr>
                		<td colspan="12" align="center">
                		<strong><span class="employer"><?php echo $applicant['employer_name']; ?></span></strong>
                		</td>
                	</tr>
                	<?php endif; ?>
                    <?php $ctr ++; ?>
                    <tr>
                    	<td><?php echo $ctr; ?></td>
                        <td><?php echo str_pad( $applicantId, 7, '0', STR_PAD_LEFT); ?></td>
                        <td><?php echo fdate( 'd-M-Y', $applicant['applicant_date_applied'], '0000-00-00' ); ?></td>
						<td>
						<?php echo fdate( 'd-M-Y', $applicant['deployed_date'], '0000-00-00' ); ?>
						</td>
                        <td><?php echo $applicant['applicant_name']; ?></td>
                        <td><?php echo $applicant['agent_first'].' '.$applicant['agent_last']; ?></td>
						 <td><?php echo $applicant['passport_number']; ?></td>
                        <td><?php echo $applicant['job_name']; ?></td>
						
						<td align="center">
						<?php if (  $applicant['requirement_visa_release_date'] != '0000-00-00' ): ?>
						<span class="text-success"><?php echo $applicant['requirement_visa_release_date']; ?></span>
						<?php else: ?>
						--
						<?php endif; ?>
						</td>
						
						<td><?php echo $applicant['requirement_oec_number']; ?></td>

						<td><?php echo $applicant['requirement_owwa_certificate']; ?></td>	
						<td><?php echo $applicant['requirement_ticket']; ?></td>
                        <td><?php echo $applicant['position_name']; ?></td>
                        <td><?php echo $applicant['country_name']; ?></td>
                        <td><?php echo $applicant['applicant_remarks']; ?></td>
                   
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    	<!-- endOf: #content -->   
        
    </div>
    <!-- endOf: #wrapper -->

    <div style="clear:both" align="center">
        <p>&nbsp;</p>
        <a href="#" id="btn-print" role="button">Print</a>
    </div>        

    <script src="<?php echo $app->getPath()['scripts']; ?>jquery-2.0.3.min.js"></script>
    <?php $app->renderScripts(); ?>
</body>
</html>