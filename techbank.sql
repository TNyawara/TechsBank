-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2018 at 10:31 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techbank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountdetails`
--

CREATE TABLE `accountdetails` (
  `idaccountdetails` int(11) NOT NULL,
  `idcustomerdetails` int(11) NOT NULL,
  `Currency` varchar(45) NOT NULL,
  `CurrentAmount` double DEFAULT '0',
  `idaccounttype` int(11) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `accountdetails`
--

INSERT INTO `accountdetails` (`idaccountdetails`, `idcustomerdetails`, `Currency`, `CurrentAmount`, `idaccounttype`, `pass`) VALUES
(1, 5, 'Ksh', 11500, 1, '1234'),
(2, 6, 'Ksh', 0, 2, '1234');

-- --------------------------------------------------------

--
-- Table structure for table `accounttypes`
--

CREATE TABLE `accounttypes` (
  `idaccounttypes` int(11) NOT NULL,
  `accounttype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounttypes`
--

INSERT INTO `accounttypes` (`idaccounttypes`, `accounttype`) VALUES
(1, 'Checking Account'),
(2, 'Savings Account'),
(3, 'Timed Deposit'),
(4, 'Money Market');

-- --------------------------------------------------------

--
-- Table structure for table `customerdetails`
--

CREATE TABLE `customerdetails` (
  `idcustomerDetails` int(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Age` int(11) NOT NULL,
  `PhoneNumber` varchar(255) NOT NULL,
  `IDNumber` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `NumberofAccounts` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customerdetails`
--

INSERT INTO `customerdetails` (`idcustomerDetails`, `FirstName`, `LastName`, `Title`, `DateOfBirth`, `Age`, `PhoneNumber`, `IDNumber`, `Email`, `NumberofAccounts`) VALUES
(5, 'Tony', 'Tumwet', 'Mr', '1997-07-31', 21, '0799243956', '34997978', 'triadsyndicate@gmail.com', 1),
(6, 'Rara', 'Polly', 'Mrs', '1990-10-10', 28, '07663533541', '349988952', 'jeffk@yopmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `login` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`login`, `pass`) VALUES
('techbank', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `logdetails`
--

CREATE TABLE `logdetails` (
  `logid` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logdetails`
--

INSERT INTO `logdetails` (`logid`, `accountid`, `type`, `amount`) VALUES
(1, 1, 'WITHDRAWAL', 0),
(2, 1, 'DEPOSIT', 0),
(3, 1, 'DEPOSIT', 12000),
(4, 1, 'WITHDRAWAL', 500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountdetails`
--
ALTER TABLE `accountdetails`
  ADD PRIMARY KEY (`idaccountdetails`),
  ADD KEY `idcustomerdetails_idx` (`idcustomerdetails`),
  ADD KEY `idaccounttype_idx` (`idaccounttype`);

--
-- Indexes for table `accounttypes`
--
ALTER TABLE `accounttypes`
  ADD PRIMARY KEY (`idaccounttypes`);

--
-- Indexes for table `customerdetails`
--
ALTER TABLE `customerdetails`
  ADD PRIMARY KEY (`idcustomerDetails`);

--
-- Indexes for table `logdetails`
--
ALTER TABLE `logdetails`
  ADD PRIMARY KEY (`logid`),
  ADD KEY `fk` (`accountid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountdetails`
--
ALTER TABLE `accountdetails`
  MODIFY `idaccountdetails` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `accounttypes`
--
ALTER TABLE `accounttypes`
  MODIFY `idaccounttypes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `customerdetails`
--
ALTER TABLE `customerdetails`
  MODIFY `idcustomerDetails` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `logdetails`
--
ALTER TABLE `logdetails`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `logdetails`
--
ALTER TABLE `logdetails`
  ADD CONSTRAINT `fk` FOREIGN KEY (`accountid`) REFERENCES `accountdetails` (`idaccountdetails`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
