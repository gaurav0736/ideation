<?php /* Template Name: Finalised Idea */ ?>
<?php

get_header(); ?>
<?php 
    query_posts(array( 
        'post_type' => 'idea',
         'meta_query' => array(
        array(
            'key'     => 'status',
            'value'   => 'completed',
            'compare' => '=',
        ),
    ),
    ) );  
?>
		<section id="primary" class="content-area col-sm-12 col-md-8 <?php echo of_get_option( 'site_layout' ); ?>">
			<main id="main" class="site-main" role="main">

			<?php if ( have_posts() ) : ?>

				<header class="page-header">
					<h1 class="page-title">
						Finalised Ideas
					</h1>
					<?php
						// Show an optional term description.
						$term_description = term_description();
						if ( ! empty( $term_description ) ) :
							printf( '<div class="taxonomy-description">%s</div>', $term_description );
						endif;
					?>
				</header><!-- .page-header -->

				<?php /* Start the Loop */ ?>
				<?php while ( have_posts() ) : the_post(); ?>

					<?php
						/* Include the Post-Format-specific template for the content.
						 * If you want to override this in a child theme, then include a file
						 * called content-___.php (where ___ is the Post Format name) and that will be used instead.
						 */
						
						get_template_part( 'content', get_post_format() );
					?>

				<?php endwhile; ?>

				<?php dazzling_paging_nav(); ?>

			<?php else : ?>

				<?php get_template_part( 'content', 'none' ); ?>

			<?php endif; ?>

			</main><!-- #main -->
		</section><!-- #primary -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>
