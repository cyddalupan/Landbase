<div id="modalAddRecruitmentAgent" role="dialog" tabindex="-1" class="modal fade modal-darkorange" aria-hidden="false">
	<div class="modal-dialog">
    	<div class="modal-content">
        	<div class="modal-header">
            	<button aria-hidden="true" data-dismiss="modal" class="bootbox-close-button close" type="button">×</button>
                <h4 class="modal-title">New Recruitment Agent</h4>
            </div>
            
            <form method="post" class="form" role="form">
            <input type="hidden" name="flag" value="add" />
            <div class="modal-body">
                <div class="bootbox-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="agent[first]">First name</label>
                                        <input name="agent[first]" type="text" placeholder="First" class="form-control" value="<?php echo isset( $post['agent']['first'] ) ? $post['agent']['first'] : ''; ?>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="agent[last]">Last name</label>
                                        <input name="agent[last]" type="text" placeholder="Last" class="form-control" value="<?php echo isset( $post['agent']['last'] ) ? $post['agent']['last'] : ''; ?>">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="agent[contacts]">Contact numbers <small><em>(Press Enter to accept contact)</em></small></label>
                                <input name="agent[contacts]" class="form-control" type="text" placeholder="Add contact" value="<?php echo isset( $post['agent']['contacts'] ) ? $post['agent']['contacts'] : ''; ?>" />
                            </div>
                            <div class="form-group">
                            	<label for="agent[email]">Email</label>
                                <input name="agent[email]" type="email" placeholder="Email address" class="form-control" value="<?php echo isset( $post['agent']['email'] ) ? $post['agent']['email'] : ''; ?>" style="text-transform:lowercase">
                            </div>  
                            <div class="form-group">
                                <label for="agent[agent_commission]">Agent Commission</label>
                                <input name="agent[agent_commission]" type="text" placeholder="Agent Commission" class="form-control" value="<?php echo isset( $post['agent']['agent_commission'] ) ? $post['agent']['agent_commission'] : ''; ?>" style="text-transform:lowercase">
                            </div> 
                        </div>
                    </div> 
                    
                </div>
           </div>
			<div class="modal-footer">
    			<button class="btn btn-default" data-dismiss="modal" type="button">Cancel</button>
                <button class="btn btn-primary" type="submit">Add</button>
			</div>
            </form>
		</div>
	</div>
</div>


<div id="modalEditRecruitmentAgent" role="dialog" tabindex="-1" class="modal fade modal-darkorange" aria-hidden="false">
	<div class="modal-dialog">
    	<div class="modal-content">
        	<div class="modal-header">
            	<button aria-hidden="true" data-dismiss="modal" class="bootbox-close-button close" type="button">×</button>
                <h4 class="modal-title">--</h4>
            </div>
            
            <form method="post" class="form" role="form">
            <input type="hidden" name="flag" value="edit" />
            <input type="hidden" name="agent[agent_id]" value="0" />
            <div class="modal-body">
                <div class="bootbox-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="agent[first]">First name</label>
                                        <input name="agent[first]" type="text" placeholder="First" class="form-control" value="<?php echo isset( $post['agent']['first'] ) ? $post['agent']['first'] : ''; ?>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="agent[last]">Last name</label>
                                        <input name="agent[last]" type="text" placeholder="Last" class="form-control" value="<?php echo isset( $post['agent']['last'] ) ? $post['agent']['last'] : ''; ?>">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="agent[contacts]">Contact numbers <small><em>(Press Enter to accept contact)</em></small></label>
                                <input name="agent[contacts]" class="form-control" type="text" placeholder="Add contact" value="<?php echo isset( $post['agent']['contacts'] ) ? $post['agent']['contacts'] : ''; ?>" />
                            </div>
                            <div class="form-group">
                            	<label for="agent[email]">Email</label>
                                <input name="agent[email]" type="email" placeholder="Email address" class="form-control" value="<?php echo isset( $post['agent']['email'] ) ? $post['agent']['email'] : ''; ?>" style="text-transform:lowercase">
                            </div> 
                            <div class="form-group">
                                <label for="agent[agent_commission]">Agent Commission</label>
                                <input name="agent[agent_commission]" type="text" placeholder="Agent Commission" class="form-control" value="<?php echo isset( $post['agent']['agent_commission'] ) ? $post['agent']['agent_commission'] : ''; ?>" style="text-transform:lowercase">
                            </div> 
                        </div>
                    </div> 
                </div>
           </div>
			<div class="modal-footer">
    			<button class="btn btn-default" data-dismiss="modal" type="button">Cancel</button>
                <button class="btn btn-primary" type="submit">Save changes</button>
			</div>
            </form>
		</div>
	</div>
</div>
