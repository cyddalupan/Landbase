<?php $app->renderStyles(); ?>
<div class="modal-header">
    <button aria-hidden="true" data-dismiss="modal" class="bootbox-close-button close" type="button">×</button>
    <h4 class="modal-title">List Employers</h4>
</div>

<form method="post" class="form" action="<?php echo site_url( 'admin/reports/marketing-agencies-employers' ); ?>" target="_blank">
<div class="modal-body">
    <div class="bootbox-body">
    	
		<div class="row">			
			<div class="col-sm-3">
				Marketing Agency:
			</div>
			<div class="col-sm-5">
				<select name="employer[agency]" class="form-control">
					<option value="0">-- All --</option>
					<?php foreach ( $agencies as $agency ): ?>
					<option value="<?php echo $agency['agency_id']; ?>"><?php echo $agency['agency_name']; ?></option>
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