<?php 


function idea_post_type() {
    $args = array(
        'public'    => true,
        'label'     => __( 'Ideas', 'kappa' ),
        'menu_icon' => 'dashicons-book',
        'supports'=> array( 'title', 'editor', 'thumbnail','comments' ),
        'rewrite' => array('slug' => 'ideas'),
        'has_archive' => true
    );
    register_post_type( 'idea', $args );
}
add_action( 'init', 'idea_post_type' );


function your_prefix_get_meta_box( $meta_boxes ) {
	

	$meta_boxes[] = array(
		'id' => 'additional',
		'title' => esc_html__( 'Additional Details', 'metabox-online-generator' ),
		'post_types' => array('idea' ),
		'context' => 'side',
		'priority' => 'default',
		'autosave' => 'false',
		'fields' => array(
			array(
				'id' => 'status',
				'name' => esc_html__( 'Status', 'metabox-online-generator' ),
				'type' => 'select_advanced',
				'options' => array(
					'new' => 'New Idea',
					'completed' => 'Finalides Idea',
				),
				'std' => 'new',
			),
		),
	);

	return $meta_boxes;
}
add_filter( 'rwmb_meta_boxes', 'your_prefix_get_meta_box' );

function startup_post_type() {
    $args = array(
        'public'    => true,
        'label'     => __( 'Start Up/MSMEs', 'kappa' ),
        'menu_icon' => 'dashicons-book',
        'supports'=> array( 'title', 'editor', 'thumbnail' ),
        'rewrite' => array('slug' => 'startup'),
        'has_archive' => true

    );
    register_post_type( 'startup', $args );
}
add_action( 'init', 'startup_post_type' );



function startup_get_meta_box( $meta_boxes ) {
	$prefix = '';

	$meta_boxes[] = array(
		'id' => 'startup',
		'title' => esc_html__( 'Additional Details', 'metabox-online-generator' ),
		'post_types' => array('startup' ),
		'context' => 'advanced',
		'priority' => 'default',
		'autosave' => 'false',
		'fields' => array(
			array(
				'id' => '_founder',
				'type' => 'textarea',
				'name' => esc_html__( 'Founder/Co-Founders', 'metabox-online-generator' ),
			),
		),
	);

	return $meta_boxes;
}
add_filter( 'rwmb_meta_boxes', 'startup_get_meta_box' );



function teammate_post_type() {
    $args = array(
        'public'    => true,
        'label'     => __( 'Teammate', 'kappa' ),
        'menu_icon' => 'dashicons-book',
        'supports'=> array( 'title','editor'  ),
        'rewrite' => array('slug' => 'teammate'),
        'has_archive' => true

    );
    register_post_type( 'teammate', $args );
}
add_action( 'init', 'teammate_post_type' );

function teammate_get_meta_box( $meta_boxes ) {

	$meta_boxes[] = array(
		'id' => 'teammate',
		'title' => esc_html__( 'Additional Info', 'metabox-online-generator' ),
		'post_types' => array('teammate' ),
		'context' => 'side',
		'priority' => 'default',
		'autosave' => 'false',
		'fields' => array(
			array(
				'id' =>  'skills',
				'type' => 'textarea',
				'name' => esc_html__( 'Skills Required', 'metabox-online-generator' ),
			),
			array(
				'id' =>  'no_of_people',
				'type' => 'text',
				'name' => esc_html__( 'No. of People', 'metabox-online-generator' ),
			),
			array(
				'id' =>  'expectation',
				'type' => 'textarea',
				'name' => esc_html__( 'Expectation from joining person', 'metabox-online-generator' ),
			),
			array(
				'id' =>  'location',
				'type' => 'text',
				'name' => esc_html__( 'Location', 'metabox-online-generator' ),
			),
			array(
				'id' =>  'project_span',
				'type' => 'text',
				'name' => esc_html__( 'Estimated Span Of Project', 'metabox-online-generator' ),
			),
			array(
				'id' =>  'contact_person',
				'type' => 'text',
				'name' => esc_html__( 'Contact Person Name', 'metabox-online-generator' ),
			),
			array(
				'id' =>  'contact_mobile',
				'type' => 'text',
				'name' => esc_html__( 'Mobile No.', 'metabox-online-generator' ),
			),
			array(
				'id' =>  'contact_email',
				'type' => 'text',
				'name' => esc_html__( 'Email Id', 'metabox-online-generator' ),
			),
		),
	);

	return $meta_boxes;
}
add_filter( 'rwmb_meta_boxes', 'teammate_get_meta_box' );



function project_post_type() {
    $args = array(
        'public'    => true,
        'label'     => __( 'Projects', 'kappa' ),
        'menu_icon' => 'dashicons-book',
        'supports'=> array( 'title','editor' ,'thumbnail' ),
        'rewrite' => array('slug' => 'projects'),
        'has_archive' => true

    );
    register_post_type( 'project', $args );
}
add_action( 'init', 'project_post_type' );


function project_get_meta_box( $meta_boxes ) {
	
	$meta_boxes[] = array(
		'id' => 'additional_details',
		'title' => esc_html__( 'Additional Details', 'metabox-online-generator' ),
		'post_types' => array('project' ),
		'context' => 'advanced',
		'priority' => 'default',
		'autosave' => 'false',
		'fields' => array(
			array(
				'id' =>  'project_users',
				'type' => 'user',
				'name' => esc_html__( 'Users', 'metabox-online-generator' ),
				'field_type' => 'checkbox_list',
			),
			array(
				'id' =>  'project_span',
				'type' => 'text',
				'name' => esc_html__( 'Time Span', 'metabox-online-generator' ),
			),
			array(
				'id' => 'status',
				'name' => esc_html__( 'Status', 'metabox-online-generator' ),
				'type' => 'select_advanced',
				'options' => array(
					'new' => 'New Project',
					'completed' => 'Completed Project',
				),
				'std' => 'new',
			),
		),
	);

	return $meta_boxes;
}
add_filter( 'rwmb_meta_boxes', 'project_get_meta_box' );