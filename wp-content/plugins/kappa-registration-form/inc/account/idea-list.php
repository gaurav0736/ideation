<?php 
kp_restrict_access();
get_header();
dashboardSidebar();
?>

<a href="<?php echo site_url(); ?>/edit-idea">Add New Idea</a>
<?php
get_footer();
