<?php 
kp_restrict_access();
get_header();

dashboardSidebar();

$id =esc_attr(get_query_var('edit-team'));
?>
<section id="primary" class="content-area col-sm-12 col-md-8 <?php echo of_get_option( 'site_layout' ); ?>">
			<main id="main" class="site-main" role="main">


				<header class="page-header">
					<h1 class="page-title">

						<?php
						if($id){
							_e( 'Edit Teammate Requirement', 'kappa' );
	
						}else{
							 _e( 'Create Teammate Requirement', 'kappa' );
						
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
   
 if(empty($_POST['post_title'])){
           $_SESSION['msg'][] =  'Please enter teammate requirement title.';
 }


   if($_SESSION['msg'] == ''){  

    $skills = wp_strip_all_tags($_POST['skills']);
    $expectation = wp_strip_all_tags($_POST['expectation']);
    $no_of_people = wp_strip_all_tags($_POST['no_of_people']);
    $location = wp_strip_all_tags($_POST['location']);
    $project_span = wp_strip_all_tags($_POST['project_span']);
    $contact_person = wp_strip_all_tags($_POST['contact_person']);
    $contact_mobile = wp_strip_all_tags($_POST['contact_mobile']);
    $contact_email = wp_strip_all_tags($_POST['contact_email']);

    	if($id){
    		$my_post = array(
    		  'ID'           => $id,
			  'post_title'    => wp_strip_all_tags( $_POST['post_title'] ),
			  'post_content'  => $_POST['description'],
			  'post_status'   => 'publish',
			  'post_author'   => get_current_user_id(),
			  'post_type'	  => 'teammate',
			);
	           
			// Insert the post into the database
			$insertpost = wp_update_post( $my_post );

      update_post_meta($insertpost, 'skills',  $skills);  
      update_post_meta($insertpost, 'expectation',  $expectation);  
      update_post_meta($insertpost, 'no_of_people',  $no_of_people);  
      update_post_meta($insertpost, 'location',  $location);  
      update_post_meta($insertpost, 'project_span',  $project_span);  
      update_post_meta($insertpost, 'contact_person',  $contact_person);  
      update_post_meta($insertpost, 'contact_mobile',  $contact_mobile);  
      update_post_meta($insertpost, 'contact_email',  $contact_email); 



	    $_SESSION['msg'][] = 'Your data has been updated successfully.';
			//update_post_meta($insertpost, '_thumbnail_id',  $attachment_id);		
	    
    	}else{
        $my_post = array(
			  'post_title'    => wp_strip_all_tags( $_POST['post_title'] ),
			  'post_content'  => $_POST['description'],
			  'post_status'   => 'publish',
			  'post_author'   => get_current_user_id(),
			  'post_type'	  => 'teammate',
			);
	           
			// Insert the post into the database
			$insertpost = wp_insert_post( $my_post );	

      update_post_meta($insertpost, 'skills',  $skills);  
      update_post_meta($insertpost, 'expectation',  $expectation); 
      update_post_meta($insertpost, 'no_of_people',  $no_of_people);  
      update_post_meta($insertpost, 'location',  $location);  
      update_post_meta($insertpost, 'project_span',  $project_span);  
      update_post_meta($insertpost, 'contact_person',  $contact_person);  
      update_post_meta($insertpost, 'contact_mobile',  $contact_mobile);  
      update_post_meta($insertpost, 'contact_email',  $contact_email);
	        $_SESSION['msg'][] = 'Your data has been created successfully.';
    	}

         wp_redirect( home_url('/teamlist/') );
         exit;
       }
}
 

 if($id){
	$post = get_post($id);
  if(get_current_user_id() != $post->post_author){
    wp_redirect( home_url('/teamlist/') );
    exit;
  }
 	$description = $post->post_content;
 	$post_title = get_the_title($id);


    $skills =  get_post_meta($id, 'skills',  true); 
    $expectation =  get_post_meta($id, 'expectation',  true);  
    $no_of_people =  get_post_meta($id, 'no_of_people',  true);  
    $location =  get_post_meta($id, 'location',  true);  
    $project_span =  get_post_meta($id, 'project_span', true);  
    $contact_person =   get_post_meta($id, 'contact_person', true);  
    $contact_mobile =  get_post_meta($id, 'contact_mobile', true);  
    $contact_email  =  get_post_meta($id, 'contact_email', true);
 }

      
            if(!empty($_SESSION['msg']) ) :
                sessionMsg($_SESSION['msg']);
                unset($_SESSION['msg']);
            endif;
             ?>
          <form method="post" id="updateForm" method="post"  data-parsley-validate="" enctype="multipart/form-data">
          <div class="form-group col-sm-12">
            <label for="post_title">Project Title</label>
            <input type="text" class="form-control" value="<?php if($_POST['post_title']!= ''){ echo stripslashes($_POST['post_title']);}else{ echo $post_title; } ?>" name="post_title" id="post_title" data-parsley-required />
          </div>
          <div class="form-group col-sm-12">
            <label for="description">Project Description</label>           
             <?php wp_editor(  $description, 'description', $settings ); ?>
          </div>

          <div class="form-group col-sm-6">
            <label for="skills">Skills Required</label>
            <textarea name="skills" id="skills" rows="2" class="form-control" data-parsley-required ><?php if($_POST['skills']!= ''){ echo $_POST['skills'];}else{ echo $skills; } ?></textarea>
          </div>
          <div class="form-group col-sm-6">
            <label for="no_of_people">No. of people required</label>
            <input type="text" class="form-control" value="<?php if($_POST['no_of_people']!= ''){ echo stripslashes($_POST['no_of_people']);}else{ echo $no_of_people; } ?>" name="no_of_people" id="no_of_people" data-parsley-required />
          </div>
          <div class="clearfix"></div>
           <div class="form-group col-sm-6">
            <label for="expectation">Expectation from joining person</label>
            <textarea name="expectation" id="expectation" rows="2" class="form-control" data-parsley-required ><?php if($_POST['expectation']!= ''){ echo $_POST['expectation'];}else{ echo $expectation; } ?></textarea>
          </div>
           <div class="form-group col-sm-6">
            <label for="location">Location</label>
            <input type="text" class="form-control" value="<?php if($_POST['location']!= ''){ echo stripslashes($_POST['location']);}else{ echo $location; } ?>" name="location" id="location" data-parsley-required />
          </div>
          <div class="clearfix"></div>
          <div class="form-group col-sm-6">
            <label for="project_span">Estimated Span of Project</label>
            <input type="text" class="form-control" value="<?php if($_POST['project_span']!= ''){ echo stripslashes($_POST['project_span']);}else{ echo $project_span; } ?>" name="project_span" id="project_span" data-parsley-required />
          </div>
          <div class="form-group col-sm-6">
            <label for="contact_person">Contact Person Name</label>
            <input type="text" class="form-control" value="<?php if($_POST['contact_person']!= ''){ echo stripslashes($_POST['contact_person']);}else{ echo $contact_person; } ?>" name="contact_person" id="contact_person" data-parsley-required />
          </div>
          <div class="form-group col-sm-6">
            <label for="contact_mobile">Mobile No.</label>
            <input type="text" class="form-control" value="<?php if($_POST['contact_mobile']!= ''){ echo stripslashes($_POST['contact_mobile']);}else{ echo $contact_mobile; } ?>" name="contact_mobile" id="contact_mobile" data-parsley-required data-parsley-type="digits" />
          </div>
          <div class="form-group col-sm-6">
            <label for="contact_email">Email</label>
            <input type="email" class="form-control" value="<?php if($_POST['contact_email']!= ''){ echo stripslashes($_POST['contact_email']);}else{ echo $contact_email; } ?>" name="contact_email" id="contact_email" data-parsley-required data-parsley-type="email" />
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
