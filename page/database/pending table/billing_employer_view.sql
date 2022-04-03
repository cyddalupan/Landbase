-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 15, 2015 at 02:59 AM
-- Server version: 5.5.42-37.1-log
-- PHP Version: 5.4.23

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `stepupma_cyd`
--

-- --------------------------------------------------------

--
-- Structure for view `billing_employer_view`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`stepupma_cyd`@`localhost` SQL SECURITY DEFINER VIEW `billing_employer_view` AS select `b`.`bill_id` AS `bill_id`,`b`.`bill_employer` AS `bill_employer`,`b`.`bill_applicant` AS `bill_applicant`,`b`.`bill_amount` AS `bill_amount`,`b`.`bill_employer_cost` AS `bill_employer_cost`,`b`.`bill_applicant_cost` AS `bill_applicant_cost`,`b`.`bill_employer_deposit` AS `bill_employer_deposit`,`b`.`bill_applicant_deposit` AS `bill_applicant_deposit`,`b`.`bill_status` AS `bill_status`,`b`.`bill_remarks` AS `bill_remarks`,`b`.`bill_createdby` AS `bill_createdby`,`b`.`bill_updatedby` AS `bill_updatedby`,`b`.`bill_created` AS `bill_created`,`b`.`bill_updated` AS `bill_updated`,`e`.`employer_id` AS `employer_id`,`e`.`employer_user` AS `employer_user`,`e`.`employer_no` AS `employer_no`,`e`.`employer_name` AS `employer_name`,`e`.`employer_remarks` AS `employer_remarks`,`e`.`employer_contact_person` AS `employer_contact_person`,`e`.`employer_contact` AS `employer_contact`,`e`.`employer_email` AS `employer_email`,`e`.`employer_address` AS `employer_address`,`e`.`employer_country` AS `employer_country`,`e`.`employer_source_agency` AS `employer_source_agency`,`e`.`employer_source_agent` AS `employer_source_agent`,`e`.`employer_agency_commission` AS `employer_agency_commission`,`e`.`employer_agent_commission` AS `employer_agent_commission`,`e`.`employer_agency_commission_from` AS `employer_agency_commission_from`,`e`.`employer_agent_commission_from` AS `employer_agent_commission_from`,`e`.`employer_slug` AS `employer_slug`,`e`.`employer_createdby` AS `employer_createdby`,`e`.`employer_updatedby` AS `employer_updatedby`,`e`.`employer_created` AS `employer_created`,`e`.`employer_updated` AS `employer_updated`,sum(`b`.`bill_employer_cost`) AS `amount`,sum(`b`.`bill_employer_deposit`) AS `debit`,sum((`b`.`bill_employer_cost` - `b`.`bill_employer_deposit`)) AS `credit`,count(`b`.`bill_applicant`) AS `applicants` from (`bill` `b` join `employer` `e` on((`b`.`bill_employer` = `e`.`employer_id`))) group by `b`.`bill_employer`;

--
-- VIEW  `billing_employer_view`
-- Data: None
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
