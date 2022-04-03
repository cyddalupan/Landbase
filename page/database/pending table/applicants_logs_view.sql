-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 15, 2015 at 02:13 AM
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
-- Structure for view `applicants_logs_view`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`stepupma_cyd`@`localhost` SQL SECURITY DEFINER VIEW `applicants_logs_view` AS select `log`.`log_id` AS `log_id`,`log`.`log_applicant` AS `log_applicant`,`log`.`log_employer` AS `log_employer`,`log`.`log_status` AS `log_status`,`log`.`log_country` AS `log_country`,`log`.`log_date` AS `log_date`,`log`.`log_remarks` AS `log_remarks`,`log`.`log_createdby` AS `log_createdby`,`log`.`log_created` AS `log_created`,`c`.`country_id` AS `country_id`,`c`.`country_name` AS `country_name`,`c`.`country_code` AS `country_code`,`c`.`country_abbr` AS `country_abbr`,`e`.`employer_id` AS `employer_id`,`e`.`employer_user` AS `employer_user`,`e`.`employer_source_agency` AS `employer_source_agency`,`e`.`employer_source_agent` AS `employer_source_agent`,`e`.`employer_no` AS `employer_no`,`e`.`employer_name` AS `employer_name`,`e`.`employer_contact_person` AS `employer_contact_person`,`e`.`employer_contact` AS `employer_contact`,`e`.`employer_email` AS `employer_email`,`e`.`employer_address` AS `employer_address`,`e`.`employer_country` AS `employer_country`,`e`.`employer_remarks` AS `employer_remarks`,`u`.`user_id` AS `user_id`,`u`.`user_name` AS `user_name`,`u`.`user_password` AS `user_password`,`u`.`user_fullname` AS `user_fullname`,`u`.`user_email` AS `user_email`,`u`.`user_type` AS `user_type`,`u`.`user_status` AS `user_status`,`u`.`user_updated` AS `user_updated`,`a`.`applicant_id` AS `applicant_id`,`a`.`applicant_first` AS `applicant_first`,`a`.`applicant_middle` AS `applicant_middle`,`a`.`applicant_last` AS `applicant_last`,concat(`a`.`applicant_first`,' ',`a`.`applicant_middle`,' ',`a`.`applicant_last`) AS `applicant_name`,`a`.`applicant_suffix` AS `applicant_suffix`,`a`.`applicant_birthdate` AS `applicant_birthdate`,`a`.`applicant_age` AS `applicant_age`,`a`.`applicant_gender` AS `applicant_gender`,`a`.`applicant_contacts` AS `applicant_contacts`,`a`.`applicant_address` AS `applicant_address`,`a`.`applicant_email` AS `applicant_email`,`a`.`applicant_nationality` AS `applicant_nationality`,`a`.`applicant_civil_status` AS `applicant_civil_status`,`a`.`applicant_religion` AS `applicant_religion`,`a`.`applicant_languages` AS `applicant_languages`,`a`.`applicant_height` AS `applicant_height`,`a`.`applicant_weight` AS `applicant_weight`,`a`.`applicant_position_type` AS `applicant_position_type`,`a`.`applicant_preferred_position` AS `applicant_preferred_position`,`a`.`applicant_expected_salary` AS `applicant_expected_salary`,`a`.`applicant_preferred_country` AS `applicant_preferred_country`,`a`.`applicant_other_skills` AS `applicant_other_skills`,`a`.`applicant_cv` AS `applicant_cv`,`a`.`applicant_photo` AS `applicant_photo`,`a`.`applicant_status` AS `applicant_status`,`a`.`applicant_source` AS `applicant_source`,`a`.`applicant_remarks` AS `applicant_remarks`,`a`.`applicant_date_applied` AS `applicant_date_applied`,`a`.`applicant_employer` AS `applicant_employer`,`a`.`applicant_job` AS `applicant_job`,`a`.`applicant_slug` AS `applicant_slug`,`e`.`employer_slug` AS `employer_slug` from ((((`applicant_log` `log` join `applicant` `a` on((`a`.`applicant_id` = `log`.`log_applicant`))) left join `user` `u` on((`u`.`user_id` = `log`.`log_createdby`))) left join `employer` `e` on((`e`.`employer_id` = `log`.`log_employer`))) left join `country` `c` on((`c`.`country_id` = `log`.`log_country`))) order by `log`.`log_date` desc,`log`.`log_created` desc,`log`.`log_createdby` desc;

--
-- VIEW  `applicants_logs_view`
-- Data: None
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
