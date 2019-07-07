<?php
/**
 * The Sidebar containing the main widget areas.
 *
 * @package dazzling
 */
 global $user_login; 
 global $current_user;
 if(!$user_login){
 	return;
 }

?>
	<div id="secondary" class="widget-area col-sm-12 col-md-4" role="complementary">
			

		<aside id="archives" class="widget">
			<h1 class="widget-title"><?php _e( 'Dashboard', 'dazzling' ); ?></h1>
				<ul>
		 <li <?php if(is_page('account')){echo 'class="active"';} ?>><a href="<?php echo site_url(); ?>/account/"><i class="fa fa-window-maximize"></i>Dashboard</a></li>
		 <li <?php if(is_page('update-profile')){echo 'class="active"';} ?>><a href="<?php echo site_url(); ?>/update-profile/"><i class="fa fa-user"></i>Update Profile</a></li>
		 <li <?php if(is_page('update-password')){echo 'class="active"';} ?>><a href="<?php echo site_url(); ?>/update-password/"><i class="fa fa-key"></i>Change Password</a></li>
		 <li><a href="<?php echo wp_logout_url(home_url( '/login/' )); ?>"><i class="fa fa-power-off"></i>Logout</a></li>
	</ul>
			</aside>

		
	</div><!-- #secondary -->
