<?php 

function events_post_type() {
    $args = array(
        'public'    => true,
        'label'     => __( 'Events', 'textdomain' ),
        'menu_icon' => 'dashicons-book',
        'supports'=> array( 'title', 'editor', 'thumbnail' ),
        'rewrite' => array('slug' => 'events'),

    );
    register_post_type( 'event', $args );
}
add_action( 'init', 'events_post_type' );


function news_post_type() {
    $args = array(
        'public'    => true,
        'label'     => __( 'News', 'textdomain' ),
        'menu_icon' => 'dashicons-info',
        'supports'=> array( 'title', 'editor', 'thumbnail' ),
        'rewrite' => array('slug' => 'news'),
        
    );
    register_post_type( 'news', $args );
}
add_action( 'init', 'news_post_type' );



function dazzling_latest_post_type($post_type,$post_count='3') {
     
            $query = new WP_Query( array( 'post_type' => $post_type, 'posts_per_page' => $post_count ) );
            if($post_count == '3'){
              $div = '4';
            }else{
              $div='3';
            }
//            print_r($query);
            if ($query->have_posts()) :
            	 echo '<div class="row">';
              while ($query->have_posts()) : $query->the_post();
              	echo '<div class="col-sm-'.$div.'"><div class="card ">';
                if ( has_post_thumbnail() ) { // Check if the post has a featured image assigned to it.
                  echo '  <img class="img-responsive" src="'.get_the_post_thumbnail_url('','dazzling-featured').'" alt="Avatar" style="width:100%">';
                }else{
                  echo '  <img class="img-responsive" src="'.get_template_directory_uri().'/img/noimage-1.png" alt="Avatar">';
                }
                echo '<div class="card_content">';
                  echo '<a href="'. get_permalink() .'">';
                    if ( get_the_title() != '' ) echo '<h4>'. wp_trim_words(get_the_title(),5).'</h4>';
                  echo '</a>';
                echo '</div>';
                 echo '</div></div>';
                endwhile;

     			 echo ' </div>';
              endif;
    }


 function areaInterest(){
 	return array('ai'=>'Artificial Intelligence','am'=>'Additive Manufaturing','cc'=>'Cloud Computing','iot'=>'IOT');
 }

  function member_type(){
 	return array('founder'=>'Founder','mentor'=>'Mentor','investor'=>'Investor','trainer'=>'Trainer');
 }