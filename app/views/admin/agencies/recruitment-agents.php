<?php foreach ($agents as $agent): ?>
<?php $totalCA[$agent['agent_id']] = 0; ?>
<!-- Modal -->
<div class="modal fade" id="CATransaction<?php echo $agent['agent_id']; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?php echo $agent['agent_first'].' '.$agent['agent_last']; ?></h4>
        </div>
        <div>
            <ul class="nav nav-tabs">
                <li role="presentation" <?php if($this->session->flashdata('errors') == '')echo 'class="active"'; ?> ><a href="#CAsummary<?php echo $agent['agent_id']; ?>" aria-controls="home" role="tab" data-toggle="tab">Record Summary</a></li>
                <li role="presentation" <?php if($this->session->flashdata('errors') != '')echo 'class="active"'; ?> ><a href="#CAadd<?php echo $agent['agent_id']; ?>" aria-controls="profile" role="tab" data-toggle="tab">Add Cash Advance</a></li>
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade <?php if($this->session->flashdata('errors') == '')echo 'in active'; ?>" id="CAsummary<?php echo $agent['agent_id']; ?>">
                    <?php if(isset($CSTransactions[$agent['agent_id']])){ ?>
                    <table class="table">
                        <tr>
                            <th>
                                Remaining Balance
                            </th>
                            <th>
                                Applicant Name
                            </th>
                            <th>
                                Cash Advance
                            </th>
                        </tr>
                        <?php 
                        foreach ($CSTransactions[$agent['agent_id']] as $CSTransaction) {
                            echo '
                                <tr>
                                    <td>
                                        '.($CSTransaction->current_commission - $agent['cash_advance']).'
                                    </td>
                                    <td>
                                        '.$applicants_raw[$CSTransaction->applicant_id]->applicant_first.'
                                    </td>
                                    <td>
                                        '.$CSTransaction->cash_advance.'
                                    </td>
                                </tr>
                            ';
                            $totalCA[$agent['agent_id']] = $totalCA[$agent['agent_id']] + $CSTransaction->cash_advance;
                        } ?>
                        <tr>
                            <td></td>
                            <td><strong>Total :</strong></td>
                            <td><strong><?php echo $totalCA[$agent['agent_id']]; ?></strong></td>
                        </tr>
                    </table>
                    <?php }else{ ?>
                    -- No Cash Advance Transactions --
                    <?php }//endif ?>
                    <br/>
                    <a href="<?php echo base_url(); ?>admin/agencies/cash_advance_logs" type="button" class="btn btn-info pull-left"><i class="fa fa-list"></i> Cash Advance Logs</a>
                    <div class="clearfix"></div>
                </div>
                <div role="tabpanel" class="tab-pane fade <?php if($this->session->flashdata('errors') != '')echo 'in active'; ?> " id="CAadd<?php echo $agent['agent_id']; ?>">
                    <form method="post" action="<?php echo site_url(); ?>admin/agencies/cash_advance/<?php echo $agent['agent_id']; ?>">
                        <table class="table">
                            <tr>
                                <td>
                                    <label>
                                        Applicant Name
                                    </label>
                                </td>
                                <td>
                                    <select class="form-control" name="applicant_id">
                                        <option></option>
                                        <?php 
                                        foreach ($agent['applicant'] as $key => $value) {
                                           echo '<option value="'.$value->applicant_id.'">'.$value->applicant_first.' '.$value->applicant_last.'</option>';
                                        } ?>
                                    </select>
                                    <div style="color:#a94442;">
                                        <?php echo $this->session->flashdata('errors_applicant'); ?>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        Cash Advance
                                    </label>
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="cash_advance">
                                    <div style="color:#a94442;">
                                        <?php echo $this->session->flashdata('error_cash_advance'); ?>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br/>
                        <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-paper-plane"></i> Save changes</button>
                        <div class="clearfix"></div>
                    </form>
                </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<?php endforeach; ?>

<!-- Page Breadcrumb -->
<div class="page-breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <i class="fa fa-home"></i>
            <a href="<?php echo site_url('admin/'); ?>">Home</a>
        </li>
        <li class="active">Recruitment Agencies</li>
    </ul>
</div>
<!-- /Page Breadcrumb -->

<!-- Page Header -->
<div class="page-header position-relative">
    <div class="header-title">
        <h1>
            Recruitment Agencies
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

<?php echo $this->session->flashdata('success'); ?>
<script type="text/javascript">
    errorID = '';
    <?php 
    if($this->session->flashdata('error_agent_id') != ''){
        echo "errorID = '".$this->session->flashdata('error_agent_id')."';";
    }
    ?>
</script>

<!-- Page Body -->
<div class="page-body page-<?php echo $app->getTemplate(); ?>">
	<?php $app->renderAlerts(); ?> 

    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header  with-footer">
                    <span class="widget-caption">
                        <a href="#" role="button" class="btn btn-xs btn-default" data-toggle="modal" data-target="#modalAddRecruitmentAgent"><i class="fa fa-plus"></i> Add recruitment agent</a>
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
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped ">
                            <thead class=" bordered-palegreen">
                                <tr>
                                    <th width="5%">#</th>
                                    <th>Agent</th>
                                    <th>Contacts</th>
                                    <th>Email</th>
                                    <th>Refered Applicants</th>
                                    <th>Agent Commission</th>
                                    <th>Cash Advance</th>
                                    <th>Balance</th>
                                    <th>Created</th>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $ctr = $paginationCounter['from']; ?>
                                <?php foreach ($agents as $agent): ?>
                                <tr>
                                    <td>
                                        <?php echo str_pad( $ctr, 3, '0', STR_PAD_LEFT); ?>
                                    </td>
                                    <td>
                                        <?php echo $agent['agent_first'].' '.$agent['agent_last']; ?>
                                    </td>
                                    <td>
                                        <?php echo str_replace(',', ' / ', $agent['agent_contacts'] ); ?>
                                    </td>
                                    <td>
                                        <a href="mailto:<?php echo $agent['agent_email']; ?>"><?php echo $agent['agent_email']; ?></a>
                                    </td>
                                    <td>
                                        <?php echo number_format( $agent['applicants'] ); ?>
                                    </td>
                                    <td>
                                        <?php echo $agent['agent_commission']; ?>
                                    </td>
                                    <td>
                                        <?php echo $agent['cash_advance']; ?>
                                    </td>
                                    <td>
                                        <?php echo $agent['balance']; ?>
                                    </td>
                                    <td>
                                        <small><?php echo date( 'M-d-Y h:ia', strtotime( $agent['agent_created'] ) ); ?></small>
                                    </td>
                                    <td>
                                        <a href="#" class="btn btn-default btn-xs black " data-toggle="modal" data-target="#CATransaction<?php echo $agent['agent_id']; ?>"><i class="fa fa-money"></i> Cash Advance</a>
                                    </td>
                                    <td>
                                        <a href="#" class="btn btn-default btn-xs black btn-edit-recruitment-agent" data-toggle="modal" data-target="#modalEditRecruitmentAgent" data-recruitment-agent="<?php echo (int) $agent['agent_id']; ?>"><i class="fa fa-pencil"></i> Edit</a>
                                    </td>
                                </tr>
                                <?php $ctr++; ?>
                                <?php endforeach; ?>
                                <?php if ( count( $agents ) == 0 ): ?>
                                <tr>
                                    <td align="center" colspan="7">-- No recruitment agents --</td>
                                </tr>
                                <?php endif; ?>
                            </tbody>
                        </table> 
                    </div>
                    <hr>
                    <div class="footer" align="right">
                        <span class="pull-left">
                           Showing <?php echo $paginationCounter['from']; ?> to <?php echo $paginationCounter['to']; ?> of <?php echo $paginationCounter['total-records']; ?> entries
                        </span>
                        <?php echo $paginationHTML; ?>
                        <div class="clearfix"></div>
                    </div> 
                </div> 
            </div>
        </div>
    </div>
</div>
<!-- /Page Body --> 

<script type="text/javascript">
$('#myTabs a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
});
</script>