<?php 
kp_restrict_access();
get_header();

dashboardSidebar();

$id =esc_attr(get_query_var('edit-idea'));
?>
<section id="primary" class="content-area col-sm-12 col-md-8 <?php echo of_get_option( 'site_layout' ); ?>">
			<main id="main" class="site-main" role="main">


				<header class="page-header">
					<h1 class="page-title">

						<?php
						if($id){
							_e( 'Edit Idea', 'kappa' );
	
						}else{
							 _e( 'Create Idea', 'kappa' );
						
						}
						?>
					</h1>
					
				</header><!-- .page-header -->
				 
<?php 
$settings =   array(
    'wpautop' => false, // use wpautop?
    'textarea_rows' => get_option('default_post_edit_rows', 10), // rows="..."   
    'tinymce' => true, // load TinyMCE, can be used to pass settings directly to TinyMCE using an array()
    'quicktags' => true, // load Quicktags, can be used to pass settings directly to Quicktags using an array()
    'media_buttons' => false,
    'drag_drop_upload' => false
);

 if (isset($_POST['submit'])){
    require_once(ABSPATH . '/wp-load.php');
    require_once(ABSPATH . 'wp-admin' . '/includes/file.php');
    require_once(ABSPATH . 'wp-admin' . '/includes/image.php');
    $fileinfo = @getimagesize($_FILES["thumbnail_image"]["tmp_name"]);
    $width = $fileinfo[0];
    $height = $fileinfo[1];    
    $allowed_image_extension = array(
        "png",
        "jpg",
        "jpeg"
    );    
    // Get image file extension


 if(empty($_POST['post_title'])){
           $_SESSION['msg'][] =  'Please enter idea title.';
 }
    $file_extension = pathinfo($_FILES["thumbnail_image"]["name"], PATHINFO_EXTENSION);
    if (file_exists($_FILES["thumbnail_image"]["tmp_name"])) {
        if (! in_array($file_extension, $allowed_image_extension)) {       
         	$_SESSION['msg'][] =  "Upload valid images. Only PNG and JPEG are allowed.";
        }    // Validate image file size
        else if (($_FILES["thumbnail_image"]["size"] > 1000000)) {       
            $_SESSION['msg'][] =  "Image size exceeds 1MB";
        } 
		else if($width < 220 || $height < 220) {
           	$_SESSION['msg'][] =  "Image dimension should be greater than 220 x 200";
        }else{
        	$filename =  $_FILES['thumbnail_image']['name'];
            $uploaddir = wp_upload_dir(); // get wordpress upload directory
            $myDirPath = $uploaddir['path'];
            $myDirUrl = $uploaddir['url'];
            $MyImage = rand(0,5000).$_FILES['thumbnail_image']['name'];
            $image_path = $myDirPath.'/'.$MyImage;
            move_uploaded_file($_FILES['thumbnail_image']['tmp_name'],$image_path);
             $file_array = array(
                'name' => $_FILES['thumbnail_image']['name'],
                'type'    => $_FILES['thumbnail_image']['type'],
                'tmp_name'   => $_FILES['thumbnail_image']['tmp_name'],
                'error'    => $_FILES['thumbnail_image']['error'],
                'size'   => $_FILES['thumbnail_image']['size'],
            );
            $file = $MyImage;
            $uploadfile = $myDirPath.'/' . basename( $file );
            $filename = basename( $uploadfile );
            //$wp_filetype = wp_check_filetype( basename( $uploaded_file[‘file’] ), null );
            $wp_filetype = wp_check_filetype(basename($filename), null );
            $attachment = array(
            'post_mime_type' => $wp_filetype['type'],
            'post_title' => preg_replace('/\.[^.]+$/', '', $_FILES['thumbnail_image']['name']),
            'post_content' => '',
            'post_status' => 'inherit'
            );       
            $attachment_id = wp_insert_attachment( $attachment, $uploadfile );        
            $attach_data = wp_generate_attachment_metadata( $attachment_id, $uploadfile );
            $attachimage_url = $uploads['url'].'/'.basename( $filename ) ;
            wp_update_attachment_metadata( $attachment_id, $attach_data ); 
        	update_post_meta($id, '_thumbnail_id',  $attachment_id);
        }
      
    }    // Validate file input to check if is with valid extension
    if($_SESSION['msg'] == ''){  
    	if($id){
    		$my_post = array(
    		  'ID'           => $id,
			  'post_title'    => wp_strip_all_tags( $_POST['post_title'] ),
			  'post_content'  => $_POST['description'],
			  'post_status'   => 'publish',
			  'post_author'   => get_current_user_id(),
			  'post_type'	  => 'idea',
			);
	           
			// Insert the post into the database
			$insertpost = wp_update_post( $my_post );
      update_post_meta($insertpost, 'status',  wp_strip_all_tags($_POST['status']));  
	        $_SESSION['msg'][] = 'Your idea has been updated successfully.';
			//update_post_meta($insertpost, '_thumbnail_id',  $attachment_id);		
	    
    	}else{
        $my_post = array(
			  'post_title'    => wp_strip_all_tags( $_POST['post_title'] ),
			  'post_content'  => $_POST['description'],
			  'post_status'   => 'publish',
			  'post_author'   => get_current_user_id(),
			  'post_type'	  => 'idea',
			);
	           
			// Insert the post into the database
			$insertpost = wp_insert_post( $my_post );
			update_post_meta($insertpost, '_thumbnail_id',  $attachment_id);	
      update_post_meta($insertpost, 'status',  wp_strip_all_tags($_POST['status']));  	
	        $_SESSION['msg'][] = 'Your idea has been created successfully.';
    	}

         wp_redirect( home_url('/idealist/') );
         exit;
       }
}
 

 if($id){
 	$post = get_post($id);
 	if(get_current_user_id() != $post->post_author){
    	wp_redirect( home_url('/idealist/') );
    	exit;
  	}
 	$thumbnail_id = get_post_meta($id,'_thumbnail_id',true);
 	$attachment_id = wp_get_attachment_image_src( $thumbnail_id, 'medium');
 	$description = $post->post_content;
 	$post_title = get_the_title($id);
  $status = get_post_meta($id,'status', true);
 }

      
            if(!empty($_SESSION['msg']) ) :
                sessionMsg($_SESSION['msg']);
                unset($_SESSION['msg']);
            endif;
             ?>
          <form method="post" id="updateForm" method="post"  data-parsley-validate="" enctype="multipart/form-data">
          <div class="form-group col-sm-12">
            <label for="post_title">Subject</label>
            <input type="text" class="form-control" value="<?php if($_POST['post_title']!= ''){ echo stripslashes($_POST['post_title']);}else{ echo $post_title; } ?>" name="post_title" id="post_title" data-parsley-required />
          </div>
          <div class="form-group col-sm-12">
            <label for="thumbnail_image">Profile Pic </label>
            
            <input type="file" id="thumbnail_image" name="thumbnail_image" >
            <?php if($attachment_id){ ?>
            <img src="<?php echo $attachment_id['0'] ?>" style="clear: both;height: 100px;width:100px;">
            <?php } ?>
			<label style="color:#510000;">Note: Image dimension should be greater than 220px x 220px.</label>
          </div>
          <div class="form-group col-sm-12">
            <label for="description">About Info</label>           
             <?php wp_editor(  $description, 'description', $settings ); ?>
          </div>
           <div class="form-group col-sm-12">
            <label for="description">Status</label>  
            <select name="status" id="status" class="form-control" >

              <option  <?php if($_POST['status'] == 'new'){ echo 'selected="selected"';}else if($status == 'new'){ echo 'selected="selected"';} ?> value="new">New Idea</option>
              <option <?php if($_POST['status'] == 'completed'){ echo 'selected="selected"';}else if($status == 'completed'){ echo 'selected="selected"';} ?> value="completed">Finalised Idea</option>
            </select>
          </div>
          <div class="form-group col-sm-12">
          <input id="submit" type="submit" name="submit" value="Submit" >
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
