<?php
/**
 * The Template for displaying all single posts.
 *
 * @package dazzling
 */

get_header(); ?>
	<div id="primary" class="content-area col-sm-12 col-md-8">
		<main id="main" class="site-main" role="main">

		<?php while ( have_posts() ) : the_post(); 
			$id = get_the_ID();
	$skills =  get_post_meta($id, 'skills',  true); 
    $expectation =  get_post_meta($id, 'expectation',  true);  
    $no_of_people =  get_post_meta($id, 'no_of_people',  true);  
    $location =  get_post_meta($id, 'location',  true);  
    $project_span =  get_post_meta($id, 'project_span', true);  
    $contact_person =   get_post_meta($id, 'contact_person', true);  
    $contact_mobile =  get_post_meta($id, 'contact_mobile', true);  
    $contact_email  =  get_post_meta($id, 'contact_email', true);

			?>

			
<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header page-header">
		<img class="img-responsive" src="<?=get_The_post_thumbnail_url();?>">
		<h1 class="entry-title "><?php the_title(); ?></h1>

		<div class="entry-meta">
			<?php dazzling_posted_on(); ?>
		</div><!-- .entry-meta -->
	</header><!-- .entry-header -->
	
	<div class="entry-content">
		<h3>Project Description</h3>
		<?php echo get_the_content(); ?>
		
	</div><!-- .entry-content -->
	<div class="additional_data">
		<h3>Location</h3> <?=$location?>
		<hr>
		<h3>Span of Project</h3> <?=$project_span?>
		<hr>
		<h3>Skills</h3> <?=$skills?>
		<hr>
		<h3>Number of person required</h3> <?=$no_of_people?>
		<hr>
		<h3>Expectation</h3> <?=$expectation?>
		
	</div>

	<div class="contact_details">
		<h3>For any other doubt, Please contact</h3>
		<strong>Contact Person</strong> : <?=$contact_person?><br>
		<strong>Mobile No.</strong> : <?=$contact_mobile?><br>
		<strong>Email Id</strong> : <?=$contact_email?><br>
	</div>

	<footer class="entry-meta">
		

		<?php edit_post_link( __( 'Edit', 'dazzling' ), '<i class="fa fa-pencil-square-o"></i><span class="edit-link">', '</span>' ); ?>
		<?php dazzling_setPostViews(get_the_ID()); ?>
		<hr class="section-divider">
	</footer><!-- .entry-meta -->
</article><!-- #post-## -->

			

		<?php endwhile; // end of the loop. ?>

		</main><!-- #main -->
	</div><!-- #primary -->

<?php get_sidebar('blog'); ?>
<?php get_footer(); ?>