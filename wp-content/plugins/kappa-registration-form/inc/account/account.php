<?php 
kp_restrict_access();
get_header();
dashboardSidebar();

$user = wp_get_current_user();
?>

<section id="primary" class="content-area col-sm-12 col-md-8 <?php echo of_get_option( 'site_layout' ); ?>">
			<main id="main" class="site-main" role="main">


				<header class="page-header">
					<h1 class="page-title">
						<?php _e( 'Dashboard', 'kappa' );
						?>
					</h1>
					
				</header><!-- .page-header -->
				<span>Hello! <b><?php echo $user->user_login; ?></b> (not <b><?php echo $user->user_login; ?></b>? <a href="<?php echo wp_logout_url(home_url( '/login/' )); ?>"><i class="fa fa-power-off"></i> Logout</a>)<br><br>

From your account dashboard you can view your recent <a href="<?=home_url('/idealist/')?>">ideas</a>, manage your <a href="<?=home_url('/preoject-list/')?>">projects</a> and <a href="<?=home_url('/startup-list/')?>">startup/msme's</a> details, and edit your <a href="<?=home_url('/update-password/')?>">password</a> and <a href="<?=home_url('/update-profile/')?>">account details</a>.</span>

			</main>
		</section>
<?php
get_footer();
