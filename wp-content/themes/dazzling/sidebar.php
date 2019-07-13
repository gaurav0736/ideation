<?php
/**
 * The Sidebar containing the main widget areas.
 *
 * @package dazzling
 */
?>
	<div id="secondary" class="widget-area col-sm-12 col-md-4" role="complementary">
			<aside id="search" class="widget widget_search">
				<h1 class="widget-title"><?php _e( 'Subscribe Us', 'dazzling' ); ?></h1>
				<?php echo do_shortcode('[contact-form-7 id="72" title="Subscribe Us"]'); ?>
			</aside>

			<aside id="archives" class="widget">
				<h1 class="widget-title"><?php _e( 'Links', 'dazzling' ); ?></h1>
				<ul>
					<li><a href="<?php echo site_url().'/join-us'; ?>">Join Us</a></li>
					<li><a href="<?php echo site_url().'/idealist'; ?>">Submit your IDEA</a></li>
					<li><a href="<?php echo site_url().'/project-list'; ?>">Start developing</a></li>
					<li><a href="<?php echo site_url().'/startup-list'; ?>">Start your start-up/MSME dream</a></li>
					<li><a href="<?php echo site_url().'/people'; ?>">Our Members</a></li>
					<li><a href="<?php echo get_permalink( get_option( 'page_for_posts' ) ); ?>">Our Blog</a></li>
				</ul>
			</aside>

		
	</div><!-- #secondary -->
