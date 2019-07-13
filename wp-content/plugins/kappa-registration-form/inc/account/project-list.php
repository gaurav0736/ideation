<?php 
kp_restrict_access();
get_header();
dashboardSidebar();

?>


<section id="primary" class="content-area col-sm-12 col-md-8 <?php echo of_get_option( 'site_layout' ); ?>">
			<main id="main" class="site-main" role="main">


				<header class="page-header">
					<h1 class="page-title">
						<?php _e( 'Projects List', 'kappa' );
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
					<a class="btn btn-default" href="<?php echo site_url(); ?>/edit-project">Add New Project</a>
				</div>

				<hr>
<div class="table">
	<table class="table" >
		<tr>
			<th>S.No.</th>
			<th>Project Title</th>
			<th>Status</th>
			<th>Action</th>
		</tr>

		<?php  $query = new WP_Query( array( 'post_type' => 'project', 'posts_per_page' => '-1','author'=>get_current_user_id() ) );

            if ($query->have_posts()) :
            	$x =1;
              while ($query->have_posts()) : $query->the_post();
              	$status = get_post_meta(get_the_ID(),'status',true);
              	if($status!='completed'){
              		$status = 'New Project';
              	}else{
              		$status = 'Completed Project';
              	}

		 ?>
		<tr id="<?=get_the_ID();?>">
			<td><?=$x?>.</td>
			<td><?=get_the_title()?></td>
			<td><?=$status?></td>
			<td><a href="<?php echo site_url(); ?>/edit-project/<?=get_the_ID()?>"><i class="fa fa-pencil"></i></a> <a href="javascript:void(0);" class="delete" data-id="<?=get_the_ID();?>" onclick="deletethis('<?=get_the_ID();?>')"><i class="fa fa-trash"></i></a> </td>
		</tr>
	<?php $x++; endwhile;
	endif; ?>

	</table>
</div>

</main>
</section>


<script type="text/javascript">
	function deletethis(deleteID){
		var ajaxurl = '<?=admin_url("admin-ajax.php");?>';
		if(confirm('Are you sure you want to delete this?')){

		var data = {
			'action': 'deletePost',
			'deleteID': deleteID
		};

		// since 2.8 ajaxurl is always defined in the admin header and points to admin-ajax.php
			jQuery.post(ajaxurl, data, function(response) {
				jQuery('#'+deleteID).remove();
			});
		}
	}

</script>

<?php
get_footer();
