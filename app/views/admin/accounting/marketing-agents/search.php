<?php $app->renderStyles(); ?>
<div class="modal-header">
    <button aria-hidden="true" data-dismiss="modal" class="bootbox-close-button close" type="button">×</button>
    <h4 class="modal-title">Marketing Agents</h4>
</div>

<form method="post" class="form" action="<?php echo site_url( 'admin/accounting/marketing-agents' ); ?>" target="_blank">
<div class="modal-body">
    <div class="bootbox-body">

    	<div class="row">			
			<div class="col-sm-3">
				Marketing Agents:
			</div>
			<div class="col-sm-5">
				<select name="agent[agent]" class="form-control">
					<option value="0">-- All --</option>
					<?php foreach ( $agents as $agent ): ?>
					<option value="<?php echo $agent['agent_id']; ?>"><?php echo $agent['agent_first'].' '.$agent['agent_last']; ?></option>
					<?php endforeach; ?>
				</select>
			</div>
		</div>

		<p>&nbsp;</p>

		<div class="row">		
			<div class="col-sm-5 col-sm-offset-3">
				<select name="agent[status]" class="form-control">
					<option value="1">APPROVED</option>
					<option value="0">NOT APPROVED</option>
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
			        <input name="agent[date-from]" type="text" data-date-format="yyyy-mm-dd" class="form-control date-picker" placeholder="yyyy-mm-dd" value="<?php echo date( 'Y-m-d', time() ); ?>">
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
			        <input name="agent[date-to]" type="text" data-date-format="yyyy-mm-dd" class="form-control date-picker" placeholder="yyyy-mm-dd" value="<?php echo date( 'Y-m-d', time() ); ?>">
			        <span class="input-group-addon">
			            <i class="fa fa-calendar"></i>
			        </span>
			    </div>
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