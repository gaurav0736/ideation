-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 13, 2019 at 10:06 AM
-- Server version: 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ideation`
--

-- --------------------------------------------------------

--
-- Table structure for table `it_commentmeta`
--

DROP TABLE IF EXISTS `it_commentmeta`;
CREATE TABLE IF NOT EXISTS `it_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `it_comments`
--

DROP TABLE IF EXISTS `it_comments`;
CREATE TABLE IF NOT EXISTS `it_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `it_comments`
--

INSERT INTO `it_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2019-07-06 06:04:13', '2019-07-06 06:04:13', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `it_db7_forms`
--

DROP TABLE IF EXISTS `it_db7_forms`;
CREATE TABLE IF NOT EXISTS `it_db7_forms` (
  `form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_post_id` bigint(20) NOT NULL,
  `form_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `form_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `it_links`
--

DROP TABLE IF EXISTS `it_links`;
CREATE TABLE IF NOT EXISTS `it_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `it_options`
--

DROP TABLE IF EXISTS `it_options`;
CREATE TABLE IF NOT EXISTS `it_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `it_options`
--

INSERT INTO `it_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/ideation', 'yes'),
(2, 'home', 'http://localhost/ideation', 'yes'),
(3, 'blogname', 'Ideation', 'yes'),
(4, 'blogdescription', 'Innovators And Innovation', 'yes'),
(5, 'users_can_register', '1', 'yes'),
(6, 'admin_email', 'gaurav0736@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '1', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:224:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:8:\"ideas/?$\";s:24:\"index.php?post_type=idea\";s:38:\"ideas/feed/(feed|rdf|rss|rss2|atom)/?$\";s:41:\"index.php?post_type=idea&feed=$matches[1]\";s:33:\"ideas/(feed|rdf|rss|rss2|atom)/?$\";s:41:\"index.php?post_type=idea&feed=$matches[1]\";s:25:\"ideas/page/([0-9]{1,})/?$\";s:42:\"index.php?post_type=idea&paged=$matches[1]\";s:10:\"startup/?$\";s:27:\"index.php?post_type=startup\";s:40:\"startup/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=startup&feed=$matches[1]\";s:35:\"startup/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=startup&feed=$matches[1]\";s:27:\"startup/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=startup&paged=$matches[1]\";s:11:\"teammate/?$\";s:28:\"index.php?post_type=teammate\";s:41:\"teammate/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?post_type=teammate&feed=$matches[1]\";s:36:\"teammate/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?post_type=teammate&feed=$matches[1]\";s:28:\"teammate/page/([0-9]{1,})/?$\";s:46:\"index.php?post_type=teammate&paged=$matches[1]\";s:11:\"projects/?$\";s:27:\"index.php?post_type=project\";s:41:\"projects/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=project&feed=$matches[1]\";s:36:\"projects/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=project&feed=$matches[1]\";s:28:\"projects/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=project&paged=$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:33:\"ideas/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"ideas/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"ideas/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"ideas/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"ideas/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"ideas/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:22:\"ideas/([^/]+)/embed/?$\";s:37:\"index.php?idea=$matches[1]&embed=true\";s:26:\"ideas/([^/]+)/trackback/?$\";s:31:\"index.php?idea=$matches[1]&tb=1\";s:46:\"ideas/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?idea=$matches[1]&feed=$matches[2]\";s:41:\"ideas/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?idea=$matches[1]&feed=$matches[2]\";s:34:\"ideas/([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?idea=$matches[1]&paged=$matches[2]\";s:41:\"ideas/([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?idea=$matches[1]&cpage=$matches[2]\";s:30:\"ideas/([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?idea=$matches[1]&page=$matches[2]\";s:22:\"ideas/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:32:\"ideas/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:52:\"ideas/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"ideas/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"ideas/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"ideas/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:35:\"startup/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"startup/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"startup/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"startup/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"startup/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"startup/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"startup/([^/]+)/embed/?$\";s:40:\"index.php?startup=$matches[1]&embed=true\";s:28:\"startup/([^/]+)/trackback/?$\";s:34:\"index.php?startup=$matches[1]&tb=1\";s:48:\"startup/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?startup=$matches[1]&feed=$matches[2]\";s:43:\"startup/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?startup=$matches[1]&feed=$matches[2]\";s:36:\"startup/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?startup=$matches[1]&paged=$matches[2]\";s:43:\"startup/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?startup=$matches[1]&cpage=$matches[2]\";s:32:\"startup/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?startup=$matches[1]&page=$matches[2]\";s:24:\"startup/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"startup/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"startup/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"startup/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"startup/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"startup/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:36:\"teammate/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"teammate/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"teammate/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"teammate/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"teammate/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"teammate/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:25:\"teammate/([^/]+)/embed/?$\";s:41:\"index.php?teammate=$matches[1]&embed=true\";s:29:\"teammate/([^/]+)/trackback/?$\";s:35:\"index.php?teammate=$matches[1]&tb=1\";s:49:\"teammate/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?teammate=$matches[1]&feed=$matches[2]\";s:44:\"teammate/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?teammate=$matches[1]&feed=$matches[2]\";s:37:\"teammate/([^/]+)/page/?([0-9]{1,})/?$\";s:48:\"index.php?teammate=$matches[1]&paged=$matches[2]\";s:44:\"teammate/([^/]+)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?teammate=$matches[1]&cpage=$matches[2]\";s:33:\"teammate/([^/]+)(?:/([0-9]+))?/?$\";s:47:\"index.php?teammate=$matches[1]&page=$matches[2]\";s:25:\"teammate/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"teammate/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"teammate/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"teammate/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"teammate/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"teammate/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:36:\"projects/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"projects/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"projects/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"projects/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"projects/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"projects/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:25:\"projects/([^/]+)/embed/?$\";s:40:\"index.php?project=$matches[1]&embed=true\";s:29:\"projects/([^/]+)/trackback/?$\";s:34:\"index.php?project=$matches[1]&tb=1\";s:49:\"projects/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?project=$matches[1]&feed=$matches[2]\";s:44:\"projects/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?project=$matches[1]&feed=$matches[2]\";s:37:\"projects/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?project=$matches[1]&paged=$matches[2]\";s:44:\"projects/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?project=$matches[1]&cpage=$matches[2]\";s:33:\"projects/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?project=$matches[1]&page=$matches[2]\";s:25:\"projects/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"projects/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"projects/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"projects/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"projects/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"projects/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"events/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"events/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"events/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"events/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"events/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"events/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"events/([^/]+)/embed/?$\";s:38:\"index.php?event=$matches[1]&embed=true\";s:27:\"events/([^/]+)/trackback/?$\";s:32:\"index.php?event=$matches[1]&tb=1\";s:35:\"events/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?event=$matches[1]&paged=$matches[2]\";s:42:\"events/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?event=$matches[1]&cpage=$matches[2]\";s:31:\"events/([^/]+)(?:/([0-9]+))?/?$\";s:44:\"index.php?event=$matches[1]&page=$matches[2]\";s:23:\"events/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"events/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"events/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"events/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"events/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"events/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:32:\"news/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:42:\"news/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:62:\"news/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"news/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"news/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:38:\"news/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:21:\"news/([^/]+)/embed/?$\";s:37:\"index.php?news=$matches[1]&embed=true\";s:25:\"news/([^/]+)/trackback/?$\";s:31:\"index.php?news=$matches[1]&tb=1\";s:33:\"news/([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?news=$matches[1]&paged=$matches[2]\";s:40:\"news/([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?news=$matches[1]&cpage=$matches[2]\";s:29:\"news/([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?news=$matches[1]&page=$matches[2]\";s:21:\"news/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:31:\"news/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:51:\"news/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"news/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"news/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:27:\"news/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=31&cpage=$matches[1]\";s:18:\"account(/(.*))?/?$\";s:30:\"index.php?&account=$matches[2]\";s:26:\"update-password(/(.*))?/?$\";s:38:\"index.php?&update-password=$matches[2]\";s:25:\"update-profile(/(.*))?/?$\";s:37:\"index.php?&update-profile=$matches[2]\";s:19:\"idealist(/(.*))?/?$\";s:31:\"index.php?&idealist=$matches[2]\";s:20:\"edit-idea(/(.*))?/?$\";s:32:\"index.php?&edit-idea=$matches[2]\";s:23:\"startup-list(/(.*))?/?$\";s:35:\"index.php?&startup-list=$matches[2]\";s:23:\"edit-startup(/(.*))?/?$\";s:35:\"index.php?&edit-startup=$matches[2]\";s:19:\"teamlist(/(.*))?/?$\";s:31:\"index.php?&teamlist=$matches[2]\";s:20:\"edit-team(/(.*))?/?$\";s:32:\"index.php?&edit-team=$matches[2]\";s:23:\"project-list(/(.*))?/?$\";s:35:\"index.php?&project-list=$matches[2]\";s:23:\"edit-project(/(.*))?/?$\";s:35:\"index.php?&edit-project=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:6:{i:0;s:33:\"classic-editor/classic-editor.php\";i:1;s:36:\"contact-form-7/wp-contact-form-7.php\";i:2;s:42:\"contact-form-cfdb7/contact-form-cfdb-7.php\";i:3;s:51:\"kappa-registration-form/kappa-registration-form.php\";i:4;s:39:\"kiwi-social-share/kiwi-social-share.php\";i:5;s:21:\"meta-box/meta-box.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'dazzling', 'yes'),
(41, 'stylesheet', 'dazzling', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '44719', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:33:\"classic-editor/classic-editor.php\";a:2:{i:0;s:14:\"Classic_Editor\";i:1;s:9:\"uninstall\";}}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '22', 'yes'),
(84, 'page_on_front', '31', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'initial_db_version', '44719', 'yes'),
(94, 'it_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:12:\"cfdb7_access\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:3:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;s:12:\"upload_files\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'sidebars_widgets', 'a:9:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:4:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:10:\"archives-2\";i:3;s:12:\"categories-2\";}s:13:\"home-widget-1\";a:0:{}s:13:\"home-widget-2\";a:0:{}s:13:\"home-widget-3\";a:0:{}s:15:\"footer-widget-1\";a:0:{}s:15:\"footer-widget-2\";a:0:{}s:15:\"footer-widget-3\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(102, 'cron', 'a:6:{i:1563015855;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1563041055;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1563084253;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1563084412;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1563084418;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(103, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'recovery_keys', 'a:0:{}', 'yes'),
(115, 'theme_mods_twentynineteen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1562393368;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(120, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1563000841;s:7:\"checked\";a:4:{s:8:\"dazzling\";s:5:\"2.1.1\";s:14:\"twentynineteen\";s:3:\"1.4\";s:15:\"twentyseventeen\";s:3:\"2.2\";s:13:\"twentysixteen\";s:3:\"2.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(129, 'can_compress_scripts', '1', 'no'),
(144, 'recently_activated', 'a:0:{}', 'yes'),
(149, 'current_theme', 'Dazzling', 'yes'),
(150, 'theme_mods_dazzling', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:2;}s:18:\"custom_css_post_id\";i:-1;s:12:\"header_image\";s:13:\"remove-header\";}', 'yes'),
(151, 'theme_switched', '', 'yes'),
(152, 'widget_dazzling-social', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(153, 'widget_dazzling_tabbed_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(155, '_transient_timeout_kiwi_social_share_review', '1564985456', 'no'),
(156, '_transient_kiwi_social_share_review', '2019-07-06', 'no'),
(157, 'kiwi_social_sharing_version', '2.0.15', 'yes'),
(158, 'kiwi_general_settings', 'a:20:{s:17:\"networks_ordering\";s:0:\"\";s:13:\"styles_colors\";s:8:\"original\";s:20:\"networks_article_bar\";a:4:{i:0;s:8:\"facebook\";i:1;s:7:\"twitter\";i:2;s:9:\"pinterest\";i:3;s:8:\"linkedin\";}s:13:\"share_buttons\";s:2:\"on\";s:22:\"share_buttons_location\";s:3:\"top\";s:23:\"share_buttons_posttypes\";s:3:\"all\";s:28:\"share_buttons_posttypes_list\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:12:\"button_shape\";s:4:\"rect\";s:17:\"article_bar_style\";s:6:\"center\";s:14:\"floating_panel\";s:2:\"on\";s:23:\"floating_panel_location\";s:4:\"left\";s:24:\"floating_panel_posttypes\";s:3:\"all\";s:29:\"floating_panel_posttypes_list\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:21:\"button_shape_floating\";s:4:\"rect\";s:27:\"custom_meta_boxes_posttypes\";s:3:\"all\";s:32:\"custom_meta_boxes_posttypes_list\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:24:\"click_to_tweet_posttypes\";s:3:\"all\";s:29:\"click_to_tweet_posttypes_list\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:28:\"highlight_to_tweet_posttypes\";s:3:\"all\";s:33:\"highlight_to_tweet_posttypes_list\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}}', 'yes'),
(189, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(192, 'kiwi_network_colors', 'a:11:{s:8:\"facebook\";a:4:{s:10:\"background\";s:7:\"#3b5998\";s:4:\"text\";s:7:\"#ffffff\";s:16:\"hover_background\";s:7:\"#1b4199\";s:10:\"hover_text\";s:7:\"#ffffff\";}s:7:\"twitter\";a:4:{s:10:\"background\";s:7:\"#4eaef8\";s:4:\"text\";s:7:\"#ffffff\";s:16:\"hover_background\";s:7:\"#1193f7\";s:10:\"hover_text\";s:7:\"#ffffff\";}s:11:\"google-plus\";a:4:{s:10:\"background\";s:7:\"#db4437\";s:4:\"text\";s:7:\"#ffffff\";s:16:\"hover_background\";s:7:\"#db2615\";s:10:\"hover_text\";s:7:\"#ffffff\";}s:9:\"pinterest\";a:4:{s:10:\"background\";s:7:\"#bd081c\";s:4:\"text\";s:7:\"#ffffff\";s:16:\"hover_background\";s:7:\"#770107\";s:10:\"hover_text\";s:7:\"#ffffff\";}s:6:\"fintel\";a:4:{s:10:\"background\";s:7:\"#087515\";s:4:\"text\";s:7:\"#ffffff\";s:16:\"hover_background\";s:7:\"#087515\";s:10:\"hover_text\";s:7:\"#ffffff\";}s:8:\"linkedin\";a:4:{s:10:\"background\";s:7:\"#1a85bc\";s:4:\"text\";s:7:\"#ffffff\";s:16:\"hover_background\";s:7:\"#006aa8\";s:10:\"hover_text\";s:7:\"#ffffff\";}s:6:\"reddit\";a:4:{s:10:\"background\";s:7:\"#ff4500\";s:4:\"text\";s:7:\"#ffffff\";s:16:\"hover_background\";s:7:\"#e22500\";s:10:\"hover_text\";s:7:\"#ffffff\";}s:5:\"email\";a:4:{s:10:\"background\";s:7:\"#4d9159\";s:4:\"text\";s:7:\"#ffffff\";s:16:\"hover_background\";s:7:\"#0e9126\";s:10:\"hover_text\";s:7:\"#ffffff\";}s:8:\"telegram\";a:4:{s:10:\"background\";s:7:\"#179cde\";s:4:\"text\";s:7:\"#ffffff\";s:16:\"hover_background\";s:7:\"#008cea\";s:10:\"hover_text\";s:7:\"#ffffff\";}s:8:\"whatsapp\";a:4:{s:10:\"background\";s:7:\"#0dc143\";s:4:\"text\";s:7:\"#ffffff\";s:16:\"hover_background\";s:7:\"#499b06\";s:10:\"hover_text\";s:7:\"#ffffff\";}s:5:\"skype\";a:4:{s:10:\"background\";s:7:\"#009ee5\";s:4:\"text\";s:7:\"#ffffff\";s:16:\"hover_background\";s:7:\"#008ae0\";s:10:\"hover_text\";s:7:\"#ffffff\";}}', 'yes'),
(193, 'kiwi_social_identities', 'a:4:{s:16:\"twitter_username\";s:0:\"\";s:17:\"facebook_page_url\";s:0:\"\";s:15:\"facebook_app_id\";s:0:\"\";s:19:\"facebook_app_secret\";s:0:\"\";}', 'yes'),
(194, 'kiwi_advanced_settings', '', 'yes'),
(206, 'cfdb7_view_install_date', '2019-07-06 7:49:27', 'yes'),
(207, 'wpcf7', 'a:2:{s:7:\"version\";s:5:\"5.1.3\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1562399406;s:7:\"version\";s:5:\"5.1.3\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'yes'),
(208, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1563000841;s:7:\"checked\";a:8:{s:19:\"akismet/akismet.php\";s:5:\"4.1.2\";s:33:\"classic-editor/classic-editor.php\";s:3:\"1.5\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"5.1.3\";s:42:\"contact-form-cfdb7/contact-form-cfdb-7.php\";s:7:\"1.2.4.6\";s:9:\"hello.php\";s:5:\"1.7.2\";s:51:\"kappa-registration-form/kappa-registration-form.php\";s:3:\"1.0\";s:39:\"kiwi-social-share/kiwi-social-share.php\";s:6:\"2.0.15\";s:21:\"meta-box/meta-box.php\";s:6:\"4.18.4\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:7:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:33:\"classic-editor/classic-editor.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/classic-editor\";s:4:\"slug\";s:14:\"classic-editor\";s:6:\"plugin\";s:33:\"classic-editor/classic-editor.php\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/classic-editor/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/classic-editor.1.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-256x256.png?rev=1998671\";s:2:\"1x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-128x128.png?rev=1998671\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/classic-editor/assets/banner-1544x500.png?rev=1998671\";s:2:\"1x\";s:69:\"https://ps.w.org/classic-editor/assets/banner-772x250.png?rev=1998676\";}s:11:\"banners_rtl\";a:0:{}}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"5.1.3\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-7.5.1.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=984007\";s:2:\"1x\";s:66:\"https://ps.w.org/contact-form-7/assets/icon-128x128.png?rev=984007\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}}s:42:\"contact-form-cfdb7/contact-form-cfdb-7.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:32:\"w.org/plugins/contact-form-cfdb7\";s:4:\"slug\";s:18:\"contact-form-cfdb7\";s:6:\"plugin\";s:42:\"contact-form-cfdb7/contact-form-cfdb-7.php\";s:11:\"new_version\";s:7:\"1.2.4.6\";s:3:\"url\";s:49:\"https://wordpress.org/plugins/contact-form-cfdb7/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/contact-form-cfdb7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:71:\"https://ps.w.org/contact-form-cfdb7/assets/icon-256x256.png?rev=1619878\";s:2:\"1x\";s:71:\"https://ps.w.org/contact-form-cfdb7/assets/icon-128x128.png?rev=1619878\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:73:\"https://ps.w.org/contact-form-cfdb7/assets/banner-772x250.png?rev=1619902\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}s:39:\"kiwi-social-share/kiwi-social-share.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:31:\"w.org/plugins/kiwi-social-share\";s:4:\"slug\";s:17:\"kiwi-social-share\";s:6:\"plugin\";s:39:\"kiwi-social-share/kiwi-social-share.php\";s:11:\"new_version\";s:6:\"2.0.15\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/kiwi-social-share/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/kiwi-social-share.2.0.15.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/kiwi-social-share/assets/icon-256x256.png?rev=1445882\";s:2:\"1x\";s:70:\"https://ps.w.org/kiwi-social-share/assets/icon-256x256.png?rev=1445882\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:72:\"https://ps.w.org/kiwi-social-share/assets/banner-772x250.png?rev=1445902\";}s:11:\"banners_rtl\";a:0:{}}s:21:\"meta-box/meta-box.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:22:\"w.org/plugins/meta-box\";s:4:\"slug\";s:8:\"meta-box\";s:6:\"plugin\";s:21:\"meta-box/meta-box.php\";s:11:\"new_version\";s:6:\"4.18.4\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/meta-box/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/meta-box.4.18.4.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/meta-box/assets/icon-128x128.png?rev=1100915\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:63:\"https://ps.w.org/meta-box/assets/banner-772x250.png?rev=1929588\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(215, 'category_children', 'a:0:{}', 'yes'),
(219, 'dazzling', 'a:4:{s:24:\"dazzling_slider_checkbox\";i:1;s:25:\"dazzling_slide_categories\";s:1:\"3\";s:21:\"dazzling_slide_number\";s:1:\"1\";s:18:\"custom_footer_text\";s:8:\"Ideation\";}', 'yes'),
(236, 'recovery_mode_email_last_sent', '1562858002', 'yes'),
(283, 'WPLANG', '', 'yes'),
(284, 'new_admin_email', 'gaurav0736@gmail.com', 'yes'),
(296, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.2.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.2.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.2\";s:7:\"version\";s:5:\"5.2.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1563000837;s:15:\"version_checked\";s:5:\"5.2.2\";s:12:\"translations\";a:0:{}}', 'no'),
(297, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:20:\"gaurav0736@gmail.com\";s:7:\"version\";s:5:\"5.2.2\";s:9:\"timestamp\";i:1562438321;}', 'no'),
(346, '_site_transient_timeout_browser_bcf1814caa6afe84eeebef28ff236a7f', '1563202616', 'no'),
(347, '_site_transient_browser_bcf1814caa6afe84eeebef28ff236a7f', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"75.0.3770.100\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(493, '_site_transient_timeout_theme_roots', '1563002639', 'no'),
(494, '_site_transient_theme_roots', 'a:4:{s:8:\"dazzling\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no'),
(504, 'cfdb7_view_ignore_notice', 'true', 'yes'),
(507, '_transient_is_multi_author', '0', 'yes'),
(508, '_transient_all_the_cool_cats', '1', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `it_postmeta`
--

DROP TABLE IF EXISTS `it_postmeta`;
CREATE TABLE IF NOT EXISTS `it_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `it_postmeta`
--

INSERT INTO `it_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_wp_trash_meta_status', 'publish'),
(4, 5, '_wp_trash_meta_time', '1562393608'),
(6, 1, 'post_views_count', '13'),
(7, 3, '_edit_lock', '1562396176:1'),
(8, 3, '_edit_last', '1'),
(9, 8, '_edit_lock', '1562424590:1'),
(10, 8, '_edit_last', '1'),
(11, 10, '_edit_lock', '1562948643:1'),
(12, 10, '_edit_last', '1'),
(13, 12, '_edit_lock', '1562424548:1'),
(16, 12, '_edit_last', '1'),
(19, 14, '_edit_lock', '1562948612:1'),
(22, 14, '_edit_last', '1'),
(25, 16, '_edit_lock', '1562948668:1'),
(28, 16, '_edit_last', '1'),
(31, 18, '_edit_lock', '1562425743:1'),
(34, 18, '_edit_last', '1'),
(37, 20, '_edit_lock', '1562426597:1'),
(40, 20, '_edit_last', '1'),
(43, 22, '_edit_lock', '1562424535:1'),
(46, 22, '_edit_last', '1'),
(49, 24, '_edit_lock', '1563004392:1'),
(52, 24, '_edit_last', '1'),
(55, 26, '_edit_lock', '1562490416:1'),
(58, 26, '_edit_last', '1'),
(61, 28, '_edit_lock', '1562424543:1'),
(64, 28, '_edit_last', '1'),
(69, 31, '_edit_lock', '1562396423:1'),
(72, 31, '_edit_last', '1'),
(75, 33, '_menu_item_type', 'post_type'),
(76, 33, '_menu_item_menu_item_parent', '0'),
(77, 33, '_menu_item_object_id', '31'),
(78, 33, '_menu_item_object', 'page'),
(79, 33, '_menu_item_target', ''),
(80, 33, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(81, 33, '_menu_item_xfn', ''),
(82, 33, '_menu_item_url', ''),
(84, 34, '_menu_item_type', 'post_type'),
(85, 34, '_menu_item_menu_item_parent', '0'),
(86, 34, '_menu_item_object_id', '28'),
(87, 34, '_menu_item_object', 'page'),
(88, 34, '_menu_item_target', ''),
(89, 34, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(90, 34, '_menu_item_xfn', ''),
(91, 34, '_menu_item_url', ''),
(93, 35, '_menu_item_type', 'post_type'),
(94, 35, '_menu_item_menu_item_parent', '0'),
(95, 35, '_menu_item_object_id', '26'),
(96, 35, '_menu_item_object', 'page'),
(97, 35, '_menu_item_target', ''),
(98, 35, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(99, 35, '_menu_item_xfn', ''),
(100, 35, '_menu_item_url', ''),
(102, 36, '_menu_item_type', 'post_type'),
(103, 36, '_menu_item_menu_item_parent', '0'),
(104, 36, '_menu_item_object_id', '24'),
(105, 36, '_menu_item_object', 'page'),
(106, 36, '_menu_item_target', ''),
(107, 36, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(108, 36, '_menu_item_xfn', ''),
(109, 36, '_menu_item_url', ''),
(111, 37, '_menu_item_type', 'post_type'),
(112, 37, '_menu_item_menu_item_parent', '0'),
(113, 37, '_menu_item_object_id', '22'),
(114, 37, '_menu_item_object', 'page'),
(115, 37, '_menu_item_target', ''),
(116, 37, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(117, 37, '_menu_item_xfn', ''),
(118, 37, '_menu_item_url', ''),
(129, 39, '_menu_item_type', 'post_type'),
(130, 39, '_menu_item_menu_item_parent', '0'),
(131, 39, '_menu_item_object_id', '18'),
(132, 39, '_menu_item_object', 'page'),
(133, 39, '_menu_item_target', ''),
(134, 39, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(135, 39, '_menu_item_xfn', ''),
(136, 39, '_menu_item_url', ''),
(138, 40, '_menu_item_type', 'post_type'),
(139, 40, '_menu_item_menu_item_parent', '44'),
(140, 40, '_menu_item_object_id', '16'),
(141, 40, '_menu_item_object', 'page'),
(142, 40, '_menu_item_target', ''),
(143, 40, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(144, 40, '_menu_item_xfn', ''),
(145, 40, '_menu_item_url', ''),
(147, 41, '_menu_item_type', 'post_type'),
(148, 41, '_menu_item_menu_item_parent', '44'),
(149, 41, '_menu_item_object_id', '14'),
(150, 41, '_menu_item_object', 'page'),
(151, 41, '_menu_item_target', ''),
(152, 41, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(153, 41, '_menu_item_xfn', ''),
(154, 41, '_menu_item_url', ''),
(156, 42, '_menu_item_type', 'post_type'),
(157, 42, '_menu_item_menu_item_parent', '44'),
(158, 42, '_menu_item_object_id', '12'),
(159, 42, '_menu_item_object', 'page'),
(160, 42, '_menu_item_target', ''),
(161, 42, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(162, 42, '_menu_item_xfn', ''),
(163, 42, '_menu_item_url', ''),
(165, 43, '_menu_item_type', 'post_type'),
(166, 43, '_menu_item_menu_item_parent', '44'),
(167, 43, '_menu_item_object_id', '10'),
(168, 43, '_menu_item_object', 'page'),
(169, 43, '_menu_item_target', ''),
(170, 43, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(171, 43, '_menu_item_xfn', ''),
(172, 43, '_menu_item_url', ''),
(174, 44, '_menu_item_type', 'post_type'),
(175, 44, '_menu_item_menu_item_parent', '0'),
(176, 44, '_menu_item_object_id', '8'),
(177, 44, '_menu_item_object', 'page'),
(178, 44, '_menu_item_target', ''),
(179, 44, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(180, 44, '_menu_item_xfn', ''),
(181, 44, '_menu_item_url', ''),
(183, 45, '_menu_item_type', 'post_type'),
(184, 45, '_menu_item_menu_item_parent', '0'),
(185, 45, '_menu_item_object_id', '3'),
(186, 45, '_menu_item_object', 'page'),
(187, 45, '_menu_item_target', ''),
(188, 45, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(189, 45, '_menu_item_xfn', ''),
(190, 45, '_menu_item_url', ''),
(191, 45, '_menu_item_orphaned', '1562396627'),
(192, 46, '_menu_item_type', 'post_type'),
(193, 46, '_menu_item_menu_item_parent', '0'),
(194, 46, '_menu_item_object_id', '2'),
(195, 46, '_menu_item_object', 'page'),
(196, 46, '_menu_item_target', ''),
(197, 46, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(198, 46, '_menu_item_xfn', ''),
(199, 46, '_menu_item_url', ''),
(200, 46, '_menu_item_orphaned', '1562396628'),
(201, 47, '_menu_item_type', 'post_type'),
(202, 47, '_menu_item_menu_item_parent', '0'),
(203, 47, '_menu_item_object_id', '1'),
(204, 47, '_menu_item_object', 'page'),
(205, 47, '_menu_item_target', ''),
(206, 47, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(207, 47, '_menu_item_xfn', ''),
(208, 47, '_menu_item_url', ''),
(209, 47, '_menu_item_orphaned', '1562396628'),
(210, 48, '_form', '<label> Your Name (required)\n    [text* your-name] </label>\n\n<label> Your Email (required)\n    [email* your-email] </label>\n\n<label> Subject\n    [text your-subject] </label>\n\n<label> Your Message\n    [textarea your-message] </label>\n\n[submit \"Send\"]'),
(211, 48, '_mail', 'a:8:{s:7:\"subject\";s:25:\"Ideation \"[your-subject]\"\";s:6:\"sender\";s:31:\"Ideation <gaurav0736@gmail.com>\";s:4:\"body\";s:172:\"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Ideation (http://localhost/ideation)\";s:9:\"recipient\";s:20:\"gaurav0736@gmail.com\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(212, 48, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:25:\"Ideation \"[your-subject]\"\";s:6:\"sender\";s:31:\"Ideation <gaurav0736@gmail.com>\";s:4:\"body\";s:114:\"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Ideation (http://localhost/ideation)\";s:9:\"recipient\";s:12:\"[your-email]\";s:18:\"additional_headers\";s:30:\"Reply-To: gaurav0736@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(213, 48, '_messages', 'a:8:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";}'),
(214, 48, '_additional_settings', NULL),
(215, 48, '_locale', 'en_US'),
(216, 1, '_edit_lock', '1562431414:1'),
(219, 50, '_wp_attached_file', '2019/07/cropped-download.jpeg'),
(220, 50, '_wp_attachment_context', 'custom-header'),
(221, 50, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:300;s:6:\"height\";i:66;s:4:\"file\";s:29:\"2019/07/cropped-download.jpeg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"cropped-download-150x66.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:66;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:28:\"cropped-download-300x66.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:66;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:27:\"cropped-download-60x60.jpeg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:17:\"attachment_parent\";i:49;}'),
(224, 51, '_wp_trash_meta_status', 'publish'),
(225, 51, '_wp_trash_meta_time', '1562401498'),
(226, 52, '_wp_trash_meta_status', 'publish'),
(227, 52, '_wp_trash_meta_time', '1562401511'),
(228, 1, '_edit_last', '1'),
(236, 1, '_wp_old_slug', 'hello-world'),
(237, 56, '_wp_trash_meta_status', 'publish'),
(238, 56, '_wp_trash_meta_time', '1562401706'),
(239, 57, '_wp_trash_meta_status', 'publish'),
(240, 57, '_wp_trash_meta_time', '1562401899'),
(241, 58, '_wp_trash_meta_status', 'publish'),
(242, 58, '_wp_trash_meta_time', '1562401909'),
(243, 59, '_wp_attached_file', '2019/07/banner-research-new-idea-award.jpg'),
(244, 59, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1300;s:6:\"height\";i:600;s:4:\"file\";s:42:\"2019/07/banner-research-new-idea-award.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:42:\"banner-research-new-idea-award-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:42:\"banner-research-new-idea-award-300x138.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:138;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:42:\"banner-research-new-idea-award-768x354.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:354;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:43:\"banner-research-new-idea-award-1024x473.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:473;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:42:\"banner-research-new-idea-award-730x410.jpg\";s:5:\"width\";i:730;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:40:\"banner-research-new-idea-award-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(252, 62, '_wp_attached_file', '2019/07/idea-spark.jpg'),
(253, 62, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2000;s:6:\"height\";i:500;s:4:\"file\";s:22:\"2019/07/idea-spark.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"idea-spark-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"idea-spark-300x75.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:75;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"idea-spark-768x192.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:192;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:23:\"idea-spark-1024x256.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:256;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:22:\"idea-spark-730x410.jpg\";s:5:\"width\";i:730;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:20:\"idea-spark-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(254, 1, '_thumbnail_id', '62'),
(259, 22, '_wp_page_template', 'default'),
(260, 28, '_wp_page_template', 'default'),
(261, 12, '_wp_page_template', 'default'),
(266, 8, '_wp_page_template', 'default'),
(267, 66, '_edit_last', '1'),
(268, 66, '_edit_lock', '1562425150:1'),
(269, 66, '_thumbnail_id', '59'),
(270, 66, 'post_views_count', '12'),
(284, 69, '_menu_item_type', 'post_type'),
(285, 69, '_menu_item_menu_item_parent', '0'),
(286, 69, '_menu_item_object_id', '20'),
(287, 69, '_menu_item_object', 'page'),
(288, 69, '_menu_item_target', ''),
(289, 69, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(290, 69, '_menu_item_xfn', ''),
(291, 69, '_menu_item_url', ''),
(293, 20, '_wp_page_template', 'templates/events.php'),
(294, 70, '_edit_last', '1'),
(295, 70, '_edit_lock', '1562426662:1'),
(296, 70, '_thumbnail_id', '59'),
(297, 70, 'post_views_count', '3'),
(298, 71, '_wp_trash_meta_status', 'publish'),
(299, 71, '_wp_trash_meta_time', '1562427131'),
(300, 72, '_form', '<label>Your Name (required)\n[text* your-name ]</label>\n<label>Your Email (required)\n[email* your-email]</label>\n[submit \"Subscribe\"]'),
(301, 72, '_mail', 'a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:32:\"Ideation : Newsletter Subscriber\";s:6:\"sender\";s:31:\"Ideation <gaurav0736@gmail.com>\";s:9:\"recipient\";s:20:\"gaurav0736@gmail.com\";s:4:\"body\";s:118:\"From: [your-name] <[your-email]>\n\n-- \nThis e-mail was sent from a contact form on Ideation (http://localhost/ideation)\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(302, 72, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:25:\"Ideation \"[your-subject]\"\";s:6:\"sender\";s:31:\"Ideation <gaurav0736@gmail.com>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:114:\"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Ideation (http://localhost/ideation)\";s:18:\"additional_headers\";s:30:\"Reply-To: gaurav0736@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(303, 72, '_messages', 'a:23:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";s:12:\"invalid_date\";s:29:\"The date format is incorrect.\";s:14:\"date_too_early\";s:44:\"The date is before the earliest one allowed.\";s:13:\"date_too_late\";s:41:\"The date is after the latest one allowed.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:20:\"The file is too big.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";s:14:\"invalid_number\";s:29:\"The number format is invalid.\";s:16:\"number_too_small\";s:47:\"The number is smaller than the minimum allowed.\";s:16:\"number_too_large\";s:46:\"The number is larger than the maximum allowed.\";s:23:\"quiz_answer_not_correct\";s:36:\"The answer to the quiz is incorrect.\";s:17:\"captcha_not_match\";s:31:\"Your entered code is incorrect.\";s:13:\"invalid_email\";s:38:\"The e-mail address entered is invalid.\";s:11:\"invalid_url\";s:19:\"The URL is invalid.\";s:11:\"invalid_tel\";s:32:\"The telephone number is invalid.\";}'),
(304, 72, '_additional_settings', ''),
(305, 72, '_locale', 'en_US'),
(310, 75, '_edit_last', '1'),
(311, 75, '_edit_lock', '1562433387:1'),
(312, 75, '_wp_page_template', 'templates/registration.php'),
(313, 77, '_edit_lock', '1562483126:1'),
(314, 77, '_edit_last', '1'),
(317, 77, '_wp_trash_meta_status', 'publish'),
(318, 77, '_wp_trash_meta_time', '1562497130'),
(319, 77, '_wp_desired_post_slug', 'my-account'),
(320, 80, '_wp_attached_file', '2019/07/4214X-Men.jpg'),
(321, 80, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:608;s:6:\"height\";i:800;s:4:\"file\";s:21:\"2019/07/4214X-Men.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"4214X-Men-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"4214X-Men-228x300.jpg\";s:5:\"width\";i:228;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:21:\"4214X-Men-608x410.jpg\";s:5:\"width\";i:608;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:19:\"4214X-Men-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(322, 81, '_wp_attached_file', '2019/07/Zendaya.jpg'),
(323, 81, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:150;s:6:\"height\";i:150;s:4:\"file\";s:19:\"2019/07/Zendaya.jpg\";s:5:\"sizes\";a:1:{s:9:\"tab-small\";a:4:{s:4:\"file\";s:17:\"Zendaya-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(324, 82, '_wp_attached_file', '2019/07/X-Men.jpg'),
(325, 82, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:608;s:6:\"height\";i:800;s:4:\"file\";s:17:\"2019/07/X-Men.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:17:\"X-Men-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:17:\"X-Men-228x300.jpg\";s:5:\"width\";i:228;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:17:\"X-Men-608x410.jpg\";s:5:\"width\";i:608;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:15:\"X-Men-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(328, 85, '_wp_attached_file', '2019/07/1854Spider-man-far-from-home.jpg'),
(329, 85, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:608;s:6:\"height\";i:800;s:4:\"file\";s:40:\"2019/07/1854Spider-man-far-from-home.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:40:\"1854Spider-man-far-from-home-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:40:\"1854Spider-man-far-from-home-228x300.jpg\";s:5:\"width\";i:228;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:40:\"1854Spider-man-far-from-home-608x410.jpg\";s:5:\"width\";i:608;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:38:\"1854Spider-man-far-from-home-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(331, 87, '_wp_attached_file', '2019/07/2665banner-research-new-idea-award.jpg'),
(332, 87, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1300;s:6:\"height\";i:600;s:4:\"file\";s:46:\"2019/07/2665banner-research-new-idea-award.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:46:\"2665banner-research-new-idea-award-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:46:\"2665banner-research-new-idea-award-300x138.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:138;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:46:\"2665banner-research-new-idea-award-768x354.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:354;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:47:\"2665banner-research-new-idea-award-1024x473.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:473;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:46:\"2665banner-research-new-idea-award-730x410.jpg\";s:5:\"width\";i:730;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:44:\"2665banner-research-new-idea-award-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(335, 90, '_wp_attached_file', '2019/07/3799Spider-man-far-from-home.jpg'),
(336, 90, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:608;s:6:\"height\";i:800;s:4:\"file\";s:40:\"2019/07/3799Spider-man-far-from-home.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:40:\"3799Spider-man-far-from-home-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:40:\"3799Spider-man-far-from-home-228x300.jpg\";s:5:\"width\";i:228;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:40:\"3799Spider-man-far-from-home-608x410.jpg\";s:5:\"width\";i:608;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:38:\"3799Spider-man-far-from-home-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(337, 91, '_wp_attached_file', '2019/07/634banner-research-new-idea-award.jpg'),
(338, 91, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1300;s:6:\"height\";i:600;s:4:\"file\";s:45:\"2019/07/634banner-research-new-idea-award.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"634banner-research-new-idea-award-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:45:\"634banner-research-new-idea-award-300x138.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:138;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:45:\"634banner-research-new-idea-award-768x354.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:354;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:46:\"634banner-research-new-idea-award-1024x473.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:473;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:45:\"634banner-research-new-idea-award-730x410.jpg\";s:5:\"width\";i:730;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:43:\"634banner-research-new-idea-award-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(339, 92, '_wp_attached_file', '2019/07/4288banner-research-new-idea-award.jpg'),
(340, 92, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1300;s:6:\"height\";i:600;s:4:\"file\";s:46:\"2019/07/4288banner-research-new-idea-award.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:46:\"4288banner-research-new-idea-award-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:46:\"4288banner-research-new-idea-award-300x138.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:138;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:46:\"4288banner-research-new-idea-award-768x354.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:354;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:47:\"4288banner-research-new-idea-award-1024x473.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:473;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:46:\"4288banner-research-new-idea-award-730x410.jpg\";s:5:\"width\";i:730;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:44:\"4288banner-research-new-idea-award-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(341, 93, '_wp_attached_file', '2019/07/197banner-research-new-idea-award.jpg'),
(342, 93, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1300;s:6:\"height\";i:600;s:4:\"file\";s:45:\"2019/07/197banner-research-new-idea-award.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"197banner-research-new-idea-award-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:45:\"197banner-research-new-idea-award-300x138.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:138;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:45:\"197banner-research-new-idea-award-768x354.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:354;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:46:\"197banner-research-new-idea-award-1024x473.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:473;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:45:\"197banner-research-new-idea-award-730x410.jpg\";s:5:\"width\";i:730;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:43:\"197banner-research-new-idea-award-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(343, 94, '_thumbnail_id', '95'),
(344, 94, '_edit_lock', '1562770498:1'),
(345, 95, '_wp_attached_file', '2019/07/339754.jpg'),
(346, 96, '_thumbnail_id', '97'),
(347, 97, '_wp_attached_file', '2019/07/1109banner-research-new-idea-award.jpg'),
(348, 97, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1300;s:6:\"height\";i:600;s:4:\"file\";s:46:\"2019/07/1109banner-research-new-idea-award.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:46:\"1109banner-research-new-idea-award-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:46:\"1109banner-research-new-idea-award-300x138.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:138;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:46:\"1109banner-research-new-idea-award-768x354.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:354;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:47:\"1109banner-research-new-idea-award-1024x473.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:473;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:46:\"1109banner-research-new-idea-award-730x410.jpg\";s:5:\"width\";i:730;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:44:\"1109banner-research-new-idea-award-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(352, 94, '_wp_old_slug', 'fsdfsdf-sdf-sdf__trashed'),
(353, 94, 'post_views_count', '13'),
(354, 96, 'post_views_count', '3'),
(355, 96, '_edit_last', '1'),
(356, 96, '_edit_lock', '1562770305:1'),
(357, 94, '_edit_last', '1'),
(358, 98, '_edit_lock', '1562771584:1'),
(359, 99, '_wp_attached_file', '2019/07/807banner-research-new-idea-award.jpg'),
(360, 99, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1300;s:6:\"height\";i:600;s:4:\"file\";s:45:\"2019/07/807banner-research-new-idea-award.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"807banner-research-new-idea-award-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:45:\"807banner-research-new-idea-award-300x138.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:138;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:45:\"807banner-research-new-idea-award-768x354.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:354;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:46:\"807banner-research-new-idea-award-1024x473.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:473;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:45:\"807banner-research-new-idea-award-730x410.jpg\";s:5:\"width\";i:730;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:43:\"807banner-research-new-idea-award-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(361, 100, '_thumbnail_id', '99'),
(362, 100, '_founder', 'aasd sad, asd asd\r\nasd asd asdasd sad'),
(363, 94, '_wp_trash_meta_status', 'publish'),
(364, 94, '_wp_trash_meta_time', '1562772185'),
(365, 94, '_wp_desired_post_slug', 'fsdfsdf-sdf-sdf'),
(366, 101, '_wp_attached_file', '2019/07/2023banner-research-new-idea-award.jpg'),
(367, 101, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1300;s:6:\"height\";i:600;s:4:\"file\";s:46:\"2019/07/2023banner-research-new-idea-award.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:46:\"2023banner-research-new-idea-award-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:46:\"2023banner-research-new-idea-award-300x138.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:138;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:46:\"2023banner-research-new-idea-award-768x354.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:354;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:47:\"2023banner-research-new-idea-award-1024x473.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:473;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:46:\"2023banner-research-new-idea-award-730x410.jpg\";s:5:\"width\";i:730;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:44:\"2023banner-research-new-idea-award-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(368, 102, '_thumbnail_id', '101'),
(369, 102, '_founder', 'Garry Wilson, Mark Author'),
(370, 102, '_edit_lock', '1562776595:1'),
(371, 102, 'post_views_count', '9'),
(372, 104, '_edit_lock', '1562777197:1'),
(373, 105, '_edit_lock', '1562777208:1'),
(374, 105, '_edit_last', '1'),
(375, 105, '_thumbnail_id', '97'),
(376, 106, '_wp_attached_file', '2019/07/4073banner-research-new-idea-award.jpg'),
(377, 106, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1300;s:6:\"height\";i:600;s:4:\"file\";s:46:\"2019/07/4073banner-research-new-idea-award.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:46:\"4073banner-research-new-idea-award-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:46:\"4073banner-research-new-idea-award-300x138.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:138;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:46:\"4073banner-research-new-idea-award-768x354.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:354;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:47:\"4073banner-research-new-idea-award-1024x473.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:473;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:17:\"dazzling-featured\";a:4:{s:4:\"file\";s:46:\"4073banner-research-new-idea-award-730x410.jpg\";s:5:\"width\";i:730;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:44:\"4073banner-research-new-idea-award-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(378, 107, '_thumbnail_id', '106'),
(379, 108, '_edit_lock', '1562778724:1'),
(380, 109, '_edit_lock', '1562778744:1'),
(381, 110, '_edit_lock', '1562780106:1'),
(382, 111, 'skills', 'Nec feugiat in fermentum posuere'),
(383, 111, 'no_of_people', '5'),
(384, 111, 'location', 'Delhi'),
(385, 111, 'project_span', '2 montha'),
(386, 111, 'contact_person', 'Garry Wilson'),
(387, 111, 'contact_mobile', '9876543210'),
(388, 111, 'contact_email', 'garry@gmail.com'),
(389, 111, 'expectation', 'Dis parturient montes nascetur ridiculus mus mauris'),
(390, 111, 'post_views_count', '8'),
(391, 105, 'post_views_count', '3'),
(392, 112, '_edit_lock', '1562858202:1'),
(393, 113, '_edit_lock', '1562858263:1'),
(394, 114, '_edit_lock', '1562858350:1'),
(395, 115, '_edit_lock', '1562861874:1'),
(396, 115, '_edit_last', '1'),
(397, 115, '_thumbnail_id', '90'),
(399, 115, 'project_span', '1 month'),
(402, 116, '_thumbnail_id', '0'),
(403, 116, 'project_span', '3w'),
(405, 115, 'project_users', '3'),
(406, 115, 'project_users', '2'),
(407, 117, '_thumbnail_id', '0'),
(408, 117, 'project_span', '2 weeks'),
(427, 119, '_thumbnail_id', '0'),
(428, 119, 'project_span', '2 weeks'),
(434, 117, 'post_views_count', '4'),
(435, 116, 'post_views_count', '2'),
(436, 107, 'post_views_count', '3'),
(437, 119, 'post_views_count', '11'),
(438, 118, 'post_views_count', '1'),
(439, 14, '_wp_page_template', 'default'),
(440, 10, '_wp_page_template', 'default'),
(441, 16, '_wp_page_template', 'default'),
(445, 116, 'project_users', '3'),
(446, 116, 'project_users', '2'),
(447, 122, '_thumbnail_id', '0'),
(448, 122, '_founder', 'Neque volutpat,  Tincidunt vitae'),
(449, 123, '_thumbnail_id', '0'),
(450, 123, '_founder', 'Habitasse platea, Dictumst vestibulum'),
(451, 122, 'post_views_count', '1'),
(452, 105, '_wp_trash_meta_status', 'publish'),
(453, 105, '_wp_trash_meta_time', '1562949395'),
(454, 105, '_wp_desired_post_slug', 'asdasd'),
(455, 96, '_wp_trash_meta_status', 'publish'),
(456, 96, '_wp_trash_meta_time', '1562949410'),
(457, 96, '_wp_desired_post_slug', 'sdfsdfsdf'),
(458, 115, '_wp_trash_meta_status', 'publish'),
(459, 115, '_wp_trash_meta_time', '1562949417'),
(460, 115, '_wp_desired_post_slug', 'adasdasd'),
(461, 100, 'post_views_count', '1'),
(462, 24, '_wp_page_template', 'templates/teambuilder.php'),
(464, 125, '_wp_attached_file', '2019/07/cropped-807banner-research-new-idea-award.jpg'),
(465, 125, '_wp_attachment_context', 'custom-header'),
(466, 125, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:300;s:6:\"height\";i:66;s:4:\"file\";s:53:\"2019/07/cropped-807banner-research-new-idea-award.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:52:\"cropped-807banner-research-new-idea-award-150x66.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:66;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:52:\"cropped-807banner-research-new-idea-award-300x66.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:66;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"tab-small\";a:4:{s:4:\"file\";s:51:\"cropped-807banner-research-new-idea-award-60x60.jpg\";s:5:\"width\";i:60;s:6:\"height\";i:60;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:17:\"attachment_parent\";i:99;}'),
(469, 118, '_edit_lock', '1563005927:1'),
(470, 118, '_edit_last', '1'),
(471, 118, 'status', 'new'),
(472, 107, 'status', 'completed'),
(473, 100, 'status', 'new'),
(474, 119, 'status', 'completed'),
(477, 117, 'status', 'new'),
(478, 117, 'project_users', '3'),
(479, 119, 'project_users', '3'),
(480, 119, 'project_users', '4'),
(481, 126, '_edit_lock', '1563006169:1'),
(482, 126, '_edit_last', '1'),
(483, 126, '_wp_page_template', 'templates/finalised-idea.php'),
(484, 128, '_edit_lock', '1563006048:1'),
(485, 128, '_edit_last', '1'),
(486, 128, '_wp_page_template', 'templates/completed-projects.php'),
(487, 130, '_menu_item_type', 'post_type'),
(488, 130, '_menu_item_menu_item_parent', '44'),
(489, 130, '_menu_item_object_id', '128'),
(490, 130, '_menu_item_object', 'page'),
(491, 130, '_menu_item_target', ''),
(492, 130, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(493, 130, '_menu_item_xfn', ''),
(494, 130, '_menu_item_url', ''),
(496, 131, '_menu_item_type', 'post_type'),
(497, 131, '_menu_item_menu_item_parent', '44'),
(498, 131, '_menu_item_object_id', '126'),
(499, 131, '_menu_item_object', 'page'),
(500, 131, '_menu_item_target', ''),
(501, 131, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(502, 131, '_menu_item_xfn', ''),
(503, 131, '_menu_item_url', ''),
(505, 132, '_edit_lock', '1563010529:1'),
(506, 132, '_edit_last', '1'),
(508, 132, '_wp_page_template', 'templates/people.php');

-- --------------------------------------------------------

--
-- Table structure for table `it_posts`
--

DROP TABLE IF EXISTS `it_posts`;
CREATE TABLE IF NOT EXISTS `it_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `it_posts`
--

INSERT INTO `it_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2019-07-06 06:04:13', '2019-07-06 06:04:13', '<!-- wp:paragraph -->\r\n<p>Upload your ideas and get listed and get your ideas implemented...</p>\r\n<!-- /wp:paragraph -->', 'Get Ideas', '', 'publish', 'open', 'open', '', 'get-ideas', '', '', '2019-07-06 16:43:34', '2019-07-06 16:43:34', '', 0, 'http://localhost/ideation/?p=1', 0, 'post', '', 1),
(2, 1, '2019-07-06 06:04:13', '2019-07-06 06:04:13', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/ideation/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2019-07-06 06:04:13', '2019-07-06 06:04:13', '', 0, 'http://localhost/ideation/?page_id=2', 0, 'page', '', 0),
(3, 1, '2019-07-06 06:04:13', '2019-07-06 06:04:13', '<!-- wp:heading -->\n<h2>Who we are</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our website address is: http://localhost/ideation.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>What personal data we collect and why we collect it</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Comments</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor’s IP address and browser user agent string to help spam detection.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Media</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Contact forms</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Cookies</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select \"Remember Me\", your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Embedded content from other websites</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Analytics</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>Who we share your data with</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>How long we retain your data</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>What rights you have over your data</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Where we send your data</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Visitor comments may be checked through an automated spam detection service.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Your contact information</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>Additional information</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>How we protect your data</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>What data breach procedures we have in place</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>What third parties we receive data from</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>What automated decision making and/or profiling we do with user data</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Industry regulatory disclosure requirements</h3>\n<!-- /wp:heading -->', 'Privacy Policy', '', 'publish', 'closed', 'open', '', 'privacy-policy', '', '', '2019-07-06 06:56:15', '2019-07-06 06:56:15', '', 0, 'http://localhost/ideation/?page_id=3', 0, 'page', '', 0),
(5, 1, '2019-07-06 06:13:28', '2019-07-06 06:13:28', '{\n    \"blogdescription\": {\n        \"value\": \"Innovators And Innovation\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-07-06 06:13:28\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '9eb98710-c906-43ef-810d-6ac5372b9033', '', '', '2019-07-06 06:13:28', '2019-07-06 06:13:28', '', 0, 'http://localhost/ideation/2019/07/06/9eb98710-c906-43ef-810d-6ac5372b9033/', 0, 'customize_changeset', '', 0),
(7, 1, '2019-07-06 06:56:15', '2019-07-06 06:56:15', '<!-- wp:heading -->\n<h2>Who we are</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our website address is: http://localhost/ideation.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>What personal data we collect and why we collect it</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Comments</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor’s IP address and browser user agent string to help spam detection.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Media</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Contact forms</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Cookies</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select \"Remember Me\", your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Embedded content from other websites</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Analytics</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>Who we share your data with</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>How long we retain your data</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>What rights you have over your data</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Where we send your data</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Visitor comments may be checked through an automated spam detection service.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Your contact information</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>Additional information</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>How we protect your data</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>What data breach procedures we have in place</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>What third parties we receive data from</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>What automated decision making and/or profiling we do with user data</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Industry regulatory disclosure requirements</h3>\n<!-- /wp:heading -->', 'Privacy Policy', '', 'inherit', 'closed', 'closed', '', '3-revision-v1', '', '', '2019-07-06 06:56:15', '2019-07-06 06:56:15', '', 3, 'http://localhost/ideation/2019/07/06/3-revision-v1/', 0, 'revision', '', 0),
(8, 1, '2019-07-06 06:57:09', '2019-07-06 06:57:09', '', 'Innovation', '', 'publish', 'open', 'closed', '', 'innovation', '', '', '2019-07-06 14:49:50', '2019-07-06 14:49:50', '', 0, 'http://localhost/ideation/?page_id=8', 0, 'page', '', 0),
(9, 1, '2019-07-06 06:57:09', '2019-07-06 06:57:09', '', 'Innovation', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2019-07-06 06:57:09', '2019-07-06 06:57:09', '', 8, 'http://localhost/ideation/2019/07/06/8-revision-v1/', 0, 'revision', '', 0),
(10, 1, '2019-07-06 06:57:29', '2019-07-06 06:57:29', '', 'Ideas', '', 'publish', 'closed', 'closed', '', 'ideas', '', '', '2019-07-12 16:24:03', '2019-07-12 16:24:03', '', 0, 'http://localhost/ideation/?page_id=10', 0, 'page', '', 0),
(11, 1, '2019-07-06 06:57:29', '2019-07-06 06:57:29', '', 'Ideation', '', 'inherit', 'closed', 'closed', '', '10-revision-v1', '', '', '2019-07-06 06:57:29', '2019-07-06 06:57:29', '', 10, 'http://localhost/ideation/2019/07/06/10-revision-v1/', 0, 'revision', '', 0),
(12, 1, '2019-07-06 06:57:52', '2019-07-06 06:57:52', '', 'Development', '', 'publish', 'closed', 'closed', '', 'development', '', '', '2019-07-06 14:49:08', '2019-07-06 14:49:08', '', 0, 'http://localhost/ideation/?p=12', 0, 'page', '', 0),
(13, 1, '2019-07-06 06:57:52', '2019-07-06 06:57:52', '', 'Development', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2019-07-06 06:57:52', '2019-07-06 06:57:52', '', 12, 'http://localhost/ideation/2019/07/06/12-revision-v1/', 0, 'revision', '', 0),
(14, 1, '2019-07-06 06:58:10', '2019-07-06 06:58:10', '', 'Projects', '', 'publish', 'open', 'closed', '', 'projects', '', '', '2019-07-12 16:23:32', '2019-07-12 16:23:32', '', 0, 'http://localhost/ideation/?p=14', 0, 'page', '', 0),
(15, 1, '2019-07-06 06:58:10', '2019-07-06 06:58:10', '', 'Product', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2019-07-06 06:58:10', '2019-07-06 06:58:10', '', 14, 'http://localhost/ideation/2019/07/06/14-revision-v1/', 0, 'revision', '', 0),
(16, 1, '2019-07-06 06:58:34', '2019-07-06 06:58:34', '', 'Start Up/MSME', '', 'publish', 'open', 'closed', '', 'startup', '', '', '2019-07-12 16:24:28', '2019-07-12 16:24:28', '', 0, 'http://localhost/ideation/?p=16', 0, 'page', '', 0),
(17, 1, '2019-07-06 06:58:34', '2019-07-06 06:58:34', '', 'Start Up/MSME', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2019-07-06 06:58:34', '2019-07-06 06:58:34', '', 16, 'http://localhost/ideation/2019/07/06/16-revision-v1/', 0, 'revision', '', 0),
(18, 1, '2019-07-06 06:58:51', '2019-07-06 06:58:51', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Turpis egestas integer eget aliquet nibh praesent tristique magna. Mattis rhoncus urna neque viverra justo nec ultrices dui. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Elit pellentesque habitant morbi tristique. Eget mauris pharetra et ultrices neque ornare aenean euismod. In cursus turpis massa tincidunt dui ut ornare lectus sit. Amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet. Ornare massa eget egestas purus viverra accumsan in nisl nisi. Condimentum lacinia quis vel eros donec ac. Ut sem viverra aliquet eget sit. Malesuada proin libero nunc consequat interdum varius sit. Nulla facilisi cras fermentum odio eu. Iaculis nunc sed augue lacus viverra vitae congue. Et ligula ullamcorper malesuada proin libero nunc. Semper risus in hendrerit gravida rutrum. Placerat orci nulla pellentesque dignissim enim sit amet venenatis. Venenatis a condimentum vitae sapien pellentesque habitant. Elementum facilisis leo vel fringilla est ullamcorper.\r\n\r\nInterdum varius sit amet mattis vulputate enim. Leo vel orci porta non pulvinar neque laoreet suspendisse. Pharetra vel turpis nunc eget lorem dolor sed. Arcu cursus vitae congue mauris rhoncus aenean vel elit. Accumsan in nisl nisi scelerisque eu ultrices vitae auctor eu. Malesuada proin libero nunc consequat interdum. Nulla facilisi morbi tempus iaculis urna. Pellentesque habitant morbi tristique senectus et netus et malesuada. At varius vel pharetra vel turpis nunc eget. Elementum facilisis leo vel fringilla est ullamcorper eget. Risus sed vulputate odio ut enim blandit volutpat maecenas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Viverra vitae congue eu consequat. Nisi est sit amet facilisis magna. Sed libero enim sed faucibus. Erat velit scelerisque in dictum non consectetur. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus scelerisque. Risus nullam eget felis eget nunc.\r\n\r\nVitae justo eget magna fermentum iaculis eu non diam phasellus. Cursus mattis molestie a iaculis at erat. Duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam. Eros donec ac odio tempor. Vitae nunc sed velit dignissim sodales ut eu. Nulla at volutpat diam ut. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare. At varius vel pharetra vel turpis nunc eget. Nibh tortor id aliquet lectus proin. Id consectetur purus ut faucibus pulvinar elementum integer. Diam maecenas sed enim ut sem viverra aliquet. Viverra mauris in aliquam sem. Sit amet consectetur adipiscing elit. Justo donec enim diam vulputate ut pharetra sit amet. Id neque aliquam vestibulum morbi blandit cursus. Mattis enim ut tellus elementum sagittis vitae et leo. Nec feugiat in fermentum posuere urna nec tincidunt praesent.\r\n\r\nDis parturient montes nascetur ridiculus mus mauris. A diam maecenas sed enim ut sem viverra aliquet eget. Platea dictumst quisque sagittis purus sit amet volutpat. Proin nibh nisl condimentum id venenatis a condimentum vitae. Fringilla urna porttitor rhoncus dolor. Tincidunt dui ut ornare lectus. Sed adipiscing diam donec adipiscing tristique risus nec feugiat. Id donec ultrices tincidunt arcu non sodales neque sodales. Integer eget aliquet nibh praesent tristique magna sit amet. Dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida. Morbi tincidunt augue interdum velit. Ultricies mi eget mauris pharetra et ultrices neque ornare. Viverra adipiscing at in tellus integer. Amet nulla facilisi morbi tempus. Arcu non odio euismod lacinia at quis risus sed. Urna nunc id cursus metus aliquam eleifend mi in nulla. Magna eget est lorem ipsum dolor sit amet consectetur. Tempus imperdiet nulla malesuada pellentesque elit. Neque volutpat ac tincidunt vitae semper quis lectus nulla.\r\n\r\nAliquet lectus proin nibh nisl condimentum. Sit amet aliquam id diam maecenas ultricies mi. Nibh ipsum consequat nisl vel pretium. Sed ullamcorper morbi tincidunt ornare massa eget. Consectetur lorem donec massa sapien faucibus et molestie ac feugiat. Faucibus vitae aliquet nec ullamcorper sit amet risus nullam eget. Elementum facilisis leo vel fringilla est ullamcorper eget. Sed felis eget velit aliquet sagittis. Diam volutpat commodo sed egestas egestas fringilla. Amet massa vitae tortor condimentum lacinia quis vel. Donec adipiscing tristique risus nec feugiat in fermentum posuere. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Elit pellentesque habitant morbi tristique senectus et netus et malesuada. Posuere morbi leo urna molestie at elementum eu. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus. Tempus imperdiet nulla malesuada pellentesque. Et sollicitudin ac orci phasellus egestas. Magna fermentum iaculis eu non diam phasellus. Cras fermentum odio eu feugiat pretium nibh ipsum consequat.', 'People Resources', '', 'publish', 'closed', 'closed', '', 'people-resources', '', '', '2019-07-06 15:07:58', '2019-07-06 15:07:58', '', 0, 'http://localhost/ideation/?p=18', 0, 'page', '', 0),
(19, 1, '2019-07-06 06:58:51', '2019-07-06 06:58:51', '', 'People Resources', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2019-07-06 06:58:51', '2019-07-06 06:58:51', '', 18, 'http://localhost/ideation/2019/07/06/18-revision-v1/', 0, 'revision', '', 0),
(20, 1, '2019-07-06 06:59:03', '2019-07-06 06:59:03', '', 'Events', '', 'publish', 'closed', 'closed', '', 'events', '', '', '2019-07-06 15:16:33', '2019-07-06 15:16:33', '', 0, 'http://localhost/ideation/?p=20', 0, 'page', '', 0),
(21, 1, '2019-07-06 06:59:03', '2019-07-06 06:59:03', '', 'Events', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2019-07-06 06:59:03', '2019-07-06 06:59:03', '', 20, 'http://localhost/ideation/2019/07/06/20-revision-v1/', 0, 'revision', '', 0),
(22, 1, '2019-07-06 06:59:14', '2019-07-06 06:59:14', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2019-07-06 14:48:55', '2019-07-06 14:48:55', '', 0, 'http://localhost/ideation/?p=22', 0, 'page', '', 0),
(23, 1, '2019-07-06 06:59:14', '2019-07-06 06:59:14', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2019-07-06 06:59:14', '2019-07-06 06:59:14', '', 22, 'http://localhost/ideation/2019/07/06/22-revision-v1/', 0, 'revision', '', 0),
(24, 1, '2019-07-06 06:59:28', '2019-07-06 06:59:28', '', 'Team Builder', '', 'publish', 'closed', 'closed', '', 'team-builder', '', '', '2019-07-12 16:39:13', '2019-07-12 16:39:13', '', 0, 'http://localhost/ideation/?p=24', 0, 'page', '', 0),
(25, 1, '2019-07-06 06:59:28', '2019-07-06 06:59:28', '', 'Team Builder', '', 'inherit', 'closed', 'closed', '', '24-revision-v1', '', '', '2019-07-06 06:59:28', '2019-07-06 06:59:28', '', 24, 'http://localhost/ideation/2019/07/06/24-revision-v1/', 0, 'revision', '', 0),
(26, 1, '2019-07-06 06:59:43', '2019-07-06 06:59:43', '[kp_login_form]', 'Login', '', 'publish', 'closed', 'closed', '', 'login', '', '', '2019-07-07 07:15:20', '2019-07-07 07:15:20', '', 0, 'http://localhost/ideation/?p=26', 0, 'page', '', 0),
(27, 1, '2019-07-06 06:59:43', '2019-07-06 06:59:43', '', 'Login', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2019-07-06 06:59:43', '2019-07-06 06:59:43', '', 26, 'http://localhost/ideation/2019/07/06/26-revision-v1/', 0, 'revision', '', 0),
(28, 1, '2019-07-06 06:59:55', '2019-07-06 06:59:55', '[contact-form-7 id=\"48\" title=\"Contact form 1\"]', 'Contact Us', '', 'publish', 'closed', 'closed', '', 'contact', '', '', '2019-07-06 14:49:03', '2019-07-06 14:49:03', '', 0, 'http://localhost/ideation/?p=28', 0, 'page', '', 0),
(29, 1, '2019-07-06 06:59:55', '2019-07-06 06:59:55', '', 'Contact', '', 'inherit', 'closed', 'closed', '', '28-revision-v1', '', '', '2019-07-06 06:59:55', '2019-07-06 06:59:55', '', 28, 'http://localhost/ideation/2019/07/06/28-revision-v1/', 0, 'revision', '', 0),
(31, 1, '2019-07-06 07:00:21', '2019-07-06 07:00:21', '', 'Home', '', 'publish', 'open', 'open', '', 'home', '', '', '2019-07-06 07:00:23', '2019-07-06 07:00:23', '', 0, 'http://localhost/ideation/?p=31', 0, 'page', '', 0),
(32, 1, '2019-07-06 07:00:21', '2019-07-06 07:00:21', '', 'Home', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2019-07-06 07:00:21', '2019-07-06 07:00:21', '', 31, 'http://localhost/ideation/2019/07/06/31-revision-v1/', 0, 'revision', '', 0),
(33, 1, '2019-07-06 07:13:42', '2019-07-06 07:13:42', ' ', '', '', 'publish', 'closed', 'closed', '', '33', '', '', '2019-07-13 08:24:51', '2019-07-13 08:24:51', '', 0, 'http://localhost/ideation/?p=33', 1, 'nav_menu_item', '', 0),
(34, 1, '2019-07-06 07:13:43', '2019-07-06 07:13:43', ' ', '', '', 'publish', 'closed', 'closed', '', '34', '', '', '2019-07-13 08:24:52', '2019-07-13 08:24:52', '', 0, 'http://localhost/ideation/?p=34', 14, 'nav_menu_item', '', 0),
(35, 1, '2019-07-06 07:13:43', '2019-07-06 07:13:43', ' ', '', '', 'publish', 'closed', 'closed', '', '35', '', '', '2019-07-13 08:24:52', '2019-07-13 08:24:52', '', 0, 'http://localhost/ideation/?p=35', 13, 'nav_menu_item', '', 0),
(36, 1, '2019-07-06 07:13:43', '2019-07-06 07:13:43', ' ', '', '', 'publish', 'closed', 'closed', '', '36', '', '', '2019-07-13 08:24:52', '2019-07-13 08:24:52', '', 0, 'http://localhost/ideation/?p=36', 12, 'nav_menu_item', '', 0),
(37, 1, '2019-07-06 07:13:43', '2019-07-06 07:13:43', ' ', '', '', 'publish', 'closed', 'closed', '', '37', '', '', '2019-07-13 08:24:51', '2019-07-13 08:24:51', '', 0, 'http://localhost/ideation/?p=37', 11, 'nav_menu_item', '', 0),
(39, 1, '2019-07-06 07:13:42', '2019-07-06 07:13:42', ' ', '', '', 'publish', 'closed', 'closed', '', '39', '', '', '2019-07-13 08:24:51', '2019-07-13 08:24:51', '', 0, 'http://localhost/ideation/?p=39', 9, 'nav_menu_item', '', 0),
(40, 1, '2019-07-06 07:13:42', '2019-07-06 07:13:42', ' ', '', '', 'publish', 'closed', 'closed', '', '40', '', '', '2019-07-13 08:24:51', '2019-07-13 08:24:51', '', 0, 'http://localhost/ideation/?p=40', 5, 'nav_menu_item', '', 0),
(41, 1, '2019-07-06 07:13:42', '2019-07-06 07:13:42', ' ', '', '', 'publish', 'closed', 'closed', '', '41', '', '', '2019-07-13 08:24:51', '2019-07-13 08:24:51', '', 0, 'http://localhost/ideation/?p=41', 6, 'nav_menu_item', '', 0),
(42, 1, '2019-07-06 07:13:42', '2019-07-06 07:13:42', ' ', '', '', 'publish', 'closed', 'closed', '', '42', '', '', '2019-07-13 08:24:51', '2019-07-13 08:24:51', '', 0, 'http://localhost/ideation/?p=42', 8, 'nav_menu_item', '', 0),
(43, 1, '2019-07-06 07:13:42', '2019-07-06 07:13:42', ' ', '', '', 'publish', 'closed', 'closed', '', '43', '', '', '2019-07-13 08:24:51', '2019-07-13 08:24:51', '', 0, 'http://localhost/ideation/?p=43', 3, 'nav_menu_item', '', 0),
(44, 1, '2019-07-06 07:13:42', '2019-07-06 07:13:42', ' ', '', '', 'publish', 'closed', 'closed', '', '44', '', '', '2019-07-13 08:24:51', '2019-07-13 08:24:51', '', 0, 'http://localhost/ideation/?p=44', 2, 'nav_menu_item', '', 0),
(45, 1, '2019-07-06 07:03:47', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-07-06 07:03:47', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?p=45', 1, 'nav_menu_item', '', 0),
(46, 1, '2019-07-06 07:03:47', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-07-06 07:03:47', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?p=46', 1, 'nav_menu_item', '', 0),
(47, 1, '2019-07-06 07:03:48', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2019-07-06 07:03:48', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?p=47', 1, 'nav_menu_item', '', 0),
(48, 1, '2019-07-06 07:50:06', '2019-07-06 07:50:06', '<label> Your Name (required)\n    [text* your-name] </label>\n\n<label> Your Email (required)\n    [email* your-email] </label>\n\n<label> Subject\n    [text your-subject] </label>\n\n<label> Your Message\n    [textarea your-message] </label>\n\n[submit \"Send\"]\nIdeation \"[your-subject]\"\nIdeation <gaurav0736@gmail.com>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Ideation (http://localhost/ideation)\ngaurav0736@gmail.com\nReply-To: [your-email]\n\n0\n0\n\nIdeation \"[your-subject]\"\nIdeation <gaurav0736@gmail.com>\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on Ideation (http://localhost/ideation)\n[your-email]\nReply-To: gaurav0736@gmail.com\n\n0\n0\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2019-07-06 07:50:06', '2019-07-06 07:50:06', '', 0, 'http://localhost/ideation/?post_type=wpcf7_contact_form&p=48', 0, 'wpcf7_contact_form', '', 0),
(50, 1, '2019-07-06 08:24:50', '2019-07-06 08:24:50', '', 'cropped-download.jpeg', '', 'inherit', 'open', 'closed', '', 'cropped-download-jpeg', '', '', '2019-07-06 08:24:50', '2019-07-06 08:24:50', '', 0, 'http://localhost/ideation/wp-content/uploads/2019/07/cropped-download.jpeg', 0, 'attachment', 'image/jpeg', 0),
(51, 1, '2019-07-06 08:24:57', '2019-07-06 08:24:57', '{\n    \"dazzling::header_image\": {\n        \"value\": \"http://localhost/ideation/wp-content/uploads/2019/07/cropped-download.jpeg\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-07-06 08:24:57\"\n    },\n    \"dazzling::header_image_data\": {\n        \"value\": {\n            \"url\": \"http://localhost/ideation/wp-content/uploads/2019/07/cropped-download.jpeg\",\n            \"thumbnail_url\": \"http://localhost/ideation/wp-content/uploads/2019/07/cropped-download.jpeg\",\n            \"timestamp\": 1562401490828,\n            \"attachment_id\": 50,\n            \"width\": 300,\n            \"height\": 66\n        },\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-07-06 08:24:57\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '40122f3b-5c08-4b50-a7f0-5ce7db74f41e', '', '', '2019-07-06 08:24:57', '2019-07-06 08:24:57', '', 0, 'http://localhost/ideation/40122f3b-5c08-4b50-a7f0-5ce7db74f41e/', 0, 'customize_changeset', '', 0),
(52, 1, '2019-07-06 08:25:11', '2019-07-06 08:25:11', '{\n    \"dazzling::header_image\": {\n        \"value\": \"remove-header\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-07-06 08:25:11\"\n    },\n    \"dazzling::header_image_data\": {\n        \"value\": \"remove-header\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-07-06 08:25:11\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '1f4f8e5e-251c-4136-9903-b0fc694987cd', '', '', '2019-07-06 08:25:11', '2019-07-06 08:25:11', '', 0, 'http://localhost/ideation/1f4f8e5e-251c-4136-9903-b0fc694987cd/', 0, 'customize_changeset', '', 0),
(53, 1, '2019-07-06 08:25:49', '2019-07-06 08:25:49', '<!-- wp:paragraph -->\r\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\r\n<!-- /wp:paragraph -->', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2019-07-06 08:25:49', '2019-07-06 08:25:49', '', 1, 'http://localhost/ideation/1-revision-v1/', 0, 'revision', '', 0),
(55, 1, '2019-07-06 08:28:04', '2019-07-06 08:28:04', '<!-- wp:paragraph -->\r\n<p>Upload your ideas and get listed and get your ideas implemented...</p>\r\n<!-- /wp:paragraph -->', 'Get Ideas', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2019-07-06 08:28:04', '2019-07-06 08:28:04', '', 1, 'http://localhost/ideation/1-revision-v1/', 0, 'revision', '', 0),
(56, 1, '2019-07-06 08:28:26', '2019-07-06 08:28:26', '{\n    \"dazzling[dazzling_slider_checkbox]\": {\n        \"value\": true,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-07-06 08:28:26\"\n    },\n    \"dazzling[dazzling_slide_categories]\": {\n        \"value\": \"3\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-07-06 08:28:26\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'fc4cb439-a0fc-4791-8753-a4092082aa23', '', '', '2019-07-06 08:28:26', '2019-07-06 08:28:26', '', 0, 'http://localhost/ideation/fc4cb439-a0fc-4791-8753-a4092082aa23/', 0, 'customize_changeset', '', 0),
(57, 1, '2019-07-06 08:31:39', '2019-07-06 08:31:39', '{\n    \"dazzling[dazzling_slide_number]\": {\n        \"value\": \"4\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-07-06 08:31:39\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '7b0def9d-2884-4efc-86b2-c6d557126f76', '', '', '2019-07-06 08:31:39', '2019-07-06 08:31:39', '', 0, 'http://localhost/ideation/7b0def9d-2884-4efc-86b2-c6d557126f76/', 0, 'customize_changeset', '', 0),
(58, 1, '2019-07-06 08:31:49', '2019-07-06 08:31:49', '{\n    \"dazzling[dazzling_slide_number]\": {\n        \"value\": \"1\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-07-06 08:31:49\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'e89576f7-56dc-4822-87dc-4516c6c1fe0d', '', '', '2019-07-06 08:31:49', '2019-07-06 08:31:49', '', 0, 'http://localhost/ideation/e89576f7-56dc-4822-87dc-4516c6c1fe0d/', 0, 'customize_changeset', '', 0),
(59, 1, '2019-07-06 08:34:02', '2019-07-06 08:34:02', '', 'banner-research-new-idea-award', '', 'inherit', 'open', 'closed', '', 'banner-research-new-idea-award', '', '', '2019-07-06 08:34:02', '2019-07-06 08:34:02', '', 1, 'http://localhost/ideation/wp-content/uploads/2019/07/banner-research-new-idea-award.jpg', 0, 'attachment', 'image/jpeg', 0),
(61, 1, '2019-07-06 14:36:34', '2019-07-06 14:36:34', '<!-- wp:paragraph -->\n<p>Upload your ideas and get listed and get your ideas implemented...</p>\n<!-- /wp:paragraph -->', 'Get Ideas', '', 'inherit', 'closed', 'closed', '', '1-autosave-v1', '', '', '2019-07-06 14:36:34', '2019-07-06 14:36:34', '', 1, 'http://localhost/ideation/1-autosave-v1/', 0, 'revision', '', 0),
(62, 1, '2019-07-06 14:38:56', '2019-07-06 14:38:56', '', 'idea-spark', '', 'inherit', 'open', 'closed', '', 'idea-spark', '', '', '2019-07-06 14:38:56', '2019-07-06 14:38:56', '', 1, 'http://localhost/ideation/wp-content/uploads/2019/07/idea-spark.jpg', 0, 'attachment', 'image/jpeg', 0),
(63, 1, '2019-07-06 14:44:42', '2019-07-06 14:44:42', '[contact-form-7 id=\"48\" title=\"Contact form 1\"]', 'Contact', '', 'inherit', 'closed', 'closed', '', '28-revision-v1', '', '', '2019-07-06 14:44:42', '2019-07-06 14:44:42', '', 28, 'http://localhost/ideation/28-revision-v1/', 0, 'revision', '', 0),
(64, 1, '2019-07-06 14:45:25', '2019-07-06 14:45:25', '[contact-form-7 id=\"48\" title=\"Contact form 1\"]', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '28-revision-v1', '', '', '2019-07-06 14:45:25', '2019-07-06 14:45:25', '', 28, 'http://localhost/ideation/28-revision-v1/', 0, 'revision', '', 0),
(65, 1, '2019-07-06 14:53:58', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-07-06 14:53:58', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?post_type=event&p=65', 0, 'event', '', 0),
(66, 1, '2019-07-06 14:57:39', '2019-07-06 14:57:39', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Our First Event', '', 'publish', 'closed', 'closed', '', 'events', '', '', '2019-07-06 14:59:10', '2019-07-06 14:59:10', '', 0, 'http://localhost/ideation/?post_type=event&#038;p=66', 0, 'event', '', 0),
(68, 1, '2019-07-06 15:07:58', '2019-07-06 15:07:58', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Turpis egestas integer eget aliquet nibh praesent tristique magna. Mattis rhoncus urna neque viverra justo nec ultrices dui. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Elit pellentesque habitant morbi tristique. Eget mauris pharetra et ultrices neque ornare aenean euismod. In cursus turpis massa tincidunt dui ut ornare lectus sit. Amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet. Ornare massa eget egestas purus viverra accumsan in nisl nisi. Condimentum lacinia quis vel eros donec ac. Ut sem viverra aliquet eget sit. Malesuada proin libero nunc consequat interdum varius sit. Nulla facilisi cras fermentum odio eu. Iaculis nunc sed augue lacus viverra vitae congue. Et ligula ullamcorper malesuada proin libero nunc. Semper risus in hendrerit gravida rutrum. Placerat orci nulla pellentesque dignissim enim sit amet venenatis. Venenatis a condimentum vitae sapien pellentesque habitant. Elementum facilisis leo vel fringilla est ullamcorper.\r\n\r\nInterdum varius sit amet mattis vulputate enim. Leo vel orci porta non pulvinar neque laoreet suspendisse. Pharetra vel turpis nunc eget lorem dolor sed. Arcu cursus vitae congue mauris rhoncus aenean vel elit. Accumsan in nisl nisi scelerisque eu ultrices vitae auctor eu. Malesuada proin libero nunc consequat interdum. Nulla facilisi morbi tempus iaculis urna. Pellentesque habitant morbi tristique senectus et netus et malesuada. At varius vel pharetra vel turpis nunc eget. Elementum facilisis leo vel fringilla est ullamcorper eget. Risus sed vulputate odio ut enim blandit volutpat maecenas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Viverra vitae congue eu consequat. Nisi est sit amet facilisis magna. Sed libero enim sed faucibus. Erat velit scelerisque in dictum non consectetur. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus scelerisque. Risus nullam eget felis eget nunc.\r\n\r\nVitae justo eget magna fermentum iaculis eu non diam phasellus. Cursus mattis molestie a iaculis at erat. Duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam. Eros donec ac odio tempor. Vitae nunc sed velit dignissim sodales ut eu. Nulla at volutpat diam ut. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare. At varius vel pharetra vel turpis nunc eget. Nibh tortor id aliquet lectus proin. Id consectetur purus ut faucibus pulvinar elementum integer. Diam maecenas sed enim ut sem viverra aliquet. Viverra mauris in aliquam sem. Sit amet consectetur adipiscing elit. Justo donec enim diam vulputate ut pharetra sit amet. Id neque aliquam vestibulum morbi blandit cursus. Mattis enim ut tellus elementum sagittis vitae et leo. Nec feugiat in fermentum posuere urna nec tincidunt praesent.\r\n\r\nDis parturient montes nascetur ridiculus mus mauris. A diam maecenas sed enim ut sem viverra aliquet eget. Platea dictumst quisque sagittis purus sit amet volutpat. Proin nibh nisl condimentum id venenatis a condimentum vitae. Fringilla urna porttitor rhoncus dolor. Tincidunt dui ut ornare lectus. Sed adipiscing diam donec adipiscing tristique risus nec feugiat. Id donec ultrices tincidunt arcu non sodales neque sodales. Integer eget aliquet nibh praesent tristique magna sit amet. Dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida. Morbi tincidunt augue interdum velit. Ultricies mi eget mauris pharetra et ultrices neque ornare. Viverra adipiscing at in tellus integer. Amet nulla facilisi morbi tempus. Arcu non odio euismod lacinia at quis risus sed. Urna nunc id cursus metus aliquam eleifend mi in nulla. Magna eget est lorem ipsum dolor sit amet consectetur. Tempus imperdiet nulla malesuada pellentesque elit. Neque volutpat ac tincidunt vitae semper quis lectus nulla.\r\n\r\nAliquet lectus proin nibh nisl condimentum. Sit amet aliquam id diam maecenas ultricies mi. Nibh ipsum consequat nisl vel pretium. Sed ullamcorper morbi tincidunt ornare massa eget. Consectetur lorem donec massa sapien faucibus et molestie ac feugiat. Faucibus vitae aliquet nec ullamcorper sit amet risus nullam eget. Elementum facilisis leo vel fringilla est ullamcorper eget. Sed felis eget velit aliquet sagittis. Diam volutpat commodo sed egestas egestas fringilla. Amet massa vitae tortor condimentum lacinia quis vel. Donec adipiscing tristique risus nec feugiat in fermentum posuere. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Elit pellentesque habitant morbi tristique senectus et netus et malesuada. Posuere morbi leo urna molestie at elementum eu. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus. Tempus imperdiet nulla malesuada pellentesque. Et sollicitudin ac orci phasellus egestas. Magna fermentum iaculis eu non diam phasellus. Cras fermentum odio eu feugiat pretium nibh ipsum consequat.', 'People Resources', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2019-07-06 15:07:58', '2019-07-06 15:07:58', '', 18, 'http://localhost/ideation/18-revision-v1/', 0, 'revision', '', 0),
(69, 1, '2019-07-06 15:12:04', '2019-07-06 15:12:04', ' ', '', '', 'publish', 'closed', 'closed', '', '69', '', '', '2019-07-13 08:24:51', '2019-07-13 08:24:51', '', 0, 'http://localhost/ideation/?p=69', 10, 'nav_menu_item', '', 0),
(70, 1, '2019-07-06 15:26:28', '2019-07-06 15:26:28', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Turpis egestas integer eget aliquet nibh praesent tristique magna. Mattis rhoncus urna neque viverra justo nec ultrices dui. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Elit pellentesque habitant morbi tristique. Eget mauris pharetra et ultrices neque ornare aenean euismod. In cursus turpis massa tincidunt dui ut ornare lectus sit. Amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet. Ornare massa eget egestas purus viverra accumsan in nisl nisi. Condimentum lacinia quis vel eros donec ac. Ut sem viverra aliquet eget sit. Malesuada proin libero nunc consequat interdum varius sit. Nulla facilisi cras fermentum odio eu. Iaculis nunc sed augue lacus viverra vitae congue. Et ligula ullamcorper malesuada proin libero nunc. Semper risus in hendrerit gravida rutrum. Placerat orci nulla pellentesque dignissim enim sit amet venenatis. Venenatis a condimentum vitae sapien pellentesque habitant. Elementum facilisis leo vel fringilla est ullamcorper.\r\n\r\nInterdum varius sit amet mattis vulputate enim. Leo vel orci porta non pulvinar neque laoreet suspendisse. Pharetra vel turpis nunc eget lorem dolor sed. Arcu cursus vitae congue mauris rhoncus aenean vel elit. Accumsan in nisl nisi scelerisque eu ultrices vitae auctor eu. Malesuada proin libero nunc consequat interdum. Nulla facilisi morbi tempus iaculis urna. Pellentesque habitant morbi tristique senectus et netus et malesuada. At varius vel pharetra vel turpis nunc eget. Elementum facilisis leo vel fringilla est ullamcorper eget. Risus sed vulputate odio ut enim blandit volutpat maecenas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Viverra vitae congue eu consequat. Nisi est sit amet facilisis magna. Sed libero enim sed faucibus. Erat velit scelerisque in dictum non consectetur. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus scelerisque. Risus nullam eget felis eget nunc.\r\n\r\nVitae justo eget magna fermentum iaculis eu non diam phasellus. Cursus mattis molestie a iaculis at erat. Duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam. Eros donec ac odio tempor. Vitae nunc sed velit dignissim sodales ut eu. Nulla at volutpat diam ut. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare. At varius vel pharetra vel turpis nunc eget. Nibh tortor id aliquet lectus proin. Id consectetur purus ut faucibus pulvinar elementum integer. Diam maecenas sed enim ut sem viverra aliquet. Viverra mauris in aliquam sem. Sit amet consectetur adipiscing elit. Justo donec enim diam vulputate ut pharetra sit amet. Id neque aliquam vestibulum morbi blandit cursus. Mattis enim ut tellus elementum sagittis vitae et leo. Nec feugiat in fermentum posuere urna nec tincidunt praesent.\r\n\r\nDis parturient montes nascetur ridiculus mus mauris. A diam maecenas sed enim ut sem viverra aliquet eget. Platea dictumst quisque sagittis purus sit amet volutpat. Proin nibh nisl condimentum id venenatis a condimentum vitae. Fringilla urna porttitor rhoncus dolor. Tincidunt dui ut ornare lectus. Sed adipiscing diam donec adipiscing tristique risus nec feugiat. Id donec ultrices tincidunt arcu non sodales neque sodales. Integer eget aliquet nibh praesent tristique magna sit amet. Dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida. Morbi tincidunt augue interdum velit. Ultricies mi eget mauris pharetra et ultrices neque ornare. Viverra adipiscing at in tellus integer. Amet nulla facilisi morbi tempus. Arcu non odio euismod lacinia at quis risus sed. Urna nunc id cursus metus aliquam eleifend mi in nulla. Magna eget est lorem ipsum dolor sit amet consectetur. Tempus imperdiet nulla malesuada pellentesque elit. Neque volutpat ac tincidunt vitae semper quis lectus nulla.\r\n\r\nAliquet lectus proin nibh nisl condimentum. Sit amet aliquam id diam maecenas ultricies mi. Nibh ipsum consequat nisl vel pretium. Sed ullamcorper morbi tincidunt ornare massa eget. Consectetur lorem donec massa sapien faucibus et molestie ac feugiat. Faucibus vitae aliquet nec ullamcorper sit amet risus nullam eget. Elementum facilisis leo vel fringilla est ullamcorper eget. Sed felis eget velit aliquet sagittis. Diam volutpat commodo sed egestas egestas fringilla. Amet massa vitae tortor condimentum lacinia quis vel. Donec adipiscing tristique risus nec feugiat in fermentum posuere. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Elit pellentesque habitant morbi tristique senectus et netus et malesuada. Posuere morbi leo urna molestie at elementum eu. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus. Tempus imperdiet nulla malesuada pellentesque. Et sollicitudin ac orci phasellus egestas. Magna fermentum iaculis eu non diam phasellus. Cras fermentum odio eu feugiat pretium nibh ipsum consequat.', 'Our News', '', 'publish', 'closed', 'closed', '', 'our-news', '', '', '2019-07-06 15:26:28', '2019-07-06 15:26:28', '', 0, 'http://localhost/ideation/?post_type=news&#038;p=70', 0, 'news', '', 0),
(71, 1, '2019-07-06 15:32:11', '2019-07-06 15:32:11', '{\n    \"dazzling[custom_footer_text]\": {\n        \"value\": \"Ideation\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-07-06 15:32:11\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '5ad4d699-638b-4b11-9630-6ac82de175df', '', '', '2019-07-06 15:32:11', '2019-07-06 15:32:11', '', 0, 'http://localhost/ideation/5ad4d699-638b-4b11-9630-6ac82de175df/', 0, 'customize_changeset', '', 0);
INSERT INTO `it_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(72, 1, '2019-07-06 15:33:49', '2019-07-06 15:33:49', '<label>Your Name (required)\r\n[text* your-name ]</label>\r\n<label>Your Email (required)\r\n[email* your-email]</label>\r\n[submit \"Subscribe\"]\n1\nIdeation : Newsletter Subscriber\nIdeation <gaurav0736@gmail.com>\ngaurav0736@gmail.com\nFrom: [your-name] <[your-email]>\r\n\r\n-- \r\nThis e-mail was sent from a contact form on Ideation (http://localhost/ideation)\nReply-To: [your-email]\n\n\n\n\nIdeation \"[your-subject]\"\nIdeation <gaurav0736@gmail.com>\n[your-email]\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on Ideation (http://localhost/ideation)\nReply-To: gaurav0736@gmail.com\n\n\n\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.\nThe date format is incorrect.\nThe date is before the earliest one allowed.\nThe date is after the latest one allowed.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe file is too big.\nThere was an error uploading the file.\nThe number format is invalid.\nThe number is smaller than the minimum allowed.\nThe number is larger than the maximum allowed.\nThe answer to the quiz is incorrect.\nYour entered code is incorrect.\nThe e-mail address entered is invalid.\nThe URL is invalid.\nThe telephone number is invalid.', 'Subscribe Us', '', 'publish', 'closed', 'closed', '', 'subscribe-us', '', '', '2019-07-06 15:44:56', '2019-07-06 15:44:56', '', 0, 'http://localhost/ideation/?post_type=wpcf7_contact_form&#038;p=72', 0, 'wpcf7_contact_form', '', 0),
(73, 1, '2019-07-06 16:39:51', '2019-07-06 16:39:51', '<!-- wp:paragraph -->\r\n<p>Upload your ideas and get listed and get your ideas implemented...</p>\r\n<!-- /wp:paragraph -->', 'Get Ideas fsdfsdfsd fsdf sdf sdf dsf sdf sdf sdf sdf dsf dsf ds fsdf dsf sdfsdf sd fsdf sdf dsf sd fsdf sdf sdf ds fsdf', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2019-07-06 16:39:51', '2019-07-06 16:39:51', '', 1, 'http://localhost/ideation/1-revision-v1/', 0, 'revision', '', 0),
(74, 1, '2019-07-06 16:43:34', '2019-07-06 16:43:34', '<!-- wp:paragraph -->\r\n<p>Upload your ideas and get listed and get your ideas implemented...</p>\r\n<!-- /wp:paragraph -->', 'Get Ideas', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2019-07-06 16:43:34', '2019-07-06 16:43:34', '', 1, 'http://localhost/ideation/1-revision-v1/', 0, 'revision', '', 0),
(75, 1, '2019-07-06 17:18:18', '2019-07-06 17:18:18', '', 'Join Us', '', 'publish', 'closed', 'closed', '', 'join-us', '', '', '2019-07-06 17:18:18', '2019-07-06 17:18:18', '', 0, 'http://localhost/ideation/?page_id=75', 0, 'page', '', 0),
(76, 1, '2019-07-06 17:18:18', '2019-07-06 17:18:18', '', 'Join Us', '', 'inherit', 'closed', 'closed', '', '75-revision-v1', '', '', '2019-07-06 17:18:18', '2019-07-06 17:18:18', '', 75, 'http://localhost/ideation/75-revision-v1/', 0, 'revision', '', 0),
(77, 1, '2019-07-07 07:07:48', '2019-07-07 07:07:48', '', 'My Account', '', 'trash', 'closed', 'closed', '', 'my-account__trashed', '', '', '2019-07-07 10:58:50', '2019-07-07 10:58:50', '', 0, 'http://localhost/ideation/?page_id=77', 0, 'page', '', 0),
(78, 1, '2019-07-07 07:07:48', '2019-07-07 07:07:48', '', 'My Account', '', 'inherit', 'closed', 'closed', '', '77-revision-v1', '', '', '2019-07-07 07:07:48', '2019-07-07 07:07:48', '', 77, 'http://localhost/ideation/77-revision-v1/', 0, 'revision', '', 0),
(79, 1, '2019-07-07 07:15:20', '2019-07-07 07:15:20', '[kp_login_form]', 'Login', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2019-07-07 07:15:20', '2019-07-07 07:15:20', '', 26, 'http://localhost/ideation/26-revision-v1/', 0, 'revision', '', 0),
(80, 2, '2019-07-07 11:44:17', '2019-07-07 11:44:17', '', 'X-Men', '', 'inherit', 'open', 'closed', '', 'x-men', '', '', '2019-07-07 11:44:17', '2019-07-07 11:44:17', '', 0, 'http://localhost/ideation/x-men/', 0, 'attachment', 'image/jpeg', 0),
(81, 2, '2019-07-07 15:10:18', '2019-07-07 15:10:18', '', 'Zendaya', '', 'inherit', 'open', 'closed', '', 'zendaya', '', '', '2019-07-07 15:10:18', '2019-07-07 15:10:18', '', 0, 'http://localhost/ideation/wp-content/uploads/2019/07/Zendaya.jpg', 0, 'attachment', 'image/jpeg', 0),
(82, 2, '2019-07-07 15:33:35', '2019-07-07 15:33:35', '', 'X-Men', '', 'inherit', 'open', 'closed', '', 'x-men-2', '', '', '2019-07-07 15:33:35', '2019-07-07 15:33:35', '', 0, 'http://localhost/ideation/wp-content/uploads/2019/07/X-Men.jpg', 0, 'attachment', 'image/jpeg', 0),
(85, 2, '2019-07-07 15:45:42', '2019-07-07 15:45:42', '', 'Spider-man-far-from-home', '', 'inherit', 'open', 'closed', '', 'spider-man-far-from-home', '', '', '2019-07-07 15:45:42', '2019-07-07 15:45:42', '', 0, 'http://localhost/ideation/spider-man-far-from-home/', 0, 'attachment', 'image/jpeg', 0),
(87, 2, '2019-07-07 15:48:38', '2019-07-07 15:48:38', '', 'banner-research-new-idea-award', '', 'inherit', 'open', 'closed', '', 'banner-research-new-idea-award-2', '', '', '2019-07-07 15:48:38', '2019-07-07 15:48:38', '', 0, 'http://localhost/ideation/banner-research-new-idea-award-2/', 0, 'attachment', 'image/jpeg', 0),
(90, 2, '2019-07-07 16:08:42', '2019-07-07 16:08:42', '', 'Spider-man-far-from-home', '', 'inherit', 'open', 'closed', '', 'spider-man-far-from-home-2', '', '', '2019-07-07 16:08:42', '2019-07-07 16:08:42', '', 0, 'http://localhost/ideation/spider-man-far-from-home-2/', 0, 'attachment', 'image/jpeg', 0),
(91, 2, '2019-07-08 15:31:30', '2019-07-08 15:31:30', '', 'banner-research-new-idea-award', '', 'inherit', 'open', 'closed', '', 'banner-research-new-idea-award-3', '', '', '2019-07-08 15:31:30', '2019-07-08 15:31:30', '', 0, 'http://localhost/ideation/banner-research-new-idea-award-3/', 0, 'attachment', 'image/jpeg', 0),
(92, 2, '2019-07-08 15:31:59', '2019-07-08 15:31:59', '', 'banner-research-new-idea-award', '', 'inherit', 'open', 'closed', '', 'banner-research-new-idea-award-4', '', '', '2019-07-08 15:31:59', '2019-07-08 15:31:59', '', 0, 'http://localhost/ideation/banner-research-new-idea-award-4/', 0, 'attachment', 'image/jpeg', 0),
(93, 2, '2019-07-08 15:32:23', '2019-07-08 15:32:23', '', 'banner-research-new-idea-award', '', 'inherit', 'open', 'closed', '', 'banner-research-new-idea-award-5', '', '', '2019-07-08 15:32:23', '2019-07-08 15:32:23', '', 0, 'http://localhost/ideation/banner-research-new-idea-award-5/', 0, 'attachment', 'image/jpeg', 0),
(94, 1, '2019-07-08 15:32:23', '2019-07-08 15:32:23', '<p>sdffdsf sdfdsfasd asdasd</p>', 'fsdfsdf sdf sdfasdasd', '', 'trash', 'open', 'closed', '', 'fsdfsdf-sdf-sdf__trashed', '', '', '2019-07-10 15:23:05', '2019-07-10 15:23:05', '', 0, 'http://localhost/ideation/idea/fsdfsdf-sdf-sdf/', 0, 'idea', '', 0),
(95, 2, '2019-07-08 16:40:33', '2019-07-08 16:40:33', '', '54', '', 'inherit', 'open', 'closed', '', '54', '', '', '2019-07-08 16:40:33', '2019-07-08 16:40:33', '', 0, 'http://localhost/ideation/54/', 0, 'attachment', 'image/jpeg', 0),
(96, 1, '2019-07-08 16:41:10', '2019-07-08 16:41:10', '<p>sdfsdfsdf</p>', 'sdfsdfsdf', '', 'trash', 'open', 'closed', '', 'sdfsdfsdf__trashed', '', '', '2019-07-12 16:36:50', '2019-07-12 16:36:50', '', 0, 'http://localhost/ideation/idea/sdfsdfsdf/', 0, 'idea', '', 0),
(97, 2, '2019-07-08 16:41:22', '2019-07-08 16:41:22', '', 'banner-research-new-idea-award', '', 'inherit', 'open', 'closed', '', 'banner-research-new-idea-award-6', '', '', '2019-07-08 16:41:22', '2019-07-08 16:41:22', '', 0, 'http://localhost/ideation/banner-research-new-idea-award-6/', 0, 'attachment', 'image/jpeg', 0),
(98, 1, '2019-07-10 15:08:25', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-07-10 15:08:25', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?post_type=startup&p=98', 0, 'startup', '', 0),
(99, 2, '2019-07-10 15:22:28', '2019-07-10 15:22:28', '', 'banner-research-new-idea-award', '', 'inherit', 'open', 'closed', '', 'banner-research-new-idea-award-7', '', '', '2019-07-10 15:22:28', '2019-07-10 15:22:28', '', 0, 'http://localhost/ideation/banner-research-new-idea-award-7/', 0, 'attachment', 'image/jpeg', 0),
(100, 2, '2019-07-10 15:22:30', '2019-07-10 15:22:30', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Turpis egestas integer eget aliquet nibh praesent tristique magna. Mattis rhoncus urna neque viverra justo nec ultrices dui. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Elit pellentesque habitant morbi tristique. Eget mauris pharetra et ultrices neque ornare aenean euismod. In cursus turpis massa tincidunt dui ut ornare lectus sit. Amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet. Ornare massa eget egestas purus viverra accumsan in nisl nisi. Condimentum lacinia quis vel eros donec ac. Ut sem viverra aliquet eget sit. Malesuada proin libero nunc consequat interdum varius sit. Nulla facilisi cras fermentum odio eu. Iaculis nunc sed augue lacus viverra vitae congue. Et ligula ullamcorper malesuada proin libero nunc. Semper risus in hendrerit gravida rutrum. Placerat orci nulla pellentesque dignissim enim sit amet venenatis. Venenatis a condimentum vitae sapien pellentesque habitant. Elementum facilisis leo vel fringilla est ullamcorper.</p>', 'Elementum facilisis leo vel fringilla est ullamcorper', '', 'publish', 'open', 'closed', '', 'sadasdasd-das-d', '', '', '2019-07-13 08:07:44', '2019-07-13 08:07:44', '', 0, 'http://localhost/ideation/idea/sadasdasd-das-d/', 0, 'idea', '', 0),
(101, 2, '2019-07-10 15:23:30', '2019-07-10 15:23:30', '', 'banner-research-new-idea-award', '', 'inherit', 'open', 'closed', '', 'banner-research-new-idea-award-8', '', '', '2019-07-10 15:23:30', '2019-07-10 15:23:30', '', 0, 'http://localhost/ideation/banner-research-new-idea-award-8/', 0, 'attachment', 'image/jpeg', 0),
(102, 2, '2019-07-10 15:23:32', '2019-07-10 15:23:32', '<p>Dis parturient montes nascetur ridiculus mus mauris. A diam maecenas sed enim ut sem viverra aliquet eget. Platea dictumst quisque sagittis purus sit amet volutpat. Proin nibh nisl condimentum id venenatis a condimentum vitae. Fringilla urna porttitor rhoncus dolor. Tincidunt dui ut ornare lectus. Sed adipiscing diam donec adipiscing tristique risus nec feugiat. Id donec ultrices tincidunt arcu non sodales neque sodales. Integer eget aliquet nibh praesent tristique magna sit amet. Dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida. Morbi tincidunt augue interdum velit. Ultricies mi eget mauris pharetra et ultrices neque ornare. Viverra adipiscing at in tellus integer. Amet nulla facilisi morbi tempus. Arcu non odio euismod lacinia at quis risus sed. Urna nunc id cursus metus aliquam eleifend mi in nulla. Magna eget est lorem ipsum dolor sit amet consectetur. Tempus imperdiet nulla malesuada pellentesque elit. Neque volutpat ac tincidunt vitae semper quis lectus nulla.</p>', 'Neque volutpat ac tincidunt vitae', '', 'publish', 'closed', 'closed', '', 'asdasdasda', '', '', '2019-07-12 16:32:06', '2019-07-12 16:32:06', '', 0, 'http://localhost/ideation/idea/asdasdasda/', 0, 'startup', '', 0),
(103, 1, '2019-07-10 16:39:18', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-07-10 16:39:18', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?post_type=teammate&p=103', 0, 'teammate', '', 0),
(104, 1, '2019-07-10 16:39:30', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-07-10 16:39:30', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?post_type=teammate&p=104', 0, 'teammate', '', 0),
(105, 1, '2019-07-10 16:48:18', '2019-07-10 16:48:18', 'asdasdasd', 'asdasd', '', 'trash', 'open', 'closed', '', 'asdasd__trashed', '', '', '2019-07-12 16:36:35', '2019-07-12 16:36:35', '', 0, 'http://localhost/ideation/?post_type=idea&#038;p=105', 0, 'idea', '', 0),
(106, 2, '2019-07-10 16:53:54', '2019-07-10 16:53:54', '', 'banner-research-new-idea-award', '', 'inherit', 'open', 'closed', '', 'banner-research-new-idea-award-9', '', '', '2019-07-10 16:53:54', '2019-07-10 16:53:54', '', 0, 'http://localhost/ideation/banner-research-new-idea-award-9/', 0, 'attachment', 'image/jpeg', 0),
(107, 2, '2019-07-10 16:53:55', '2019-07-10 16:53:55', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Turpis egestas integer eget aliquet nibh praesent tristique magna. Mattis rhoncus urna neque viverra justo nec ultrices dui. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Elit pellentesque habitant morbi tristique. Eget mauris pharetra et ultrices neque ornare aenean euismod. In cursus turpis massa tincidunt dui ut ornare lectus sit. Amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet. Ornare massa eget egestas purus viverra accumsan in nisl nisi. Condimentum lacinia quis vel eros donec ac. Ut sem viverra aliquet eget sit. Malesuada proin libero nunc consequat interdum varius sit. Nulla facilisi cras fermentum odio eu. Iaculis nunc sed augue lacus viverra vitae congue. Et ligula ullamcorper malesuada proin libero nunc. Semper risus in hendrerit gravida rutrum. Placerat orci nulla pellentesque dignissim enim sit amet venenatis. Venenatis a condimentum vitae sapien pellentesque habitant. Elementum facilisis leo vel fringilla est ullamcorper.</p>\r\n<p>&nbsp;</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Turpis egestas integer eget aliquet nibh praesent tristique magna. Mattis rhoncus urna neque viverra justo nec ultrices dui. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Elit pellentesque habitant morbi tristique. Eget mauris pharetra et ultrices neque ornare aenean euismod. In cursus turpis massa tincidunt dui ut ornare lectus sit. Amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet. Ornare massa eget egestas purus viverra accumsan in nisl nisi. Condimentum lacinia quis vel eros donec ac. Ut sem viverra aliquet eget sit. Malesuada proin libero nunc consequat interdum varius sit. Nulla facilisi cras fermentum odio eu. Iaculis nunc sed augue lacus viverra vitae congue. Et ligula ullamcorper malesuada proin libero nunc. Semper risus in hendrerit gravida rutrum. Placerat orci nulla pellentesque dignissim enim sit amet venenatis. Venenatis a condimentum vitae sapien pellentesque habitant. Elementum facilisis leo vel fringilla est ullamcorper.</p>', 'Lorem ipsum dolor sit amet', '', 'publish', 'open', 'closed', '', 'asdasdasd-asd-asd', '', '', '2019-07-13 08:07:34', '2019-07-13 08:07:34', '', 0, 'http://localhost/ideation/idea/asdasdasd-asd-asd/', 0, 'idea', '', 0),
(108, 1, '2019-07-10 17:01:45', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-07-10 17:01:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?post_type=teammate&p=108', 0, 'teammate', '', 0),
(109, 1, '2019-07-10 17:12:07', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-07-10 17:12:07', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?post_type=teammate&p=109', 0, 'teammate', '', 0),
(110, 1, '2019-07-10 17:12:25', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-07-10 17:12:25', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?post_type=teammate&p=110', 0, 'teammate', '', 0),
(111, 2, '2019-07-10 17:20:53', '2019-07-10 17:20:53', '<p>Dis parturient montes nascetur ridiculus mus mauris. A diam maecenas sed enim ut sem viverra aliquet eget. Platea dictumst quisque sagittis purus sit amet volutpat. Proin nibh nisl condimentum id venenatis a condimentum vitae. Fringilla urna porttitor rhoncus dolor. Tincidunt dui ut ornare lectus. Sed adipiscing diam donec adipiscing tristique risus nec feugiat. Id donec ultrices tincidunt arcu non sodales neque sodales. Integer eget aliquet nibh praesent tristique magna sit amet. Dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida. Morbi tincidunt augue interdum velit. Ultricies mi eget mauris pharetra et ultrices neque ornare. Viverra adipiscing at in tellus integer. Amet nulla facilisi morbi tempus. Arcu non odio euismod lacinia at quis risus sed. Urna nunc id cursus metus aliquam eleifend mi in nulla. Magna eget est lorem ipsum dolor sit amet consectetur. Tempus imperdiet nulla malesuada pellentesque elit. Neque volutpat ac tincidunt vitae semper quis lectus nulla.</p>', 'Lorem ipsum dolor sit amet', '', 'publish', 'open', 'closed', '', 'asdasd-asd-asd-asdad', '', '', '2019-07-12 16:34:27', '2019-07-12 16:34:27', '', 0, 'http://localhost/ideation/idea/asdasd-asd-asd-asdad/', 0, 'teammate', '', 0),
(112, 1, '2019-07-11 15:14:26', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-07-11 15:14:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?post_type=teamprojectmate&p=112', 0, 'teamprojectmate', '', 0),
(113, 1, '2019-07-11 15:17:07', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-07-11 15:17:07', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?post_type=project&p=113', 0, 'project', '', 0),
(114, 1, '2019-07-11 15:17:45', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-07-11 15:17:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?post_type=project&p=114', 0, 'project', '', 0),
(115, 1, '2019-07-11 15:19:36', '2019-07-11 15:19:36', 'sd asd asd sad', 'adasdasd', '', 'trash', 'closed', 'closed', '', 'adasdasd__trashed', '', '', '2019-07-12 16:36:57', '2019-07-12 16:36:57', '', 0, 'http://localhost/ideation/?post_type=project&#038;p=115', 0, 'project', '', 0),
(116, 2, '2019-07-11 16:02:43', '2019-07-11 16:02:43', '<p>Dis parturient montes nascetur ridiculus mus mauris. A diam maecenas sed enim ut sem viverra aliquet eget. Platea dictumst quisque sagittis purus sit amet volutpat. Proin nibh nisl condimentum id venenatis a condimentum vitae. Fringilla urna porttitor rhoncus dolor. Tincidunt dui ut ornare lectus. Sed adipiscing diam donec adipiscing tristique risus nec feugiat. Id donec ultrices tincidunt arcu non sodales neque sodales. Integer eget aliquet nibh praesent tristique magna sit amet. Dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida. Morbi tincidunt augue interdum velit. Ultricies mi eget mauris pharetra et ultrices neque ornare. Viverra adipiscing at in tellus integer. Amet nulla facilisi morbi tempus. Arcu non odio euismod lacinia at quis risus sed. Urna nunc id cursus metus aliquam eleifend mi in nulla. Magna eget est lorem ipsum dolor sit amet consectetur. Tempus imperdiet nulla malesuada pellentesque elit. Neque volutpat ac tincidunt vitae semper quis lectus nulla.</p>', 'Tempus imperdiet nulla malesuada', '', 'publish', 'closed', 'closed', '', 'asdasd', '', '', '2019-07-12 16:31:23', '2019-07-12 16:31:23', '', 0, 'http://localhost/ideation/projects/asdasd/', 0, 'project', '', 0),
(117, 2, '2019-07-11 16:10:36', '2019-07-11 16:10:36', '<p>Vitae justo eget magna fermentum iaculis eu non diam phasellus. Cursus mattis molestie a iaculis at erat. Duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam. Eros donec ac odio tempor. Vitae nunc sed velit dignissim sodales ut eu. Nulla at volutpat diam ut. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare. At varius vel pharetra vel turpis nunc eget. Nibh tortor id aliquet lectus proin. Id consectetur purus ut faucibus pulvinar elementum integer. Diam maecenas sed enim ut sem viverra aliquet. Viverra mauris in aliquam sem. Sit amet consectetur adipiscing elit. Justo donec enim diam vulputate ut pharetra sit amet. Id neque aliquam vestibulum morbi blandit cursus. Mattis enim ut tellus elementum sagittis vitae et leo. Nec feugiat in fermentum posuere urna nec tincidunt praesent.</p>', 'Eu non diam phasellus. Cursus mattis molestie', '', 'publish', 'closed', 'closed', '', 'sadasdasd-das-d', '', '', '2019-07-13 08:12:09', '2019-07-13 08:12:09', '', 0, 'http://localhost/ideation/projects/sadasdasd-das-d/', 0, 'project', '', 0),
(118, 2, '2019-07-12 15:09:39', '2019-07-12 15:09:39', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Turpis egestas integer eget aliquet nibh praesent tristique magna. Mattis rhoncus urna neque viverra justo nec ultrices dui. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Elit pellentesque habitant morbi tristique. Eget mauris pharetra et ultrices neque ornare aenean euismod. In cursus turpis massa tincidunt dui ut ornare lectus sit. Amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet. Ornare massa eget egestas purus viverra accumsan in nisl nisi. Condimentum lacinia quis vel eros donec ac. Ut sem viverra aliquet eget sit. Malesuada proin libero nunc consequat interdum varius sit. Nulla facilisi cras fermentum odio eu. Iaculis nunc sed augue lacus viverra vitae congue. Et ligula ullamcorper malesuada proin libero nunc. Semper risus in hendrerit gravida rutrum. Placerat orci nulla pellentesque dignissim enim sit amet venenatis. Venenatis a condimentum vitae sapien pellentesque habitant. Elementum facilisis leo vel fringilla est ullamcorper.', 'Lorem ipsum dolor sit amet', '', 'publish', 'open', 'closed', '', 'asd', '', '', '2019-07-13 08:02:10', '2019-07-13 08:02:10', '', 0, 'http://localhost/ideation/idea/asd/', 0, 'idea', '', 0),
(119, 2, '2019-07-12 15:09:58', '2019-07-12 15:09:58', '<p>Interdum varius sit amet mattis vulputate enim. Leo vel orci porta non pulvinar neque laoreet suspendisse. Pharetra vel turpis nunc eget lorem dolor sed. Arcu cursus vitae congue mauris rhoncus aenean vel elit. Accumsan in nisl nisi scelerisque eu ultrices vitae auctor eu. Malesuada proin libero nunc consequat interdum. Nulla facilisi morbi tempus iaculis urna. Pellentesque habitant morbi tristique senectus et netus et malesuada. At varius vel pharetra vel turpis nunc eget. Elementum facilisis leo vel fringilla est ullamcorper eget. Risus sed vulputate odio ut enim blandit volutpat maecenas. Purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Viverra vitae congue eu consequat. Nisi est sit amet facilisis magna. Sed libero enim sed faucibus. Erat velit scelerisque in dictum non consectetur. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus scelerisque. Risus nullam eget felis eget nunc.</p>', 'Interdum varius sit amet mattis vulputate enim', '', 'publish', 'closed', 'closed', '', 'asd', '', '', '2019-07-13 08:13:12', '2019-07-13 08:13:12', '', 0, 'http://localhost/ideation/projects/asd/', 0, 'project', '', 0),
(120, 1, '2019-07-12 16:23:32', '2019-07-12 16:23:32', '', 'Projects', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2019-07-12 16:23:32', '2019-07-12 16:23:32', '', 14, 'http://localhost/ideation/14-revision-v1/', 0, 'revision', '', 0),
(121, 1, '2019-07-12 16:24:03', '2019-07-12 16:24:03', '', 'Ideas', '', 'inherit', 'closed', 'closed', '', '10-revision-v1', '', '', '2019-07-12 16:24:03', '2019-07-12 16:24:03', '', 10, 'http://localhost/ideation/10-revision-v1/', 0, 'revision', '', 0),
(122, 2, '2019-07-12 16:32:35', '2019-07-12 16:32:35', '<div class=\"entry-content\">\r\n<p>Aliquet lectus proin nibh nisl condimentum. Sit amet aliquam id diam maecenas ultricies mi. Nibh ipsum consequat nisl vel pretium. Sed ullamcorper morbi tincidunt ornare massa eget. Consectetur lorem donec massa sapien faucibus et molestie ac feugiat. Faucibus vitae aliquet nec ullamcorper sit amet risus nullam eget. Elementum facilisis leo vel fringilla est ullamcorper eget. Sed felis eget velit aliquet sagittis. Diam volutpat commodo sed egestas egestas fringilla. Amet massa vitae tortor condimentum lacinia quis vel. Donec adipiscing tristique risus nec feugiat in fermentum posuere. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Elit pellentesque habitant morbi tristique senectus et netus et malesuada. Posuere morbi leo urna molestie at elementum eu. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus. Tempus imperdiet nulla malesuada pellentesque. Et sollicitudin ac orci phasellus egestas. Magna fermentum iaculis eu non diam phasellus. Cras fermentum odio eu feugiat pretium nibh ipsum consequat.</p>\r\n</div>\r\n<footer class=\"entry-meta\"></footer>', 'Lorem ipsum dolor sit amet', '', 'publish', 'closed', 'closed', '', 'lorem-ipsum-dolor-sit-amet', '', '', '2019-07-12 16:32:35', '2019-07-12 16:32:35', '', 0, 'http://localhost/ideation/startup/lorem-ipsum-dolor-sit-amet/', 0, 'startup', '', 0),
(123, 2, '2019-07-12 16:33:11', '2019-07-12 16:33:11', '<p>Dis parturient montes nascetur ridiculus mus mauris. A diam maecenas sed enim ut sem viverra aliquet eget. Platea dictumst quisque sagittis purus sit amet volutpat. Proin nibh nisl condimentum id venenatis a condimentum vitae. Fringilla urna porttitor rhoncus dolor. Tincidunt dui ut ornare lectus. Sed adipiscing diam donec adipiscing tristique risus nec feugiat. Id donec ultrices tincidunt arcu non sodales neque sodales. Integer eget aliquet nibh praesent tristique magna sit amet. Dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida. Morbi tincidunt augue interdum velit. Ultricies mi eget mauris pharetra et ultrices neque ornare. Viverra adipiscing at in tellus integer. Amet nulla facilisi morbi tempus. Arcu non odio euismod lacinia at quis risus sed. Urna nunc id cursus metus aliquam eleifend mi in nulla. Magna eget est lorem ipsum dolor sit amet consectetur. Tempus imperdiet nulla malesuada pellentesque elit. Neque volutpat ac tincidunt vitae semper quis lectus nulla.</p>', 'Neque volutpat ac tincidunt vitae', '', 'publish', 'closed', 'closed', '', 'neque-volutpat-ac-tincidunt-vitae', '', '', '2019-07-12 16:33:11', '2019-07-12 16:33:11', '', 0, 'http://localhost/ideation/startup/neque-volutpat-ac-tincidunt-vitae/', 0, 'startup', '', 0),
(124, 1, '2019-07-12 16:54:19', '0000-00-00 00:00:00', '{\n    \"dazzling[w2f_cfa_button]\": {\n        \"value\": \"\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-07-12 16:54:19\"\n    },\n    \"dazzling[cfa_color]\": {\n        \"value\": \"#383838\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-07-12 16:54:19\"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', '331d56c4-6810-4130-8952-a063ce611976', '', '', '2019-07-12 16:54:19', '0000-00-00 00:00:00', '', 0, 'http://localhost/ideation/?p=124', 0, 'customize_changeset', '', 0),
(125, 1, '2019-07-12 16:54:24', '2019-07-12 16:54:24', '', 'cropped-807banner-research-new-idea-award.jpg', '', 'inherit', 'open', 'closed', '', 'cropped-807banner-research-new-idea-award-jpg', '', '', '2019-07-12 16:54:24', '2019-07-12 16:54:24', '', 0, 'http://localhost/ideation/wp-content/uploads/2019/07/cropped-807banner-research-new-idea-award.jpg', 0, 'attachment', 'image/jpeg', 0),
(126, 1, '2019-07-13 08:21:30', '2019-07-13 08:21:30', '', 'Finalised Idea', '', 'publish', 'closed', 'closed', '', 'finalised-idea', '', '', '2019-07-13 08:21:30', '2019-07-13 08:21:30', '', 0, 'http://localhost/ideation/?page_id=126', 0, 'page', '', 0),
(127, 1, '2019-07-13 08:21:30', '2019-07-13 08:21:30', '', 'Finalised Idea', '', 'inherit', 'closed', 'closed', '', '126-revision-v1', '', '', '2019-07-13 08:21:30', '2019-07-13 08:21:30', '', 126, 'http://localhost/ideation/126-revision-v1/', 0, 'revision', '', 0),
(128, 1, '2019-07-13 08:23:06', '2019-07-13 08:23:06', '', 'Completed Projects', '', 'publish', 'closed', 'closed', '', 'completed-projects', '', '', '2019-07-13 08:23:06', '2019-07-13 08:23:06', '', 0, 'http://localhost/ideation/?page_id=128', 0, 'page', '', 0),
(129, 1, '2019-07-13 08:23:06', '2019-07-13 08:23:06', '', 'Completed Projects', '', 'inherit', 'closed', 'closed', '', '128-revision-v1', '', '', '2019-07-13 08:23:06', '2019-07-13 08:23:06', '', 128, 'http://localhost/ideation/128-revision-v1/', 0, 'revision', '', 0),
(130, 1, '2019-07-13 08:23:59', '2019-07-13 08:23:59', ' ', '', '', 'publish', 'closed', 'closed', '', '130', '', '', '2019-07-13 08:24:51', '2019-07-13 08:24:51', '', 0, 'http://localhost/ideation/?p=130', 7, 'nav_menu_item', '', 0),
(131, 1, '2019-07-13 08:23:58', '2019-07-13 08:23:58', ' ', '', '', 'publish', 'closed', 'closed', '', '131', '', '', '2019-07-13 08:24:51', '2019-07-13 08:24:51', '', 0, 'http://localhost/ideation/?p=131', 4, 'nav_menu_item', '', 0),
(132, 1, '2019-07-13 08:26:51', '2019-07-13 08:26:51', '', 'People', '', 'publish', 'closed', 'closed', '', 'people', '', '', '2019-07-13 08:27:39', '2019-07-13 08:27:39', '', 0, 'http://localhost/ideation/?page_id=132', 0, 'page', '', 0),
(133, 1, '2019-07-13 08:26:51', '2019-07-13 08:26:51', '', 'People', '', 'inherit', 'closed', 'closed', '', '132-revision-v1', '', '', '2019-07-13 08:26:51', '2019-07-13 08:26:51', '', 132, 'http://localhost/ideation/132-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `it_termmeta`
--

DROP TABLE IF EXISTS `it_termmeta`;
CREATE TABLE IF NOT EXISTS `it_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `it_terms`
--

DROP TABLE IF EXISTS `it_terms`;
CREATE TABLE IF NOT EXISTS `it_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `it_terms`
--

INSERT INTO `it_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Top Menu', 'top-menu', 0),
(3, 'IDEA', 'idea', 0);

-- --------------------------------------------------------

--
-- Table structure for table `it_term_relationships`
--

DROP TABLE IF EXISTS `it_term_relationships`;
CREATE TABLE IF NOT EXISTS `it_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `it_term_relationships`
--

INSERT INTO `it_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 3, 0),
(12, 1, 0),
(14, 1, 0),
(16, 1, 0),
(18, 1, 0),
(20, 1, 0),
(22, 1, 0),
(24, 1, 0),
(26, 1, 0),
(28, 1, 0),
(31, 1, 0),
(33, 2, 0),
(34, 2, 0),
(35, 2, 0),
(36, 2, 0),
(37, 2, 0),
(39, 2, 0),
(40, 2, 0),
(41, 2, 0),
(42, 2, 0),
(43, 2, 0),
(44, 2, 0),
(69, 2, 0),
(130, 2, 0),
(131, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `it_term_taxonomy`
--

DROP TABLE IF EXISTS `it_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `it_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `it_term_taxonomy`
--

INSERT INTO `it_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'nav_menu', '', 0, 14),
(3, 3, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `it_usermeta`
--

DROP TABLE IF EXISTS `it_usermeta`;
CREATE TABLE IF NOT EXISTS `it_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `it_usermeta`
--

INSERT INTO `it_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'it_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'it_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"7e586dd0d1be2bf4fac58e7766558af21e9c8f65aba3686917bebb86db641470\";a:4:{s:10:\"expiration\";i:1563120440;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36\";s:5:\"login\";i:1562947640;}}'),
(17, 1, 'it_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(19, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:12:\"add-post_tag\";i:1;s:15:\"add-post_format\";}'),
(20, 1, 'nav_menu_recently_edited', '2'),
(21, 1, 'it_user-settings', 'libraryContent=browse&editor=tinymce'),
(22, 1, 'it_user-settings-time', '1562425054'),
(23, 1, 'closedpostboxes_page', 'a:0:{}'),
(24, 1, 'metaboxhidden_page', 'a:5:{i:0;s:10:\"postcustom\";i:1;s:16:\"commentstatusdiv\";i:2;s:11:\"commentsdiv\";i:3;s:7:\"slugdiv\";i:4;s:9:\"authordiv\";}'),
(25, 2, 'nickname', 'gaurav'),
(26, 2, 'first_name', 'Gaurav'),
(27, 2, 'last_name', 'Sharma'),
(28, 2, 'description', '<p><!--more-->Software <strong>developer</strong> ~<code>1</code>11`1dsfsdfsd312312~!@~!@~!@<a href=\"http://localhost/ideation/get-ideas/\">Get Ideas</a></p>'),
(29, 2, 'rich_editing', 'true'),
(30, 2, 'syntax_highlighting', 'true'),
(31, 2, 'comment_shortcuts', 'false'),
(32, 2, 'admin_color', 'fresh'),
(33, 2, 'use_ssl', '0'),
(34, 2, 'show_admin_bar_front', 'true'),
(35, 2, 'locale', ''),
(36, 2, 'it_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(37, 2, 'it_user_level', '0'),
(38, 2, 'city', 'delhi'),
(39, 2, 'phone', '9876543210'),
(47, 2, 'session_tokens', 'a:5:{s:64:\"d91bba958c5ac809eee152b2b04531b049a5bc7c12818639c24fb73c71318647\";a:4:{s:10:\"expiration\";i:1563704231;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36\";s:5:\"login\";i:1562494631;}s:64:\"1d042bcfc42a27024d39f758eb608c5d2aa7006efe6b2d6cf7024091575599a2\";a:4:{s:10:\"expiration\";i:1563704454;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36\";s:5:\"login\";i:1562494854;}s:64:\"7e6ec9b109c1eeff7cc52de9dfc4511bf5aae83cd665e5a331e810bd47917444\";a:4:{s:10:\"expiration\";i:1563704579;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36\";s:5:\"login\";i:1562494979;}s:64:\"04575eac42833f84c4f10f76286a4d35e13a9752bf4dc469b5d529f593762467\";a:4:{s:10:\"expiration\";i:1563706430;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36\";s:5:\"login\";i:1562496830;}s:64:\"76c53319bf474d1521e618b6888c13c5a0a5e379ebe1277bbb232c44f2111925\";a:4:{s:10:\"expiration\";i:1564218927;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36\";s:5:\"login\";i:1563009327;}}'),
(48, 2, 'userProfileImage', '90'),
(49, 1, 'meta-box-order_teammate', 'a:7:{s:8:\"form_top\";s:0:\"\";s:16:\"before_permalink\";s:0:\"\";s:11:\"after_title\";s:0:\"\";s:12:\"after_editor\";s:0:\"\";s:4:\"side\";s:18:\"submitdiv,teammate\";s:6:\"normal\";s:7:\"slugdiv\";s:8:\"advanced\";s:0:\"\";}'),
(50, 1, 'screen_layout_teammate', '2'),
(51, 3, 'nickname', 'garry'),
(52, 3, 'first_name', 'Garry'),
(53, 3, 'last_name', 'Wilson'),
(54, 3, 'description', ''),
(55, 3, 'rich_editing', 'true'),
(56, 3, 'syntax_highlighting', 'true'),
(57, 3, 'comment_shortcuts', 'false'),
(58, 3, 'admin_color', 'fresh'),
(59, 3, 'use_ssl', '0'),
(60, 3, 'show_admin_bar_front', 'true'),
(61, 3, 'locale', ''),
(62, 3, 'it_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(63, 3, 'it_user_level', '0'),
(64, 3, 'city', 'delhi'),
(65, 3, 'phone', '9876543210'),
(81, 4, 'nickname', 'test'),
(82, 4, 'first_name', 'test'),
(83, 4, 'last_name', 'test'),
(84, 4, 'description', ''),
(85, 4, 'rich_editing', 'true'),
(86, 4, 'syntax_highlighting', 'true'),
(87, 4, 'comment_shortcuts', 'false'),
(88, 4, 'admin_color', 'fresh'),
(89, 4, 'use_ssl', '0'),
(90, 4, 'show_admin_bar_front', 'true'),
(91, 4, 'locale', ''),
(92, 4, 'it_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(93, 4, 'it_user_level', '0'),
(98, 4, 'city', 'dekhi'),
(99, 4, 'phone', '1234567890'),
(111, 3, 'member_type', 'trainer'),
(112, 3, 'area_interest', 'am'),
(114, 4, 'member_type', 'mentor'),
(115, 4, 'member_type', 'investor'),
(116, 4, 'area_interest', 'ai'),
(117, 4, 'area_interest', 'iot'),
(118, 2, 'member_type', 'investor'),
(119, 2, 'area_interest', 'cc'),
(120, 2, 'area_interest', 'iot');

-- --------------------------------------------------------

--
-- Table structure for table `it_users`
--

DROP TABLE IF EXISTS `it_users`;
CREATE TABLE IF NOT EXISTS `it_users` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `it_users`
--

INSERT INTO `it_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BRgOb/zkxabDHgvmsByPfoXzgODZtf/', 'admin', 'gaurav0736@gmail.com', '', '2019-07-06 06:04:13', '', 0, 'admin'),
(2, 'gaurav', '$P$BoZRocbV/jCPS6ilLFyEcJKLT1aM6k.', 'gaurav', 'gaurav@gmail.com', '', '2019-07-06 19:52:47', '', 0, 'Gaurav Sharma'),
(3, 'garry', '$P$BSM34CwtTdFG/pyvhLtOojsY17Tqpn/', 'garry', 'garry@gmail.com', '', '2019-07-11 15:38:36', '', 0, 'Garry Wilson'),
(4, 'test', '$P$B5dF4jWxj80zjEs/ZKCdadqU8Gq2DW1', 'test', 'test@gmail.com', '', '2019-07-11 16:31:04', '', 0, 'test test');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
