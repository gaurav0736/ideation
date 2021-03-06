<?php
/**
 * The Template for displaying all single posts.
 *
 * @package dazzling
 */

get_header(); ?>
	<div id="primary" class="content-area col-sm-12 col-md-8">
		<main id="main" class="site-main" role="main">

		<?php while ( have_posts() ) : the_post(); ?>

			
<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header page-header">
		<img class="img-responsive" src="<?=get_The_post_thumbnail_url();?>">
		<h1 class="entry-title "><?php the_title(); ?></h1>

		<div class="entry-meta">
			<?php dazzling_posted_on(); ?>
		</div><!-- .entry-meta -->
	</header><!-- .entry-header -->
	<div class="founders">
		<h3>Estimated Span of Project</h3> <?=get_post_meta(get_the_ID(),'project_span',true);?>
		<hr>
		<h3>Team mate</h3>
		<ul>
		 	<?php $users = get_post_meta(get_the_ID(),'project_users');
				foreach($users as $user_id){
					echo '<li>'.get_user_meta($user_id,'first_name',true).' '.get_user_meta($user_id,'last_name',true).'</li>';
				}
			?>
		</ul>
		<hr>
	</div>
	<div class="entry-content">
		<h3>Idea</h3>
		<?php echo get_the_content(); ?>
		
	</div><!-- .entry-content -->

	<footer class="entry-meta">
		

		<?php edit_post_link( __( 'Edit', 'dazzling' ), '<i class="fa fa-pencil-square-o"></i><span class="edit-link">', '</span>' ); ?>
		<?php dazzling_setPostViews(get_the_ID()); ?>
		<hr class="section-divider">
	</footer><!-- .entry-meta -->
</article><!-- #post-## -->

			

		<?php endwhile; // end of the loop. ?>

		</main><!-- #main -->
	</div><!-- #primary -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>