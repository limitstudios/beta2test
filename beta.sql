-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 03, 2017 at 10:34 AM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beta`
--

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sess_id` varbinary(128) NOT NULL,
  `sess_data` blob NOT NULL,
  `sess_time` int(10) UNSIGNED NOT NULL,
  `sess_lifetime` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sess_id`, `sess_data`, `sess_time`, `sess_lifetime`) VALUES
(0x3636303839626562656363623636303734313765383038353439613138353734, 0x5f7366325f617474726962757465737c613a323a7b733a32373a225f73656375726974792e61646d696e2e7461726765745f70617468223b733a32363a22687474703a2f2f6465636b626f6f6b736e6578743a383838382f223b733a31383a225f637372662f61757468656e746963617465223b733a34333a226d46796c69617662694857303339446541577a524b3055554664556f2d637244463330507a583749334377223b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313530393730333735353b733a313a2263223b693a313530393730333735353b733a313a226c223b733a313a2230223b7d, 1509703755, 1440),
(0x3664623536393363366437393962393861636135613338353162353238386464, 0x5f7366325f617474726962757465737c613a353a7b733a32373a225f73656375726974792e61646d696e2e7461726765745f70617468223b733a32363a22687474703a2f2f6465636b626f6f6b736e6578743a383838382f223b733a31383a225f637372662f61757468656e746963617465223b733a34333a2232375562556a517151784659716b664a524a584a6b794274686d326d753953307850474a32493375693051223b733a32333a225f73656375726974792e6c6173745f757365726e616d65223b733a32313a2261646d696e406465636b626f6f6b732e636f2e756b223b733a363a22646f6d61696e223b733a31333a226465636b626f6f6b736e657874223b733a31353a225f73656375726974795f61646d696e223b733a3932393a22433a36373a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c47756172645c546f6b656e5c506f737441757468656e7469636174696f6e4775617264546f6b656e223a3834383a7b613a323a7b693a303b733a353a2261646d696e223b693a313b733a3831333a22613a343a7b693a303b433a31353a224170705c456e746974795c55736572223a3232303a7b613a353a7b693a303b733a313a2231223b693a313b733a32313a2261646d696e406465636b626f6f6b732e636f2e756b223b693a323b733a3132383a226134616138373836313432303137323936346531323434643037323134633033363331656361383933303865383039633633373639336365373963323463336330626336666435363562656432333938346531643332313938663932663063373034373064623034363337663132336231623831356465373437366564336235223b693a333b733a393a22326635666230313665223b693a343b623a313b7d7d693a313b623a313b693a323b613a343a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31333a22524f4c455f53455454494e4753223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31313a22524f4c455f4d4153544552223b7d693a323b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31323a22524f4c455f464f554e444552223b7d693a333b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31303a22524f4c455f41444d494e223b7d7d693a333b613a303a7b7d7d223b7d7d223b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313530393730303631313b733a313a2263223b693a313530393639393431363b733a313a226c223b733a313a2230223b7d, 1509700611, 1440),
(0x6139316663613162366235626566646163326466643730613565303234323266, 0x5f7366325f617474726962757465737c613a313a7b733a31383a225f637372662f61757468656e746963617465223b733a34333a22352d52584f536f466e337774482d68356c4e514d487830784f674653566a493845646c597670486e635973223b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313530393730353137373b733a313a2263223b693a313530393730353137353b733a313a226c223b733a313a2230223b7d, 1509705177, 1440),
(0x6531633537653561363262666661653433376165643035613463623330646166, 0x5f7366325f617474726962757465737c613a323a7b733a32373a225f73656375726974792e61646d696e2e7461726765745f70617468223b733a32363a22687474703a2f2f6465636b626f6f6b736e6578743a383838382f223b733a31383a225f637372662f61757468656e746963617465223b733a34333a22544e316961537a5754354a767a65413843414a4a5053706d5059755f6649365f77744a536236544d644177223b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313530393534343433343b733a313a2263223b693a313530393534343431343b733a313a226c223b733a313a2230223b7d, 1509544434, 1440);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `is_founder` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `email`, `password`, `salt`, `is_active`, `roles`, `is_founder`) VALUES
(1, 1, 'admin@test.tld', '9222b6a5358d062d271a48f2b3de758816814a441042c448ca4d95baf918995ab1b0d57b83b12c2cecef8467692624c04bb183e64229378ee01a1ca6c0a3fddb', 'bce14fc80', 1, 'a:1:{i:0;s:13:\"ROLE_SETTINGS\";}', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sess_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
