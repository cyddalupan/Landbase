<?php $app->renderStyles(); ?>
<?php $subStatus = cydGetJson("addSubStatus.json"); ?>
<div class="modal-header">
    <button aria-hidden="true" data-dismiss="modal" class="bootbox-close-button close" type="button">×</button>
    <h4 class="modal-title">Applicants Report</h4>
</div>

<form method="post" class="form" action="<?php echo site_url( 'admin/reports/applicants' ); ?>" target="_blank">
<div class="modal-body">
    <div class="bootbox-body">
    	<div class="row">
    		<div class="col-sm-3">
    			Status:
    		</div>
    		<div class="col-sm-5">
    			<select name="applicant[status]" class="form-control">
					<option value="">------</option>
					<option value="<?php echo $status['Selected']; ?>">Selected</option>
					<option value="<?php echo $status['Deployed']; ?>">Deployed</option>	
				</select>
    		</div>
    	</div>
		
    	<div class="row selected-option hide">
		<p>&nbsp;</p>			
			<div class="col-sm-3">
				Sub Status:
			</div>
			<div class="col-sm-5">
				<select name="applicant[substatus]" class="form-control">
					<option value="">All</option>
					<?php foreach($subStatus as $subStat) {?>
                    <option><?php echo $subStat; ?></option>
                    <?php }//substatus loop ?>
				</select>
			</div>
		</div>

		<p>&nbsp;</p>

		<div class="row">
			<div class="col-sm-3">
				Date (From):
			</div>
			<div class="col-sm-5">
				<div class="input-group">
			        <input name="applicant[date-from]" type="text" data-date-format="yyyy-mm-dd" class="form-control date-picker" placeholder="yyyy-mm-dd" value="<?php echo date( 'Y-m-d', time() ); ?>">
			        <span class="input-group-addon">
			            <i class="fa fa-calendar"></i>
			        </span>
			    </div>
			</div>
		</div>

		<p>&nbsp;</p>

		<div class="row">
			<div class="col-sm-3">
				Date (to):
			</div>
			<div class="col-sm-5">
				<div class="input-group">
			        <input name="applicant[date-to]" type="text" data-date-format="yyyy-mm-dd" class="form-control date-picker" placeholder="yyyy-mm-dd" value="<?php echo date( 'Y-m-d', time() ); ?>">
			        <span class="input-group-addon">
			            <i class="fa fa-calendar"></i>
			        </span>
			    </div>
			</div>
		</div>

		<p>&nbsp;</p>

		<div class="row">			
			<div class="col-sm-3">
				Employer:
			</div>
			<div class="col-sm-5">
				<select name="applicant[employer]" class="form-control">
					<option value="0">-- All --</option>
					<?php foreach ( $employers as $employer ): ?>
					<option value="<?php echo $employer['employer_id']; ?>"><?php echo $employer['employer_name']; ?></option>
					<?php endforeach; ?>
				</select>
			</div>
		</div>
 
    </div>
</div>
<div class="modal-footer">
    <button class="btn btn-default" data-dismiss="modal"  type="button">Cancel</button>
    <button class="btn btn-primary" type="submit">Generate</button>
</div>
</form>
<?php $app->renderScripts(); ?>