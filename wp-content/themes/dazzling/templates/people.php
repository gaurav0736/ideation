<?php /* Template Name: People */ ?>

<?php
get_header(); ?>
<?php 
    query_posts(array( 
        'post_type' => 'teammate',
    ) );  
?>
<?php get_sidebar('member'); ?>
		<section id="primary" class="content-area col-sm-12 col-md-8 <?php echo of_get_option( 'site_layout' ); ?>">
			<main id="main" class="site-main" role="main">

			<?php 

			if(!empty($_POST['member_type'])){
					$member_type_data = $_POST['member_type'];
				}else{
					$member_type_data = array();;
				}
			if(!empty($_POST['area_interest'])){
					$area_interest_data = $_POST['area_interest'];
				}else{
					$area_interest_data = array();;
				}
				//print_r($area_interest_data);
			$args2 = array(
                            'role'    => 'subscriber',
                            'order'   => 'ASC',
                            'meta_query'=>
							         array(
							            array(
							                'relation' => 'OR',
							            array(
							                'key' => 'member_type',
							                'value' => $member_type_data,
							                'compare' => "IN",
							            ),
							            array(
							                'key' => 'area_interest',
							                'value' =>  $area_interest_data,
							                'compare' => "IN",
							            ),
							        ),
							     ),
                            );
			
                  $users = get_users( $args2 );
                  ?>

				<header class="page-header">
					<h1 class="page-title">
						<?php _e( 'Our Members', 'dazzling' );
						?>
					</h1>
					
				</header><!-- .page-header -->

				<?php /* Start the Loop */ ?>
				<?php foreach($users as $user){  
				$profileId = get_user_meta($user->ID,'userProfileImage',true); 
				$attachment_id = wp_get_attachment_image_src( $profileId, 'full');
				//print_r($attachment_id);
				echo '<div class="col-sm-4"><div class="card ">';
                if ( $attachment_id ) { // Check if the post has a featured image assigned to it.
                  echo '  <img class="img-responsive" src="'.$attachment_id['0'].'" alt="Avatar" style="height:120px; width:230px;">';
                }else{
                  echo '  <img class="img-responsive" src="'.get_template_directory_uri().'/img/noimage-1.png" alt="Avatar">';
                }
                echo '<div class="card_content">';
                echo '<h4>'.$user->first_name.' '.$user->last_name.'</h4>';
                echo '<strong>Phone</strong> : '.$user->phone.'<br>';
                echo '<strong>City</strong> : '.$user->city;
                echo '</div>';
                 echo '</div></div>';
				 } ?>

			</main><!-- #main -->
		</section><!-- #primary -->


<?php get_footer(); ?>
