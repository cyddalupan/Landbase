<!-- Page Breadcrumb -->
<div class="page-breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <i class="fa fa-home"></i>
            <a href="<?php echo site_url('admin/dashboard'); ?>">Home</a>
        </li>
        <li>Billing</li>
        <li class="active">Transactions</li>
    </ul>
</div>
<!-- /Page Breadcrumb -->
<!-- Page Header -->
<div class="page-header position-relative">
    <div class="header-title">
        <h1>
            Transactions
        </h1>
    </div>
    <!--Header Buttons-->
    <div class="header-buttons">
        <a class="sidebar-toggler" href="#">
            <i class="fa fa-arrows-h"></i>
        </a>
        <a class="refresh" id="refresh-toggler" href="#">
            <i class="fa fa-refresh"></i>
        </a>
        <a class="fullscreen" id="fullscreen-toggler" href="#">
            <i class="fa fa-arrows-alt"></i>
        </a>
    </div>
    <!--Header Buttons End-->
</div>
<!-- /Page Header -->
<!-- Page Body -->
<div class="page-body page-<?php echo $app->getTemplate(); ?>">
     
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="widget">

                <div class="widget-header with-footer">
                    <span class="widget-caption">
                        <form class="form-inline" method="get">
                        	<input name="search[or]" type="text" placeholder="Search by OR#" class="form-control input-xs" value="<?php echo isset( $_GET['search']['or'] ) ? $_GET['search']['or'] : ''; ?>" required>
                        	<button type="submit" class="btn btn-xs btn-default">Search</button>
                        </form>
                    </span>
                    
                    <div class="widget-buttons">
                        <a href="#" data-toggle="maximize">
                            <i class="fa fa-expand"></i>
                        </a>
                        <a href="#" data-toggle="collapse">
                            <i class="fa fa-minus"></i>
                        </a>
                        <a href="#" data-toggle="dispose">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="widget-body">
                    <?php $app->renderAlerts(); ?>
                    <div class="table-responsive" style="overflow:scroll; padding:10px;">
                        <table class="table table-bordered table-hover table-jobs">
                            <thead class="bordered-palegreen">
                                <tr>
                                    <th>#</th>
                                    <th>OR#</th>
                                    <th>Agency/Employer</th>
                                    <th>Applicant</th>
                                    <th>Amount</th>
                                    <th>Remarks</th>
                                    <th>Date</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if ( count( $ORs ) == 0 ): ?>
                                    <tr>	
                                        <td colspan="8" align="center"> -- No transaction entries --</td>
                                    </tr>
                                <?php endif;?>
                                <?php $ctr = 0; ?>
                                <?php foreach ( $ORs as $orNumber => $or ): ?>
                                <?php $ctr++; ?>
                                <tr>
                                    <td>
                                        <?php echo $ctr; ?>
                                    </td>
                                    <td>
                                        <a href="<?php echo site_url( 'admin/billing/or-review/'.$or['or_id'] ); ?>" role="button" class="" data-toggle="modal" data-target="#modalReports" title="View/Edit details">
                                        <?php echo isset( $_GET['search']['or'] ) ? matchStr( $_GET['search']['or'], $or['or_number']) : $or['or_number']; ?>
                                        </a>
                                    </td>
                                    <td>
                                        <?php echo $or['employer_name']; ?>
                                    </td>
                                    <td>
                                        <?php if ( $or['applicants'] > 0 ): ?>
                                        [ <strong><?php echo  $or['applicants']; ?></strong> applicants ]
                                        <?php else: ?>
                                        <?php echo $or['applicant_first'].' '.$or['applicant_last']; ?>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <span class="text-primary">P <?php echo number_format( $or['or_amount'], 2 ); ?></span>
                                    </td>
                                    <td>
                                        <?php echo $or['or_remarks']; ?>
                                    </td>
                                    <td>
                                        <?php echo date( 'Y-m-d', strtotime( $or['or_date'] ) ); ?>
                                    </td>
                                    <td class="numeric">
                                        <?php if ( in_array($_SESSION['admin']['user']['user_type'], [3,4,8]) ): ?>
                                        <?php if ( ! $or['or_status'] ): ?>
                                        <a href="#" role="button" class="btn btn-xs btn-info btn-approve" data-transaction="<?php echo $or['or_id'] ?>">Approve</a>
                                        <?php else: ?>
                                        <a href="#" role="button" class="btn btn-xs btn-default btn-unapprove" data-transaction="<?php echo $or['or_id'] ?>">Unapprove</a>
                                        <?php endif; ?>
                                        <?php endif; ?>
                                        
                                        <?php if ( in_array($_SESSION['admin']['user']['user_type'], [2,3,4,8]) ): ?>
                                        <br>
                                        <?php if ( $or['or_status'] ): ?>
                                        Approved by <strong><?php echo $or['user_fullname'] ?></strong>
                                        <br>
                                        <a href="<?php echo site_url( 'admin/reports/oreceipt/'.$or['or_id'] ); ?>" class="btn btn-xs btn-default" target="_blank">Print</a>
                                        <?php else: ?>
                                        <span class="text-warning">Not yet approve</span>
                                        <?php endif; ?>
                                        <?php endif; ?>
                                    </td> 
                                </tr> 
                                <?php endforeach; ?>
                            </tbody>
                        </table> 
                    </div><!-- .table-responsive -->
                    <hr>
                    <div class="footer" align="right">
                        &nbsp;
                        <div class="clearfix"></div>
                    </div> 
                </div>

            </div> <!-- .widget -->
            
        </div>
    </div>
</div>
<!-- /Page Body -->
