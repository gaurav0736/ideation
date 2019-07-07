<?php

/*
  Plugin Name: Kappa Registration Form
  Plugin URI: #
  Description: Simple WordPress registration form plugin that just work
  Version: 1.0
  Author: Gaurav Sharma
  Author URI: #
 */

class Kappa_registration_form
{

    private $username;
    private $email;
    private $password;
    private $website;
    private $first_name;
    private $last_name;
    private $nickname;
    private $bio;

    function __construct()
    {

        add_shortcode('kp_registration_form', array($this, 'shortcode'));
        add_action('wp_enqueue_scripts', array($this, 'flat_ui_kit'));
        add_shortcode('kp_login_form', array($this, 'login_form'));
    }

   public function login_form() { 
           ?>
    <!-- section -->
    <section class="aa_loginForm">
        <?php 
            global $user_login;
            // In case of a login error.?>
           <div class="aa_error">
          <?php 
            if(! empty($_SESSION['loginError']) ) :
                sessionMsg($_SESSION['loginError']);
                unset($_SESSION['loginError']);
            endif;
                
            if(!empty($_SESSION['msg']) ) :
                sessionMsg($_SESSION['msg']);
                unset($_SESSION['msg']);
            endif;
             ?>
        </div>
        <?php 
         // If user is already logged in.
            if ( is_user_logged_in() ) : 

                 wp_redirect( home_url('/account/') );
                 exit; 
                // If user is not logged in.
                else: 
                
                    // Login form arguments.
                    $args = array(
                        'echo'           => true,
                        'redirect'       => site_url( '/account' ), 
                        'form_id'        => 'loginform',
                        'label_username' => __( 'Username' ),
                        'label_password' => __( 'Password' ),
                        'label_remember' => __( 'Remember Me' ),
                        'label_log_in'   => __( 'Log In' ),
                        'id_username'    => 'user_login',
                        'id_password'    => 'user_pass',
                        'id_remember'    => 'rememberme',
                        'id_submit'      => 'wp-submit',
                        'remember'       => true,
                        'value_username' => NULL,
                        'value_remember' => true
                    ); 
                    
                    // Calling the login form.
                    wp_login_form( $args );
                endif;
        ?> 

    </section>
    <!-- /section -->
<?php 
    }


    public function registration_form()
    {

        ?>

        <form method="post" action="" data-parsley-validate="">
            <div class="login-form">
               <div class="row">
                 <div class="form-group col-sm-6">
                    <input name="reg_fname" type="text" class="form-control login-field" required=""
                           value="<?php echo(isset($_POST['reg_fname']) ? $_POST['reg_fname'] : null); ?>"
                           placeholder="First Name" id="reg-fname"/>
                    <label class="login-field-icon fui-user" for="reg-fname"></label>
                </div>

                <div class="form-group col-sm-6">
                    <input name="reg_lname" type="text" class="form-control login-field" required=""
                           value="<?php echo(isset($_POST['reg_lname']) ? $_POST['reg_lname'] : null); ?>"
                           placeholder="Last Name" id="reg-lname"/>
                    <label class="login-field-icon fui-user" for="reg-lname"></label>
                </div>
               </div>
               <div class="row">
                <div class="form-group col-sm-6">
                    <input name="reg_name" type="text" class="form-control login-field"
                           value="<?php echo(isset($_POST['reg_name']) ? $_POST['reg_name'] : null); ?>"
                           placeholder="Username" id="reg-name" required/>
                    <label class="login-field-icon fui-user" for="reg-name"></label>
                </div>

                <div class="form-group col-sm-6">
                    <input name="reg_email" type="email" class="form-control login-field"
                           value="<?php echo(isset($_POST['reg_email']) ? $_POST['reg_email'] : null); ?>"
                           placeholder="Email" id="reg-email" required/>
                    <label class="login-field-icon fui-mail" for="reg-email"></label>
                </div>
               </div>

                <div class="row">

                <div class="form-group col-sm-6">
                    <input name="reg_password" type="password" class="form-control login-field"
                           value="<?php echo(isset($_POST['reg_password']) ? $_POST['reg_password'] : null); ?>"
                           placeholder="Password" id="reg-pass" required/>
                    <label class="login-field-icon fui-lock" for="reg-pass"></label>
                </div>
                <div class="form-group col-sm-6">
                    <input name="reg_password_con" type="password" class="form-control login-field"
                           value="<?php echo(isset($_POST['reg_password_con']) ? $_POST['reg_password_con'] : null); ?>" data-parsley-equalto="#reg-pass"
                           placeholder="Confirm Password" id="reg-pass-con" required/>
                    <label class="login-field-icon fui-lock" for="reg-pass-con"></label>
                </div>
                </div>


                <div class="row">

                <div class="form-group col-sm-6">
                    <input name="reg_city" type="text" class="form-control login-field" data-parsley-required data-parsley-length="[2, 100]" 
                           value="<?php echo(isset($_POST['reg_city']) ? $_POST['reg_city'] : null); ?>"
                           placeholder="City" id="reg-city"/>
                    <label class="login-field-icon fui-location" for="reg-city"></label>

                </div>

                 <div class="form-group col-sm-6">
                    <input name="reg_phone" type="text" class="form-control login-field" data-parsley-required data-parsley-type='digits' data-parsley-length="[6, 16]"
                           value="<?php echo(isset($_POST['reg_phore']) ? $_POST['reg_phore'] : null); ?>"
                           placeholder="Phone No." id="reg-phone"/>
                    <label class="login-field-icon fui-list" for="reg-phone"></label>
                    
                </div>

                <div class="row">
                     <div class="form-group col-sm-12">
                         <label class="login_checkbox" for="reg-usertype">Member Type : </label>
                         <?php $member_type = member_type();
                            foreach($member_type as $key=>$val){
                                if($_POST['member_type']){
                                    if(in_array($key,$_POST['member_type'])){
                                        $checked='checked="checked"';
                                    }else{
                                        $checked = '';
                                    }
                                }else{
                                    $checked = '';
                                }
                                
                                echo '<input type="checkbox" '.$checked.' name="member_type[]" value="'.$key.'"  > '.$val.' &nbsp;';
                            }

                          ?>


                     </div>

                </div>

                <div class="row">
                     <div class="form-group col-sm-12">
                         <label class="login_checkbox" for="reg-usertype">Area Of Interest : </label>
                         <?php $area_interest = areaInterest();
                            foreach($area_interest as $key=>$val){
                                if($_POST['area_interest']){
                                    if(in_array($key,$_POST['area_interest'])){
                                        $checked='checked="checked"';
                                    }else{
                                        $checked = '';
                                    }
                                }else{
                                    $checked = '';
                                }
                                 
                                echo '<input type="checkbox" '.$checked.' name="area_interest[]" value="'.$key.'"  > '.$val.' &nbsp;';
                            }

                          ?>


                     </div>

                </div>


               </div>

                <input class="btn btn-primary btn-lg btn-block" type="submit" name="reg_submit" value="Register"/>
        </form>
        </div>
    <?php
    }

    function validation()
    {

        if (empty($this->username) || empty($this->password) || empty($this->email)) {
            return new WP_Error('field', 'Required form field is missing');
        }

        if (strlen($this->username) < 4) {
            return new WP_Error('username_length', 'Username too short. At least 4 characters is required');
        }

        if (strlen($this->password) < 5) {
            return new WP_Error('password', 'Password length must be greater than 5');
        }
        
        if ($this->password_con != $this->password) {
            return new WP_Error('password_con', 'Confirm Password must be same.');
        }

        if (!is_email($this->email)) {
            return new WP_Error('email_invalid', 'Email is not valid');
        }

        if (email_exists($this->email)) {
            return new WP_Error('email', 'Email Already in use');
        }

        if(empty($this->area_interest)){
            return new WP_Error('area_interest', 'Please select at least one area of interest.');
        }

        if(empty($this->member_type)){
            return new WP_Error('area_interest', 'Please select at least one member type.');
        }

        if(empty($this->city)){
            return new WP_Error('city', 'Please enter your city.');
        }

        $details = array(
            'Username' => $this->username,
            'First Name' => $this->first_name,
            'Last Name' => $this->last_name,
            
        );

        foreach ($details as $field => $detail) {
            if (!validate_username($detail)) {
                return new WP_Error('name_invalid', 'Sorry, the "' . $field . '" you entered is not valid');
            }
        }

    }

    function registration()
    {

        $userdata = array(
            'user_login' => esc_attr($this->username),
            'user_email' => esc_attr($this->email),
            'user_pass' => esc_attr($this->password),
            'first_name' => esc_attr($this->first_name),
            'last_name' => esc_attr($this->last_name),
        );


        if (is_wp_error($this->validation())) {
            echo '<div style="margin-bottom: 6px" class="btn btn-block btn-lg btn-danger">';
            echo '<strong>' . $this->validation()->get_error_message() . '</strong>';
            echo '</div>';
        } else {


            $register_user = wp_insert_user($userdata);
            if (!is_wp_error($register_user)) {
                $city = esc_attr($this->city);
                $phone = esc_attr($this->phone);
                $member_type = implode(', ',$this->member_type);
                $area_interest = implode(', ',$this->area_interest);
                add_user_meta($register_user,'city',$city);
                add_user_meta($register_user,'phone',$phone);
                add_user_meta($register_user,'member_type',esc_attr($member_type));
                add_user_meta($register_user,'area_interest',esc_attr($area_interest));

                echo '<div style="margin-bottom: 6px" class="btn btn-block btn-lg btn-danger">';
                echo '<strong>Registration complete. Go to <a href="' . wp_login_url() . '">login page</a></strong>';
                echo '</div>';
            } else {
                echo '<div style="margin-bottom: 6px" class="btn btn-block btn-lg btn-danger">';
                echo '<strong>' . $register_user->get_error_message() . '</strong>';
                echo '</div>';
            }
        }

    }

    function flat_ui_kit()
    {
        wp_enqueue_style('bootstrap-css', plugins_url('../bootstrap/css/bootstrap.css', __FILE__));
        wp_enqueue_style('flat-ui-kit', plugins_url('../css/flat-ui.css', __FILE__));
        wp_enqueue_script('parsley-js', plugins_url('../js/parsley.js', __FILE__));        
        wp_enqueue_style('kappa-css', plugins_url('../css/kappa.css', __FILE__));

    }

    function shortcode()
    {

        ob_start();

        if ($_POST['reg_submit']) {
            $this->username = $_POST['reg_name'];
            $this->email = $_POST['reg_email'];
            $this->password = $_POST['reg_password'];
            $this->password_con = $_POST['reg_password_con'];
            $this->first_name = $_POST['reg_fname'];
            $this->last_name = $_POST['reg_lname'];
            $this->city = $_POST['reg_city'];
            $this->phone = $_POST['reg_phone'];
            $this->member_type = $_POST['member_type'];
            $this->area_interest = $_POST['area_interest'];
            $this->validation();
            $this->registration();
        }

        $this->registration_form();
        return ob_get_clean();
    }

}

new Kappa_registration_form;
