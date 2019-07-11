<?php

function dashboardSidebar(){



	?>
	<div id="secondary" class="widget-area col-sm-12 col-md-4" role="complementary">
		<aside id="archives" class="widget">
			<h1 class="widget-title"><?php _e( 'Dashboard', 'dazzling' ); ?></h1>
	<ul>
		 <li <?php echo $activeClass; ?>><a href="<?php echo site_url(); ?>/account/"><i class="fa fa-dashboard"></i> Dashboard</a></li>
		 <li <?php echo $activeClass; ?>><a href="<?php echo site_url(); ?>/idealist/"><i class="fa fa-home"></i> Ideas</a></li>
		 <li <?php echo $activeClass; ?>><a href="<?php echo site_url(); ?>/project-list/"><i class="fa fa-tasks"></i> Projects</a></li>
		 <li <?php echo $activeClass; ?>><a href="<?php echo site_url(); ?>/startup-list/"><i class="fa fa-industry"></i> Startup/MSMEs</a></li>
		 <li <?php echo $activeClass; ?>><a href="<?php echo site_url(); ?>/teamlist/"><i class="fa fa-group"></i> Team Mates Required</a></li>
		 <li <?php echo $activeClass; ?>><a href="<?php echo site_url(); ?>/update-profile/"><i class="fa fa-user"></i> Update Profile</a></li>
		 <li <?php echo $activeClass; ?>><a href="<?php echo site_url(); ?>/update-password/"><i class="fa fa-key"></i> Change Password</a></li>
		 <li><a href="<?php echo wp_logout_url(home_url( '/login/' )); ?>"><i class="fa fa-power-off"></i> Logout</a></li>
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
    $vars[] = 'idealist';
    $vars[] = 'edit-idea';
    $vars[] = 'startup-list';
    $vars[] = 'edit-startup';
    $vars[] = 'teamlist';
    $vars[] = 'edit-team';
    $vars[] = 'project-list';
    $vars[] = 'edit-project';
    return $vars;
}


// Add rewrite endpoint


add_action( 'init', 'account_page_endpoint' );
function account_page_endpoint() {
    add_rewrite_endpoint( 'account', EP_ROOT );
    add_rewrite_endpoint( 'update-password', EP_ROOT );
    add_rewrite_endpoint( 'update-profile', EP_ROOT );
    add_rewrite_endpoint( 'idealist', EP_ROOT );
    add_rewrite_endpoint( 'edit-idea', EP_ROOT );
    add_rewrite_endpoint( 'startup-list', EP_ROOT );
    add_rewrite_endpoint( 'edit-startup', EP_ROOT );
    add_rewrite_endpoint( 'teamlist', EP_ROOT );
    add_rewrite_endpoint( 'edit-team', EP_ROOT );
    add_rewrite_endpoint( 'project-list', EP_ROOT );
    add_rewrite_endpoint( 'edit-project', EP_ROOT );
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
    }else if(get_query_var( 'idealist', false ) !== false){
    	return  plugin_dir_path( __FILE__ ) . 'account/idea-list.php';
    }else if(get_query_var( 'edit-idea', false ) !== false){
    	return  plugin_dir_path( __FILE__ ) . 'account/edit-idea.php';
    }else if(get_query_var( 'startup-list', false ) !== false){
    	return  plugin_dir_path( __FILE__ ) . 'account/startup-list.php';
    }else if(get_query_var( 'edit-startup', false ) !== false){
    	return  plugin_dir_path( __FILE__ ) . 'account/edit-startup.php';
    }else if(get_query_var( 'teamlist', false ) !== false){
    	return  plugin_dir_path( __FILE__ ) . 'account/teamlist.php';
    }else if(get_query_var( 'edit-team', false ) !== false){
    	return  plugin_dir_path( __FILE__ ) . 'account/edit-team.php';
    }else if(get_query_var( 'project-list', false ) !== false){
    	return  plugin_dir_path( __FILE__ ) . 'account/project-list.php';
    }else if(get_query_var( 'edit-project', false ) !== false){
    	return  plugin_dir_path( __FILE__ ) . 'account/edit-project.php';
    }
    return $template;
}



add_action( 'wp_ajax_deletePost', 'deletePost' );
add_action( 'wp_ajax_nopriv_deletePost', 'deletePost' );

function deletePost(){
	$deleteId = intval($_POST['deleteID']);
	wp_trash_post($deleteId);
	echo 'success';

}