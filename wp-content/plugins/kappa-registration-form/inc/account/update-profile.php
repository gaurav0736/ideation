<?php 
kp_restrict_access();
get_header();
dashboardSidebar();
?>
<section id="primary" class="content-area col-sm-12 col-md-8 <?php echo of_get_option( 'site_layout' ); ?>">
			<main id="main" class="site-main" role="main">


				<header class="page-header">
					<h1 class="page-title">
						<?php _e( 'Change Password', 'kappa' );
						?>
					</h1>
					
				</header><!-- .page-header -->
				 
<?php 
$settings =   array(
    'wpautop' => false, // use wpautop?
    'textarea_rows' => get_option('default_post_edit_rows', 10), // rows="..."   
    'tinymce' => true, // load TinyMCE, can be used to pass settings directly to TinyMCE using an array()
    'quicktags' => true // load Quicktags, can be used to pass settings directly to Quicktags using an array()
);

 if (isset($_POST['submit'])){
    require_once(ABSPATH . '/wp-load.php');
    require_once(ABSPATH . 'wp-admin' . '/includes/file.php');
    require_once(ABSPATH . 'wp-admin' . '/includes/image.php');
    $fileinfo = @getimagesize($_FILES["userProfileImage"]["tmp_name"]);
    $width = $fileinfo[0];
    $height = $fileinfo[1];    
    $allowed_image_extension = array(
        "png",
        "jpg",
        "jpeg"
    );    
    // Get image file extension


 if(empty($_POST['area_interest'])){
           $_SESSION['msg'][] =  'Please select at least one area of interest.';
 }if(empty($_POST['area_interest'])){
           $_SESSION['msg'][] =  'Please select at least one member type.';
 }if(empty($_POST['city'])){
           $_SESSION['msg'][] =  'Please enter your city.';
 }
    $file_extension = pathinfo($_FILES["userProfileImage"]["name"], PATHINFO_EXTENSION);
    if (file_exists($_FILES["userProfileImage"]["tmp_name"])) {
        if (! in_array($file_extension, $allowed_image_extension)) {       
         $_SESSION['msg'][] =  "Upload valid images. Only PNG and JPEG are allowed.";
        }    // Validate image file size
        else if (($_FILES["userProfileImage"]["size"] > 1000000)) {       
            $_SESSION['msg'][] =  "Image size exceeds 1MB";
        } 
		else if($width < 220 || $height < 220) {
           $_SESSION['msg'][] =  "Image dimension should be greater than 220 x 200";
        }else {
            $filename =  $_FILES['userProfileImage']['name'];
            $uploaddir = wp_upload_dir(); // get wordpress upload directory
            $myDirPath = $uploaddir['path'];
            $myDirUrl = $uploaddir['url'];
            $MyImage = rand(0,5000).$_FILES['userProfileImage']['name'];
            $image_path = $myDirPath.'/'.$MyImage;
            move_uploaded_file($_FILES['userProfileImage']['tmp_name'],$image_path);
             $file_array = array(
                'name' => $_FILES['userProfileImage']['name'],
                'type'    => $_FILES['userProfileImage']['type'],
                'tmp_name'   => $_FILES['userProfileImage']['tmp_name'],
                'error'    => $_FILES['userProfileImage']['error'],
                'size'   => $_FILES['userProfileImage']['size'],
            );
            $file = $MyImage;
            $uploadfile = $myDirPath.'/' . basename( $file );
            $filename = basename( $uploadfile );
            //$wp_filetype = wp_check_filetype( basename( $uploaded_file[‘file’] ), null );
            $wp_filetype = wp_check_filetype(basename($filename), null );
            $attachment = array(
            'post_mime_type' => $wp_filetype['type'],
            'post_title' => preg_replace('/\.[^.]+$/', '', $_FILES['userProfileImage']['name']),
            'post_content' => '',
            'post_status' => 'inherit'
            );       
            $attachment_id = wp_insert_attachment( $attachment, $uploadfile );        
            $attach_data = wp_generate_attachment_metadata( $attachment_id, $uploadfile );
            $attachimage_url = $uploads['url'].'/'.basename( $filename ) ;
            wp_update_attachment_metadata( $attachment_id, $attach_data );
            update_user_meta($current_user->ID, 'userProfileImage',  $attachment_id); 
        }
      
    }    // Validate file input to check if is with valid extension
    if($_SESSION['msg'] == ''){
        $first_name = esc_attr(trim($_POST['first_name']));
        $last_name = esc_attr(trim($_POST['last_name']));
        $phone = esc_attr($_POST['phone']);
        $city = esc_attr($_POST['city']);
        $description = $_POST['description'];
        $member_type_data = implode(', ',$_POST['member_type']);
        $area_interest_data = implode(', ',$_POST['area_interest']);
        update_user_meta($current_user->ID, 'first_name', $first_name); 
        update_user_meta($current_user->ID, 'last_name', $last_name);
        update_user_meta($current_user->ID, 'phone', $phone);
        update_user_meta($current_user->ID, 'description', $description);
        update_user_meta($current_user->ID, 'city', $city);
        update_user_meta($current_user->ID, 'member_type', esc_attr($member_type));
        update_user_meta($current_user->ID, 'area_interest', esc_attr($area_interest));
        $_SESSION['msg'][] = 'Your profile has been updated successfully.'; 
         //wp_redirect( home_url('/account/') );
       }
}
      
       $profileId = get_user_meta(get_current_user_id(),'userProfileImage',true); 
       $phone = get_user_meta(get_current_user_id(),'phone',true); 
       $city = get_user_meta(get_current_user_id(),'city',true); 
       $member_type = get_user_meta(get_current_user_id(),'member_type',true); 
       $area_interest = get_user_meta(get_current_user_id(),'area_interest',true); 
       $attachment_id = wp_get_attachment_image_src( $profileId, 'full');

       if($_POST){
       	 $member_type_data = $_POST['member_type'];
         $area_interest_data = $_POST['area_interest'];
       }else{
       	 $member_type_data = explode(', ',$member_type);
         $area_interest_data = explode(', ',$area_interest);
       }


            if(! empty($_SESSION['loginError']) ) :
                sessionMsg($_SESSION['loginError']);
                unset($_SESSION['loginError']);
            endif;
                
            if(!empty($_SESSION['msg']) ) :
                sessionMsg($_SESSION['msg']);
                unset($_SESSION['msg']);
            endif;
             ?>
          <form method="post" id="updateForm" method="post"  data-parsley-validate="" enctype="multipart/form-data">
          <div class="form-group col-sm-6">
            <label for="first_name">First Name</label>
            <input type="text" class="form-control" value="<?php if($_POST['first_name']!= ''){ echo stripslashes($_POST['first_name']);}else{ echo stripslashes($current_user->first_name); } ?>" name="first_name" id="first_name" data-parsley-required data-parsley-type="alphanum" />
          </div>
          <div class="form-group col-sm-6">
            <label for="last_name">Last Name</label>
            <input type="text" class="form-control" value="<?php if($_POST['last_name']!= ''){ echo stripslashes($_POST['last_name']);}else{ echo stripslashes($current_user->last_name); } ?>" name="last_name" id="last_name" data-parsley-required data-parsley-type="alphanum"   />
          </div>
          
          <div class="form-group col-sm-6">
            <label for="phone">Phone</label>
            <input type="text" class="form-control" value="<?php if($_POST['phone']!= ''){ echo stripslashes($_POST['phone']);}else{ echo stripslashes($current_user->phone); } ?>" name="phone" id="phone" data-parsley-required data-parsley-type='digits' data-parsley-length="[6, 16]" />
          </div>
           <div class="form-group col-sm-6">
            <label for="city">City</label>
            <input type="text" class="form-control" value="<?php if($_POST['city']!= ''){ echo stripslashes($_POST['city']);}else{ echo stripslashes($current_user->city); } ?>" name="city" id="city" data-parsley-required data-parsley-length="[2, 100]" />
          </div>
          <div class="row">
                     <div class="form-group col-sm-12">
                         <label class="login_checkbox" for="reg-usertype">Member Type : </label>
                         <?php $member_type = member_type();

                            foreach($member_type as $key=>$val){
                                    if(in_array($key, $member_type_data)){
                                    	$checked='checked="checked"';
                                    }else{
                                        $checked = '';
                                    }
                                echo '<input type="checkbox" '.$checked.' name="member_type[]" value="'.$key.'"  > '.$val.' &nbsp;';
                            }

                          ?>


                     </div>

                </div>

                <div class="row">
                     <div class="form-group col-sm-12">
                         <label class="login_checkbox" for="reg-usertype">Area Of Interest : </label>
                         <?php $area_interest = areaInterest();
                            foreach($area_interest as $key=>$val){
                                    if(in_array($key,$area_interest_data)){
                                        $checked='checked="checked"';
                                    }else{
                                        $checked = '';
                                    }
                                 
                                echo '<input type="checkbox" '.$checked.' name="area_interest[]" value="'.$key.'"  > '.$val.' &nbsp;';
                            }

                          ?>


                     </div>
                 </div>
          <div class="form-group col-sm-6">
            <label for="userProfileImage">Profile Pic </label>
            <?php if($attachment_id){ ?>
            <img src="<?php echo $attachment_id['0'] ?>" style="clear: both;height: 100px;width:100px;">
            <?php } ?>
            <input type="file" id="userProfileImage" name="userProfileImage" >
			<label style="color:#510000;">Note: Image dimension should be 220 x 220.</label>
          </div>
          <div class="form-group col-sm-12">
            <label for="description">About Info</label>           
             <?php wp_editor(  $description, 'description', $settings ); ?>
          </div>
          <div class="form-group col-sm-12">
          <input id="submit" type="submit" name="submit" value="Update" >
          </div>
          </form>
        </div>
      </div>
    </div>
    <!--end of div container--> 
  </section>
</main>




<?php
get_footer();
