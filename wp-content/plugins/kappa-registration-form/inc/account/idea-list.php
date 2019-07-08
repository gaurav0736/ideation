<?php 
kp_restrict_access();
get_header();
dashboardSidebar();

?>


<section id="primary" class="content-area col-sm-12 col-md-8 <?php echo of_get_option( 'site_layout' ); ?>">
			<main id="main" class="site-main" role="main">


				<header class="page-header">
					<h1 class="page-title">
						<?php _e( 'Ideas List', 'kappa' );
						?>
					</h1>
					
				</header><!-- .page-header -->
				<?php 
		                
		            if(!empty($_SESSION['msg']) ) :
		                sessionMsg($_SESSION['msg']);
		                unset($_SESSION['msg']);
		            endif;
           
				?>
				<div align="right">
					<a class="btn btn-default" href="<?php echo site_url(); ?>/edit-idea">Add New Idea</a>
				</div>

				<hr>
<div class="table">
	<table class="table" >
		<tr>
			<th>S.No.</th>
			<th>Idea Title</th>
			<th>Action</th>
		</tr>
		<?php  $query = new WP_Query( array( 'post_type' => 'idea', 'posts_per_page' => '-1' ) );

            if ($query->have_posts()) :
            	$x =1;
              while ($query->have_posts()) : $query->the_post();

		 ?>
		<tr>
			<td><?=$x?>.</td>
			<td><?=get_the_title()?></td>
			<td><a href="<?php echo site_url(); ?>/edit-idea/<?=get_the_ID()?>"><i class="fa fa-eye"></i></a> <a href="javascript:void(0);" class="delete" data-id="<?=get_the_ID();?>"><i class="fa fa-trash"></i></a> </td>
		</tr>
	<?php $x++; endwhile;
	endif; ?>

	</table>
</div>

</main>
</section>




<?php
get_footer();
