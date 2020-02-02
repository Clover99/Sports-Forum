-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2020 at 06:36 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(12) NOT NULL,
  `category` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `category`) VALUES
(1, 'Football'),
(6, 'Basketball'),
(7, 'Volleyball'),
(8, 'Netball');

-- --------------------------------------------------------

--
-- Table structure for table `tblaccount`
--

CREATE TABLE `tblaccount` (
  `accnt_Id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_Id` int(11) DEFAULT NULL,
  `privilege` varchar(255) NOT NULL,
  `voided` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblaccount`
--

INSERT INTO `tblaccount` (`accnt_Id`, `username`, `password`, `user_Id`, `privilege`, `voided`) VALUES
(8, 'mcdo', '8542c29a0773a42de1f302903b9e2d74', 13, 'student', 0),
(9, 'mar', '5fa9db2e335ef69a4eeb9fe7974d61f4', 14, 'admin', 0),
(11, 'Innocent', '1234567', 16, 'student', 0),
(12, 'Florencia', '1234567', 17, 'student', 0),
(16, 'Gracian', '1234567', 21, 'student', 0),
(17, 'Zenengeya', '1234567', 22, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `Id` int(11) NOT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`Id`, `uname`, `pwd`) VALUES
(1, 'admin', 'admin'),
(2, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomment`
--

CREATE TABLE `tblcomment` (
  `comment_id` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `post_Id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `user_Id` int(12) DEFAULT NULL,
  `voided` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomment`
--

INSERT INTO `tblcomment` (`comment_id`, `comment`, `post_Id`, `datetime`, `user_Id`, `voided`) VALUES
(6, 'test comment', 14, '2019-09-11 05:54:31', 16, 0),
(7, 'test comment', 14, '2019-09-11 05:55:17', 17, 0),
(8, 'sakldja', 14, '2019-09-11 06:22:21', 16, 0),
(14, 'sure', 14, '2019-09-22 02:25:33', 21, 0),
(15, 'asasas', 14, '2019-09-22 02:34:57', 16, 0),
(16, 'okay sure', 18, '2019-09-23 07:18:05', 21, 0),
(17, 'Game on', 21, '2019-09-23 07:20:13', 21, 0),
(18, 'sure', 21, '2019-09-23 07:20:45', 21, 0),
(19, 'What time?', 21, '2019-09-23 07:23:19', 21, 0),
(20, '2:00pm', 21, '2019-09-23 07:26:03', 21, 0),
(21, 'okay', 21, '2019-09-23 07:27:56', 21, 0),
(22, 'okay', 21, '2019-09-23 07:29:08', 21, 0),
(23, 'sure', 21, '2019-09-23 07:29:44', 21, 0),
(24, 'SXSXS', 21, '2019-09-23 07:45:08', 16, 0),
(27, 'xxsxs', 21, '2019-09-23 07:48:18', 16, 0),
(28, 'okay dolo', 19, '2019-09-23 11:13:40', 16, 0),
(29, 'Chikondano Zenengeya', 19, '2019-09-24 03:48:33', 22, 0),
(30, '', 19, '2019-11-30 04:41:42', 17, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblpost`
--

CREATE TABLE `tblpost` (
  `post_Id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `cat_id` int(12) DEFAULT NULL,
  `user_Id` int(11) NOT NULL,
  `voided` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpost`
--

INSERT INTO `tblpost` (`post_Id`, `title`, `content`, `datetime`, `cat_id`, `user_Id`, `voided`) VALUES
(14, 'Away game', 'Test 1      ', '2019-09-11 05:53:38', 1, 0, 0),
(15, 'Away game', 'Test 2', '2019-09-11 05:53:56', 6, 0, 0),
(16, 'Away game', '            Test 3            ', '2019-09-11 05:54:08', 7, 0, 0),
(17, 'Away game', 'Test 4              ', '2019-09-11 05:54:21', 8, 0, 0),
(18, 'Away game', 'jghfgcvnvj', '2019-09-22 02:28:09', 6, 0, 0),
(19, 'Home Game', 'DMI vs CU', '2019-09-23 03:38:02', 1, 0, 0),
(21, 'Home Game', 'DMI Vipers VS TNM    ', '2019-09-23 07:19:52', 6, 0, 0),
(22, 'Away game', '  sjakhadiwai', '2019-09-26 04:45:05', 6, 0, 0),
(23, 'Home Game', 'samsndmksjeljlw', '2020-01-03 04:00:12', 1, 0, 0),
(24, 'Away game', 'weiotuiuirnjrtk  ', '2020-01-03 05:18:51', 1, 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblrating`
--

CREATE TABLE `tblrating` (
  `rating_id` int(11) NOT NULL,
  `rating_type` tinyint(4) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `voided` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblrating`
--

INSERT INTO `tblrating` (`rating_id`, `rating_type`, `post_id`, `comment_id`, `user_id`, `voided`) VALUES
(22, 1, 14, 6, 21, 0),
(23, 2, 14, 6, 16, 0),
(24, 1, 21, 24, 16, 0),
(25, 1, 21, 17, 16, 0),
(26, 2, 21, 18, 16, 0),
(27, 2, 21, 20, 16, 0),
(28, 1, 21, 21, 16, 0),
(29, 2, 21, 22, 16, 0),
(30, 2, 19, 28, 16, 0),
(31, 1, 19, 28, 21, 0),
(32, 2, 19, 29, 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblratingtype`
--

CREATE TABLE `tblratingtype` (
  `ratingType_id` int(11) NOT NULL,
  `rating_type` tinyint(4) NOT NULL,
  `description` varchar(255) NOT NULL,
  `voided` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblratingtype`
--

INSERT INTO `tblratingtype` (`ratingType_id`, `rating_type`, `description`, `voided`) VALUES
(1, 1, 'Like', 0),
(2, 2, 'Dislike', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblreply`
--

CREATE TABLE `tblreply` (
  `reply_Id` int(11) NOT NULL,
  `reply` varchar(255) NOT NULL,
  `comment_Id` int(11) NOT NULL,
  `post_Id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `user_Id` int(11) NOT NULL,
  `voided` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblreply`
--

INSERT INTO `tblreply` (`reply_Id`, `reply`, `comment_Id`, `post_Id`, `datetime`, `user_Id`, `voided`) VALUES
(12, 'okay', 6, 14, '2019-09-21 21:19:40', 16, 0),
(13, 'wena', 6, 14, '2019-09-21 21:22:00', 16, 0),
(14, 'utibwa', 6, 14, '2019-09-21 21:32:44', 16, 0),
(15, 'sasasa', 6, 14, '2019-09-22 13:39:34', 16, 0),
(81, 'innocent', 6, 14, '2019-09-22 19:31:27', 16, 0),
(83, 'mwai', 6, 14, '2019-09-22 19:33:02', 16, 0),
(84, 'mwai', 6, 14, '2019-09-22 19:33:02', 16, 0),
(85, 'thoko', 6, 14, '2019-09-22 19:34:10', 16, 0),
(86, 'sly', 6, 14, '2019-09-22 19:34:44', 16, 0),
(87, 'sean', 6, 14, '2019-09-22 19:39:12', 16, 0),
(88, 'hello', 7, 14, '2019-09-22 19:42:56', 16, 0),
(89, 'hello', 6, 14, '2019-09-22 19:43:12', 16, 0),
(90, 'hie', 7, 14, '2019-09-22 19:44:41', 16, 0),
(91, 'her', 7, 14, '2019-09-22 19:45:13', 16, 0),
(92, 'word', 7, 14, '2019-09-22 19:45:27', 16, 0),
(93, 'tabwera', 7, 14, '2019-09-22 19:46:07', 16, 0),
(94, 'iwe', 6, 14, '2019-09-22 19:46:52', 16, 0),
(95, 'galu', 6, 14, '2019-09-22 19:47:04', 16, 0),
(96, 'sassas', 22, 21, '2019-09-23 01:32:09', 21, 0),
(97, 'assdfghj', 22, 21, '2019-09-23 01:33:15', 16, 0),
(98, 'hghghghg', 22, 21, '2019-09-23 01:38:40', 16, 0),
(99, 'ssdsdsd', 22, 21, '2019-09-23 01:40:10', 16, 0),
(100, 'msxmsx', 19, 21, '2019-09-23 01:40:49', 16, 0),
(101, 'XSXSX', 17, 21, '2019-09-23 01:44:15', 16, 0),
(102, 'AASAS', 18, 21, '2019-09-23 01:44:35', 16, 0),
(103, 'AXSAS', 19, 21, '2019-09-23 01:44:48', 16, 0),
(104, 'AZAZA', 17, 21, '2019-09-23 01:44:59', 16, 0),
(105, 'hello her', 27, 21, '2019-09-23 01:48:52', 16, 0),
(106, 'osadanda', 28, 19, '2019-09-23 17:14:05', 16, 0),
(107, 'tiwina', 28, 19, '2019-09-23 17:15:05', 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `user_Id` int(11) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(3) NOT NULL,
  `location` varchar(255) NOT NULL,
  `phone_number` varchar(14) NOT NULL,
  `avatar` varchar(10) NOT NULL,
  `voided` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`user_Id`, `fname`, `lname`, `gender`, `age`, `location`, `phone_number`, `avatar`, `voided`) VALUES
(13, 'mcdo', 'mcdo', 'Male', 0, '', '0', '', 0),
(14, 'mar', 'mar', 'Female', 0, '', '0', '', 0),
(16, 'Emmanuel', 'Mtingwi', 'Male', 20, 'Lilongwe', '0886475127', '', 0),
(17, 'Florencia', 'Mtingwi', 'Female', 0, '', '0', '', 0),
(21, 'Gracian', 'Chiona', 'Male', 0, '', '0', '', 0),
(22, 'Mr', 'Zenengeya', 'Male', 0, '', '0', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tblaccount`
--
ALTER TABLE `tblaccount`
  ADD PRIMARY KEY (`accnt_Id`),
  ADD KEY `user_Id` (`user_Id`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblcomment`
--
ALTER TABLE `tblcomment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `user_Id` (`user_Id`),
  ADD KEY `post_Id` (`post_Id`),
  ADD KEY `user_Id_2` (`user_Id`);

--
-- Indexes for table `tblpost`
--
ALTER TABLE `tblpost`
  ADD PRIMARY KEY (`post_Id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `user_Id` (`user_Id`);

--
-- Indexes for table `tblrating`
--
ALTER TABLE `tblrating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tblratingtype`
--
ALTER TABLE `tblratingtype`
  ADD PRIMARY KEY (`ratingType_id`);

--
-- Indexes for table `tblreply`
--
ALTER TABLE `tblreply`
  ADD PRIMARY KEY (`reply_Id`),
  ADD KEY `comment_Id` (`comment_Id`),
  ADD KEY `post_Id` (`post_Id`),
  ADD KEY `user_Id` (`user_Id`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`user_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblaccount`
--
ALTER TABLE `tblaccount`
  MODIFY `accnt_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcomment`
--
ALTER TABLE `tblcomment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tblpost`
--
ALTER TABLE `tblpost`
  MODIFY `post_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tblrating`
--
ALTER TABLE `tblrating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tblratingtype`
--
ALTER TABLE `tblratingtype`
  MODIFY `ratingType_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblreply`
--
ALTER TABLE `tblreply`
  MODIFY `reply_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `user_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblaccount`
--
ALTER TABLE `tblaccount`
  ADD CONSTRAINT `tblaccount_ibfk_1` FOREIGN KEY (`user_Id`) REFERENCES `tbluser` (`user_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblcomment`
--
ALTER TABLE `tblcomment`
  ADD CONSTRAINT `tblcomment_ibfk_1` FOREIGN KEY (`user_Id`) REFERENCES `tbluser` (`user_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblcomment_ibfk_2` FOREIGN KEY (`post_Id`) REFERENCES `tblpost` (`post_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblpost`
--
ALTER TABLE `tblpost`
  ADD CONSTRAINT `tblpost_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);

--
-- Constraints for table `tblrating`
--
ALTER TABLE `tblrating`
  ADD CONSTRAINT `tblrating_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `tblpost` (`post_Id`),
  ADD CONSTRAINT `tblrating_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `tblcomment` (`comment_id`);

--
-- Constraints for table `tblreply`
--
ALTER TABLE `tblreply`
  ADD CONSTRAINT `tblreply_ibfk_1` FOREIGN KEY (`comment_Id`) REFERENCES `tblcomment` (`comment_Id`),
  ADD CONSTRAINT `tblreply_ibfk_2` FOREIGN KEY (`post_Id`) REFERENCES `tblpost` (`post_Id`),
  ADD CONSTRAINT `tblreply_ibfk_3` FOREIGN KEY (`user_Id`) REFERENCES `tbluser` (`user_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
