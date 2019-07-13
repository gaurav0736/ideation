<?php
/**
 * The main template file.
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file exists.
 * Learn more: http://codex.wordpress.org/Template_Hierarchy
 *
 * @package dazzling
 */

get_header(); ?>	

        <div id="primary" class="content-area col-sm-12 col-md-8">
             <main id="main" class="site-main" role="main">
                    <h1 class="entry-title">Latest Ideas</h1>
                        <?php dazzling_latest_post_type('idea','3'); ?>

                </main><!-- #main -->
                <hr>
                <main id="main" class="site-main" role="main">
                    <h1 class="entry-title">Projects</h1>
                        <?php dazzling_latest_post_type('project','3'); ?>

                </main><!-- #main -->
                <hr>
                <main id="main" class="site-main" role="main">
                    <h1 class="entry-title">Startup/MSMEs</h1>
                        <?php dazzling_latest_post_type('startup','3'); ?>

                </main><!-- #main -->
                <hr>

            </div>
            <?php get_sidebar(); ?>
            <div class="clearfix"></div>
            <div id="primary" class="content-area col-sm-12 col-md-12">
                <main id="main" class="site-main" role="main">
                    <h1 class="entry-title">Latest Blog</h1>
                        <?php dazzling_latest_post_type('post','6'); ?>

                </main><!-- #main -->
                <hr>
                 <main id="main" class="site-main" role="main">
                    <h1 class="entry-title">Latest Events</h1>
                        <?php dazzling_latest_post_type('event','6'); ?>

                </main><!-- #main -->
                <hr>
                 <main id="main" class="site-main" role="main">
                    <h1 class="entry-title">Latest News</h1>
                        <?php dazzling_latest_post_type('news','6'); ?>

                </main><!-- #main -->
                <hr>
        </div><!-- #primary -->


<?php get_footer(); ?>