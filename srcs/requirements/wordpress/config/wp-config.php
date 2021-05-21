<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
#define( 'DB_NAME', 'wordpress_db' );
define( 'DB_NAME', getenv('WORDPRESS_DB_NAME') );

/** MySQL database username */
#define( 'DB_USER', 'lchapren' );
define( 'DB_USER', getenv('WORDPRESS_DB_USER') );

/** MySQL database password */
#define( 'DB_PASSWORD', 'tipass' );
define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );

/** MySQL hostname */
#define( 'DB_HOST', 'mariadb' );
define( 'DB_HOST', getenv('WORDPRESS_DB_HOST') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

mysqli_connect("DB_HOST", "DB_USER", "DB_PASSWORD", "DB_NAME", "3306");

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'ZnVvDIS|?*~6JJxXBu1!{zk]Z@I_tanR&N^s2]x0Ek8X*uTv<gLNw|vdn]qRFLz<');
define('SECURE_AUTH_KEY',  'H3&W8-Z+MFK91|8IM4nfD&l=h^Ou*/aXD+d6;c,)y9=dUDL/=ibxq@:~*TDg3_T-');
define('LOGGED_IN_KEY',    '%?K`0o;YVqv/uSGQgNVRm/`+M po6[u^-+yJ(VounKB/{q ,Su*l+$c(%)x(hTt=');
define('NONCE_KEY',        '1:`e|GY$=UKSY?z7:NL:9knp7f/Yf`TC<jgFJy|.8<C, ]dhsi6r8RN:S}Jk<IE!');
define('AUTH_SALT',        'yyD:{+xoRQ2J?-z~fPu>_F+ZH=>,%U8wn]~NC~Lnv3XPsIJJBhg#qN=Ts?mVJC.t');
define('SECURE_AUTH_SALT', 'G-_m6v`7dceDP<~`_,bL%*?d/r{{viT~,-E=v$@=a sr}du3o]`0`+//YKe{}`aR');
define('LOGGED_IN_SALT',   '*mp||MHC+Ioo1a{jJ=@`}s9d0~M?5ExaI4frJ0h)@REcnew4^UH}dO_^@x(Aup1`');
define('NONCE_SALT',       'IR#e=iq99uC]HM|c .a+G)3*I]YJ)]K09NkIGdfSZ!Z7>xUm3q,!W[MO(ZQ]*N:X');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );
/** Add any custom values after this line. */

//define( 'WP_USE_EXT_MYSQL', false );

/** Custom values must be above this line. That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';