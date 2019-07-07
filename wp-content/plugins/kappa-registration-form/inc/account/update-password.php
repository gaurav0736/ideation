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
            if(! empty($_SESSION['loginError']) ) :
                sessionMsg($_SESSION['loginError']);
                unset($_SESSION['loginError']);
            endif;
                
            if(!empty($_SESSION['msg']) ) :
                sessionMsg($_SESSION['msg']);
                unset($_SESSION['msg']);
            endif;
             ?>
				<?php echo do_shortcode('[kp_changepassword]'); ?>

			</main><!-- #main -->
		</section><!-- #primary -->



<?php
get_footer();
