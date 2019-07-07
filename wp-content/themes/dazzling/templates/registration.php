<?php /* Template Name: Registration */ ?>
<?php 
get_header();
?>
<section id="primary" class="content-area col-sm-12 col-md-8 <?php echo of_get_option( 'site_layout' ); ?>">
			<main id="main" class="site-main" role="main">


				<header class="page-header">
					<h1 class="page-title">
						<?php _e( 'Join Us', 'dazzling' );
						?>
					</h1>
					
				</header><!-- .page-header -->
				<?php echo do_shortcode('[kp_registration_form]'); ?>

			</main><!-- #main -->
		</section><!-- #primary -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>
