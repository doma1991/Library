-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2019 at 02:22 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library v6`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBookAuthor` (IN `bookAuthor` VARCHAR(50))  BEGIN
SELECT * 
FROM author_book_intermediary
WHERE book_id = bookAuthor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBookByTitle` (IN `title` VARCHAR(50))  BEGIN
SELECT * 
FROM book
WHERE title = title;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBookByTitles` (IN `bookTitle` VARCHAR(50))  BEGIN
SELECT * 
FROM book
WHERE title = bookTitle;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMemberBySurnames` (IN `memberSURNAME` VARCHAR(50))  BEGIN
SELECT * 
FROM member
WHERE surname = memberSurname;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMemberByTown` (IN `cityName` VARCHAR(50))  BEGIN
SELECT * 
FROM address
WHERE city_id = cityName;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `first_line` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `second_line` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `postcode_ID` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`first_line`, `second_line`, `city_id`, `postcode_ID`, `ID`) VALUES
('Flat 55, 1 Douglas Path', '', 1, 3, 1),
('125-126 Long Acre', '', 1, 4, 2),
('1 Nine Elms Ln', '', 1, 5, 3),
('198 Mill Rd', '', 3, 6, 4),
('10a Queen St', '', 2, 7, 5),
('29 Walton Park Lane', '', 4, 8, 6),
('246 Priory Road', '', 7, 1, 7),
('246 Priory Road', '', 7, 1, 8),
('246 Priory Road', '', 7, 1, 9),
('20 Kendal Walk', '', 6, 2, 10),
('46 HallifordClose', '', 1, 8, 11),
('10 Cherry Tree Lane', '', 1, 8, 12),
('16 SilverdaleClose', '', 5, 8, 13),
('24 Evelyn Drive', '', 1, 8, 14),
('20 Kendal Walk', '', 6, 2, 15);

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `ID` int(11) NOT NULL,
  `forename` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `surname` varchar(50) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`ID`, `forename`, `surname`) VALUES
(1, 'Honey', 'Bell'),
(2, 'Rosie', 'Bloom'),
(3, 'John', 'Field'),
(4, 'Sarah', 'Smith'),
(5, 'Jane', 'Wild'),
(6, 'Emotional ', 'Rescue'),
(7, 'Julie ', 'Tottman'),
(8, 'Paulo ', 'Coelho'),
(9, 'John ', 'Green'),
(10, 'J.R.R. ', 'Tolkien'),
(11, 'Agatha ', 'Christie'),
(12, 'Stephen ', 'Hawking'),
(13, 'Jheni ', 'Osman'),
(14, 'Stephen ', 'Farthing'),
(15, 'Randall ', 'Munroe'),
(16, 'Timmy', 'Tumble');

-- --------------------------------------------------------

--
-- Table structure for table `author_book_intermediary`
--

CREATE TABLE `author_book_intermediary` (
  `author_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `author_book_intermediary`
--

INSERT INTO `author_book_intermediary` (`author_id`, `book_id`, `id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 1, 16);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ID` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(100) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ID`, `category_id`, `title`) VALUES
(1, 6, 'ABC'),
(2, 3, 'The Love I Lost'),
(3, 7, 'Minibeasts'),
(4, 8, 'Code Breakers'),
(5, 9, 'I See You'),
(6, 3, 'Murder on the Orient Express'),
(7, 10, 'Brief Answers to the Big Questions'),
(8, 11, 'The Worlds Great Wonders'),
(9, 12, 'Art. The Whole Story'),
(10, 10, 'What if?'),
(11, 1, 'The wit and wisdom of the wife'),
(12, 2, 'Super cats'),
(13, 3, 'The Alchemist'),
(14, 4, 'We are liars'),
(15, 5, 'The fall of Gondolin');

-- --------------------------------------------------------

--
-- Table structure for table `book_loan`
--

CREATE TABLE `book_loan` (
  `ID` int(11) NOT NULL,
  `member_id` int(3) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `Date_Loaned` date DEFAULT NULL,
  `Due_Date` date DEFAULT NULL,
  `Date_Returned` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `book_loan`
--

INSERT INTO `book_loan` (`ID`, `member_id`, `book_id`, `Date_Loaned`, `Due_Date`, `Date_Returned`) VALUES
(32, 3, 7, NULL, NULL, NULL),
(33, 4, 7, NULL, NULL, NULL),
(34, 5, 7, NULL, NULL, NULL),
(35, 6, 7, NULL, NULL, NULL),
(36, 7, 7, NULL, NULL, NULL),
(37, 8, 7, NULL, NULL, NULL),
(38, 9, 7, NULL, NULL, NULL),
(39, 10, 7, NULL, NULL, NULL),
(40, 11, 7, NULL, NULL, NULL),
(41, 12, 7, NULL, NULL, NULL),
(42, 13, 7, NULL, NULL, NULL),
(43, 14, 7, NULL, NULL, NULL),
(44, 15, 7, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `name`) VALUES
(1, 'Comedy'),
(2, 'Pets'),
(3, 'Fiction'),
(4, 'Teens'),
(5, 'Fantasy'),
(6, 'Early years'),
(7, 'Nature'),
(8, 'Technology'),
(9, 'Horror'),
(10, 'Science'),
(11, 'Travelling'),
(12, 'Art');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `ID` int(11) NOT NULL,
  `city` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`ID`, `city`) VALUES
(1, 'London'),
(2, 'Bath'),
(3, 'Cambridge'),
(4, 'Cardiff'),
(5, 'Nottingham'),
(6, 'Leeds'),
(7, 'Birmingham');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `ID` int(11) NOT NULL,
  `forename` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `surname` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `gender` enum('m','f') COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`ID`, `forename`, `surname`, `address_id`, `email`, `gender`) VALUES
(3, 'Jenna', 'Smith', 1, 'jenna.smith@gmail.com', 'f'),
(4, 'Erica', 'Johns', 2, 'erica.johns1994@hotmail.com', 'f'),
(5, 'James', 'Kenley', 3, 'james_1975@yahoo.com', 'm'),
(6, 'Edward', 'Leighton', 4, 'edward.leighton@gmail.com', 'm'),
(7, 'Anna', 'Graham', 5, 'annushka35@gmail.com', 'f'),
(8, 'Richard', 'Edwards', 6, 'rich@email.com', 'm'),
(9, 'Dominika', 'Malinowska', 7, 'do_ma1991@hotmail.com', 'f'),
(10, 'Gareth', 'StrakerField', 8, 'gaz_field@hotmail.com', 'm'),
(11, 'Mac', 'Malinowska', 9, 'ragdoll_mac@instagram.com', 'm'),
(12, 'Couch', 'Bear', 10, 'couch_bear@gmail.com', 'm'),
(13, 'Isabel', 'Draper', 11, 'issi@email.com', 'f'),
(14, 'Tess', 'Draper-Edwards', 12, 'tess@email.com', 'f'),
(15, 'Dylan', 'Draper-Edwards', 13, 'dylan@email.com', 'm'),
(16, 'Milo', 'Draper-Edwards', 14, 'milo@email.com', 'm'),
(17, 'Big', 'Penguin', 15, 'big_p@gmail.com', 'm');

-- --------------------------------------------------------

--
-- Table structure for table `popular_selections`
--

CREATE TABLE `popular_selections` (
  `ID` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `number_checked_out` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `popular_selections`
--

INSERT INTO `popular_selections` (`ID`, `book_id`, `number_checked_out`) VALUES
(1, 15, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `postcode`
--

CREATE TABLE `postcode` (
  `ID` int(11) NOT NULL,
  `name` varchar(10) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `postcode`
--

INSERT INTO `postcode` (`ID`, `name`) VALUES
(1, 'B28 0SU'),
(2, 'LS3 1NP'),
(3, 'E14 3GR'),
(4, 'WC2E 9LD'),
(5, 'SW11 8AU'),
(6, 'CB1 3NF'),
(7, 'BA1 1HE'),
(8, 'TW12 3LL');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `ID` int(11) NOT NULL,
  `member_id` int(3) DEFAULT NULL,
  `popular_selections_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`ID`, `member_id`, `popular_selections_id`) VALUES
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `ID` int(11) NOT NULL,
  `purchasePrice` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `number_available` int(11) DEFAULT NULL,
  `number_on_loan` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`ID`, `purchasePrice`, `quantity`, `number_available`, `number_on_loan`, `book_id`) VALUES
(2, 2.5, 20, NULL, NULL, 1),
(3, 5, 20, NULL, NULL, 2),
(4, 4, 10, NULL, NULL, 3),
(5, 1, 1, NULL, NULL, 4),
(6, 2, 15, NULL, NULL, 5),
(7, 5, 10, NULL, NULL, 6),
(8, 4, 8, NULL, NULL, 7),
(9, 2, 7, NULL, NULL, 8),
(10, 10, 25, NULL, NULL, 9),
(11, 8, 30, NULL, NULL, 10),
(12, 15, 50, NULL, NULL, 11),
(13, 21, 17, NULL, NULL, 12),
(14, 16, 20, NULL, NULL, 13),
(15, 13, 20, NULL, NULL, 14),
(16, 10, 25, NULL, NULL, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `postcode_ID` (`postcode_ID`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `author_book_intermediary`
--
ALTER TABLE `author_book_intermediary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `book_loan`
--
ALTER TABLE `book_loan`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `member_id` (`member_id`) USING BTREE;

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `popular_selections`
--
ALTER TABLE `popular_selections`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `postcode`
--
ALTER TABLE `postcode`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `member_id` (`member_id`) USING BTREE,
  ADD KEY `popular_selections_id` (`popular_selections_id`) USING BTREE;

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `book_id` (`book_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `author_book_intermediary`
--
ALTER TABLE `author_book_intermediary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `book_loan`
--
ALTER TABLE `book_loan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `popular_selections`
--
ALTER TABLE `popular_selections`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `postcode`
--
ALTER TABLE `postcode`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`ID`),
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`postcode_ID`) REFERENCES `postcode` (`ID`);

--
-- Constraints for table `author_book_intermediary`
--
ALTER TABLE `author_book_intermediary`
  ADD CONSTRAINT `author_book_intermediary_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`ID`),
  ADD CONSTRAINT `author_book_intermediary_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`ID`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`ID`);

--
-- Constraints for table `book_loan`
--
ALTER TABLE `book_loan`
  ADD CONSTRAINT `book_loan_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`ID`),
  ADD CONSTRAINT `book_loan_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`ID`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`ID`);

--
-- Constraints for table `popular_selections`
--
ALTER TABLE `popular_selections`
  ADD CONSTRAINT `popular_selections_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`ID`);

--
-- Constraints for table `promotions`
--
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`ID`),
  ADD CONSTRAINT `promotions_ibfk_2` FOREIGN KEY (`popular_selections_id`) REFERENCES `popular_selections` (`ID`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
