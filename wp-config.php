<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'ideation' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'OYs+W7o.MFMiIj9nw.=K){C8FqnnlO+5Oz>J9)|5}6wB9E|S0r<Z$4$GTYi!ni?i' );
define( 'SECURE_AUTH_KEY',  'xXO;:B]KJI)/[Z#[@%m=4uACcNY9WloOo/]l$aQ-<~d;Uq6gW6@%[&)f:>ImBV 3' );
define( 'LOGGED_IN_KEY',    '6Hcd-Jm;?11?md>:[NVSGIKZbx4n_;vlhVJu^yf=OV}pFXN4Xl?fUu1Uu1_R)lZM' );
define( 'NONCE_KEY',        '8=F)V+#StO7.z]l1YNMQ1Xnl&pWt55G]1z8$6R`a3t00,YHfoau_-qFdpFhuO-*q' );
define( 'AUTH_SALT',        '+81N<^lPBf?<=8toZY%6FNd)3QUfbfP3uarxOXFJEC9n0Cn>:FHQd,q*pCIk?wEY' );
define( 'SECURE_AUTH_SALT', 'N=U/:@7$MG5Ofsw}OR{],u!k!}(k85r]PnFY$<`HhM{ <aoE=z*Af,G8z9{h/&-/' );
define( 'LOGGED_IN_SALT',   'L#[g]fE@ IN:$41%u_Fe~&Dp+(OM2 s]veNw8SH*xQyjb5]_n>KX=7}P_{UWu]`p' );
define( 'NONCE_SALT',       'VgH`KNyd`%~SCLgjMZI{SJ-sOgp%%y;9eN02+6;`)v5]9({q&Kld%c!jqC^;2Dl9' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'it_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
