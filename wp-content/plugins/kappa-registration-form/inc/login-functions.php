<?php 

/* remove admin bar for subscriber */
add_action('after_setup_theme', 'remove_admin_bar'); 
function remove_admin_bar() {
    ob_start();
	$current_user   = wp_get_current_user();
    $role_name      = $current_user->roles[0]; 
	if ('subscriber' === $role_name ) {
	  show_admin_bar(false);
	}
}

/* redirect wp-admin for subscriber */
function redirect_users_by_role() { 
    $current_user   = wp_get_current_user();
    $role_name      = $current_user->roles[0]; 
    if ( 'subscriber' === $role_name ) {
        wp_redirect(home_url('/my-account/' ));
    }  
} // redirect_users_by_role
add_action( 'admin_init', 'redirect_users_by_role' );

/* front page access for subscriber */
function kp_restrict_access() {
    global $wp_query;
    $query_vars = $wp_query->query_vars;
    // Or restrict by redirecting
    $restricted_pages = array( 'my-account', 'update-password', 'logout', 'subscription-renew' );
    if ( !is_user_logged_in() and in_array($query_vars['pagename'], $restricted_pages ))
       wp_redirect( home_url() ); 
}
add_action( 'wp', 'kp_restrict_access' );


add_action( 'wp_login_failed', 'my_front_end_login_fail' );  // hook failed login
function my_front_end_login_fail( $username ) {
   $referrer = wp_get_referer();  // where did the post submission come from?
   // if there's a valid referrer, and it's not the default log-in screen
   if ( !empty($referrer) && !strstr($referrer,'wp-login') && !strstr($referrer,'wp-admin') ) {
      wp_redirect( $referrer);
      	$_SESSION['loginError'][] = 'Username or Password is incorrect.';
         // let's append some information (login=failed) to the URL for the theme to use
      exit;
   }
}

add_action( 'authenticate', 'check_username_password', 1, 3);
function check_username_password( $login, $username, $password ) {
// Getting URL of the login page
$referrer = wp_get_referer();
// if there's a valid referrer, and it's not the default log-in screen
	if( !empty( $referrer ) && !strstr( $referrer,'wp-login' ) && !strstr( $referrer,'wp-admin' ) ) { 
	    if( $username == "" || $password == "" ){
	        wp_redirect( $referrer );
	        	$_SESSION['loginError'][] = 'Username Or Password is empty.';
	        exit;
	    }
	}
}

// starting session
add_action('init', 'myStartSession', 1);
function myStartSession() {
	  ob_start();
    session_start();
}


function sessionMsg($array){
	if(!empty($array)){
	echo '<div class="alert alert-warning"><ul>';
		foreach ($array as $value) {
			echo '<li>'.$value.'</li>';
		}
	}
	echo '</ul></div>';
}


