<?php
/**
 * The Sidebar containing the main widget areas.
 *
 * @package dazzling
 */
?>
	<div id="secondary" class="widget-area col-sm-12 col-md-4" role="complementary">
			
		<form action="" method="post" >
			<aside id="archives" class="widget">
				<h1 class="widget-title"><?php _e( 'Member Type', 'dazzling' ); ?></h1>
				<ul>
				<?php $member_type = member_type();
				if(!empty($_POST['member_type'])){
					$member_type_data = $_POST['member_type'];
				}else{
					$member_type_data = array();;
				}
                            foreach($member_type as $key=>$val){
                                    if(in_array($key, $member_type_data)){
                                    	$checked='checked="checked"';
                                    }else{
                                        $checked = '';
                                    }
                                echo '<li><input type="checkbox" '.$checked.' name="member_type[]" value="'.$key.'"  > '.$val.'</li>';
                            }

                          ?>
                 </ul>

			</aside>
			<aside id="archives" class="widget">
				<h1 class="widget-title"><?php _e( 'Area of Interest', 'dazzling' ); ?></h1>
				<ul>
				<?php $area_interest = areaInterest();
				if(!empty($_POST['area_interest'])){
					$area_interest_data = $_POST['area_interest'];
				}else{
					$area_interest_data = array();;
				}
                            foreach($area_interest as $key=>$val){

                                    if(in_array($key,$area_interest_data)){
                                        $checked='checked="checked"';
                                    }else{
                                        $checked = '';
                                    }
                                 
                                echo '<li><input type="checkbox" '.$checked.' name="area_interest[]" value="'.$key.'"  > '.$val.' </li>';
                            }

                          ?>
                 </ul>

			</aside>
			<input type="submit" name="submit" value="submit">
		</form>
		
	</div><!-- #secondary -->
