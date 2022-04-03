<div class="page-sidebar <?php echo $app->getSideBarClass(); ?>" id="sidebar">
    <!-- Page Sidebar Header-->
    <div class="sidebar-header-wrapper">
        <form method="get" action="<?php echo site_url(); ?>admin/applicants/all">
        <input type="text" name="search[q]" class="form-control searchinput" placeholder="Keywords" value="<?php echo isset( $get['search']['q'] ) ? $get['search']['q'] : ''; ?>">
        <input type="hidden" name="search[country]" value="0">
        <input type="hidden" name="search[position]" value="0">
        <input type="hidden" name="search[employer]" value="0">
        <input type="hidden" name="search[age][from]" value="0">
        <input type="hidden" name="search[salary][from]" value="0">
        <input type="hidden" name="search[date-applied][from]" value="0">
        <input type="hidden" name="search[status]" value="111">
		<input type="hidden" name="search[recruitmentAgent]]" value="0">
        </form>
        <i class="searchicon fa fa-search"></i>
        <div class="searchhelper">Search Applicants, Employers, Users</div>
    </div>
    <!-- /Page Sidebar Header -->
    
    <!-- Sidebar Menu -->
    <ul class="nav sidebar-menu">
        <!--Dashboard-->
        <li class="<?php echo controllerActive('dashboard'); ?>">
            <a href="<?php href('admin/dashboard'); ?>">
                <i class="menu-icon fa fa-home"></i>
                <span class="menu-text"> Dashboard </span>
            </a>
        </li>
        
        <?php if ( in_array( $_SESSION['admin']['user']['user_type'], [1, 3,4, 6, 7]) ): ?>
        <!-- Applicants -->
        <li class="<?php echo controllerActive('applicants', true); ?>">
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-bookmark"></i>
                <span class="menu-text"> Applicants </span>
                <i class="menu-expand"></i>
            </a>
    
            <ul class="submenu">
                <?php if ( ! in_array( $_SESSION['admin']['user']['user_type'], [6, 7]) ): ?>
                <li class="<?php echo subControllerActive('applicants/add'); ?>">
                    <a href="<?php href( 'admin/applicants/add' ); ?>">
                        <span class="menu-text btn btn-default btn-xs"><i class="fa fa-plus"></i> Add Applicant</span>
                    </a>
                </li>
                <?php endif; ?>

                <?php if ( in_array( $_SESSION['admin']['user']['user_type'], [6, 7, 3, 4]) ): ?>
                <li class="<?php echo subControllerActive('applicants/all'); ?>">
                    <a href="<?php href( 'admin/applicants/all' ); ?>">
                        <span class="menu-text">All</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('applicants/all?status=Available'); ?>">
                    <a href="<?php href( 'admin/applicants/all?status=Available' ); ?>">
                        <span class="menu-text">Available</span> 
                    </a>
                </li>
                <li class="<?php echo subControllerActive('applicants/all?status=For Review'); ?>">
                    <a href="<?php href( 'admin/applicants/all?status=For Review' ); ?>">
                        <span class="menu-text">Under Review</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('applicants/all?status=Reserved'); ?>">
                    <a href="<?php href( 'admin/applicants/all?status=Reserved' ); ?>">
                        <span class="menu-text">Reserved</span> 
                    </a>
                </li>
                <li class="<?php echo subControllerActive('applicants/expired-reservations'); ?>">
                    <a href="<?php href( 'admin/applicants/expired-reservations' ); ?>">
                        <span class="menu-text">Expired Reservations</span> 
                    </a>
                </li>
                <li class="<?php echo subControllerActive('applicants/expired-medical'); ?>">
                    <a href="<?php href( 'admin/applicants/expired-medical' ); ?>">
                        <span class="menu-text">Expired Medical</span> 
                    </a>
                </li>
                <li class="<?php echo subControllerActive('applicants/expired-passports'); ?>">
                    <a href="<?php href( 'admin/applicants/expired-passports' ); ?>">
                        <span class="menu-text">Expired Passports</span> 
                    </a>
                </li>
                <li class="<?php echo subControllerActive('applicants/all?status=Line Up'); ?>">
                    <a href="<?php href( 'admin/applicants/all?status=Line Up' ); ?>">
                        <span class="menu-text"> Line Up</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('applicants/selected'); ?>">
                    <a href="<?php href( 'admin/applicants/selected' ); ?>">
                        <span class="menu-text"> Selected</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('applicants/for-deployment'); ?>">
                    <a href="<?php href( 'admin/applicants/for-deployment' ); ?>">
                        <span class="menu-text"> For Deployment</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('applicants/deployed'); ?>">
                    <a href="<?php href( 'admin/applicants/deployed' ); ?>">
                        <span class="menu-text"> Deployed</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('applicants/cancelled'); ?>">
                    <a href="<?php href( 'admin/applicants/all?status=Cancelled' ); ?>">
                        <span class="menu-text"> Cancelled</span>
                    </a>
                </li>
                <?php endif; ?>
            </ul>
        </li>
        <?php endif; ?>

        <!-- Employers -->
        <?php if ( in_array( $_SESSION['admin']['user']['user_type'], [3,4]) ): ?>
        <li class="<?php echo controllerActive('employers', true); ?>">
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-briefcase"></i>
                <span class="menu-text"> Employers </span>
                <i class="menu-expand"></i>
            </a>
    
            <ul class="submenu">
                <li class="<?php echo subControllerActive('employers/add'); ?>">
                    <a href="<?php href( 'admin/employers/add' ); ?>" role="button" data-toggle="modal" data-target="#modalReports">
                        <span class="menu-text btn btn-default btn-xs"><i class="fa fa-plus"></i> Add employer</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('employers/all'); ?>">
                    <a href="<?php href( 'admin/employers/all' ); ?>">
                        <span class="menu-text">All</span>
                    </a>
                </li>
            </ul>
        </li>
        <?php endif; ?>

        <!-- Agencies / Agents -->
        <?php if ( in_array( $_SESSION['admin']['user']['user_type'], [3,4]) ): ?>
        <li class="<?php echo controllerActive('agencies', true); ?>">
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-language"></i>
                <span class="menu-text"> Agencies / Agents</span>
                <i class="menu-expand"></i>
            </a>
    
            <ul class="submenu">
                <li class="<?php echo subControllerActive('agencies/marketing-agencies'); ?>">
                    <a href="<?php href( 'admin/agencies/marketing-agencies' ); ?>">
                        <span class="menu-text">Marketing Agencies</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('agencies/marketing-agents'); ?>">
                    <a href="<?php href( 'admin/agencies/marketing-agents' ); ?>">
                        <span class="menu-text">Marketing Agents</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('agencies/recruitment-agents'); ?>">
                    <a href="<?php href( 'admin/agencies/recruitment-agents' ); ?>">
                        <span class="menu-text">Recruitment Agents</span>
                    </a>
                </li>
            </ul>
        </li>
        <?php endif; ?>
        
        <!-- Commission -->
        <?php if ( in_array( $_SESSION['admin']['user']['user_type'], [2, 8, 4]) ): ?>
        <li class="<?php echo controllerActive('commissions', true); ?>">
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-cutlery"></i>
                <span class="menu-text"> Commissions</span>
                <i class="menu-expand"></i>
            </a>
    
            <ul class="submenu">
                <li class="<?php echo subControllerActive('commissions/transactions'); ?>">
                    <a href="<?php href( 'admin/commissions/transactions' ); ?>">
                        <span class="menu-text">All transactions</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('commissions/marketing-agencies'); ?>">
                    <a href="<?php href( 'admin/commissions/marketing-agencies' ); ?>">
                        <span class="menu-text">Marketing Agency</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('commissions/marketing-agents'); ?>">
                    <a href="<?php href( 'admin/commissions/marketing-agents' ); ?>">
                        <span class="menu-text">Marketing Agents</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('commissions/recruitment-agents'); ?>">
                    <a href="<?php href( 'admin/commissions/recruitment-agents' ); ?>">
                        <span class="menu-text">Recruitment Agents</span>
                    </a>
                </li>
            </ul>
        </li> 
        
        <!-- Billing -->
        <?php if ( ! in_array( $_SESSION['admin']['user']['user_type'], [3]) ): ?>
        <li class="<?php echo controllerActive('billing', true); ?>">
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-dollar"></i>
                <span class="menu-text"> Billing</span>
                <i class="menu-expand"></i>
            </a>
    
            <ul class="submenu">
                <li class="<?php echo subControllerActive('billing/transactions'); ?>">
                    <a href="<?php href( 'admin/billing/transactions' ); ?>">
                        <span class="menu-text">All transactions</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('billing/employers'); ?>">
                    <a href="<?php href( 'admin/billing/employers' ); ?>">
                        <span class="menu-text">Due to Employer</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('billing/workers'); ?>">
                    <a href="<?php href( 'admin/billing/workers' ); ?>">
                        <span class="menu-text">Due to Worker</span>
                    </a>
                </li>
            </ul>
        </li>
        <?php endif; ?>      
        <?php endif; ?>      
        
        <!-- Job Offers -->
        <?php if ( in_array( $_SESSION['admin']['user']['user_type'], [3,4]) ): ?>
        <li class="<?php echo controllerActive('jobs', true); ?>">
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-file-o"></i>
                <span class="menu-text"> Job Orders </span>
                <i class="menu-expand"></i>
            </a>
    
            <ul class="submenu">
                <li class="<?php echo subControllerActive('jobs/add'); ?>">
                    <a class="btn-add-job" href="<?php href( 'admin/jobs/add' ); ?>" role="button" data-toggle="modal" data-target="#modalReports">
                        <span class="menu-text btn btn-default btn-xs"><i class="fa fa-plus"></i> Add Job Offer</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('jobs/all'); ?>">
                    <a href="<?php href( 'admin/jobs/all' ); ?>">
                        <span class="menu-text">All</span>
                    </a>
                </li>
            </ul> 
        </li>
        <?php endif; ?> 
        
        <?php if ( in_array( $_SESSION['admin']['user']['user_type'], [3,4,6]) ): ?>
        <!-- Applicant Reports -->
        <li class="<?php echo controllerActive('applicant-reports', true); ?>">
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-file-text-o"></i>
                <span class="menu-text"> Applicant Reports </span>
    
                <i class="menu-expand"></i>
            </a>
    
            <ul class="submenu">
                <li class="<?php echo subControllerActive('reports/applicants'); ?>">
                    <a href="<?php echo site_url( 'admin/reports/applicants-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                        <span class="menu-text"> Selected & Deployed </span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('reports/applicants-status'); ?>">
                    <a href="<?php echo site_url( 'admin/reports/applicants-status-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                        <span class="menu-text"> Applicant Status Report</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('reports/employers'); ?>">
                    <a href="<?php echo site_url( 'admin/reports/employers-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                        <span class="menu-text"> Employers </span>
                    </a>
                </li>
                <li>
                    <a href="#" class="menu-dropdown">
                        <span class="menu-text">
                           Marketing Agencies
                        </span>
                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="<?php echo site_url( 'admin/reports/marketing-agencies-employers-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                                <span class="menu-text">Employers</span>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo site_url( 'admin/reports/marketing-agencies-deployed-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                                <span class="menu-text">Deployed Applicants</span>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo site_url( 'admin/reports/marketing-agencies-selected-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                                <span class="menu-text">Selected Applicants</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="menu-dropdown">
                        <span class="menu-text">
                           Marketing Agents
                        </span>
                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="<?php echo site_url( 'admin/reports/marketing-agents-employers-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                                <span class="menu-text">Employers</span>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo site_url( 'admin/reports/marketing-agents-deployed-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                                <span class="menu-text">Deployed Applicants</span>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo site_url( 'admin/reports/marketing-agents-selected-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                                <span class="menu-text">Selected Applicants</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="menu-dropdown">
                        <span class="menu-text">
                           Recruitment Agents
                        </span>
                        <i class="menu-expand"></i>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="<?php echo site_url( 'admin/reports/recruitment-agents-deployed-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                                <span class="menu-text">Deployed Applicants</span>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo site_url( 'admin/reports/recruitment-agents-selected-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                                <span class="menu-text">Selected Applicants</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
        <?php endif; ?> 

        <?php if ( in_array( $_SESSION['admin']['user']['user_type'], [2, 4, 8]) ): ?>
        <!-- Accounting Reports -->
        <li class="<?php echo controllerActive('accounting', true); ?>">
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-file-text-o"></i>
                <span class="menu-text"> Accounting Reports </span>
    
                <i class="menu-expand"></i>
            </a>
    
            <ul class="submenu">
                <li class="<?php echo subControllerActive('accounting/workers-search'); ?>">
                    <a href="<?php echo site_url( 'admin/accounting/workers-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                        <span class="menu-text"> Workers</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('accounting/employers-search'); ?>">
                    <a href="<?php echo site_url( 'admin/accounting/employers-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                        <span class="menu-text"> Employers </span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('accounting/marketing-agencies-search'); ?>">
                    <a href="<?php echo site_url( 'admin/accounting/marketing-agencies-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                        <span class="menu-text"> Marketing Agencies </span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('accounting/marketing-agents-search'); ?>">
                    <a href="<?php echo site_url( 'admin/accounting/marketing-agents-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                        <span class="menu-text"> Marketing Agents </span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('accounting/recruitment-agents-search'); ?>">
                    <a href="<?php echo site_url( 'admin/accounting/recruitment-agents-search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                        <span class="menu-text"> Recruitment Agents </span>
                    </a>
                </li>
                <!-- <li class="<?php echo subControllerActive('accounting/not-approved-vouchers'); ?>">
                    <a href="<?php href( 'admin/accounting/not-approved-vouchers' ); ?>">
                        <span class="menu-text">NOT APPROVED VOUCHER</span>
                    </a>
                </li> -->
            </ul>
        </li>
        <?php endif; ?> 

        <!-- User Logs -->
        <li class="<?php echo controllerActive('userlogs'); ?>">
            <a href="<?php echo site_url( 'admin/userlogs/search' ); ?>" role="button" class="btn-reports" data-toggle="modal" data-target="#modalReports">
                <i class="menu-icon fa fa-file-text-o"></i>
                <span class="menu-text"> User Logs</span>
            </a>
        </li>

        <?php if ( in_array( $_SESSION['admin']['user']['user_type'], [3,4]) ): ?>
        <!-- Users -->
        <li class="<?php echo controllerActive('users'); ?>">
            <a href="<?php href( 'admin/users/all' ); ?>">
                <i class="menu-icon fa fa-users"></i>
                <span class="menu-text"> Users</span>
            </a>
        </li>
        <?php endif; ?> 

        <?php if ( in_array( $_SESSION['admin']['user']['user_type'], [3,4]) ): ?>
        <!-- Settings -->
        <li class="<?php echo controllerActive('settings', true); ?>">
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-gears"></i>
                <span class="menu-text"> Settings </span>
    
                <i class="menu-expand"></i>
            </a>
    
            <ul class="submenu">
                <li class="<?php echo subControllerActive('settings/categories'); ?>">
                    <a href="<?php href('admin/settings/categories'); ?>">
                        <span class="menu-text"> Categories / Positions</span>
                    </a>
                </li>
                <li class="<?php echo subControllerActive('settings/countries'); ?>">
                    <a href="<?php href('admin/settings/countries'); ?>">
                        <span class="menu-text"> Countries </span>
                    </a>
                </li>
            </ul>
        </li>
        <?php endif; ?>  
		
		
		   <li class="">
            <a href="http://stepupmanpower.com/webadmin" target="_blank">
                <i class="menu-icon fa fa-home"></i>
                <span class="menu-text"> Manage Web  </span>
            </a>
		</li>
		
		

        <!--Right to Left-->
        <li>
            <a href="#" class="menu-dropdown">
                <i class="menu-icon fa fa-align-right"></i>
                <span class="menu-text"> Right to Left </span>
    
                <i class="menu-expand"></i>
            </a>
            <ul class="submenu">
                <li>
                    <a>
                        <span class="menu-text">RTL</span>
                        <label class="pull-right margin-top-10">
                            <input id="rtl-changer" class="checkbox-slider slider-icon colored-primary" type="checkbox">
                            <span class="text"></span>
                        </label>
                    </a>
                </li>
                <!--
                <li>
                    <a href="index-rtl-ar.html">
                        <span class="menu-text">Arabic Layout</span>
                    </a>
                </li>
    
                <li>
                    <a href="index-rtl-fa.html">
                        <span class="menu-text">Persian Layout</span>
                    </a>
                </li>
                -->
            </ul>
        </li>
    </ul>
    <!-- /Sidebar Menu -->
    
</div>