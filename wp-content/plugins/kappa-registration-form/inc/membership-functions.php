<?php

function dashboardSidebar(){
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
	<?php
}


add_filter( 'query_vars', 'add_query_vars');

function add_query_vars( $vars ) {
    $vars[] = 'account';
    $vars[] = 'update-password';
    $vars[] = 'update-profile';
    return $vars;
}


// Add rewrite endpoint


add_action( 'init', 'account_page_endpoint' );
function account_page_endpoint() {
    add_rewrite_endpoint( 'account', EP_ROOT );
    add_rewrite_endpoint( 'update-password', EP_ROOT );
    add_rewrite_endpoint( 'update-profile', EP_ROOT );
}


// Account template

add_action( 'template_include', 'account_page_template' );
function account_page_template( $template ) {
    if( get_query_var( 'account', false ) !== false ) {       
		return  plugin_dir_path( __FILE__ ) . 'account/account.php';
    }else if(get_query_var( 'update-password', false ) !== false){
    	return  plugin_dir_path( __FILE__ ) . 'account/update-password.php';
    }else if(get_query_var( 'update-profile', false ) !== false){
    	return  plugin_dir_path( __FILE__ ) . 'account/update-profile.php';
    }
    return $template;
}
