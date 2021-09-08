-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2019 at 08:56 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
`id` int(10) NOT NULL,
  `callno` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `quantity` int(10) NOT NULL,
  `issued` int(10) NOT NULL DEFAULT '0',
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `callno`, `name`, `author`, `publisher`, `quantity`, `issued`, `added_date`) VALUES
(1, 'A@4', 'C In Depth', 'Shrivastav', 'BPB', 2, 2, '2016-07-19 14:07:56'),
(2, 'B@1', 'DBMS', 'Korth', 'Pearson', 3, 0, '2016-07-18 13:09:52'),
(3, 'G@12', 'Let''s C', 'Yashwant Kanetkar', 'BPB', 10, 0, '2019-02-13 09:31:12'),
(4, 'h@3', 'HTML', 'aaaaa', 'bbbb', 10, 0, '2019-02-14 05:56:34'),
(5, 'cpp', 'Let us Cpp', 'bala guruswami', 'kalyani', 9, 1, '2019-03-18 07:05:22'),
(6, '.net', 'dot net', 'bbb', 'kk', 10, 0, '2019-03-30 13:02:39');

-- --------------------------------------------------------

--
-- Table structure for table `issuebooks`
--

CREATE TABLE IF NOT EXISTS `issuebooks` (
`id` int(11) NOT NULL,
  `bookcallno` varchar(50) NOT NULL,
  `studentid` int(11) NOT NULL,
  `studentname` varchar(50) NOT NULL,
  `studentcontact` varchar(20) NOT NULL,
  `issueddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuebooks`
--

INSERT INTO `issuebooks` (`id`, `bookcallno`, `studentid`, `studentname`, `studentcontact`, `issueddate`) VALUES
(4, 'A@4', 23, 'kk', '932992932', '2016-07-19 13:13:16'),
(6, 'A@4', 335, 'Sumedh', '95676565756', '2016-07-19 13:14:34'),
(7, 'A@4', 87, 'abhishek', '9329882382', '2016-07-19 13:16:12'),
(8, 'cpp', 35, 'mjh', 'jj', '2019-03-18 07:05:22');

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE IF NOT EXISTS `librarian` (
`id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`id`, `name`, `password`, `email`, `address`, `city`, `contact`) VALUES
(1, 'Prabhakar', 'ppp', 'prabhakar@gmail.com', 'javatpoint', 'noida', '9998328238'),
(4, 'sumedh', 'sumesh', 'sumesh@gmail.com', 'Kuch Bhi', 'noida', '93823932823'),
(6, 'abhi', 'abhi', 'abhi@gmail.com', 'javatpoint add', 'noida', '92393282323'),
(7, 'gagandeep', '123', 'gagan@gmail.com', 'addd', 'sangrur', '12345'),
(8, 'gagan', '123', 'gagan@gmail.com', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `callno` (`callno`), ADD UNIQUE KEY `callno_2` (`callno`);

--
-- Indexes for table `issuebooks`
--
ALTER TABLE `issuebooks`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `issuebooks`
--
ALTER TABLE `issuebooks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `librarian`
--
ALTER TABLE `librarian`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
