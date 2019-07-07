<?php 


function idea_post_type() {
    $args = array(
        'public'    => true,
        'label'     => __( 'Ideas', 'textdomain' ),
        'menu_icon' => 'dashicons-book',
        'supports'=> array( 'title', 'editor', 'thumbnail' ),
        'rewrite' => array('slug' => 'idea'),

    );
    register_post_type( 'idea', $args );
}
add_action( 'init', 'idea_post_type' );
