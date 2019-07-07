<?php 


function change_password_form() { ?>
	<form action="" method="post" data-parsley-validate="">
        <div class="form-group">
           <label for="current_password">Current Password:</label>           
              <input id="current_password" type="password" name="current_password" data-parsley-required class="form-control">        
        </div>
        <div class="form-group">
           <label for="first_name">New password:</label>           
             <input id="new_password" type="password" name="new_password" data-parsley-minlength="6" data-parsley-required class="form-control">               
        </div>

        <div class="form-group">
           <label for="confirm_new_password">Confirm password:</label>           
             <input id="confirm_new_password" type="password" name="confirm_new_password" data-parsley-minlength="6" data-parsley-required data-parsley-equalto="#new_password" class="form-control">             
        </div>
        <input type="submit" value="Change Password">
    </form>
<?php }

function change_password(){
	if(isset($_POST['current_password'])){
		$_POST = array_map('stripslashes_deep', $_POST);
		$current_password = sanitize_text_field($_POST['current_password']);
		$new_password = sanitize_text_field($_POST['new_password']);
		$confirm_new_password = sanitize_text_field($_POST['confirm_new_password']);
		$user_id = get_current_user_id();
		$errors = array();
		$current_user = get_user_by('id', $user_id);
    $err= 0;
		// Check for errors
		if (empty($current_password) && empty($new_password) && empty($confirm_new_password) ) {
      $err++;
		$_SESSION['msg'][] = 'All fields are required';
		}
		if($current_user && wp_check_password($current_password, $current_user->data->user_pass, $current_user->ID)){
		//match
		} else {
      $err++;
			$_SESSION['msg'][] = 'Current Password is incorrect';
		}
		if($new_password != $confirm_new_password){
      $err++;
			$_SESSION['msg'][] = 'Password does not match';
		}
		if(strlen($new_password) < 6){
      $err++;
			$_SESSION['msg'][] = 'Password is too short, minimum of 6 characters';
		}
  		if($err == 0 ){
  			wp_set_password( $new_password, $current_user->ID );
  			$userdata['ID'] = $current_user->ID; //user ID
  			$userdata['user_pass'] = $new_password;
  			wp_update_user( $userdata );

  			$_SESSION['msg'][] ='Password successfully changed!';
         wp_redirect(site_url()."/update-password");
         exit;
  		} 
      else{
         wp_redirect(site_url()."/update-password");
      }
    }
}

function kp_form_shortcode(){
	    change_password();
        change_password_form();
}
add_shortcode('kp_changepassword', 'kp_form_shortcode');





