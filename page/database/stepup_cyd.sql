-- phpMyAdmin SQL Dump
-- version 4.4.1.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Apr 15, 2015 at 11:41 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `stepup_cyd`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `COMPUTE_AGE`(`birthdate` date) RETURNS int(11)
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
	RETURN TIMESTAMPDIFF(YEAR, birthdate, CURRENT_TIMESTAMP());
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `applicant`
--

CREATE TABLE `applicant` (
  `applicant_id` int(10) unsigned NOT NULL,
  `applicant_first` varchar(100) NOT NULL,
  `applicant_middle` varchar(100) DEFAULT NULL,
  `applicant_last` varchar(100) NOT NULL,
  `applicant_suffix` varchar(10) DEFAULT NULL,
  `applicant_birthdate` date DEFAULT NULL,
  `applicant_age` int(10) unsigned DEFAULT NULL COMMENT '//Auto-compute',
  `applicant_gender` varchar(10) DEFAULT NULL,
  `applicant_contacts` varchar(255) DEFAULT NULL,
  `applicant_address` varchar(255) DEFAULT NULL,
  `applicant_email` varchar(100) DEFAULT NULL,
  `applicant_nationality` varchar(100) DEFAULT NULL,
  `applicant_civil_status` varchar(100) DEFAULT NULL,
  `applicant_religion` varchar(100) DEFAULT NULL,
  `applicant_languages` varchar(255) DEFAULT NULL COMMENT 'JSON type',
  `applicant_height` varchar(10) DEFAULT NULL,
  `applicant_weight` varchar(10) DEFAULT NULL,
  `applicant_position_type` varchar(10) DEFAULT NULL COMMENT '''Household'', ''Skilled''',
  `applicant_preferred_position` int(10) unsigned DEFAULT NULL,
  `applicant_expected_salary` float unsigned DEFAULT NULL,
  `applicant_preferred_country` varchar(100) DEFAULT NULL,
  `applicant_other_skills` text,
  `applicant_cv` varchar(255) DEFAULT NULL,
  `applicant_photo` varchar(255) DEFAULT NULL,
  `applicant_status` int(10) unsigned DEFAULT '0' COMMENT '0 = ''Available'', 1 = ''Cancelled'', 2 = ''Reserved'', 3 = ''Pre-Selected'', 4 = ''Selected'', 5 = ''Line Up'', 6 = ''Not Qualified'', 7 = ''Not Qualified'', 8 = ''For Deployment'', 9 = ''Deployed''',
  `applicant_paid` tinyint(4) unsigned DEFAULT NULL COMMENT 'Accounting Status, only admin can change this one',
  `applicant_employer` int(10) unsigned DEFAULT '0' COMMENT '`employer`',
  `applicant_job` int(10) unsigned DEFAULT '0' COMMENT '`job`',
  `applicant_source` int(11) DEFAULT '0',
  `applicant_slug` varchar(255) DEFAULT NULL,
  `applicant_remarks` text,
  `applicant_date_applied` date DEFAULT NULL,
  `applicant_createdby` int(10) unsigned DEFAULT NULL,
  `applicant_updatedby` int(10) unsigned DEFAULT NULL,
  `applicant_created` timestamp NULL DEFAULT NULL,
  `applicant_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicant`
--

INSERT INTO `applicant` (`applicant_id`, `applicant_first`, `applicant_middle`, `applicant_last`, `applicant_suffix`, `applicant_birthdate`, `applicant_age`, `applicant_gender`, `applicant_contacts`, `applicant_address`, `applicant_email`, `applicant_nationality`, `applicant_civil_status`, `applicant_religion`, `applicant_languages`, `applicant_height`, `applicant_weight`, `applicant_position_type`, `applicant_preferred_position`, `applicant_expected_salary`, `applicant_preferred_country`, `applicant_other_skills`, `applicant_cv`, `applicant_photo`, `applicant_status`, `applicant_paid`, `applicant_employer`, `applicant_job`, `applicant_source`, `applicant_slug`, `applicant_remarks`, `applicant_date_applied`, `applicant_createdby`, `applicant_updatedby`, `applicant_created`, `applicant_updated`) VALUES
(7, 'Nestor', 'Soleste', 'Gubaton', NULL, '1981-07-06', 33, 'Male', '', '7 nr. Teresa St. Canacao Homes 2 Brgy. San Juan 2 Noveleta Cavite', 'nestorgubaton@yahoo.com', 'Filipino', 'Married', 'Roman Catholic', 'Tagalog Englisg', '5''6', '120lbs', 'Skilled', 4, 400, '8', '', '', '1427513400-7.jpg', 0, NULL, 0, 0, 0, '0000000007/Nestor+Soleste+Gubaton', '', '2015-03-28', 0, 4, '2015-03-28 17:30:00', '2015-03-28 17:51:58'),
(9, 'REINRY ', 'JAVIER ', 'REDONDO', NULL, '1988-04-27', 26, 'Female', '', 'BLK. 825 LOT 38 LAS PALMAS SUBD.CAYPOMBO, STA. MARIA BULACAN', 'liexfortheliarx@yahoo.com', 'FILIPINO', 'Single', 'ROMAN CATHOLIC', '', '5''3', '', 'Household', 17, 400, '12', '', '', '', 0, NULL, 0, 0, 0, '0000000009/REINRY+JAVIER+REDONDO', '', '2015-03-30', 5, 5, '2015-03-30 23:12:24', '2015-03-30 09:12:24'),
(10, 'Erjhun ', 'Valenzuela', 'Avilla', NULL, '1996-04-24', 18, 'Male', '', '#345San Sebastian St. Brgy Fatima San jose del monte bulacan', '', 'Filipino', 'Single', 'iglesia ni cristo', '', '5"7', '50kg', 'Household', 4, 0, '13', '', '', '', 0, NULL, 0, 0, 0, '0000000010/Erjhun+Valenzuela+Avilla', '', '2015-03-30', 5, 5, '2015-03-30 23:13:14', '2015-03-30 09:13:14'),
(11, 'Alicia', 'Baldiray', 'Madrid', NULL, '1984-02-13', 31, 'Female', '', 'Tarlac Concepcion', '', 'Filipino', 'Married', 'roman catholic', '', '5"1', '45kg', 'Household', 3, 0, '13', '', '', '', 0, NULL, 0, 0, 0, '0000000011/Alicia+Baldiray+Madrid', '', '2015-03-24', 5, 5, '2015-03-31 00:01:50', '2015-03-30 10:01:50'),
(12, 'LEILANI', 'VILLAMOR', 'AMOLO', NULL, '1989-09-18', 25, 'Female', '', '18-6 JP RIZAL ST. TAGBILARAN CITY, BOHOL PHILIPPINES', 'lanivi_091889@yahoo.com', 'FILIPINO', 'Married', '', 'English', '5''4', '70KG', 'Skilled', 5, 25000, '12', '', '', '', 0, NULL, 0, 0, 0, '0000000012/LEILANI+VILLAMOR+AMOLO', '', '2015-03-30', 5, 5, '2015-03-31 00:33:40', '2015-03-30 10:33:40'),
(13, 'Nino', 'Sumaya', 'TuyogOn', NULL, '1982-04-13', 32, 'Male', '', '26 Adelfa street Barangay culiat Quezon City', 'intoynino@gmail.com', 'Filipino', 'Single', 'Roman Catholic', 'English', '5''7', '75 kls.', 'Household', 25, 20, '14', '', '', '', 0, NULL, 0, 0, 0, '0000000013/Nino+Sumaya+TuyogOn', 'I have experience related the position', '2015-04-01', 0, 0, '2015-04-01 17:35:06', '2015-04-01 03:35:06'),
(14, 'Lowelyn', 'Gusi', 'Yngson', NULL, '1990-03-31', 25, 'Male', '09154225433', 'banga talisay batangas', 'lhowieyngson31@gmail.com', 'filipino', 'Single', 'roman catholic', 'English,tagalog', '5', '90 lbs.', 'Household', 26, 17, '11', '', '', '', 0, NULL, 0, 0, 0, '0000000014/Lowelyn+Gusi+Yngson', '', '2015-04-01', 0, 0, '2015-04-01 20:23:46', '2015-04-01 06:23:47'),
(15, 'Reynoso', 'Aguinaldo', 'Yaneza', NULL, '1967-10-23', 47, 'Male', '', 'Brgy.Quisao Pililla Rizal', 'yaneza.ryan@gmail.com', 'Filipino', 'Married', 'Catholic', 'English', '5.7', '93kg.', 'Skilled', 16, 0, '14', '', '', '1427869545-15.jpg', 0, NULL, 0, 0, 0, '0000000015/Reynoso+Aguinaldo+Yaneza', '', '2015-04-01', 0, 0, '2015-04-01 20:25:45', '2015-04-01 06:25:45'),
(16, 'Evelyn ', 'Micena', 'Sugatan', NULL, '1983-09-28', 31, 'Female', '', '131 sto. domingo st. POBLACION 2 CAVITE', '', 'FILIPINO', 'Married', 'CATHOLIC', '', '5"3', '143lbs', 'Skilled', 17, 0, '11', '', '', '1427872613-16.jpg', 0, NULL, 0, 0, 0, '0000000016/Evelyn+Micena+Sugatan', '', '2015-04-01', 6, 6, '2015-04-01 21:16:53', '2015-04-01 07:16:53'),
(17, 'KAROLINE', 'N/a', 'STA.ROMANA', NULL, '1990-06-27', 24, 'Male', '', 'BLOCK 19 LOT 29 MARI GOLD ST. MARYHOMES SUBD, MOLINO 4 BACOOR CAVITE', 'KAROLINESTAROMANA@GMAIL.COM', 'FILIPINO', 'Single', 'CHRISTIAN', 'English,TAGALOG', '5''9', '170', 'Skilled', 26, 18000, '11', 'BASIC SERVING,CUSTOMER SERVICE,POS OPERATION ,COMPUTER LITERACY', '', '', 0, NULL, 0, 0, 0, '0000000017/KAROLINE+N+a+STA+ROMANA', 'I have been in the food industry for almost four years now. I have worked as waitress as three years, have experienced serving at a crowded setting. I have also worked as a barista, giving me knowledge of mixing and making coffee and tea beverages. I got promoted by the same employer as head barista, and then later on as Branch Manager. ', '2015-04-01', 0, 0, '2015-04-01 21:47:18', '2015-04-01 07:47:18'),
(18, 'Fatima', 'L', 'Bautista', NULL, '1990-10-24', 24, 'Female', '', '71 LITTLE BAGUIO ST WAWA 3 ROSARIO CAVITE ', 'fatimabautista@ymail.com', 'FILIPINO', 'Single', 'CATHOLIC', '', '5"3', '52kgs', 'Skilled', 17, 0, '11', '', '', '1427874861-18.jpg', 0, NULL, 0, 0, 0, '0000000018/Fatima+L+Bautista', '', '2015-04-01', 6, 6, '2015-04-01 21:54:21', '2015-04-01 07:54:21'),
(19, 'Mary Jane', 'Baluarte', 'Gani', NULL, '1992-11-20', 22, 'Female', '', 'Multi national village, Paranaque City', 'maryjane_baluartegani@yahoo.com', 'Filipino', 'Single', 'Catholic', 'English', '160', '45', 'Skilled', 17, 25, '11', '', '', '1427875725-19.jpg', 0, NULL, 0, 0, 0, '0000000019/Mary+Jane+Baluarte+Gani', 'I have an experience to work at mall to be a sales associate, salesclerk and to be a cashier. I''m willing to work at other country so that i can expand my skills and also my costumer service.', '2015-04-01', 0, 0, '2015-04-01 22:08:45', '2015-04-01 08:08:45'),
(20, 'CHRISTINE MLAYA', 'R', 'CARIAN', NULL, '1991-09-10', 23, 'Female', '', 'BRGY FATIMA GENERAL SANTOS CITY', 'tincarian@yahoo.com', 'FILIPINO', 'Single', 'CATHOLIC', '', '5"3', '50kg', 'Household', 17, 0, '11', '', '', '1427875998-20.jpg', 0, NULL, 0, 0, 0, '0000000020/CHRISTINE+MLAYA+R+CARIAN', '', '2015-04-01', 6, 6, '2015-04-01 22:13:18', '2015-04-01 08:13:18'),
(21, 'Charisma', 'Soliman ', 'Punzal', NULL, '1985-01-04', 30, 'Female', '', 'ville wawa3 rosario cavite ', 'charismapunzal@yahoo.com', 'filipino', 'Married', 'CATHOLIC', '', '', '', 'Skilled', 17, 0, '11', '', '', '1427877673-21.jpg', 0, NULL, 0, 0, 0, '0000000021/Charisma+Soliman+Punzal', '', '2015-04-01', 6, 6, '2015-04-01 22:41:13', '2015-04-01 08:41:13'),
(22, 'Rubylyn', 'N/A', 'Castillo', NULL, '1982-10-11', 32, 'Male', '', '80 magdalo, potol Kawit Cavite', 'gambito.jelyn@yahoo.com', 'Filipino', 'Single', 'Roman catholic', '', '5''2', '110 lbs', 'Household', 25, 400, '14', '', '', '', 0, NULL, 0, 0, 0, '0000000022/Rubylyn+N+A+Castillo', 'To obtain any kind of position where I can utilize my work experience and to learn more and serve better.  ', '2015-04-03', 0, 0, '2015-04-03 23:40:29', '2015-04-03 09:40:29'),
(23, 'YSRAEL', 'DELA CRUZ', 'AMAN', NULL, '1974-02-22', 41, 'Male', '09194221541,8310160,7344669', '1124 ESPELETA ST POBLACION MUNTINLUPA CITY', 'annievi_aman@yahoo.com', 'filipino', 'Married', 'catholic', 'English,tagalog', '5''8"', '160lbs', 'Skilled', 8, 25, '14', '', '', '', 0, NULL, 0, 0, 0, '0000000023/YSRAEL+DELA+CRUZ+AMAN', '', '2015-04-03', 0, 0, '2015-04-04 04:02:13', '2015-04-03 14:02:13'),
(24, 'ROSALITO', 'IBAñEZ', 'VILLASTIQUE', NULL, '1991-02-12', 24, 'Male', '', '#36 STA. CTALINA ST. BARANGAY HOLY SPIRIT Q.C.', 'Jhenlhi06_20@yahoo.com', 'FILIPINO', 'Single', 'R.C.', 'English', '5''5', '60 KGS.', 'Household', 6, 18, '6', '', '', '', 0, NULL, 0, 0, 0, '0000000024/ROSALITO+IBA+EZ+VILLASTIQUE', 'I WANT TO APPLY AT YOUR COMPANY TO GET ANOTHER EXPERIENCE, PLEASE ACCEPT ME. THANK YOU VERY MUCH', '2015-04-04', 0, 0, '2015-04-04 15:18:21', '2015-04-04 01:18:22'),
(25, 'Krystal', 'Perona', 'Santos', NULL, '1994-04-23', 20, 'Female', '', '439 Matimbo City of Malolos Bulacan', 'krystallinesantos@yahoo.com', 'Filipino', 'Single', 'Roman Catholic', 'English,tagalog', '', '', 'Skilled', 26, 30000, '9', '', '', '', 0, NULL, 0, 0, 0, '0000000025/Krystal+Perona+Santos', '', '2015-04-06', 0, 0, '2015-04-06 19:58:03', '2015-04-06 05:58:03');

--
-- Triggers `applicant`
--
DELIMITER $$
CREATE TRIGGER `applicant_edit` BEFORE UPDATE ON `applicant`
 FOR EACH ROW BEGIN

-- Compute the age from input birthdate
SET NEW.applicant_age = COMPUTE_AGE(NEW.applicant_birthdate);

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `applicant_insert` BEFORE INSERT ON `applicant`
 FOR EACH ROW BEGIN

-- Compute the age from input birthdate
SET NEW.applicant_age = COMPUTE_AGE(NEW.applicant_birthdate);

-- Allocate empty `applicant_created` field
IF NEW.applicant_created IS NULL THEN
SET NEW.applicant_created = CURRENT_TIMESTAMP(), NEW.applicant_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `applicants_logs_view`
--
CREATE TABLE `applicants_logs_view` (
`log_id` bigint(20) unsigned
,`log_applicant` int(10) unsigned
,`log_employer` int(10) unsigned
,`log_status` int(10) unsigned
,`log_country` int(10) unsigned
,`log_date` date
,`log_remarks` text
,`log_createdby` int(10) unsigned
,`log_created` timestamp
,`country_id` int(10) unsigned
,`country_name` varchar(100)
,`country_code` varchar(10)
,`country_abbr` varchar(10)
,`employer_id` int(10) unsigned
,`employer_user` int(11)
,`employer_source_agency` int(11) unsigned
,`employer_source_agent` int(11) unsigned
,`employer_no` varchar(10)
,`employer_name` varchar(100)
,`employer_contact_person` varchar(100)
,`employer_contact` varchar(100)
,`employer_email` varchar(100)
,`employer_address` varchar(255)
,`employer_country` int(11)
,`employer_remarks` text
,`user_id` int(10) unsigned
,`user_name` varchar(100)
,`user_password` varchar(255)
,`user_fullname` varchar(100)
,`user_email` varchar(100)
,`user_type` int(10) unsigned
,`user_status` int(10) unsigned
,`user_updated` timestamp
,`applicant_id` int(10) unsigned
,`applicant_first` varchar(100)
,`applicant_middle` varchar(100)
,`applicant_last` varchar(100)
,`applicant_name` varchar(302)
,`applicant_suffix` varchar(10)
,`applicant_birthdate` date
,`applicant_age` int(10) unsigned
,`applicant_gender` varchar(10)
,`applicant_contacts` varchar(255)
,`applicant_address` varchar(255)
,`applicant_email` varchar(100)
,`applicant_nationality` varchar(100)
,`applicant_civil_status` varchar(100)
,`applicant_religion` varchar(100)
,`applicant_languages` varchar(255)
,`applicant_height` varchar(10)
,`applicant_weight` varchar(10)
,`applicant_position_type` varchar(10)
,`applicant_preferred_position` int(10) unsigned
,`applicant_expected_salary` float unsigned
,`applicant_preferred_country` varchar(100)
,`applicant_other_skills` text
,`applicant_cv` varchar(255)
,`applicant_photo` varchar(255)
,`applicant_status` int(10) unsigned
,`applicant_source` int(11)
,`applicant_remarks` text
,`applicant_date_applied` date
,`applicant_employer` int(10) unsigned
,`applicant_job` int(10) unsigned
,`applicant_slug` varchar(255)
,`employer_slug` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `applicant_certificate`
--

CREATE TABLE `applicant_certificate` (
  `certificate_id` int(10) unsigned NOT NULL,
  `certificate_applicant` int(10) unsigned DEFAULT NULL,
  `certificate_tesda` tinyint(3) unsigned DEFAULT NULL,
  `certificate_info_sheet` tinyint(3) unsigned DEFAULT NULL,
  `certificate_authenticated` tinyint(3) unsigned DEFAULT NULL,
  `certificate_authenticated_nbi` tinyint(3) unsigned DEFAULT NULL,
  `certificate_insurance` varchar(255) DEFAULT NULL,
  `certificate_medical_clinic` varchar(255) DEFAULT NULL,
  `certificate_medical_exam_date` date DEFAULT '0000-00-00',
  `certificate_medical_result` varchar(255) DEFAULT NULL,
  `certificate_medical_remarks` text,
  `certificate_medical_expiration` date DEFAULT '0000-00-00',
  `certificate_pdos` tinyint(3) unsigned DEFAULT NULL,
  `certificate_pt_result` varchar(255) DEFAULT NULL,
  `certificate_pt_result_date` date DEFAULT '0000-00-00',
  `certificate_philhealth` tinyint(3) unsigned DEFAULT NULL,
  `certificate_m1b` tinyint(3) unsigned DEFAULT NULL,
  `certificate_createdby` int(10) unsigned DEFAULT NULL,
  `certificate_updatedby` int(10) unsigned DEFAULT NULL,
  `certificate_created` timestamp NULL DEFAULT NULL,
  `certificate_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicant_certificate`
--

INSERT INTO `applicant_certificate` (`certificate_id`, `certificate_applicant`, `certificate_tesda`, `certificate_info_sheet`, `certificate_authenticated`, `certificate_authenticated_nbi`, `certificate_insurance`, `certificate_medical_clinic`, `certificate_medical_exam_date`, `certificate_medical_result`, `certificate_medical_remarks`, `certificate_medical_expiration`, `certificate_pdos`, `certificate_pt_result`, `certificate_pt_result_date`, `certificate_philhealth`, `certificate_m1b`, `certificate_createdby`, `certificate_updatedby`, `certificate_created`, `certificate_updated`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2015-03-26 16:42:17', '2015-03-26 16:42:17'),
(2, 2, 0, 0, 0, 0, '', '123 Med', '1902-12-04', 'FIT TO WORK', '', '1901-11-13', 0, '', '0000-00-00', 0, 0, 4, 4, '2015-03-26 22:18:03', '2015-03-26 22:47:55'),
(3, 3, 0, 1, 1, 0, '', '123 med ', '1901-08-14', 'UNFIT', 'very tired - re test', '0000-00-00', 0, '', '0000-00-00', 0, 0, 0, 4, '2015-03-27 15:47:51', '2015-03-27 19:32:23'),
(4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-03-27 16:05:44', '2015-03-27 16:05:44'),
(5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-03-27 16:21:48', '2015-03-27 16:21:48'),
(6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-03-27 19:09:22', '2015-03-27 19:09:22'),
(7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-03-28 17:30:00', '2015-03-28 17:30:00'),
(8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-03-28 20:22:44', '2015-03-28 20:22:44'),
(9, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, '2015-03-30 23:12:24', '2015-03-30 23:12:24'),
(10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, '2015-03-30 23:13:14', '2015-03-30 23:13:14'),
(11, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, '2015-03-31 00:01:50', '2015-03-31 00:01:50'),
(12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, '2015-03-31 00:33:40', '2015-03-31 00:33:40'),
(13, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-01 17:35:06', '2015-04-01 17:35:06'),
(14, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-01 20:23:47', '2015-04-01 20:23:47'),
(15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-01 20:25:45', '2015-04-01 20:25:45'),
(16, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 6, '2015-04-01 21:16:53', '2015-04-01 21:16:53'),
(17, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-01 21:47:18', '2015-04-01 21:47:18'),
(18, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 6, '2015-04-01 21:54:21', '2015-04-01 21:54:21'),
(19, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-01 22:08:45', '2015-04-01 22:08:45'),
(20, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 6, '2015-04-01 22:13:18', '2015-04-01 22:13:18'),
(21, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 6, '2015-04-01 22:41:13', '2015-04-01 22:41:13'),
(22, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-03 23:40:29', '2015-04-03 23:40:29'),
(23, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-04 04:02:13', '2015-04-04 04:02:13'),
(24, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-04 15:18:22', '2015-04-04 15:18:22'),
(25, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-06 19:58:03', '2015-04-06 19:58:03');

--
-- Triggers `applicant_certificate`
--
DELIMITER $$
CREATE TRIGGER `applicant_certificate_insert` BEFORE INSERT ON `applicant_certificate`
 FOR EACH ROW BEGIN

-- Allocate empty `certificate_created` field
IF NEW.certificate_created IS NULL THEN
SET NEW.certificate_created = CURRENT_TIMESTAMP(), NEW.certificate_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_education`
--

CREATE TABLE `applicant_education` (
  `education_id` int(10) unsigned NOT NULL,
  `education_applicant` int(10) unsigned DEFAULT NULL,
  `education_mba` varchar(255) DEFAULT NULL,
  `education_mba_course` varchar(255) DEFAULT NULL,
  `education_mba_year` varchar(10) DEFAULT NULL,
  `education_college` varchar(255) DEFAULT NULL,
  `education_college_skills` varchar(255) DEFAULT NULL,
  `education_college_year` varchar(10) DEFAULT NULL,
  `education_others` varchar(255) DEFAULT NULL,
  `education_others_year` varchar(10) DEFAULT NULL,
  `education_highschool` varchar(255) DEFAULT NULL,
  `education_highschool_year` varchar(10) DEFAULT NULL,
  `education_createdby` int(10) unsigned DEFAULT NULL,
  `education_updatedby` int(10) unsigned DEFAULT NULL,
  `education_created` timestamp NULL DEFAULT NULL,
  `education_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicant_education`
--

INSERT INTO `applicant_education` (`education_id`, `education_applicant`, `education_mba`, `education_mba_course`, `education_mba_year`, `education_college`, `education_college_skills`, `education_college_year`, `education_others`, `education_others_year`, `education_highschool`, `education_highschool_year`, `education_createdby`, `education_updatedby`, `education_created`, `education_updated`) VALUES
(1, 1, '', '', '', 'PHILIPPINE CHRISTIAN', 'PHP', '2011', '', '', '', '', 1, 1, '2015-03-26 16:42:17', '2015-03-26 16:42:51'),
(2, 2, '', '', '', 'Whateveer', 'No many', '', '', '', 'High School', '1980', 4, 4, '2015-03-26 22:18:03', '2015-03-26 22:18:03'),
(3, 3, '', '', '', 'BACHELOR OF SCIENCE BUSINESS ADMINISTRATION', 'COMPUTER LITERATE', '2011', '', '', 'SAMAR NATIONAL SCHOOL', '2007', 0, 0, '2015-03-27 15:47:51', '2015-03-27 15:47:51'),
(4, 4, 'n/a', '', '', 'san sebastian college', 'commerce', '1983', 'daguapan secretarial school', '1981', 'cavite national high school', '1980', 0, 0, '2015-03-27 16:05:44', '2015-03-27 16:05:44'),
(5, 5, '', 'Batchelor In technical teacher education', '2012-2014', 'Bicol University Polangui Campus', '', '2012-2014', '', '', 'San jose National High School ', '2009-2012', 0, 0, '2015-03-27 16:21:48', '2015-03-27 16:21:48'),
(6, 6, '', '', '', '', '', '', '', '', '', '', 0, 0, '2015-03-27 19:09:22', '2015-03-27 19:09:22'),
(7, 7, '', '', '', '', '', '', 'Naval Communication Electronics and Information System Center 			Computer Technician and Maintenance Course 	', '2010', 'Cavite National High School', '2004', 0, 4, '2015-03-28 17:30:00', '2015-03-28 17:51:58'),
(8, 8, '', 'CONSERVATORY OF MUSIC', '', 'UNIVERSITY OF STO. TOMAS COLLEGE OF MUSIC', '', '', '', '', 'SISTERS OF MARY SCHOOL GIRLSTOWN', '', 0, 0, '2015-03-28 20:22:44', '2015-03-28 20:22:44'),
(9, 9, '', '', '', 'BS COMPUTER SCIENCE', '', '', 'PROFESSIONAL CAREGIVER', '2011', 'NAGA COLLEGE FOUNDATION', '2004', 5, 5, '2015-03-30 23:12:24', '2015-03-30 23:12:24'),
(10, 10, '', '', '', '', '', '', '', '', '', '', 5, 5, '2015-03-30 23:13:14', '2015-03-30 23:13:14'),
(11, 11, '', '', '', '', '', '', '', '', 'Pasay City South High School', '1998', 5, 5, '2015-03-31 00:01:50', '2015-03-31 00:01:50'),
(12, 12, '', 'NURSING', '2011', 'BACHELOR OF SCIENCE IN N URSING', '', '', '', '', 'DR. SCHOOL PUTONG NATIONAL HIGH SCHOOL', '2009', 5, 5, '2015-03-31 00:33:40', '2015-03-31 00:33:40'),
(13, 13, '', 'HRM', '1999', '', '', '', '', '', 'Almeria national high school', '1999', 0, 0, '2015-04-01 17:35:06', '2015-04-01 17:35:06'),
(14, 14, '', '', '', '', '', '', '', '', 'tanauan school of fisheries', '2012-2016', 0, 0, '2015-04-01 20:23:47', '2015-04-01 20:23:47'),
(15, 15, '', '', '', 'Patts Colleges of Aeronautic', 'Aircraft Maintenance technician', '1987', '', '', 'San Ildefonso College', '1985', 0, 0, '2015-04-01 20:25:45', '2015-04-01 20:25:45'),
(16, 16, '', 'BSEDUCATION', '2004', 'POLYTECHNIC UNIVERSITY OF THE PHILIPINES', '', '2004', '', '', 'MARAGODON NATIONAL HIGH SCHOOL', '2000', 6, 6, '2015-04-01 21:16:53', '2015-04-01 21:16:53'),
(17, 17, '', '', '', 'UNIVERSITY OF THE EAST', 'HOTEL AND RESTAURANT MANAGEMENT ', '2008-2010', 'TESDA TRAINING ', '2012', 'PARANAQUE NATIONAL HIGHSCHOOL ', '2004-2008', 0, 0, '2015-04-01 21:47:18', '2015-04-01 21:47:18'),
(18, 18, '', 'BS BUSINESS MANAGEMENT', '2006-2010', 'CAVITE STATE UNIVERSITY', '', '2006-2010', '', '', 'ROSARIO NATIONAL HIGH SCHOOL', '2002-2006', 6, 6, '2015-04-01 21:54:21', '2015-04-01 21:54:21'),
(19, 19, '', '', '', 'GenSantos Foundation College Inc.', '', '2011', '', '', 'Banisil National High School', '2008-2009', 0, 0, '2015-04-01 22:08:45', '2015-04-01 22:08:45'),
(20, 20, '', 'INFORMATION COMMUNICATION TECHNOLOGY ', '2012-2013', 'CRONASIA FOUNDATION COLLEGE', '', '2012-2013', '', '', 'CALUMPANG GENERAL SANTOS HIGH SCHOOL ', '2003-2004', 6, 6, '2015-04-01 22:13:18', '2015-04-01 22:13:18'),
(21, 21, '', 'BS EDUCATION', '2005', '', '', '', '', '', 'norzagaray high school ', '2001', 6, 6, '2015-04-01 22:41:13', '2015-04-01 22:41:13'),
(22, 22, 'N/A', 'N/A', 'N/A', 'Xavier technical training center corp.', 'celphone technician', '2007', 'NC II HOUSEHOLD SERVICES Holder', '2013', 'Emiliano Tria Memorial National High School', '2006', 0, 0, '2015-04-03 23:40:29', '2015-04-03 23:40:29'),
(23, 23, '', 'ELECTRICAL TECHNOLOGY', '', 'GUZMAN COLLEGE OF SCIENCE AND TECHNOLOGY', 'DRIVING', '2005', '', '', 'MUNTINLUPA NATIONAL HIGH SCHOOL', '1991', 0, 0, '2015-04-04 04:02:13', '2015-04-04 04:02:13'),
(24, 24, 'DATAMEX INSTITUTE OF COMPUTER TECHNOLOGY', 'COMPUTER TECHNICIAN', '2007-2009', '', 'COMPUTER LITERARTE', '', '', '', 'LAGRO HIGH SCHOOL', '2003-2007', 0, 0, '2015-04-04 15:18:22', '2015-04-04 15:18:22'),
(25, 25, '', '', '', 'Bulacan State University', 'Hotel and Restaurant Management', '2014', '', '', 'Mary the Queen School of Malolos', '2010', 0, 0, '2015-04-06 19:58:03', '2015-04-06 19:58:03');

--
-- Triggers `applicant_education`
--
DELIMITER $$
CREATE TRIGGER `applicant_education_insert` BEFORE INSERT ON `applicant_education`
 FOR EACH ROW BEGIN

-- Allocate empty `education_created` field
IF NEW.education_created IS NULL THEN
SET NEW.education_created = CURRENT_TIMESTAMP(), NEW.education_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_experiences`
--

CREATE TABLE `applicant_experiences` (
  `experience_id` bigint(20) unsigned NOT NULL,
  `experience_applicant` int(10) unsigned NOT NULL,
  `experience_company` varchar(255) DEFAULT NULL,
  `experience_position` varchar(255) DEFAULT NULL,
  `experience_salary` float DEFAULT NULL,
  `experience_country` varchar(100) DEFAULT NULL,
  `experience_from` varchar(100) DEFAULT NULL,
  `experience_to` varchar(100) DEFAULT NULL,
  `experience_years` varchar(10) DEFAULT NULL,
  `experience_createdby` int(10) unsigned DEFAULT NULL,
  `experience_updatedby` int(10) unsigned DEFAULT NULL,
  `experience_created` timestamp NULL DEFAULT NULL,
  `experience_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicant_experiences`
--

INSERT INTO `applicant_experiences` (`experience_id`, `experience_applicant`, `experience_company`, `experience_position`, `experience_salary`, `experience_country`, `experience_from`, `experience_to`, `experience_years`, `experience_createdby`, `experience_updatedby`, `experience_created`, `experience_updated`) VALUES
(1, 1, 'STERLING ', 'WEB DEVELOPER', 20000, 'PHILIPPINES', '2010', '2011', '1', 1, 1, '2015-03-26 16:42:51', '2015-03-26 16:42:51'),
(2, 1, 'IWEBFRAMEWORK', 'WEB DEVELOPER', 0, 'PHILIPPINES', '2010', '2011', '0', 1, 1, '2015-03-26 16:42:51', '2015-03-26 16:42:51'),
(3, 3, 'CENTURY HIGH HR INC ', 'SECRETARY', 13000, 'PHILIPPINES', '2013', '2014', NULL, 0, NULL, '2015-03-27 15:47:51', NULL),
(4, 7, 'House Technology Industries Pte., (HTI)', 'Production Operator', 10, 'Philippines ', 'March 2005', 'August 2005', '0', 4, 4, '2015-03-28 17:51:58', '2015-03-28 17:51:58'),
(5, 7, 'International Precision Assembly Inc., (IPAI)', 'Production Operator', 10, 'Philippines', 'November 2005 		', 'April 2006', '0', 4, 4, '2015-03-28 17:51:58', '2015-03-28 17:51:58'),
(6, 9, 'VOGUE CONCEPT INC/ INTSLE BRAND', 'CASHIER/SALE ASSOCIATE', 14000, 'PHILIPPINES', '2014', '2015', '1', 5, NULL, '2015-03-30 23:12:24', NULL),
(7, 11, 'exellence manpower', 'cleaner', 12000, '', '', '', '', 5, NULL, '2015-03-31 00:01:50', NULL),
(8, 12, 'GOVERNOR CELESTINO GALLARES MEMORIAL HOSPITAL', 'NURSE', 0, 'PHILIPPINES', '2014', '2015', '1', 5, NULL, '2015-03-31 00:33:40', NULL),
(9, 15, 'Sta-Clara International Corp.', 'Heavy Driver', 0, 'Philippines', '2014', '2015', '1', 0, NULL, '2015-04-01 20:25:45', NULL),
(10, 15, 'Samsung Engineering & Construction', 'Heavy Driver', 0, 'KSA', '2013', '2014', '1', 0, NULL, '2015-04-01 20:25:45', NULL),
(11, 15, 'Bechtel Company', 'Transportation Supervisor', 0, 'KSA', '2011', '2012', '1', 0, NULL, '2015-04-01 20:25:45', NULL),
(12, 15, 'Daewoo Engineering', 'Heavy Driver', 0, 'Qatar', '2009', '2010', '1', 0, NULL, '2015-04-01 20:25:45', NULL),
(13, 15, 'Shell Philippines', 'Heavy Driver', 0, 'Philippines', '2008', '2009', '1', 0, NULL, '2015-04-01 20:25:45', NULL),
(14, 15, 'Prince Bandar ibn Sultan Abdulaziz', 'Driver', 0, 'KSA', '2002', '2007', '5', 0, NULL, '2015-04-01 20:25:45', NULL),
(15, 15, 'Almojil Group of Company', 'Heavy Driver', 0, 'KSA', '1999', '2001', '2', 0, NULL, '2015-04-01 20:25:45', NULL),
(16, 16, 'SM', 'CASHIER', 13, 'philippines', '', '', '', 6, NULL, '2015-04-01 21:16:53', NULL),
(17, 18, 'MANILA SOUTHERN ASSOCIATES', 'CUSTOMER SERVICE ASSISTANT', 13, 'philippines', '', '', '', 6, NULL, '2015-04-01 21:54:21', NULL),
(18, 19, 'SM Watson Gensan', 'Cashier', 290, 'Philippines', '2013', '2014', '1', 0, NULL, '2015-04-01 22:08:45', NULL),
(19, 20, 'RUSTY LOPEZ KCC botique', 'sales associate', 13, 'philippines', '', '', '', 6, NULL, '2015-04-01 22:13:18', NULL),
(20, 20, 'PENSHOPPE ', 'sales associate', 13, 'philippines', '', '', '', 6, NULL, '2015-04-01 22:13:18', NULL),
(21, 21, 'HOUSE TECHNOLOGY INCORPORATION', 'PRODUCTION OPERATOR', 13, 'P', '', '', '', 6, NULL, '2015-04-01 22:41:13', NULL),
(22, 21, 'NT phillipines', 'PRODUCTION OPERATOR', 13, '', '', '', '', 6, NULL, '2015-04-01 22:41:13', NULL),
(23, 21, 'MANILA SOUTHERN ASSOCIATES', 'CASHIER', 13, 'philippines', '', '', '', 6, NULL, '2015-04-01 22:41:13', NULL),
(24, 21, 'FUJIMOTO INTERNATIONAL TECHNOLOGY CORPORATION', 'PRODUCTION OPERATOR', 13, 'philippines', '', '', '', 6, NULL, '2015-04-01 22:41:13', NULL),
(25, 23, 'CITY GOVERNTMENT OF MUNTINLUPA', 'BUSINESS PERMIT LICENCING OFFICE INSPECTOR', 17, 'PHILIPPINES', '2010', '2013', '3', 0, NULL, '2015-04-04 04:02:13', NULL),
(26, 23, 'CITY GOVERNTMENT OF MUNTINLUPA', 'TRAFFIC ENFORCER', 14, 'PHILIPPINES', '2008', '2009', '1', 0, NULL, '2015-04-04 04:02:13', NULL),
(27, 23, 'CITY GOVERNTMENT OF MUNTINLUPA', 'POST OFFICE ADMIN AIDE', 10, 'PHILIPPINES', '2007', '2008', '1', 0, NULL, '2015-04-04 04:02:13', NULL),
(28, 23, 'COOKSON ELECTRONICS COMPANY', 'MAINTENANCE', 12, 'PHILIPPINES', '2005', '2007', '2', 0, NULL, '2015-04-04 04:02:13', NULL),
(29, 23, 'CITY COUNSELORS OFFICE CITY GOVT OF MUNTINLUPA', 'DRIVER', 12, 'PHILIPPINES', '1998', '2003', '5', 0, NULL, '2015-04-04 04:02:13', NULL),
(30, 24, 'JAPAN HOME CENTRE', 'WAREHOUSEMAN (PACKER)', 11, 'QUEZON CITY', 'DEC. ''2014', 'MAY ''2015', '0', 0, NULL, '2015-04-04 15:18:22', NULL),
(31, 24, 'FORZA KEMIKA AG. INC.', 'MESSENGER', 10, 'MANDALUYONG CITY', 'FEB.  ''2013', 'JUNE. ''2014', '0', 0, NULL, '2015-04-04 15:18:22', NULL),
(32, 24, 'Universal Robina Corp.', 'Merchandizer', 10, 'MANDALUYONG CITY', 'SEPT. 2011', 'FEB. ''2012', '0', 0, NULL, '2015-04-04 15:18:22', NULL),
(33, 25, 'Radisson Blu', 'Kitchen Administrator', 0, 'Philippines', '2014', '2015', '1', 0, NULL, '2015-04-06 19:58:03', NULL);

--
-- Triggers `applicant_experiences`
--
DELIMITER $$
CREATE TRIGGER `applicant_experience_insert` BEFORE INSERT ON `applicant_experiences`
 FOR EACH ROW BEGIN

IF NEW.experience_created IS NULL THEN
SET NEW.experience_created = CURRENT_TIMESTAMP(), NEW.experience_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_files`
--

CREATE TABLE `applicant_files` (
  `file_id` int(10) unsigned NOT NULL,
  `file_applicant` int(10) unsigned DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `file_size` varchar(100) DEFAULT NULL,
  `file_mime` varchar(10) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_status` int(11) DEFAULT '0' COMMENT '1=Active, 0=Archived',
  `file_createdby` int(10) unsigned DEFAULT NULL,
  `file_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicant_files`
--

INSERT INTO `applicant_files` (`file_id`, `file_applicant`, `file_name`, `file_type`, `file_size`, `file_mime`, `file_path`, `file_status`, `file_createdby`, `file_created`) VALUES
(1, 1, 'C:\\fakepath\\whole1.jpeg', 'Whole Body Picture', '164805', 'image/jpeg', 'files/applicant/uploaded/0000001/1427337806-whole1.jpeg', 1, 1, '2015-03-26 16:43:26'),
(2, 20, 'C:\\fakepath\\Desert.jpg', 'Whole Body Picture', '845941', 'image/jpeg', 'files/applicant/uploaded/0000020/1427876504-Desert.jpg', 0, 4, '2015-04-01 22:21:44');

--
-- Triggers `applicant_files`
--
DELIMITER $$
CREATE TRIGGER `applicant_files_insert` BEFORE INSERT ON `applicant_files`
 FOR EACH ROW BEGIN

-- Allocate empty `file_created` field
IF NEW.file_created IS NULL THEN
SET NEW.file_created = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_log`
--

CREATE TABLE `applicant_log` (
  `log_id` bigint(20) unsigned NOT NULL,
  `log_applicant` int(10) unsigned NOT NULL,
  `log_employer` int(10) unsigned DEFAULT NULL,
  `log_status` int(10) unsigned NOT NULL,
  `log_country` int(10) unsigned NOT NULL COMMENT '`country`.`country_id`',
  `log_date` date DEFAULT NULL,
  `log_remarks` text,
  `log_createdby` int(10) unsigned NOT NULL,
  `log_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicant_log`
--

INSERT INTO `applicant_log` (`log_id`, `log_applicant`, `log_employer`, `log_status`, `log_country`, `log_date`, `log_remarks`, `log_createdby`, `log_created`) VALUES
(1, 1, 0, 0, 3, '2015-03-26', 'Applicant has been registered.', 1, '2015-03-26 16:42:17'),
(2, 2, 0, 0, 10, '2015-03-26', 'Applicant has been registered.', 4, '2015-03-26 22:18:03'),
(3, 2, 1, 2, 10, '2015-03-26', '', 4, '2015-03-26 22:42:45'),
(4, 1, 1, 4, 3, '2015-03-26', '', 4, '2015-03-26 22:43:58'),
(5, 3, 1, 0, 6, '2015-03-27', '', 4, '2015-03-27 19:29:21'),
(6, 3, 1, 2, 6, '2015-03-27', '', 4, '2015-03-27 19:30:42'),
(7, 3, 1, 5, 6, '2015-03-27', '', 4, '2015-03-27 19:51:15'),
(8, 6, 1, 0, 6, '2015-03-27', '', 4, '2015-03-27 23:46:41'),
(9, 9, 0, 0, 12, '2015-03-30', 'Applicant has been registered.', 5, '2015-03-30 23:12:24'),
(10, 10, 0, 0, 13, '2015-03-30', 'Applicant has been registered.', 5, '2015-03-30 23:13:14'),
(11, 11, 0, 0, 13, '2015-03-30', 'Applicant has been registered.', 5, '2015-03-31 00:01:50'),
(12, 12, 0, 0, 12, '2015-03-30', 'Applicant has been registered.', 5, '2015-03-31 00:33:41'),
(13, 16, 0, 0, 11, '2015-04-01', 'Applicant has been registered.', 6, '2015-04-01 21:16:53'),
(14, 18, 0, 0, 11, '2015-04-01', 'Applicant has been registered.', 6, '2015-04-01 21:54:21'),
(15, 20, 0, 0, 11, '2015-04-01', 'Applicant has been registered.', 6, '2015-04-01 22:13:18'),
(16, 21, 0, 0, 11, '2015-04-01', 'Applicant has been registered.', 6, '2015-04-01 22:41:13');

--
-- Triggers `applicant_log`
--
DELIMITER $$
CREATE TRIGGER `applicant_log_insert` BEFORE INSERT ON `applicant_log`
 FOR EACH ROW BEGIN

-- Allocate empty `log_created` field
IF NEW.log_created IS NULL THEN
SET NEW.log_created = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_passport`
--

CREATE TABLE `applicant_passport` (
  `passport_id` int(10) unsigned NOT NULL,
  `passport_applicant` int(10) unsigned DEFAULT NULL,
  `passport_number` varchar(100) DEFAULT NULL,
  `passport_issue` date DEFAULT NULL,
  `passport_issue_place` varchar(255) DEFAULT NULL,
  `passport_expiration` date DEFAULT NULL,
  `passport_visible` tinyint(4) DEFAULT '0',
  `passport_createdby` int(10) unsigned DEFAULT NULL,
  `passport_updatedby` int(10) unsigned DEFAULT NULL,
  `passport_created` timestamp NULL DEFAULT NULL,
  `passport_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicant_passport`
--

INSERT INTO `applicant_passport` (`passport_id`, `passport_applicant`, `passport_number`, `passport_issue`, `passport_issue_place`, `passport_expiration`, `passport_visible`, `passport_createdby`, `passport_updatedby`, `passport_created`, `passport_updated`) VALUES
(1, 1, '989887978', '2015-03-26', 'MANILA PHILIPPINES', '2019-03-26', 0, 1, 1, '2015-03-26 16:42:17', '2015-03-26 16:42:51'),
(2, 2, '12345656', '1970-01-01', NULL, '2016-12-22', 0, 4, 4, '2015-03-26 22:18:03', '2015-03-26 22:18:03'),
(3, 3, '', '1970-01-01', NULL, '2015-03-27', 0, 0, 0, '2015-03-27 15:47:51', '2015-03-27 15:47:51'),
(4, 4, '', '1970-01-01', NULL, '2015-03-27', 0, 0, 0, '2015-03-27 16:05:44', '2015-03-30 08:34:09'),
(5, 5, '', '1970-01-01', NULL, '2015-03-27', 0, 0, 0, '2015-03-27 16:21:48', '2015-03-27 16:21:48'),
(6, 6, '', '1970-01-01', NULL, '2015-03-27', 0, 0, 0, '2015-03-27 19:09:22', '2015-03-27 19:09:22'),
(7, 7, 'EC3423782', '2015-02-10', 'DFA Manila', '2020-02-09', 0, 0, 4, '2015-03-28 17:30:00', '2015-03-28 17:51:58'),
(8, 8, 'EB123456', '2010-09-11', 'DFA MANILA', '2015-09-11', 0, 0, 0, '2015-03-28 20:22:44', '2015-03-28 20:22:44'),
(9, 9, '', '2015-03-30', 'DFA MANILA', '2019-09-07', 0, 5, 5, '2015-03-30 23:12:24', '2015-03-30 23:12:24'),
(10, 10, 'EC1698740', '2015-03-30', '', '2015-03-30', 0, 5, 5, '2015-03-30 23:13:14', '2015-03-30 23:13:14'),
(11, 11, '', '2015-03-30', '', '2015-03-30', 0, 5, 5, '2015-03-31 00:01:50', '2015-03-31 00:01:50'),
(12, 12, 'EB2928566', '2011-07-06', 'DFA CEBU', '2016-07-05', 0, 5, 5, '2015-03-31 00:33:40', '2015-03-31 00:33:40'),
(13, 13, '', '2015-04-01', '', '2015-04-01', 0, 0, 0, '2015-04-01 17:35:06', '2015-04-01 17:35:06'),
(14, 14, 'EC2133193', '1970-01-01', 'DFA BATANGAS', '1970-01-01', 0, 0, 0, '2015-04-01 20:23:47', '2015-04-01 20:23:47'),
(15, 15, 'EB4150912', '1970-01-01', '', '1970-01-01', 0, 0, 0, '2015-04-01 20:25:45', '2015-04-01 20:25:45'),
(16, 16, '', '2015-04-01', '', '2015-04-01', 0, 6, 6, '2015-04-01 21:16:53', '2015-04-01 21:16:53'),
(17, 17, 'EC3350300', '2015-02-03', 'NCR SOUTH GAISANO SITE', '2020-02-02', 0, 0, 0, '2015-04-01 21:47:18', '2015-04-01 21:47:18'),
(18, 18, '', '2015-04-01', '', '2015-04-01', 0, 6, 6, '2015-04-01 21:54:21', '2015-04-01 21:54:21'),
(19, 19, 'EC2894427', '2019-12-03', 'Manila', '2019-12-02', 0, 0, 0, '2015-04-01 22:08:45', '2015-04-01 22:08:45'),
(20, 20, 'EC1372459', '2014-06-11', '', '2019-06-10', 0, 6, 6, '2015-04-01 22:13:18', '2015-04-01 22:13:18'),
(21, 21, '', '2015-04-01', '', '2015-04-01', 0, 6, 6, '2015-04-01 22:41:13', '2015-04-01 22:41:13'),
(22, 22, 'EB6816793', '2012-11-23', 'DFA Manila', '2017-11-22', 0, 0, 0, '2015-04-03 23:40:29', '2015-04-03 23:40:29'),
(23, 23, 'EC3441488', '2015-02-11', 'DFA NCR SOUTH', '2020-02-10', 0, 0, 0, '2015-04-04 04:02:13', '2015-04-04 04:02:13'),
(24, 24, 'EC1975507', '2014-08-27', 'DFA NCR, EAST', '2019-08-26', 0, 0, 0, '2015-04-04 15:18:22', '2015-04-04 15:18:22'),
(25, 25, 'XX5453540', '2010-02-04', 'DFA Pampangga', '2015-02-03', 0, 0, 0, '2015-04-06 19:58:03', '2015-04-06 19:58:03');

--
-- Triggers `applicant_passport`
--
DELIMITER $$
CREATE TRIGGER `applicant_passport_insert` BEFORE INSERT ON `applicant_passport`
 FOR EACH ROW BEGIN

IF NEW.passport_created IS NULL THEN
SET NEW.passport_created = CURRENT_TIMESTAMP(), NEW.passport_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_preferred_countries`
--

CREATE TABLE `applicant_preferred_countries` (
  `country_id` int(10) unsigned NOT NULL,
  `country_applicant` int(10) unsigned DEFAULT NULL,
  `country_country` int(10) unsigned DEFAULT NULL,
  `country_createdby` int(10) unsigned DEFAULT NULL,
  `country_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicant_preferred_countries`
--

INSERT INTO `applicant_preferred_countries` (`country_id`, `country_applicant`, `country_country`, `country_createdby`, `country_created`) VALUES
(1, 2, 10, 4, '2015-03-26 22:18:03'),
(2, 3, 4, 0, '2015-03-27 15:47:51'),
(3, 4, 9, 0, '2015-03-27 16:05:44'),
(4, 5, 2, 0, '2015-03-27 16:21:48'),
(5, 8, 11, 0, '2015-03-28 20:22:44'),
(6, 9, 11, 5, '2015-03-30 23:12:24'),
(7, 10, 11, 5, '2015-03-30 23:13:14'),
(8, 11, 11, 5, '2015-03-31 00:01:50'),
(9, 12, 11, 5, '2015-03-31 00:33:40'),
(10, 13, 14, 0, '2015-04-01 17:35:06'),
(11, 15, 13, 0, '2015-04-01 20:25:45'),
(12, 16, 12, 6, '2015-04-01 21:16:53'),
(13, 17, 1, 0, '2015-04-01 21:47:18'),
(14, 18, 12, 6, '2015-04-01 21:54:21'),
(15, 19, 12, 0, '2015-04-01 22:08:45'),
(16, 20, 12, 6, '2015-04-01 22:13:18'),
(17, 21, 12, 6, '2015-04-01 22:41:13'),
(18, 22, 12, 0, '2015-04-03 23:40:29'),
(19, 23, 11, 0, '2015-04-04 04:02:13'),
(20, 24, 6, 0, '2015-04-04 15:18:21'),
(21, 25, 11, 0, '2015-04-06 19:58:03');

--
-- Triggers `applicant_preferred_countries`
--
DELIMITER $$
CREATE TRIGGER `applicant_preferred_countries_insert` BEFORE INSERT ON `applicant_preferred_countries`
 FOR EACH ROW BEGIN

-- Allocate empty `country_created` field
IF NEW.country_created IS NULL THEN
SET NEW.country_created = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_preferred_positions`
--

CREATE TABLE `applicant_preferred_positions` (
  `position_id` int(10) unsigned NOT NULL,
  `position_applicant` int(10) unsigned DEFAULT NULL,
  `position_position` int(10) unsigned DEFAULT NULL,
  `position_createdby` int(10) unsigned DEFAULT NULL,
  `position_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicant_preferred_positions`
--

INSERT INTO `applicant_preferred_positions` (`position_id`, `position_applicant`, `position_position`, `position_createdby`, `position_created`) VALUES
(1, 3, 1, 0, '2015-03-27 15:47:51'),
(2, 4, 1, 0, '2015-03-27 16:05:44'),
(3, 5, 1, 0, '2015-03-27 16:21:48'),
(4, 8, 1, 0, '2015-03-28 20:22:44'),
(5, 9, 9, 5, '2015-03-30 23:12:24'),
(6, 10, 19, 5, '2015-03-30 23:13:14'),
(7, 11, 17, 5, '2015-03-31 00:01:50'),
(8, 12, 5, 5, '2015-03-31 00:33:40'),
(9, 13, 25, 0, '2015-04-01 17:35:06'),
(10, 14, 17, 0, '2015-04-01 20:23:47'),
(11, 14, 10, 0, '2015-04-01 20:23:47'),
(12, 14, 9, 0, '2015-04-01 20:23:47'),
(13, 15, 7, 0, '2015-04-01 20:25:45'),
(14, 17, 26, 0, '2015-04-01 21:47:18'),
(15, 18, 17, 6, '2015-04-01 21:54:21'),
(16, 19, 9, 0, '2015-04-01 22:08:45'),
(17, 20, 10, 6, '2015-04-01 22:13:18'),
(18, 21, 17, 6, '2015-04-01 22:41:13'),
(19, 22, 3, 0, '2015-04-03 23:40:29'),
(20, 22, 8, 0, '2015-04-03 23:40:29'),
(21, 23, 4, 0, '2015-04-04 04:02:13'),
(22, 24, 4, 0, '2015-04-04 15:18:21'),
(23, 25, 9, 0, '2015-04-06 19:58:03');

--
-- Triggers `applicant_preferred_positions`
--
DELIMITER $$
CREATE TRIGGER `applicant_preferred_positions_insert` BEFORE INSERT ON `applicant_preferred_positions`
 FOR EACH ROW BEGIN

-- Allocate empty `position_created` field
IF NEW.position_created IS NULL THEN
SET NEW.position_created = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_requirement`
--

CREATE TABLE `applicant_requirement` (
  `requirement_id` int(10) unsigned NOT NULL,
  `requirement_applicant` int(10) unsigned DEFAULT NULL,
  `requirement_trade_test` tinyint(3) unsigned DEFAULT NULL,
  `requirement_picture_status` varchar(100) DEFAULT NULL,
  `requirement_coe` tinyint(3) unsigned DEFAULT NULL,
  `requirement_school_records` varchar(255) DEFAULT NULL,
  `requirement_visa` tinyint(4) unsigned DEFAULT NULL,
  `requirement_visa_date` date DEFAULT NULL,
  `requirement_visa_release_date` date DEFAULT NULL,
  `requirement_visa_expiration` date DEFAULT NULL,
  `requirement_oec_number` varchar(100) DEFAULT NULL,
  `requirement_oec_submission_date` date DEFAULT NULL,
  `requirement_oec_release_date` date DEFAULT NULL,
  `requirement_owwa_certificate` varchar(255) DEFAULT NULL,
  `requirement_owwa_schedule` date DEFAULT NULL,
  `requirement_contract` date DEFAULT NULL,
  `requirement_mofa` varchar(255) DEFAULT NULL,
  `requirement_job_offer` int(11) DEFAULT NULL,
  `requirement_ticket` varchar(255) DEFAULT NULL,
  `requirement_offer_salary` float unsigned DEFAULT NULL,
  `requirement_remarks` text,
  `requirement_createdby` int(10) unsigned DEFAULT NULL,
  `requirement_updatedby` int(10) unsigned DEFAULT NULL,
  `requirement_created` timestamp NULL DEFAULT NULL,
  `requirement_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicant_requirement`
--

INSERT INTO `applicant_requirement` (`requirement_id`, `requirement_applicant`, `requirement_trade_test`, `requirement_picture_status`, `requirement_coe`, `requirement_school_records`, `requirement_visa`, `requirement_visa_date`, `requirement_visa_release_date`, `requirement_visa_expiration`, `requirement_oec_number`, `requirement_oec_submission_date`, `requirement_oec_release_date`, `requirement_owwa_certificate`, `requirement_owwa_schedule`, `requirement_contract`, `requirement_mofa`, `requirement_job_offer`, `requirement_ticket`, `requirement_offer_salary`, `requirement_remarks`, `requirement_createdby`, `requirement_updatedby`, `requirement_created`, `requirement_updated`) VALUES
(1, 1, 0, '', 0, '', 0, '0000-00-00', '0000-00-00', '0000-00-00', '', '0000-00-00', '0000-00-00', '', '0000-00-00', '0000-00-00', '', 3, '', 0, '', 1, 4, '2015-03-26 16:42:17', '2015-03-26 22:44:55'),
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, '2015-03-26 22:18:03', '2015-03-26 22:18:03'),
(3, 3, 0, '', 0, '', 1, '1901-01-15', '1901-01-16', '1901-01-26', 'wwwww', '1901-01-26', '1901-01-29', '', '0000-00-00', '0000-00-00', '', 3, '', 0, '', 0, 4, '2015-03-27 15:47:51', '2015-03-27 19:47:24'),
(4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-03-27 16:05:44', '2015-03-27 16:05:44'),
(5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-03-27 16:21:48', '2015-03-27 16:21:48'),
(6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-03-27 19:09:22', '2015-03-27 19:09:22'),
(7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-03-28 17:30:00', '2015-03-28 17:30:00'),
(8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-03-28 20:22:44', '2015-03-28 20:22:44'),
(9, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, '2015-03-30 23:12:24', '2015-03-30 23:12:24'),
(10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, '2015-03-30 23:13:14', '2015-03-30 23:13:14'),
(11, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, '2015-03-31 00:01:50', '2015-03-31 00:01:50'),
(12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5, '2015-03-31 00:33:40', '2015-03-31 00:33:40'),
(13, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-01 17:35:06', '2015-04-01 17:35:06'),
(14, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-01 20:23:47', '2015-04-01 20:23:47'),
(15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-01 20:25:45', '2015-04-01 20:25:45'),
(16, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 6, '2015-04-01 21:16:53', '2015-04-01 21:16:53'),
(17, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-01 21:47:18', '2015-04-01 21:47:18'),
(18, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 6, '2015-04-01 21:54:21', '2015-04-01 21:54:21'),
(19, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-01 22:08:45', '2015-04-01 22:08:45'),
(20, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 6, '2015-04-01 22:13:18', '2015-04-01 22:13:18'),
(21, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 6, '2015-04-01 22:41:13', '2015-04-01 22:41:13'),
(22, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-03 23:40:29', '2015-04-03 23:40:29'),
(23, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-04 04:02:13', '2015-04-04 04:02:13'),
(24, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-04 15:18:22', '2015-04-04 15:18:22'),
(25, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2015-04-06 19:58:03', '2015-04-06 19:58:03');

--
-- Triggers `applicant_requirement`
--
DELIMITER $$
CREATE TRIGGER `applicant_requirement_insert` BEFORE INSERT ON `applicant_requirement`
 FOR EACH ROW BEGIN

-- Allocate empty `requirement_created` field
IF NEW.requirement_created IS NULL THEN
SET NEW.requirement_created = CURRENT_TIMESTAMP(), NEW.requirement_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_salary`
--

CREATE TABLE `applicant_salary` (
  `applicant_salary_id` int(11) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `period_pay` varchar(100) NOT NULL,
  `basic_salary_pay` double NOT NULL,
  `status_pay` varchar(100) NOT NULL,
  `salary_date` varchar(10) NOT NULL,
  `sss_deductions` double NOT NULL,
  `phil_health_deductions` double NOT NULL,
  `pag_ibig_deductions` double NOT NULL,
  `hmo_miscellaneous` double NOT NULL,
  `over_time_miscellaneous` double NOT NULL,
  `night_differential_miscellaneous` double NOT NULL,
  `holiday_pay_miscellaneous` double NOT NULL,
  `absent_miscellaneous` double NOT NULL,
  `tardiness_miscellaneous` double NOT NULL,
  `undertime_miscellaneous` double NOT NULL,
  `meal_allowances` double NOT NULL,
  `transportation_allowances` double NOT NULL,
  `cola_allowances` double NOT NULL,
  `other_allowances` double NOT NULL,
  `tax_shielded_allowances` double NOT NULL,
  `total_deductions` double NOT NULL,
  `total_allowances` double NOT NULL,
  `total_misc` double NOT NULL,
  `taxable_income` double NOT NULL,
  `withholding_tax` double NOT NULL,
  `net_income` double NOT NULL,
  `salary_remarks` varchar(500) NOT NULL,
  `last_salary` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_salary_record`
--

CREATE TABLE `applicant_salary_record` (
  `applicant_salary_record_id` int(11) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `period_pay` varchar(100) NOT NULL,
  `basic_salary_pay` double NOT NULL,
  `status_pay` varchar(100) NOT NULL,
  `salary_date` varchar(10) NOT NULL,
  `sss_deductions` double NOT NULL,
  `phil_health_deductions` double NOT NULL,
  `pag_ibig_deductions` double NOT NULL,
  `hmo_miscellaneous` double NOT NULL,
  `over_time_miscellaneous` double NOT NULL,
  `night_differential_miscellaneous` double NOT NULL,
  `holiday_pay_miscellaneous` double NOT NULL,
  `absent_miscellaneous` double NOT NULL,
  `tardiness_miscellaneous` double NOT NULL,
  `undertime_miscellaneous` double NOT NULL,
  `meal_allowances` double NOT NULL,
  `transportation_allowances` double NOT NULL,
  `cola_allowances` double NOT NULL,
  `other_allowances` double NOT NULL,
  `tax_shielded_allowances` double NOT NULL,
  `total_deductions` double NOT NULL,
  `total_allowances` double NOT NULL,
  `total_misc` double NOT NULL,
  `taxable_income` double NOT NULL,
  `withholding_tax` double NOT NULL,
  `net_income` double NOT NULL,
  `salary_remarks` varchar(500) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_skills`
--

CREATE TABLE `applicant_skills` (
  `skill_id` bigint(20) unsigned NOT NULL,
  `skill_applicant` int(10) unsigned NOT NULL,
  `skill_name` varchar(255) NOT NULL,
  `skill_created` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `applicant_skills`
--
DELIMITER $$
CREATE TRIGGER `applicant_skill_insert` BEFORE INSERT ON `applicant_skills`
 FOR EACH ROW BEGIN

IF NEW.skill_created IS NULL THEN
SET NEW.skill_created = CURRENT_TIMESTAMP();
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `applicant_view`
--
CREATE TABLE `applicant_view` (
`applicant_id` int(10) unsigned
,`applicant_first` varchar(100)
,`applicant_middle` varchar(100)
,`applicant_last` varchar(100)
,`applicant_name` varchar(302)
,`applicant_suffix` varchar(10)
,`applicant_birthdate` date
,`applicant_age` int(10) unsigned
,`applicant_gender` varchar(10)
,`applicant_contacts` varchar(255)
,`applicant_address` varchar(255)
,`applicant_email` varchar(100)
,`applicant_nationality` varchar(100)
,`applicant_civil_status` varchar(100)
,`applicant_religion` varchar(100)
,`applicant_languages` varchar(255)
,`applicant_height` varchar(10)
,`applicant_weight` varchar(10)
,`applicant_position_type` varchar(10)
,`applicant_preferred_position` int(10) unsigned
,`applicant_expected_salary` float unsigned
,`applicant_preferred_country` varchar(100)
,`applicant_other_skills` text
,`applicant_cv` varchar(255)
,`applicant_photo` varchar(255)
,`applicant_status` int(10) unsigned
,`applicant_source` int(11)
,`applicant_remarks` text
,`applicant_date_applied` date
,`applicant_createdby` int(10) unsigned
,`applicant_updatedby` int(10) unsigned
,`applicant_created` timestamp
,`applicant_updated` timestamp
,`education_id` int(10) unsigned
,`education_applicant` int(10) unsigned
,`education_mba` varchar(255)
,`education_mba_course` varchar(255)
,`education_mba_year` varchar(10)
,`education_college` varchar(255)
,`education_college_skills` varchar(255)
,`education_college_year` varchar(10)
,`education_others` varchar(255)
,`education_others_year` varchar(10)
,`education_highschool` varchar(255)
,`education_highschool_year` varchar(10)
,`passport_id` int(10) unsigned
,`passport_applicant` int(10) unsigned
,`passport_number` varchar(100)
,`passport_expiration` date
,`passport_visible` tinyint(4)
,`certificate_id` int(10) unsigned
,`certificate_applicant` int(10) unsigned
,`certificate_tesda` tinyint(3) unsigned
,`certificate_info_sheet` tinyint(3) unsigned
,`certificate_authenticated` tinyint(3) unsigned
,`certificate_authenticated_nbi` tinyint(3) unsigned
,`certificate_insurance` varchar(255)
,`certificate_medical_clinic` varchar(255)
,`certificate_medical_exam_date` date
,`certificate_medical_result` varchar(255)
,`certificate_medical_remarks` text
,`certificate_medical_expiration` date
,`certificate_pdos` tinyint(3) unsigned
,`certificate_pt_result` varchar(255)
,`certificate_pt_result_date` date
,`certificate_philhealth` tinyint(3) unsigned
,`certificate_m1b` tinyint(3) unsigned
,`requirement_id` int(10) unsigned
,`requirement_applicant` int(10) unsigned
,`requirement_visa` tinyint(4) unsigned
,`requirement_visa_date` date
,`requirement_visa_release_date` date
,`requirement_visa_expiration` date
,`requirement_oec_number` varchar(100)
,`requirement_oec_submission_date` date
,`requirement_oec_release_date` date
,`requirement_owwa_certificate` varchar(255)
,`requirement_owwa_schedule` date
,`requirement_contract` date
,`requirement_mofa` varchar(255)
,`requirement_job_offer` int(11)
,`position_id` int(10) unsigned
,`position_name` varchar(255)
,`country_id` int(10) unsigned
,`country_name` varchar(100)
,`country_code` varchar(10)
,`country_abbr` varchar(10)
,`agent_id` int(10) unsigned
,`agent_first` varchar(100)
,`agent_last` varchar(100)
,`requirement_remarks` text
,`requirement_school_records` varchar(255)
,`requirement_coe` tinyint(3) unsigned
,`requirement_picture_status` varchar(100)
,`requirement_trade_test` tinyint(3) unsigned
,`job_id` int(10) unsigned
,`job_employer` int(10) unsigned
,`job_position` int(10) unsigned
,`job_gender` varchar(10)
,`job_salary` float
,`job_total` int(10) unsigned
,`job_occupied` int(10) unsigned
,`job_name` varchar(255)
,`job_content` text
,`job_status` int(11) unsigned
,`job_remarks` text
,`user_id` int(10) unsigned
,`user_name` varchar(100)
,`user_password` varchar(255)
,`user_fullname` varchar(100)
,`user_email` varchar(100)
,`user_type` int(10) unsigned
,`user_status` int(10) unsigned
,`user_lastlogin` timestamp
,`applicant_slug` varchar(255)
,`applicant_employer` int(10) unsigned
,`applicant_job` int(10) unsigned
,`job_revenue` float unsigned
,`employer_id` int(10) unsigned
,`employer_user` int(11)
,`employer_no` varchar(10)
,`employer_name` varchar(100)
,`employer_remarks` text
,`employer_contact_person` varchar(100)
,`employer_contact` varchar(100)
,`employer_email` varchar(100)
,`employer_address` varchar(255)
,`employer_country` int(11)
,`employer_source_agency` int(11) unsigned
,`employer_source_agent` int(11) unsigned
,`employer_agency_commission` float unsigned
,`employer_agent_commission` float unsigned
,`requirement_offer_salary` float unsigned
,`requirement_ticket` varchar(255)
,`passport_issue_place` varchar(255)
,`passport_issue` date
,`applicant_paid` tinyint(4) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `archive_applicant`
--

CREATE TABLE `archive_applicant` (
  `applicant_id` int(10) unsigned NOT NULL,
  `applicant_first` varchar(100) NOT NULL,
  `applicant_middle` varchar(100) DEFAULT NULL,
  `applicant_last` varchar(100) NOT NULL,
  `applicant_suffix` varchar(10) DEFAULT NULL,
  `applicant_birthdate` date DEFAULT NULL,
  `applicant_age` int(10) unsigned DEFAULT NULL COMMENT '//Auto-compute',
  `applicant_gender` varchar(10) DEFAULT NULL,
  `applicant_contacts` varchar(255) DEFAULT NULL,
  `applicant_address` varchar(255) DEFAULT NULL,
  `applicant_email` varchar(100) DEFAULT NULL,
  `applicant_nationality` varchar(100) DEFAULT NULL,
  `applicant_civil_status` varchar(100) DEFAULT NULL,
  `applicant_religion` varchar(100) DEFAULT NULL,
  `applicant_languages` varchar(255) DEFAULT NULL COMMENT 'JSON type',
  `applicant_height` varchar(10) DEFAULT NULL,
  `applicant_weight` varchar(10) DEFAULT NULL,
  `applicant_position_type` varchar(10) DEFAULT NULL COMMENT '''Household'', ''Skilled''',
  `applicant_preferred_position` int(10) unsigned DEFAULT NULL,
  `applicant_expected_salary` float unsigned DEFAULT NULL,
  `applicant_preferred_country` varchar(100) DEFAULT NULL,
  `applicant_other_skills` text,
  `applicant_cv` varchar(255) DEFAULT NULL,
  `applicant_photo` varchar(255) DEFAULT NULL,
  `applicant_status` int(10) unsigned DEFAULT NULL COMMENT '0=''Cancelled/Backout'', 1=''Available'', 2=''Pre-Selected'', 3=''Qualified'', 4=''Not Qualified'', 5=''Line Up'', 6=''Selected'', 7=''For Deployment'', 8=''Deployed'', 9=''Reserved''',
  `applicant_employer` int(10) unsigned DEFAULT '0' COMMENT '`employer`',
  `applicant_job` int(10) unsigned DEFAULT '0' COMMENT '`job`',
  `applicant_source` int(11) DEFAULT '0',
  `applicant_slug` varchar(255) DEFAULT NULL,
  `applicant_remarks` text,
  `applicant_date_applied` date DEFAULT NULL,
  `applicant_createdby` int(10) unsigned DEFAULT NULL,
  `applicant_updatedby` int(10) unsigned DEFAULT NULL,
  `applicant_created` timestamp NULL DEFAULT NULL,
  `applicant_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `applicant_archivedby` int(10) unsigned DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(10) unsigned NOT NULL,
  `bill_employer` int(10) unsigned DEFAULT NULL,
  `bill_applicant` int(10) unsigned DEFAULT NULL,
  `bill_amount` float unsigned DEFAULT '0' COMMENT 'total revenue',
  `bill_employer_cost` float unsigned DEFAULT '0' COMMENT 'employer''s part',
  `bill_applicant_cost` float unsigned DEFAULT '0' COMMENT 'applicant''s part',
  `bill_employer_deposit` float unsigned DEFAULT NULL,
  `bill_applicant_deposit` float unsigned DEFAULT NULL,
  `bill_status` int(10) unsigned DEFAULT '0' COMMENT '0=On process, 1=Closed, 2=Cancelled',
  `bill_remarks` text,
  `bill_createdby` int(10) unsigned DEFAULT NULL,
  `bill_updatedby` int(10) unsigned DEFAULT NULL,
  `bill_created` timestamp NULL DEFAULT NULL,
  `bill_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `bill_employer`, `bill_applicant`, `bill_amount`, `bill_employer_cost`, `bill_applicant_cost`, `bill_employer_deposit`, `bill_applicant_deposit`, `bill_status`, `bill_remarks`, `bill_createdby`, `bill_updatedby`, `bill_created`, `bill_updated`) VALUES
(1, 1, 1, 0, 0, 0, 0, 0, 0, 'Applicant selected job offer', 4, 4, '2015-03-26 22:44:55', '2015-03-26 22:44:55'),
(2, 1, 3, 0, 0, 0, 0, 0, 0, 'Applicant selected job offer', 4, 4, '2015-03-27 19:44:04', '2015-03-27 19:44:04');

--
-- Triggers `bill`
--
DELIMITER $$
CREATE TRIGGER `bill_edit` BEFORE UPDATE ON `bill`
 FOR EACH ROW BEGIN

IF NEW.bill_employer_deposit >= NEW.bill_employer_cost AND NEW.bill_applicant_deposit >= NEW.bill_applicant_cost THEN
SET NEW.bill_status = 1;
END IF;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `bill_insert` BEFORE INSERT ON `bill`
 FOR EACH ROW BEGIN

IF NEW.bill_created IS NULL THEN
SET NEW.bill_created = CURRENT_TIMESTAMP(), NEW.bill_updated = CURRENT_TIMESTAMP();

END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `billing_employer_view`
--
CREATE TABLE `billing_employer_view` (
`bill_id` int(10) unsigned
,`bill_employer` int(10) unsigned
,`bill_applicant` int(10) unsigned
,`bill_amount` float unsigned
,`bill_employer_cost` float unsigned
,`bill_applicant_cost` float unsigned
,`bill_employer_deposit` float unsigned
,`bill_applicant_deposit` float unsigned
,`bill_status` int(10) unsigned
,`bill_remarks` text
,`bill_createdby` int(10) unsigned
,`bill_updatedby` int(10) unsigned
,`bill_created` timestamp
,`bill_updated` timestamp
,`employer_id` int(10) unsigned
,`employer_user` int(11)
,`employer_no` varchar(10)
,`employer_name` varchar(100)
,`employer_remarks` text
,`employer_contact_person` varchar(100)
,`employer_contact` varchar(100)
,`employer_email` varchar(100)
,`employer_address` varchar(255)
,`employer_country` int(11)
,`employer_source_agency` int(11) unsigned
,`employer_source_agent` int(11) unsigned
,`employer_agency_commission` float unsigned
,`employer_agent_commission` float unsigned
,`employer_agency_commission_from` varchar(255)
,`employer_agent_commission_from` varchar(255)
,`employer_slug` varchar(255)
,`employer_createdby` int(10) unsigned
,`employer_updatedby` int(10) unsigned
,`employer_created` timestamp
,`employer_updated` timestamp
,`amount` double
,`debit` double
,`credit` double
,`applicants` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `detail_id` int(10) unsigned NOT NULL,
  `detail_bill` int(10) unsigned DEFAULT NULL,
  `detail_fee` int(10) unsigned DEFAULT NULL,
  `detail_amount` float unsigned DEFAULT NULL,
  `detail_employer` int(10) unsigned DEFAULT NULL,
  `detail_applicant` int(10) unsigned DEFAULT NULL,
  `detail_employer_cost` float unsigned DEFAULT NULL,
  `detail_applicant_cost` float unsigned DEFAULT NULL,
  `detail_employer_deposit` float unsigned DEFAULT NULL,
  `detail_applicant_deposit` float unsigned DEFAULT NULL,
  `detail_employer_balance` float unsigned DEFAULT NULL,
  `detail_applicant_balance` float unsigned DEFAULT NULL,
  `detail_remarks` text,
  `detail_createdby` int(10) unsigned DEFAULT NULL,
  `detail_updatedby` int(10) unsigned DEFAULT NULL,
  `detail_created` timestamp NULL DEFAULT NULL,
  `detail_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`detail_id`, `detail_bill`, `detail_fee`, `detail_amount`, `detail_employer`, `detail_applicant`, `detail_employer_cost`, `detail_applicant_cost`, `detail_employer_deposit`, `detail_applicant_deposit`, `detail_employer_balance`, `detail_applicant_balance`, `detail_remarks`, `detail_createdby`, `detail_updatedby`, `detail_created`, `detail_updated`) VALUES
(1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-26 22:44:55', '2015-03-26 22:44:55'),
(2, 1, 2, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-26 22:44:55', '2015-03-26 22:44:55'),
(3, 1, 3, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-26 22:44:55', '2015-03-26 22:44:55'),
(4, 1, 4, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-26 22:44:55', '2015-03-26 22:44:55'),
(5, 1, 5, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-26 22:44:55', '2015-03-26 22:44:55'),
(6, 1, 6, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-26 22:44:55', '2015-03-26 22:44:55'),
(7, 1, 7, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-26 22:44:55', '2015-03-26 22:44:55'),
(8, 1, 8, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-26 22:44:55', '2015-03-26 22:44:55'),
(9, 1, 9, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-26 22:44:55', '2015-03-26 22:44:55'),
(10, 1, 10, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-26 22:44:55', '2015-03-26 22:44:55'),
(11, 1, 11, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-26 22:44:55', '2015-03-26 22:44:55'),
(12, 1, 12, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-26 22:44:55', '2015-03-26 22:44:55'),
(13, 2, 1, 0, 1, 3, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-27 19:44:04', '2015-03-27 19:44:04'),
(14, 2, 2, 0, 1, 3, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-27 19:44:04', '2015-03-27 19:44:04'),
(15, 2, 3, 0, 1, 3, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-27 19:44:04', '2015-03-27 19:44:04'),
(16, 2, 4, 0, 1, 3, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-27 19:44:04', '2015-03-27 19:44:04'),
(17, 2, 5, 0, 1, 3, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-27 19:44:04', '2015-03-27 19:44:04'),
(18, 2, 6, 0, 1, 3, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-27 19:44:04', '2015-03-27 19:44:04'),
(19, 2, 7, 0, 1, 3, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-27 19:44:04', '2015-03-27 19:44:04'),
(20, 2, 8, 0, 1, 3, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-27 19:44:04', '2015-03-27 19:44:04'),
(21, 2, 9, 0, 1, 3, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-27 19:44:04', '2015-03-27 19:44:04'),
(22, 2, 10, 0, 1, 3, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-27 19:44:04', '2015-03-27 19:44:04'),
(23, 2, 11, 0, 1, 3, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-27 19:44:04', '2015-03-27 19:44:04'),
(24, 2, 12, 0, 1, 3, 0, 0, 0, 0, 0, 0, '', 4, 4, '2015-03-27 19:44:04', '2015-03-27 19:44:04');

--
-- Triggers `bill_detail`
--
DELIMITER $$
CREATE TRIGGER `bill_detail_edit` BEFORE UPDATE ON `bill_detail`
 FOR EACH ROW BEGIN

SET NEW.detail_employer_balance = NEW.detail_employer_cost - NEW.detail_employer_deposit;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `bill_detail_insert` BEFORE INSERT ON `bill_detail`
 FOR EACH ROW BEGIN

SET NEW.detail_employer_balance = NEW.detail_employer_cost - NEW.detail_employer_deposit;

IF NEW.detail_created IS NULL THEN
SET NEW.detail_created = CURRENT_TIMESTAMP(), NEW.detail_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bill_payment_applicant`
--

CREATE TABLE `bill_payment_applicant` (
  `payment_id` int(10) unsigned NOT NULL,
  `payment_or` varchar(255) DEFAULT NULL,
  `payment_bill` int(10) unsigned DEFAULT NULL,
  `payment_applicant` int(10) unsigned DEFAULT NULL,
  `payment_amount` float unsigned DEFAULT NULL,
  `payment_remarks` text,
  `payment_createdby` int(10) unsigned DEFAULT NULL,
  `payment_updatedby` int(10) unsigned DEFAULT NULL,
  `payment_created` timestamp NULL DEFAULT NULL,
  `payment_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bill_payment_employer`
--

CREATE TABLE `bill_payment_employer` (
  `payment_id` int(10) unsigned NOT NULL,
  `payment_or` varchar(255) DEFAULT NULL,
  `payment_bill` int(10) unsigned DEFAULT NULL,
  `payment_employer` int(10) unsigned DEFAULT NULL,
  `payment_amount` float unsigned DEFAULT NULL,
  `payment_remarks` text,
  `payment_createdby` int(10) unsigned DEFAULT NULL,
  `payment_updatedby` int(10) unsigned DEFAULT NULL,
  `payment_created` timestamp NULL DEFAULT NULL,
  `payment_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(10) unsigned NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_photo` varchar(255) DEFAULT NULL,
  `category_createdby` int(10) unsigned DEFAULT NULL,
  `category_created` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_photo`, `category_createdby`, `category_created`) VALUES
(1, 'COMPUTER/PROGRAMMING', '', 1, '2015-03-26 16:38:40'),
(2, 'HOUSEHOLD WORKERS', '', 4, '2015-03-27 10:25:05'),
(3, 'CLEANER', '', 4, '2015-03-27 10:26:39'),
(4, 'NURSING', '', 4, '2015-03-28 00:19:11'),
(5, 'WAITER (DELETE)', '', 4, '2015-03-31 14:15:26'),
(6, 'SERVICE CREW ', '', 4, '2015-03-28 00:22:08'),
(7, 'DRIVER', '', 4, '2015-03-28 00:23:46'),
(8, 'HOTEL & RESTAURANT', '', 4, '2015-03-31 14:10:34'),
(9, 'CHEF(DELETE)', '', 4, '2015-03-31 14:15:46'),
(10, 'HOUSEKEEPING (DELETE)', '', 4, '2015-03-31 14:15:04'),
(11, 'GROUNDS STAFF', '', 4, '2015-03-29 04:20:58'),
(12, 'CASHIER', '', 4, '2015-03-29 04:40:46'),
(13, 'ACCOUNTING', '', 4, '2015-03-29 04:41:27'),
(14, 'AIRCON TECH', '', 4, '2015-03-29 04:42:45'),
(15, 'OFFICE STAFF', '', 4, '2015-03-29 04:44:49'),
(16, 'SPA STAFF', '', 4, '2015-03-29 04:45:40');

--
-- Triggers `category`
--
DELIMITER $$
CREATE TRIGGER `category_insert` BEFORE INSERT ON `category`
 FOR EACH ROW BEGIN

IF NEW.category_created IS NULL THEN
SET NEW.category_created = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category_positions`
--

CREATE TABLE `category_positions` (
  `rel_id` int(10) unsigned NOT NULL,
  `rel_category` int(10) unsigned DEFAULT NULL,
  `rel_position` int(10) unsigned DEFAULT NULL,
  `rel_position_type` varchar(255) DEFAULT NULL COMMENT '''Household'', ''Skilled''',
  `rel_createdby` int(10) unsigned DEFAULT NULL,
  `rel_created` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_positions`
--

INSERT INTO `category_positions` (`rel_id`, `rel_category`, `rel_position`, `rel_position_type`, `rel_createdby`, `rel_created`) VALUES
(1, 1, 1, NULL, 1, '2015-03-26 16:39:18'),
(2, 2, 2, NULL, 4, '2015-03-28 00:14:10'),
(3, 3, 3, NULL, 4, '2015-03-28 00:18:39'),
(4, 3, 4, NULL, 4, '2015-03-28 00:18:54'),
(5, 4, 5, NULL, 4, '2015-03-28 00:19:28'),
(6, 5, 6, NULL, 4, '2015-03-28 00:21:35'),
(7, 7, 7, NULL, 4, '2015-03-28 00:24:13'),
(8, 7, 8, NULL, 4, '2015-03-28 00:24:30'),
(9, 6, 9, NULL, 4, '2015-03-28 00:25:56'),
(10, 8, 10, NULL, 4, '2015-03-29 04:08:51'),
(11, 9, 11, NULL, 4, '2015-03-29 04:14:04'),
(12, 9, 12, NULL, 4, '2015-03-29 04:14:37'),
(13, 10, 13, NULL, 4, '2015-03-29 04:18:38'),
(14, 5, 14, NULL, 4, '2015-03-29 04:19:31'),
(15, 11, 15, NULL, 4, '2015-03-29 04:22:11'),
(16, 7, 16, NULL, 4, '2015-03-29 04:32:47'),
(17, 12, 17, NULL, 4, '2015-03-29 04:41:00'),
(18, 13, 18, NULL, 4, '2015-03-29 04:41:41'),
(19, 14, 19, NULL, 4, '2015-03-29 04:43:00'),
(20, 15, 20, NULL, 4, '2015-03-29 04:45:15'),
(21, 16, 21, NULL, 4, '2015-03-29 04:46:00'),
(22, 16, 22, NULL, 4, '2015-03-29 04:47:08'),
(23, 8, 23, NULL, 4, '2015-04-01 04:11:16'),
(24, 8, 24, NULL, 4, '2015-04-01 04:11:33'),
(25, 8, 25, NULL, 4, '2015-04-01 04:13:39'),
(26, 8, 26, NULL, 4, '2015-04-01 04:14:22'),
(27, 8, 27, NULL, 4, '2015-04-01 04:14:37');

--
-- Triggers `category_positions`
--
DELIMITER $$
CREATE TRIGGER `category_position_insert` BEFORE INSERT ON `category_positions`
 FOR EACH ROW BEGIN

IF NEW.rel_created IS NULL THEN
SET NEW.rel_created = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `commission_marketing_agency`
--

CREATE TABLE `commission_marketing_agency` (
  `commission_id` int(10) unsigned NOT NULL,
  `commission_agency` int(10) unsigned DEFAULT NULL,
  `commission_applicant` int(10) unsigned DEFAULT NULL,
  `commission_employer` int(10) unsigned DEFAULT NULL,
  `commission_bill` int(10) unsigned DEFAULT NULL,
  `commission_placement_fee` tinyint(3) unsigned DEFAULT NULL,
  `commission_service_fee` tinyint(3) unsigned DEFAULT NULL,
  `commission_percentage` float unsigned DEFAULT NULL,
  `commission_base_amount` float unsigned DEFAULT NULL,
  `commission_amount` float unsigned DEFAULT NULL,
  `commission_remarks` text,
  `commission_status` int(10) unsigned DEFAULT '0' COMMENT '0=Unpaid, 1=Paid/Close',
  `commission_voucher` varchar(255) DEFAULT NULL,
  `commission_createdby` int(10) unsigned DEFAULT NULL,
  `commission_updatedby` int(10) unsigned DEFAULT NULL,
  `commission_created` timestamp NULL DEFAULT NULL,
  `commission_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commission_marketing_agent`
--

CREATE TABLE `commission_marketing_agent` (
  `commission_id` int(10) unsigned NOT NULL,
  `commission_agent` int(10) unsigned DEFAULT NULL,
  `commission_applicant` int(10) unsigned DEFAULT NULL,
  `commission_employer` int(10) unsigned DEFAULT NULL,
  `commission_bill` int(10) unsigned DEFAULT NULL,
  `commission_placement_fee` tinyint(3) unsigned DEFAULT NULL,
  `commission_service_fee` tinyint(3) unsigned DEFAULT NULL,
  `commission_percentage` float unsigned DEFAULT NULL,
  `commission_base_amount` float unsigned DEFAULT NULL,
  `commission_amount` float unsigned DEFAULT NULL,
  `commission_remarks` text,
  `commission_status` int(10) unsigned DEFAULT '0' COMMENT '0=Unpaid, 1=Paid/Close',
  `commission_voucher` varchar(255) DEFAULT NULL,
  `commission_createdby` int(10) unsigned DEFAULT NULL,
  `commission_updatedby` int(10) unsigned DEFAULT NULL,
  `commission_created` timestamp NULL DEFAULT NULL,
  `commission_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commission_recruitment_agent`
--

CREATE TABLE `commission_recruitment_agent` (
  `commission_id` int(10) unsigned NOT NULL,
  `commission_agent` int(10) unsigned DEFAULT NULL,
  `commission_applicant` int(10) unsigned DEFAULT NULL,
  `commission_employer` int(10) unsigned DEFAULT '0',
  `commission_bill` int(10) unsigned DEFAULT NULL,
  `commission_amount` float unsigned DEFAULT '0',
  `commission_remarks` text,
  `commission_status` int(10) unsigned DEFAULT '0' COMMENT '0=Unpaid, 1=Paid/Close',
  `commission_voucher` varchar(255) DEFAULT NULL,
  `commission_createdby` int(10) unsigned DEFAULT NULL,
  `commission_updatedby` int(10) unsigned DEFAULT NULL,
  `commission_created` timestamp NULL DEFAULT NULL,
  `commission_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contract_marketing_agency`
--

CREATE TABLE `contract_marketing_agency` (
  `contract_id` int(10) unsigned NOT NULL,
  `contract_agency` int(10) unsigned DEFAULT NULL,
  `contract_employer` int(10) unsigned DEFAULT NULL,
  `contract_percentage` float unsigned DEFAULT NULL,
  `contract_placement_fee` tinyint(3) unsigned DEFAULT NULL,
  `contract_service_fee` tinyint(3) unsigned DEFAULT NULL,
  `contract_base_amount` float unsigned DEFAULT NULL,
  `contract_amount` float unsigned DEFAULT NULL,
  `contract_remarks` text,
  `contract_status` int(10) unsigned DEFAULT '0' COMMENT '0=Onprocess, 1=Closed',
  `contract_createdby` int(10) unsigned DEFAULT NULL,
  `contract_updatedby` int(10) unsigned DEFAULT NULL,
  `contract_created` timestamp NULL DEFAULT NULL,
  `contract_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contract_marketing_agent`
--

CREATE TABLE `contract_marketing_agent` (
  `contract_id` int(10) unsigned NOT NULL,
  `contract_agent` int(10) unsigned DEFAULT NULL,
  `contract_employer` int(10) unsigned DEFAULT NULL,
  `contract_percentage` float unsigned DEFAULT NULL,
  `contract_placement_fee` tinyint(3) unsigned DEFAULT NULL,
  `contract_service_fee` tinyint(3) unsigned DEFAULT NULL,
  `contract_amount` float unsigned DEFAULT NULL,
  `contract_remarks` text,
  `contract_status` int(10) unsigned DEFAULT '0' COMMENT '0=Onprocess, 1=Closed',
  `contract_createdby` int(10) unsigned DEFAULT NULL,
  `contract_updatedby` int(10) unsigned DEFAULT NULL,
  `contract_created` timestamp NULL DEFAULT NULL,
  `contract_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(10) unsigned NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `country_abbr` varchar(10) DEFAULT NULL,
  `country_createdby` int(10) unsigned DEFAULT NULL,
  `country_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`, `country_code`, `country_abbr`, `country_createdby`, `country_created`) VALUES
(1, 'MALAYSIA', '+60', 'MY', NULL, '2014-10-06 01:05:11'),
(2, 'SINGAPORE', '+65', 'SG', NULL, '2014-10-06 01:05:26'),
(3, 'HONGKONG', '+852', 'HK', NULL, '2014-10-06 01:05:30'),
(4, 'BRUNEI', '+673', 'BN', NULL, '2014-10-06 01:05:32'),
(5, 'KUWAIT', '+965', 'KW', NULL, '2014-10-06 01:05:38'),
(6, 'BAHRAIN', '+973', 'BHR', NULL, '2014-10-06 01:05:39'),
(7, 'SAUDI ARABIA', '+966', 'SAU', 1, '2014-10-13 07:37:08'),
(8, 'TAIWAN', '+886', 'TAI', 1, '2014-10-13 07:38:09'),
(9, 'UNITED STATES', '+1', 'US', 1, '2014-11-04 09:08:02'),
(10, 'SOUTH KOREA', '+82', 'SK', 1, '2014-11-04 09:08:18'),
(11, 'DUBAI ', '+971', 'DXB', 4, '2015-03-28 00:34:30'),
(12, 'QATAR', '+974', 'QR', 4, '2015-03-28 00:35:23'),
(13, 'OMAN', '+968', 'O', 4, '2015-03-28 00:37:10'),
(14, 'PALAU', '+680', 'PW', 4, '2015-03-28 00:38:44'),
(15, 'JORDAN', '+60', 'JO', 4, '2015-04-01 03:35:12');

--
-- Triggers `country`
--
DELIMITER $$
CREATE TRIGGER `country_insert` BEFORE INSERT ON `country`
 FOR EACH ROW BEGIN

IF NEW.country_created IS NULL THEN
SET NEW.country_created = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `deployed`
--

CREATE TABLE `deployed` (
  `deployed_id` bigint(20) unsigned NOT NULL,
  `deployed_applicant` int(10) unsigned DEFAULT NULL,
  `deployed_employer` int(10) unsigned DEFAULT NULL,
  `deployed_job` int(10) unsigned DEFAULT NULL,
  `deployed_country` int(10) unsigned DEFAULT NULL,
  `deployed_position` int(10) unsigned DEFAULT NULL,
  `deployed_salary` float unsigned DEFAULT NULL,
  `deployed_remarks` text,
  `deployed_date` date DEFAULT NULL,
  `deployed_createdby` int(10) unsigned DEFAULT NULL,
  `deployed_updatedby` int(10) unsigned DEFAULT NULL,
  `deployed_created` timestamp NULL DEFAULT NULL,
  `deployed_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Triggers `deployed`
--
DELIMITER $$
CREATE TRIGGER `deployed_insert` BEFORE INSERT ON `deployed`
 FOR EACH ROW BEGIN

-- Allocate empty `deployed_created` field
IF NEW.deployed_created IS NULL THEN
SET NEW.deployed_created = CURRENT_TIMESTAMP(), NEW.deployed_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `employer_id` int(10) unsigned NOT NULL,
  `employer_user` int(11) DEFAULT NULL,
  `employer_no` varchar(10) DEFAULT NULL,
  `employer_name` varchar(100) NOT NULL,
  `employer_remarks` text,
  `employer_contact_person` varchar(100) DEFAULT NULL,
  `employer_contact` varchar(100) DEFAULT NULL,
  `employer_email` varchar(100) DEFAULT NULL,
  `employer_address` varchar(255) DEFAULT NULL,
  `employer_country` int(11) DEFAULT NULL,
  `employer_source_agency` int(11) unsigned DEFAULT '0',
  `employer_source_agent` int(11) unsigned DEFAULT '0',
  `employer_agency_commission` float unsigned DEFAULT '0' COMMENT 'optional',
  `employer_agent_commission` float unsigned DEFAULT '0' COMMENT 'optional',
  `employer_agency_commission_from` varchar(255) DEFAULT NULL,
  `employer_agent_commission_from` varchar(255) DEFAULT NULL,
  `employer_slug` varchar(255) DEFAULT NULL,
  `employer_createdby` int(10) unsigned DEFAULT NULL,
  `employer_updatedby` int(10) unsigned DEFAULT NULL,
  `employer_created` timestamp NULL DEFAULT NULL,
  `employer_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`employer_id`, `employer_user`, `employer_no`, `employer_name`, `employer_remarks`, `employer_contact_person`, `employer_contact`, `employer_email`, `employer_address`, `employer_country`, `employer_source_agency`, `employer_source_agent`, `employer_agency_commission`, `employer_agent_commission`, `employer_agency_commission_from`, `employer_agent_commission_from`, `employer_slug`, `employer_createdby`, `employer_updatedby`, `employer_created`, `employer_updated`) VALUES
(1, 3, '001', 'maybank', '', 'Maybank', '54353453453', '', 'PHILIPPINES', 1, 0, 0, 0, 0, 'Placement Fee', 'Placement Fee', '0000000001/Maybank', 1, 1, '2015-03-26 06:54:05', '2015-03-25 16:54:06'),
(2, 7, '123456', 'PALAU PLANTATION RESORT', '', 'PALAU', '123456', '', 'KOROR PALAU', 14, 0, 0, 0, 0, 'Placement Fee', 'Placement Fee', '0000000002/PALAU+PLANTATION+RESORT', 4, 4, '2015-03-31 19:19:46', '2015-03-31 05:19:46'),
(3, 8, '00002', 'EMPLOYER SAUDI', '', 'ADONIS', '098899890', 'EMPLOYERSAUDI@YAHOO.COM', 'MANILA', 7, 0, 0, 0, 0, 'Placement Fee', 'Placement Fee', '0000000003/EMPLOYER+SAUDI', 4, 4, '2015-03-31 21:46:25', '2015-03-31 21:55:10'),
(4, 9, '004', 'Mr Dubai', '', 'Mr. Dubai', '123456', 'Dubai@dubai.com', 'Dubai', 11, 0, 0, 0, 0, 'Placement Fee', 'Placement Fee', '0000000004/Mr+Dubai', 4, 4, '2015-04-01 03:20:00', '2015-03-31 13:20:00'),
(5, 10, '005', 'Mr Oman', '', 'Mr. Oman', '123', 'Oman@oman.com', 'OMAN', 13, 0, 0, 0, 0, 'Placement Fee', 'Placement Fee', '0000000005/Mr+Oman', 4, 4, '2015-04-01 03:22:06', '2015-03-31 13:22:06'),
(6, 11, '006', 'Mr Qatar', '', 'Mr. Qatar', '123', 'qatar@qatar.com', 'Qatar', 12, 0, 0, 0, 0, 'Placement Fee', 'Placement Fee', '0000000006/Mr+Qatar', 4, 4, '2015-04-01 03:23:55', '2015-03-31 13:23:55'),
(7, 12, '007', 'Mr Jordan', '', 'Mr. Jordan', '123', 'jordan@jordan.com', 'Jordan', 15, 0, 0, 0, 0, 'Placement Fee', 'Placement Fee', '0000000007/Mr+Jordan', 4, 4, '2015-04-01 03:36:53', '2015-03-31 13:36:53'),
(8, 13, '008', 'Mr HK', '', 'Mr. HK', '123', 'hk@hk.com', '', 3, 0, 0, 0, 0, 'Placement Fee', 'Placement Fee', '0000000008/Mr+HK', 4, 4, '2015-04-01 21:13:26', '2015-04-01 07:13:27'),
(9, 14, '23423', 'MR PHIL', '', 'MR PHIL', '0989898', '', 'MANILA', 15, 0, 0, 0, 0, 'Placement Fee', 'Placement Fee', '0000000009/MR+PHIL', 4, 4, '2015-04-01 21:14:53', '2015-04-01 07:14:53');

--
-- Triggers `employer`
--
DELIMITER $$
CREATE TRIGGER `employer_insert` BEFORE INSERT ON `employer`
 FOR EACH ROW BEGIN

-- Allocate empty `employer_created` field
IF NEW.employer_created IS NULL THEN
SET NEW.employer_created = CURRENT_TIMESTAMP(), NEW.employer_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employer_reservation`
--

CREATE TABLE `employer_reservation` (
  `reservation_id` bigint(20) unsigned NOT NULL,
  `reservation_employer` int(10) unsigned DEFAULT NULL,
  `reservation_applicant` int(10) unsigned DEFAULT NULL,
  `reservation_expiration` date DEFAULT NULL,
  `reservation_status` tinyint(3) unsigned DEFAULT '0',
  `reservation_remarks` text,
  `reservation_date` date DEFAULT NULL,
  `reservation_createdby` int(10) unsigned DEFAULT NULL,
  `reservation_updatedby` int(10) unsigned DEFAULT NULL,
  `reservation_created` timestamp NULL DEFAULT NULL,
  `reservation_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employer_reservation`
--

INSERT INTO `employer_reservation` (`reservation_id`, `reservation_employer`, `reservation_applicant`, `reservation_expiration`, `reservation_status`, `reservation_remarks`, `reservation_date`, `reservation_createdby`, `reservation_updatedby`, `reservation_created`, `reservation_updated`) VALUES
(1, 1, 2, '2015-04-02', 1, '', '2015-03-26', 4, 4, '2015-03-26 22:42:45', '2015-03-26 22:42:45'),
(2, 1, 3, '2015-04-03', 1, '', '2015-03-27', 4, 4, '2015-03-27 19:30:42', '2015-03-27 19:30:42');

--
-- Triggers `employer_reservation`
--
DELIMITER $$
CREATE TRIGGER `employer_selection_insert_copy` BEFORE INSERT ON `employer_reservation`
 FOR EACH ROW BEGIN

-- Allocate empty `reservation_created` field
IF NEW.reservation_created IS NULL THEN
SET NEW.reservation_created = CURRENT_TIMESTAMP(), NEW.reservation_updated = CURRENT_TIMESTAMP();
END IF;

IF NEW.reservation_expiration IS NULL THEN
SET NEW.reservation_expiration = DATE_ADD(CURRENT_DATE(), INTERVAL 1 WEEK);
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employer_selected`
--

CREATE TABLE `employer_selected` (
  `selected_id` bigint(20) unsigned NOT NULL,
  `selected_employer` int(10) unsigned DEFAULT NULL,
  `selected_applicant` int(10) unsigned DEFAULT NULL,
  `selected_remarks` text,
  `selected_date` date DEFAULT NULL,
  `selected_createdby` int(10) unsigned DEFAULT NULL,
  `selected_updatedby` int(10) unsigned DEFAULT NULL,
  `selected_created` timestamp NULL DEFAULT NULL,
  `selected_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employer_selected`
--

INSERT INTO `employer_selected` (`selected_id`, `selected_employer`, `selected_applicant`, `selected_remarks`, `selected_date`, `selected_createdby`, `selected_updatedby`, `selected_created`, `selected_updated`) VALUES
(1, 1, 1, '', '2015-03-26', 4, 4, '2015-03-26 22:43:58', '2015-03-26 22:43:58');

--
-- Triggers `employer_selected`
--
DELIMITER $$
CREATE TRIGGER `employer_selected_insert` BEFORE INSERT ON `employer_selected`
 FOR EACH ROW BEGIN

IF NEW.selected_created IS NULL THEN
SET NEW.selected_created = CURRENT_TIMESTAMP(), NEW.selected_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `fee`
--

CREATE TABLE `fee` (
  `fee_id` int(10) unsigned NOT NULL,
  `fee_name` varchar(150) DEFAULT NULL,
  `fee_group` varchar(100) DEFAULT NULL,
  `fee_shareable` tinyint(4) DEFAULT '0',
  `fee_createdby` int(10) unsigned DEFAULT NULL,
  `fee_updatedby` int(10) unsigned DEFAULT NULL,
  `fee_created` timestamp NULL DEFAULT NULL,
  `fee_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee`
--

INSERT INTO `fee` (`fee_id`, `fee_name`, `fee_group`, `fee_shareable`, `fee_createdby`, `fee_updatedby`, `fee_created`, `fee_updated`) VALUES
(1, 'Placement Fee', NULL, 1, 1, 1, '2014-11-02 13:21:13', '2014-11-02 13:22:24'),
(2, 'Service Fee', NULL, 0, 1, 1, '2014-11-02 13:21:16', '2014-11-02 13:22:23'),
(3, 'PDOS', 'Cost of Documentation', 0, 1, 1, '2014-11-02 13:21:16', '2014-11-02 13:22:23'),
(4, 'TRADE TEST', 'Cost of Documentation', 0, 1, 1, '2014-11-02 13:21:20', '2014-11-02 13:22:23'),
(5, 'MEDICAL TEST', 'Cost of Documentation', 0, 1, 1, '2014-11-02 13:21:23', '2014-11-02 13:22:23'),
(6, 'VISA', 'Processing Fee', 0, 1, 1, '2014-11-02 13:21:25', '2014-11-02 13:22:22'),
(7, 'AIRFARE', 'Processing Fee', 0, 1, 1, '2014-11-02 13:21:44', '2014-11-02 13:22:22'),
(8, 'POEA', 'Processing Fee', 0, 1, 1, '2014-11-02 13:21:45', '2014-11-02 13:22:22'),
(9, 'OWWA', 'Processing Fee', 0, 1, 1, '2014-11-02 13:21:48', '2014-11-02 13:22:22'),
(10, 'INSURANCE', 'Processing Fee', 0, 1, 1, '2014-11-02 13:21:56', '2014-11-02 13:22:22'),
(11, 'PHILHELATH', 'Processing Fee', 0, 1, 1, '2014-11-15 21:08:31', '2014-11-15 21:08:42'),
(12, 'PAGIBIG', 'Processing Fee', 0, 1, 1, '2014-11-15 21:08:40', '2014-11-15 21:08:41');

--
-- Triggers `fee`
--
DELIMITER $$
CREATE TRIGGER `fee_insert` BEFORE INSERT ON `fee`
 FOR EACH ROW BEGIN

-- Allocate empty `fee_created` field
IF NEW.fee_created IS NULL THEN
SET NEW.fee_created = CURRENT_TIMESTAMP(), NEW.fee_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL,
  `job_employer` int(10) unsigned DEFAULT NULL,
  `job_position` int(10) unsigned DEFAULT NULL,
  `job_gender` varchar(10) DEFAULT NULL,
  `job_salary` float DEFAULT NULL,
  `job_salary_from` float unsigned DEFAULT NULL,
  `job_salary_to` float unsigned DEFAULT NULL,
  `job_total` int(10) unsigned DEFAULT NULL,
  `job_occupied` int(10) unsigned DEFAULT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  `job_content` text,
  `job_dollar_exchange` float unsigned DEFAULT NULL,
  `job_revenue` float unsigned DEFAULT '0',
  `job_status` int(11) unsigned DEFAULT '0',
  `job_remarks` text,
  `job_createdby` int(10) unsigned DEFAULT NULL,
  `job_updatedby` int(10) unsigned DEFAULT NULL,
  `job_created` timestamp NULL DEFAULT NULL,
  `job_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`job_id`, `job_employer`, `job_position`, `job_gender`, `job_salary`, `job_salary_from`, `job_salary_to`, `job_total`, `job_occupied`, `job_name`, `job_content`, `job_dollar_exchange`, `job_revenue`, `job_status`, `job_remarks`, `job_createdby`, `job_updatedby`, `job_created`, `job_updated`) VALUES
(4, 2, 10, 'Female', NULL, 0, 0, 100, 0, 'FRONT DESK / RECEPTIONIST', 'College Graduate, Smart Appearance ', 40, 0, 1, '', 4, 4, '2015-03-31 19:25:19', '2015-04-01 15:27:10'),
(5, 2, 8, 'Any', NULL, 0, 0, 100, 0, 'COMPANY DRIVER', 'Full valid driving license (not professional license), Smart appearance, Age 21up', 40, 0, 1, '', 4, 4, '2015-03-31 19:28:37', '2015-03-31 22:12:21'),
(6, 2, 11, 'Any', NULL, 0, 0, 10, 0, 'HEAD CHEF', 'Experienced in International cusine, knowledge of Japanese cusine is a plus', 40, 0, 1, '', 4, 4, '2015-03-31 22:03:30', '2015-03-31 22:03:30'),
(7, 2, 20, 'Female', NULL, 0, 0, 10, 0, 'SECRETARY', 'College graduate, Fluent English, Hardworking, Formal letter writing, Responsible to work alone, Smart appearance, Pleasing personality, Japanese language is a plus.', 40, 0, 1, '', 4, 4, '2015-03-31 22:11:17', '2015-03-31 22:11:17'),
(8, 2, 13, 'Any', NULL, 0, 0, 10, 0, 'HOUSEKEEPING', 'Age:21 yrs up, Hardworking with previous experience a plus', 40, 0, 1, '', 4, 4, '2015-03-31 22:14:20', '2015-03-31 22:14:48'),
(9, 5, 2, 'Female', NULL, 400, 400, 100, 0, 'DOMESTIC HELPER', '23-45 YRS OLD with or without experience', 40, 0, 1, '', 4, 4, '2015-04-01 03:31:37', '2015-04-01 03:31:37'),
(10, 3, 2, 'Female', NULL, 400, 400, 100, 0, 'DOMESTIC HELPER', '23-45 YRS OLD with or without experience', 40, 0, 1, '', 4, 4, '2015-04-01 03:33:53', '2015-04-01 03:33:53'),
(11, 7, 2, 'Female', NULL, 400, 400, 100, 0, 'DOMESTIC HELPER', '23-45 YRS OLD  with or without experience', 40, 0, 1, '', 4, 4, '2015-04-01 03:38:03', '2015-04-01 03:38:03'),
(12, 2, 15, 'Male', NULL, 0, 0, 10, 0, 'GARDENER', 'Experienced gardener (large resort), Enjoys working in Island resort environment', 40, 0, 1, '', 4, 4, '2015-04-01 03:43:00', '2015-04-01 03:43:00'),
(13, 2, 26, 'Female', NULL, 0, 0, 10, 0, 'WAITRESS', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:45:22', '2015-04-01 21:17:02'),
(14, 6, 3, 'Female', NULL, 0, 0, 50, 0, 'FEMALE CLEANERS', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:46:32', '2015-04-01 03:46:32'),
(15, 4, 3, 'Female', NULL, 0, 0, 50, 0, 'FEMALE CLEANERS', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:48:41', '2015-04-01 03:48:41'),
(16, 6, 4, 'Male', NULL, 0, 0, 50, 0, 'MALE CLEANERS', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:49:28', '2015-04-01 03:49:28'),
(17, 4, 4, 'Male', NULL, 0, 0, 50, 0, 'MALE CLEANERS', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:50:00', '2015-04-01 03:50:00'),
(18, 6, 16, 'Male', NULL, 0, 0, 10, 0, 'COMPANY DRIVER w/GCC', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:51:05', '2015-04-01 03:51:05'),
(19, 4, 16, 'Male', NULL, 0, 0, 10, 0, 'COMPANY DRIVER w/GCC', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:51:52', '2015-04-01 03:51:52'),
(20, 6, 17, 'Female', NULL, 0, 0, 10, 0, 'CASHIER', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:52:41', '2015-04-01 03:52:41'),
(21, 4, 17, 'Female', NULL, 0, 0, 10, 0, 'CASHIER', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:53:13', '2015-04-01 03:53:13'),
(22, 6, 9, 'Female', NULL, 0, 0, 10, 0, 'WAITRESS', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:53:56', '2015-04-01 03:53:56'),
(23, 4, 9, 'Female', NULL, 0, 0, 10, 0, 'WAITRESS', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:55:47', '2015-04-01 03:55:47'),
(24, 6, 18, 'Any', NULL, 0, 0, 5, 0, 'ACCOUNTANT', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:56:36', '2015-04-01 03:56:36'),
(25, 4, 18, 'Any', NULL, 0, 0, 5, 0, 'ACCOUNTANT', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:57:09', '2015-04-01 03:57:09'),
(26, 6, 19, 'Male', NULL, 0, 0, 5, 0, 'AIRCON TECH', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:57:43', '2015-04-01 03:57:43'),
(27, 4, 19, 'Male', NULL, 0, 0, 5, 0, 'AIRCON TECH', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:58:16', '2015-04-01 03:58:34'),
(28, 6, 21, 'Female', NULL, 0, 0, 5, 0, 'NAIL ARTIST', '', 40, 0, 1, '', 4, 4, '2015-04-01 03:59:11', '2015-04-01 03:59:11'),
(29, 4, 21, 'Female', NULL, 0, 0, 5, 0, 'NAIL ARTIST', '', 40, 0, 1, '', 4, 4, '2015-04-01 04:00:08', '2015-04-01 04:00:08'),
(30, 6, 22, 'Female', NULL, 0, 0, 5, 0, 'BEAUTICIAN (ALL AROUND)', '', 40, 0, 1, '', 4, 4, '2015-04-01 04:01:00', '2015-04-01 04:01:00'),
(31, 6, 20, 'Female', NULL, 0, 0, 5, 0, 'OFFICE SECRETARY', '', 40, 0, 1, '', 4, 4, '2015-04-01 04:02:07', '2015-04-01 04:02:07'),
(32, 4, 20, 'Female', NULL, 0, 0, 5, 0, 'OFFICE SECRETARY', '', 40, 0, 1, '', 4, 4, '2015-04-01 04:02:42', '2015-04-01 04:02:42');

--
-- Triggers `job`
--
DELIMITER $$
CREATE TRIGGER `job_insert` BEFORE INSERT ON `job`
 FOR EACH ROW BEGIN

IF NEW.job_created IS NULL THEN
SET NEW.job_created = CURRENT_TIMESTAMP(), NEW.job_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `job_fee`
--

CREATE TABLE `job_fee` (
  `fee_id` bigint(20) unsigned NOT NULL,
  `fee_job` int(10) unsigned DEFAULT NULL,
  `fee_fee` int(10) unsigned DEFAULT NULL,
  `fee_amount` float unsigned DEFAULT NULL,
  `fee_employer` tinyint(3) unsigned DEFAULT NULL,
  `fee_applicant` tinyint(10) unsigned DEFAULT NULL,
  `fee_employer_cost` float unsigned DEFAULT NULL,
  `fee_applicant_cost` float unsigned DEFAULT NULL,
  `fee_createdby` int(10) unsigned DEFAULT NULL,
  `fee_updatedby` int(10) unsigned DEFAULT NULL,
  `fee_created` timestamp NULL DEFAULT NULL,
  `fee_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_fee`
--

INSERT INTO `job_fee` (`fee_id`, `fee_job`, `fee_fee`, `fee_amount`, `fee_employer`, `fee_applicant`, `fee_employer_cost`, `fee_applicant_cost`, `fee_createdby`, `fee_updatedby`, `fee_created`, `fee_updated`) VALUES
(1, 1, 1, 15000, 1, 1, 0, 0, 2, 2, '2015-03-07 05:26:07', '2015-03-07 05:32:41'),
(2, 1, 2, 10000, 1, 0, 10000, 0, 2, 2, '2015-03-07 05:26:07', '2015-03-07 05:32:41'),
(3, 1, 3, 2000, 1, 0, 2000, 0, 2, 2, '2015-03-07 05:26:07', '2015-03-07 05:32:41'),
(4, 1, 4, 3000, 1, 0, 3000, 0, 2, 2, '2015-03-07 05:26:07', '2015-03-07 05:32:41'),
(5, 1, 5, 2000, 1, 0, 2000, 0, 2, 2, '2015-03-07 05:26:07', '2015-03-07 05:32:41'),
(6, 1, 6, 5000, 1, 0, 5000, 0, 2, 2, '2015-03-07 05:26:07', '2015-03-07 05:32:41'),
(7, 1, 7, 200, 1, 0, 200, 0, 2, 2, '2015-03-07 05:26:07', '2015-03-07 05:32:41'),
(8, 1, 8, 0, 1, 0, 0, 0, 2, 2, '2015-03-07 05:26:07', '2015-03-07 05:32:41'),
(9, 1, 9, 0, 1, 0, 0, 0, 2, 2, '2015-03-07 05:26:07', '2015-03-07 05:32:41'),
(10, 1, 10, 0, 1, 0, 0, 0, 2, 2, '2015-03-07 05:26:07', '2015-03-07 05:32:41'),
(11, 1, 11, 2000, 0, 1, 0, 2000, 2, 2, '2015-03-07 05:26:07', '2015-03-07 05:32:41'),
(12, 1, 12, 100, 0, 1, 0, 100, 2, 2, '2015-03-07 05:26:07', '2015-03-07 05:32:41'),
(13, 2, 1, 2300, 1, 1, 2000, 300, 1, 1, '2015-03-26 16:40:15', '2015-03-26 16:40:15'),
(14, 2, 2, 10000, 1, 0, 10000, 0, 1, 1, '2015-03-26 16:40:15', '2015-03-26 16:40:15'),
(15, 2, 3, 2000, 1, 0, 2000, 0, 1, 1, '2015-03-26 16:40:15', '2015-03-26 16:40:15'),
(16, 2, 4, 0, 1, 0, 0, 0, 1, 1, '2015-03-26 16:40:15', '2015-03-26 16:40:15'),
(17, 2, 5, 0, 1, 0, 0, 0, 1, 1, '2015-03-26 16:40:15', '2015-03-26 16:40:15'),
(18, 2, 6, 0, 1, 0, 0, 0, 1, 1, '2015-03-26 16:40:15', '2015-03-26 16:40:15'),
(19, 2, 7, 0, 1, 0, 0, 0, 1, 1, '2015-03-26 16:40:15', '2015-03-26 16:40:15'),
(20, 2, 8, 0, 1, 0, 0, 0, 1, 1, '2015-03-26 16:40:15', '2015-03-26 16:40:15'),
(21, 2, 9, 0, 1, 0, 0, 0, 1, 1, '2015-03-26 16:40:15', '2015-03-26 16:40:15'),
(22, 2, 10, 1000, 0, 1, 0, 1000, 1, 1, '2015-03-26 16:40:15', '2015-03-26 16:40:15'),
(23, 2, 11, 2500, 0, 1, 0, 2500, 1, 1, '2015-03-26 16:40:15', '2015-03-26 16:40:15'),
(24, 2, 12, 100, 0, 1, 0, 100, 1, 1, '2015-03-26 16:40:15', '2015-03-26 16:40:15'),
(25, 3, 1, 0, 1, 1, 0, 0, 4, 4, '2015-03-26 22:40:49', '2015-03-26 22:40:49'),
(26, 3, 2, 0, 1, 0, 0, 0, 4, 4, '2015-03-26 22:40:49', '2015-03-26 22:40:49'),
(27, 3, 3, 0, 1, 0, 0, 0, 4, 4, '2015-03-26 22:40:49', '2015-03-26 22:40:49'),
(28, 3, 4, 0, 1, 0, 0, 0, 4, 4, '2015-03-26 22:40:49', '2015-03-26 22:40:49'),
(29, 3, 5, 0, 1, 0, 0, 0, 4, 4, '2015-03-26 22:40:49', '2015-03-26 22:40:49'),
(30, 3, 6, 0, 1, 0, 0, 0, 4, 4, '2015-03-26 22:40:49', '2015-03-26 22:40:49'),
(31, 3, 7, 0, 1, 0, 0, 0, 4, 4, '2015-03-26 22:40:49', '2015-03-26 22:40:49'),
(32, 3, 8, 0, 1, 0, 0, 0, 4, 4, '2015-03-26 22:40:49', '2015-03-26 22:40:49'),
(33, 3, 9, 0, 1, 0, 0, 0, 4, 4, '2015-03-26 22:40:49', '2015-03-26 22:40:49'),
(34, 3, 10, 0, 1, 0, 0, 0, 4, 4, '2015-03-26 22:40:49', '2015-03-26 22:40:49'),
(35, 3, 11, 0, 1, 0, 0, 0, 4, 4, '2015-03-26 22:40:49', '2015-03-26 22:40:49'),
(36, 3, 12, 0, 1, 0, 0, 0, 4, 4, '2015-03-26 22:40:49', '2015-03-26 22:40:49'),
(37, 4, 1, 0, 1, 1, 0, 0, 4, 4, '2015-03-31 19:25:19', '2015-04-01 15:27:10'),
(38, 4, 2, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:25:19', '2015-04-01 15:27:10'),
(39, 4, 3, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:25:19', '2015-04-01 15:27:10'),
(40, 4, 4, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:25:19', '2015-04-01 15:27:10'),
(41, 4, 5, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:25:19', '2015-04-01 15:27:10'),
(42, 4, 6, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:25:19', '2015-04-01 15:27:10'),
(43, 4, 7, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:25:19', '2015-04-01 15:27:10'),
(44, 4, 8, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:25:19', '2015-04-01 15:27:10'),
(45, 4, 9, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:25:19', '2015-04-01 15:27:10'),
(46, 4, 10, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:25:19', '2015-04-01 15:27:10'),
(47, 4, 11, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:25:19', '2015-04-01 15:27:10'),
(48, 4, 12, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:25:19', '2015-04-01 15:27:10'),
(49, 5, 1, 0, 1, 1, 0, 0, 4, 4, '2015-03-31 19:28:37', '2015-03-31 22:12:21'),
(50, 5, 2, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:28:37', '2015-03-31 22:12:21'),
(51, 5, 3, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:28:37', '2015-03-31 22:12:21'),
(52, 5, 4, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:28:37', '2015-03-31 22:12:21'),
(53, 5, 5, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:28:37', '2015-03-31 22:12:21'),
(54, 5, 6, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:28:37', '2015-03-31 22:12:21'),
(55, 5, 7, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:28:37', '2015-03-31 22:12:21'),
(56, 5, 8, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:28:37', '2015-03-31 22:12:21'),
(57, 5, 9, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:28:37', '2015-03-31 22:12:21'),
(58, 5, 10, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:28:37', '2015-03-31 22:12:21'),
(59, 5, 11, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:28:37', '2015-03-31 22:12:21'),
(60, 5, 12, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 19:28:37', '2015-03-31 22:12:21'),
(61, 6, 1, 0, 1, 1, 0, 0, 4, 4, '2015-03-31 22:03:30', '2015-03-31 22:03:30'),
(62, 6, 2, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:03:30', '2015-03-31 22:03:30'),
(63, 6, 3, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:03:30', '2015-03-31 22:03:30'),
(64, 6, 4, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:03:30', '2015-03-31 22:03:30'),
(65, 6, 5, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:03:30', '2015-03-31 22:03:30'),
(66, 6, 6, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:03:30', '2015-03-31 22:03:30'),
(67, 6, 7, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:03:30', '2015-03-31 22:03:30'),
(68, 6, 8, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:03:30', '2015-03-31 22:03:30'),
(69, 6, 9, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:03:30', '2015-03-31 22:03:30'),
(70, 6, 10, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:03:30', '2015-03-31 22:03:30'),
(71, 6, 11, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:03:30', '2015-03-31 22:03:30'),
(72, 6, 12, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:03:30', '2015-03-31 22:03:30'),
(73, 7, 1, 0, 1, 1, 0, 0, 4, 4, '2015-03-31 22:11:17', '2015-03-31 22:11:17'),
(74, 7, 2, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:11:17', '2015-03-31 22:11:17'),
(75, 7, 3, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:11:17', '2015-03-31 22:11:17'),
(76, 7, 4, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:11:17', '2015-03-31 22:11:17'),
(77, 7, 5, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:11:17', '2015-03-31 22:11:17'),
(78, 7, 6, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:11:17', '2015-03-31 22:11:17'),
(79, 7, 7, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:11:17', '2015-03-31 22:11:17'),
(80, 7, 8, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:11:17', '2015-03-31 22:11:17'),
(81, 7, 9, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:11:17', '2015-03-31 22:11:17'),
(82, 7, 10, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:11:17', '2015-03-31 22:11:17'),
(83, 7, 11, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:11:17', '2015-03-31 22:11:17'),
(84, 7, 12, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:11:17', '2015-03-31 22:11:17'),
(85, 8, 1, 0, 1, 1, 0, 0, 4, 4, '2015-03-31 22:14:20', '2015-03-31 22:14:48'),
(86, 8, 2, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:14:20', '2015-03-31 22:14:48'),
(87, 8, 3, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:14:20', '2015-03-31 22:14:48'),
(88, 8, 4, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:14:20', '2015-03-31 22:14:48'),
(89, 8, 5, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:14:20', '2015-03-31 22:14:48'),
(90, 8, 6, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:14:20', '2015-03-31 22:14:48'),
(91, 8, 7, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:14:20', '2015-03-31 22:14:48'),
(92, 8, 8, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:14:20', '2015-03-31 22:14:48'),
(93, 8, 9, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:14:20', '2015-03-31 22:14:48'),
(94, 8, 10, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:14:20', '2015-03-31 22:14:48'),
(95, 8, 11, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:14:20', '2015-03-31 22:14:48'),
(96, 8, 12, 0, 1, 0, 0, 0, 4, 4, '2015-03-31 22:14:20', '2015-03-31 22:14:48'),
(97, 9, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:31:37', '2015-04-01 03:31:37'),
(98, 9, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:31:37', '2015-04-01 03:31:37'),
(99, 9, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:31:37', '2015-04-01 03:31:37'),
(100, 9, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:31:37', '2015-04-01 03:31:37'),
(101, 9, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:31:37', '2015-04-01 03:31:37'),
(102, 9, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:31:37', '2015-04-01 03:31:37'),
(103, 9, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:31:37', '2015-04-01 03:31:37'),
(104, 9, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:31:37', '2015-04-01 03:31:37'),
(105, 9, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:31:37', '2015-04-01 03:31:37'),
(106, 9, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:31:37', '2015-04-01 03:31:37'),
(107, 9, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:31:37', '2015-04-01 03:31:37'),
(108, 9, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:31:37', '2015-04-01 03:31:37'),
(109, 10, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:33:53', '2015-04-01 03:33:53'),
(110, 10, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:33:53', '2015-04-01 03:33:53'),
(111, 10, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:33:53', '2015-04-01 03:33:53'),
(112, 10, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:33:53', '2015-04-01 03:33:53'),
(113, 10, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:33:53', '2015-04-01 03:33:53'),
(114, 10, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:33:53', '2015-04-01 03:33:53'),
(115, 10, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:33:53', '2015-04-01 03:33:53'),
(116, 10, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:33:53', '2015-04-01 03:33:53'),
(117, 10, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:33:53', '2015-04-01 03:33:53'),
(118, 10, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:33:53', '2015-04-01 03:33:53'),
(119, 10, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:33:53', '2015-04-01 03:33:53'),
(120, 10, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:33:53', '2015-04-01 03:33:53'),
(121, 11, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:38:03', '2015-04-01 03:38:03'),
(122, 11, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:38:03', '2015-04-01 03:38:03'),
(123, 11, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:38:03', '2015-04-01 03:38:03'),
(124, 11, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:38:03', '2015-04-01 03:38:03'),
(125, 11, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:38:03', '2015-04-01 03:38:03'),
(126, 11, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:38:03', '2015-04-01 03:38:03'),
(127, 11, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:38:03', '2015-04-01 03:38:03'),
(128, 11, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:38:03', '2015-04-01 03:38:03'),
(129, 11, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:38:03', '2015-04-01 03:38:03'),
(130, 11, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:38:03', '2015-04-01 03:38:03'),
(131, 11, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:38:03', '2015-04-01 03:38:03'),
(132, 11, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:38:03', '2015-04-01 03:38:03'),
(133, 12, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:43:00', '2015-04-01 03:43:00'),
(134, 12, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:43:00', '2015-04-01 03:43:00'),
(135, 12, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:43:00', '2015-04-01 03:43:00'),
(136, 12, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:43:00', '2015-04-01 03:43:00'),
(137, 12, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:43:00', '2015-04-01 03:43:00'),
(138, 12, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:43:00', '2015-04-01 03:43:00'),
(139, 12, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:43:00', '2015-04-01 03:43:00'),
(140, 12, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:43:00', '2015-04-01 03:43:00'),
(141, 12, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:43:00', '2015-04-01 03:43:00'),
(142, 12, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:43:00', '2015-04-01 03:43:00'),
(143, 12, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:43:00', '2015-04-01 03:43:00'),
(144, 12, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:43:00', '2015-04-01 03:43:00'),
(145, 13, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:45:22', '2015-04-01 21:17:02'),
(146, 13, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:45:22', '2015-04-01 21:17:02'),
(147, 13, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:45:22', '2015-04-01 21:17:02'),
(148, 13, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:45:22', '2015-04-01 21:17:02'),
(149, 13, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:45:22', '2015-04-01 21:17:02'),
(150, 13, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:45:22', '2015-04-01 21:17:02'),
(151, 13, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:45:22', '2015-04-01 21:17:02'),
(152, 13, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:45:22', '2015-04-01 21:17:02'),
(153, 13, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:45:22', '2015-04-01 21:17:02'),
(154, 13, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:45:22', '2015-04-01 21:17:02'),
(155, 13, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:45:22', '2015-04-01 21:17:02'),
(156, 13, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:45:22', '2015-04-01 21:17:02'),
(157, 14, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:46:32', '2015-04-01 03:46:32'),
(158, 14, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:46:32', '2015-04-01 03:46:32'),
(159, 14, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:46:32', '2015-04-01 03:46:32'),
(160, 14, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:46:32', '2015-04-01 03:46:32'),
(161, 14, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:46:32', '2015-04-01 03:46:32'),
(162, 14, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:46:32', '2015-04-01 03:46:32'),
(163, 14, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:46:32', '2015-04-01 03:46:32'),
(164, 14, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:46:32', '2015-04-01 03:46:32'),
(165, 14, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:46:32', '2015-04-01 03:46:32'),
(166, 14, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:46:32', '2015-04-01 03:46:32'),
(167, 14, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:46:32', '2015-04-01 03:46:32'),
(168, 14, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:46:32', '2015-04-01 03:46:32'),
(169, 15, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:48:41', '2015-04-01 03:48:41'),
(170, 15, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:48:41', '2015-04-01 03:48:41'),
(171, 15, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:48:41', '2015-04-01 03:48:41'),
(172, 15, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:48:41', '2015-04-01 03:48:41'),
(173, 15, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:48:41', '2015-04-01 03:48:41'),
(174, 15, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:48:41', '2015-04-01 03:48:41'),
(175, 15, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:48:41', '2015-04-01 03:48:41'),
(176, 15, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:48:41', '2015-04-01 03:48:41'),
(177, 15, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:48:41', '2015-04-01 03:48:41'),
(178, 15, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:48:41', '2015-04-01 03:48:41'),
(179, 15, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:48:41', '2015-04-01 03:48:41'),
(180, 15, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:48:41', '2015-04-01 03:48:41'),
(181, 16, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:49:28', '2015-04-01 03:49:28'),
(182, 16, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:49:28', '2015-04-01 03:49:28'),
(183, 16, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:49:28', '2015-04-01 03:49:28'),
(184, 16, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:49:28', '2015-04-01 03:49:28'),
(185, 16, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:49:28', '2015-04-01 03:49:28'),
(186, 16, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:49:28', '2015-04-01 03:49:28'),
(187, 16, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:49:28', '2015-04-01 03:49:28'),
(188, 16, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:49:28', '2015-04-01 03:49:28'),
(189, 16, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:49:28', '2015-04-01 03:49:28'),
(190, 16, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:49:28', '2015-04-01 03:49:28'),
(191, 16, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:49:28', '2015-04-01 03:49:28'),
(192, 16, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:49:28', '2015-04-01 03:49:28'),
(193, 17, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:50:00', '2015-04-01 03:50:00'),
(194, 17, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:50:00', '2015-04-01 03:50:00'),
(195, 17, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:50:00', '2015-04-01 03:50:00'),
(196, 17, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:50:00', '2015-04-01 03:50:00'),
(197, 17, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:50:00', '2015-04-01 03:50:00'),
(198, 17, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:50:00', '2015-04-01 03:50:00'),
(199, 17, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:50:00', '2015-04-01 03:50:00'),
(200, 17, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:50:00', '2015-04-01 03:50:00'),
(201, 17, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:50:00', '2015-04-01 03:50:00'),
(202, 17, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:50:00', '2015-04-01 03:50:00'),
(203, 17, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:50:00', '2015-04-01 03:50:00'),
(204, 17, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:50:00', '2015-04-01 03:50:00'),
(205, 18, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:51:05', '2015-04-01 03:51:05'),
(206, 18, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:05', '2015-04-01 03:51:05'),
(207, 18, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:05', '2015-04-01 03:51:05'),
(208, 18, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:05', '2015-04-01 03:51:05'),
(209, 18, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:05', '2015-04-01 03:51:05'),
(210, 18, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:05', '2015-04-01 03:51:05'),
(211, 18, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:05', '2015-04-01 03:51:05'),
(212, 18, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:05', '2015-04-01 03:51:05'),
(213, 18, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:05', '2015-04-01 03:51:05'),
(214, 18, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:05', '2015-04-01 03:51:05'),
(215, 18, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:05', '2015-04-01 03:51:05'),
(216, 18, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:05', '2015-04-01 03:51:05'),
(217, 19, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:51:52', '2015-04-01 03:51:52'),
(218, 19, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:52', '2015-04-01 03:51:52'),
(219, 19, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:52', '2015-04-01 03:51:52'),
(220, 19, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:52', '2015-04-01 03:51:52'),
(221, 19, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:52', '2015-04-01 03:51:52'),
(222, 19, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:52', '2015-04-01 03:51:52'),
(223, 19, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:52', '2015-04-01 03:51:52'),
(224, 19, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:52', '2015-04-01 03:51:52'),
(225, 19, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:52', '2015-04-01 03:51:52'),
(226, 19, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:52', '2015-04-01 03:51:52'),
(227, 19, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:52', '2015-04-01 03:51:52'),
(228, 19, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:51:52', '2015-04-01 03:51:52'),
(229, 20, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:52:41', '2015-04-01 03:52:41'),
(230, 20, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:52:41', '2015-04-01 03:52:41'),
(231, 20, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:52:41', '2015-04-01 03:52:41'),
(232, 20, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:52:41', '2015-04-01 03:52:41'),
(233, 20, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:52:41', '2015-04-01 03:52:41'),
(234, 20, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:52:41', '2015-04-01 03:52:41'),
(235, 20, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:52:41', '2015-04-01 03:52:41'),
(236, 20, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:52:41', '2015-04-01 03:52:41'),
(237, 20, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:52:41', '2015-04-01 03:52:41'),
(238, 20, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:52:41', '2015-04-01 03:52:41'),
(239, 20, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:52:41', '2015-04-01 03:52:41'),
(240, 20, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:52:41', '2015-04-01 03:52:41'),
(241, 21, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:53:13', '2015-04-01 03:53:13'),
(242, 21, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:13', '2015-04-01 03:53:13'),
(243, 21, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:13', '2015-04-01 03:53:13'),
(244, 21, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:13', '2015-04-01 03:53:13'),
(245, 21, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:13', '2015-04-01 03:53:13'),
(246, 21, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:13', '2015-04-01 03:53:13'),
(247, 21, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:13', '2015-04-01 03:53:13'),
(248, 21, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:13', '2015-04-01 03:53:13'),
(249, 21, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:13', '2015-04-01 03:53:13'),
(250, 21, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:13', '2015-04-01 03:53:13'),
(251, 21, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:13', '2015-04-01 03:53:13'),
(252, 21, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:13', '2015-04-01 03:53:13'),
(253, 22, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:53:56', '2015-04-01 03:53:56'),
(254, 22, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:56', '2015-04-01 03:53:56'),
(255, 22, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:56', '2015-04-01 03:53:56'),
(256, 22, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:56', '2015-04-01 03:53:56'),
(257, 22, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:56', '2015-04-01 03:53:56'),
(258, 22, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:56', '2015-04-01 03:53:56'),
(259, 22, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:56', '2015-04-01 03:53:56'),
(260, 22, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:56', '2015-04-01 03:53:56'),
(261, 22, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:56', '2015-04-01 03:53:56'),
(262, 22, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:56', '2015-04-01 03:53:56'),
(263, 22, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:56', '2015-04-01 03:53:56'),
(264, 22, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:53:56', '2015-04-01 03:53:56'),
(265, 23, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:55:47', '2015-04-01 03:55:47'),
(266, 23, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:55:47', '2015-04-01 03:55:47'),
(267, 23, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:55:47', '2015-04-01 03:55:47'),
(268, 23, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:55:47', '2015-04-01 03:55:47'),
(269, 23, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:55:47', '2015-04-01 03:55:47'),
(270, 23, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:55:47', '2015-04-01 03:55:47'),
(271, 23, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:55:47', '2015-04-01 03:55:47'),
(272, 23, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:55:47', '2015-04-01 03:55:47'),
(273, 23, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:55:47', '2015-04-01 03:55:47'),
(274, 23, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:55:47', '2015-04-01 03:55:47'),
(275, 23, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:55:47', '2015-04-01 03:55:47'),
(276, 23, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:55:47', '2015-04-01 03:55:47'),
(277, 24, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:56:36', '2015-04-01 03:56:36'),
(278, 24, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:56:36', '2015-04-01 03:56:36'),
(279, 24, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:56:36', '2015-04-01 03:56:36'),
(280, 24, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:56:36', '2015-04-01 03:56:36'),
(281, 24, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:56:36', '2015-04-01 03:56:36'),
(282, 24, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:56:36', '2015-04-01 03:56:36'),
(283, 24, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:56:36', '2015-04-01 03:56:36'),
(284, 24, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:56:36', '2015-04-01 03:56:36'),
(285, 24, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:56:36', '2015-04-01 03:56:36'),
(286, 24, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:56:36', '2015-04-01 03:56:36'),
(287, 24, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:56:36', '2015-04-01 03:56:36'),
(288, 24, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:56:36', '2015-04-01 03:56:36'),
(289, 25, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:57:09', '2015-04-01 03:57:09'),
(290, 25, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:09', '2015-04-01 03:57:09'),
(291, 25, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:09', '2015-04-01 03:57:09'),
(292, 25, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:09', '2015-04-01 03:57:09'),
(293, 25, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:09', '2015-04-01 03:57:09'),
(294, 25, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:09', '2015-04-01 03:57:09'),
(295, 25, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:09', '2015-04-01 03:57:09'),
(296, 25, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:09', '2015-04-01 03:57:09'),
(297, 25, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:09', '2015-04-01 03:57:09'),
(298, 25, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:09', '2015-04-01 03:57:09'),
(299, 25, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:09', '2015-04-01 03:57:09'),
(300, 25, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:09', '2015-04-01 03:57:09'),
(301, 26, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:57:43', '2015-04-01 03:57:43'),
(302, 26, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:43', '2015-04-01 03:57:43'),
(303, 26, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:43', '2015-04-01 03:57:43'),
(304, 26, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:43', '2015-04-01 03:57:43'),
(305, 26, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:43', '2015-04-01 03:57:43'),
(306, 26, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:43', '2015-04-01 03:57:43'),
(307, 26, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:43', '2015-04-01 03:57:43'),
(308, 26, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:43', '2015-04-01 03:57:43'),
(309, 26, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:43', '2015-04-01 03:57:43'),
(310, 26, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:43', '2015-04-01 03:57:43'),
(311, 26, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:43', '2015-04-01 03:57:43'),
(312, 26, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:57:43', '2015-04-01 03:57:43'),
(313, 27, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:58:16', '2015-04-01 03:58:34'),
(314, 27, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:58:16', '2015-04-01 03:58:34'),
(315, 27, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:58:16', '2015-04-01 03:58:34'),
(316, 27, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:58:16', '2015-04-01 03:58:34'),
(317, 27, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:58:16', '2015-04-01 03:58:34'),
(318, 27, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:58:16', '2015-04-01 03:58:34'),
(319, 27, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:58:16', '2015-04-01 03:58:34'),
(320, 27, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:58:16', '2015-04-01 03:58:34'),
(321, 27, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:58:16', '2015-04-01 03:58:34'),
(322, 27, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:58:16', '2015-04-01 03:58:34'),
(323, 27, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:58:16', '2015-04-01 03:58:34'),
(324, 27, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:58:16', '2015-04-01 03:58:34'),
(325, 28, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 03:59:11', '2015-04-01 03:59:11'),
(326, 28, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:59:11', '2015-04-01 03:59:11'),
(327, 28, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:59:11', '2015-04-01 03:59:11'),
(328, 28, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:59:11', '2015-04-01 03:59:11'),
(329, 28, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:59:11', '2015-04-01 03:59:11'),
(330, 28, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:59:11', '2015-04-01 03:59:11'),
(331, 28, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:59:11', '2015-04-01 03:59:11'),
(332, 28, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:59:11', '2015-04-01 03:59:11'),
(333, 28, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:59:11', '2015-04-01 03:59:11'),
(334, 28, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:59:11', '2015-04-01 03:59:11'),
(335, 28, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:59:11', '2015-04-01 03:59:11'),
(336, 28, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 03:59:11', '2015-04-01 03:59:11'),
(337, 29, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 04:00:08', '2015-04-01 04:00:08'),
(338, 29, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:00:08', '2015-04-01 04:00:08'),
(339, 29, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:00:08', '2015-04-01 04:00:08'),
(340, 29, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:00:08', '2015-04-01 04:00:08'),
(341, 29, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:00:08', '2015-04-01 04:00:08'),
(342, 29, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:00:08', '2015-04-01 04:00:08'),
(343, 29, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:00:08', '2015-04-01 04:00:08'),
(344, 29, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:00:08', '2015-04-01 04:00:08'),
(345, 29, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:00:08', '2015-04-01 04:00:08'),
(346, 29, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:00:08', '2015-04-01 04:00:08'),
(347, 29, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:00:08', '2015-04-01 04:00:08'),
(348, 29, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:00:08', '2015-04-01 04:00:08'),
(349, 30, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 04:01:00', '2015-04-01 04:01:00'),
(350, 30, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:01:00', '2015-04-01 04:01:00'),
(351, 30, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:01:00', '2015-04-01 04:01:00'),
(352, 30, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:01:00', '2015-04-01 04:01:00'),
(353, 30, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:01:00', '2015-04-01 04:01:00'),
(354, 30, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:01:00', '2015-04-01 04:01:00'),
(355, 30, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:01:00', '2015-04-01 04:01:00'),
(356, 30, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:01:00', '2015-04-01 04:01:00'),
(357, 30, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:01:00', '2015-04-01 04:01:00'),
(358, 30, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:01:00', '2015-04-01 04:01:00'),
(359, 30, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:01:00', '2015-04-01 04:01:00'),
(360, 30, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:01:00', '2015-04-01 04:01:00'),
(361, 31, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 04:02:07', '2015-04-01 04:02:07'),
(362, 31, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:07', '2015-04-01 04:02:07'),
(363, 31, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:07', '2015-04-01 04:02:07'),
(364, 31, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:07', '2015-04-01 04:02:07'),
(365, 31, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:07', '2015-04-01 04:02:07'),
(366, 31, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:07', '2015-04-01 04:02:07'),
(367, 31, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:07', '2015-04-01 04:02:07'),
(368, 31, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:07', '2015-04-01 04:02:07'),
(369, 31, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:07', '2015-04-01 04:02:07'),
(370, 31, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:07', '2015-04-01 04:02:07'),
(371, 31, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:07', '2015-04-01 04:02:07'),
(372, 31, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:07', '2015-04-01 04:02:07'),
(373, 32, 1, 0, 1, 1, 0, 0, 4, 4, '2015-04-01 04:02:42', '2015-04-01 04:02:42'),
(374, 32, 2, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:42', '2015-04-01 04:02:42'),
(375, 32, 3, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:42', '2015-04-01 04:02:42'),
(376, 32, 4, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:42', '2015-04-01 04:02:42'),
(377, 32, 5, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:42', '2015-04-01 04:02:42'),
(378, 32, 6, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:42', '2015-04-01 04:02:42'),
(379, 32, 7, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:42', '2015-04-01 04:02:42'),
(380, 32, 8, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:42', '2015-04-01 04:02:42'),
(381, 32, 9, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:42', '2015-04-01 04:02:42'),
(382, 32, 10, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:42', '2015-04-01 04:02:42'),
(383, 32, 11, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:42', '2015-04-01 04:02:42'),
(384, 32, 12, 0, 1, 0, 0, 0, 4, 4, '2015-04-01 04:02:42', '2015-04-01 04:02:42');

--
-- Triggers `job_fee`
--
DELIMITER $$
CREATE TRIGGER `job_fee_insert` BEFORE INSERT ON `job_fee`
 FOR EACH ROW BEGIN

-- Allocate empty `fee_created` field
IF NEW.fee_created IS NULL THEN
SET NEW.fee_created = CURRENT_TIMESTAMP(), NEW.fee_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_agency`
--

CREATE TABLE `marketing_agency` (
  `agency_id` int(10) unsigned NOT NULL,
  `agency_name` varchar(100) DEFAULT NULL,
  `agency_contact_person` varchar(255) DEFAULT NULL,
  `agency_contacts` varchar(255) DEFAULT NULL,
  `agency_address` varchar(255) DEFAULT NULL,
  `agency_email` varchar(100) DEFAULT NULL,
  `agency_remarks` text,
  `agency_createdby` int(10) unsigned DEFAULT NULL,
  `agency_updatedby` int(10) unsigned DEFAULT NULL,
  `agency_created` timestamp NULL DEFAULT NULL,
  `agency_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Triggers `marketing_agency`
--
DELIMITER $$
CREATE TRIGGER `marketing_agency_insert` BEFORE INSERT ON `marketing_agency`
 FOR EACH ROW BEGIN

IF NEW.agency_created IS NULL THEN
SET NEW.agency_created = CURRENT_TIMESTAMP(), NEW.agency_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_agent`
--

CREATE TABLE `marketing_agent` (
  `agent_id` int(10) unsigned NOT NULL,
  `agent_agency` int(11) DEFAULT NULL,
  `agent_first` varchar(100) DEFAULT NULL,
  `agent_last` varchar(100) DEFAULT NULL,
  `agent_contacts` varchar(255) DEFAULT NULL,
  `agent_email` varchar(100) DEFAULT NULL,
  `agent_remarks` text,
  `agent_createdby` int(10) unsigned DEFAULT NULL,
  `agent_updatedby` int(10) unsigned DEFAULT NULL,
  `agent_created` timestamp NULL DEFAULT NULL,
  `agent_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Triggers `marketing_agent`
--
DELIMITER $$
CREATE TRIGGER `marketing_agent_insert` BEFORE INSERT ON `marketing_agent`
 FOR EACH ROW BEGIN

IF NEW.agent_created IS NULL THEN
SET NEW.agent_created = CURRENT_TIMESTAMP(), NEW.agent_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `meta`
--

CREATE TABLE `meta` (
  `meta_id` bigint(20) unsigned NOT NULL,
  `meta_parent` int(10) unsigned DEFAULT NULL,
  `meta_type` varchar(100) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meta`
--

INSERT INTO `meta` (`meta_id`, `meta_parent`, `meta_type`, `meta_key`, `meta_value`) VALUES
(1, 0, 'fee', 'dollar-exchange', '40');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` int(11) NOT NULL,
  `option_name` varchar(160) NOT NULL,
  `option_value` varchar(160) NOT NULL,
  `option_remarks` varchar(500) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `option_name`, `option_value`, `option_remarks`, `updated_at`, `created_at`, `deleted_at`) VALUES
(1, 'tax - single', '18', 'This is on Percent', '2015-01-07 11:45:55', '2015-01-07 11:45:55', '0000-00-00 00:00:00'),
(2, 'tax - married', '17', 'This is on Percent', '2015-01-07 11:45:55', '2015-01-07 11:45:55', '0000-00-00 00:00:00'),
(3, 'tax - Single w/ 1 Dependent', '16', 'This is on Percent', '2015-01-07 11:45:55', '2015-01-07 11:45:55', '0000-00-00 00:00:00'),
(4, 'tax - Single w/ 2 Dependents', '15', 'This is on Percent', '2015-01-07 11:45:55', '2015-01-07 11:45:55', '0000-00-00 00:00:00'),
(5, 'tax - Single w/ 3 Dependents', '14', 'This is on Percent', '2015-01-07 11:45:55', '2015-01-07 11:45:55', '0000-00-00 00:00:00'),
(6, 'tax - Single w/ 4 Dependents', '13', 'This is on Percent', '2015-01-07 11:45:55', '2015-01-07 11:45:55', '0000-00-00 00:00:00'),
(7, 'tax - Married w/ 1 Dependents', '15', 'This is on Percent', '2015-01-07 11:45:55', '2015-01-07 11:45:55', '0000-00-00 00:00:00'),
(8, 'tax - Married w/ 2 Dependents', '14', 'This is on Percent', '2015-01-07 11:45:55', '2015-01-07 11:45:55', '0000-00-00 00:00:00'),
(9, 'tax - Married w/ 3 Dependents', '13', 'This is on Percent', '2015-01-07 11:45:55', '2015-01-07 11:45:55', '0000-00-00 00:00:00'),
(10, 'tax - Married w/ 4 Dependents', '12', 'This is on Percent', '2015-01-07 11:45:55', '2015-01-07 11:45:55', '0000-00-00 00:00:00'),
(11, 'withholding_tax', '1', 'value must be 1 or 2. if 1(withholding tax deduct on first cutoff and other deductions (like sss,pag-ibig,philhealth) on second cutoff)', '2015-01-07 11:45:55', '2015-01-07 11:45:55', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `or`
--

CREATE TABLE `or` (
  `or_id` bigint(20) unsigned NOT NULL,
  `or_number` varchar(255) DEFAULT NULL,
  `or_amount` float unsigned DEFAULT NULL,
  `or_employer` int(10) unsigned DEFAULT NULL,
  `or_applicant` int(10) unsigned DEFAULT NULL,
  `or_status` int(10) unsigned DEFAULT '0',
  `or_approvedby` int(10) unsigned DEFAULT '0',
  `or_remarks` text,
  `or_date` date DEFAULT NULL,
  `or_createdby` int(10) unsigned DEFAULT NULL,
  `or_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Triggers `or`
--
DELIMITER $$
CREATE TRIGGER `or_insert` BEFORE INSERT ON `or`
 FOR EACH ROW BEGIN

IF NEW.or_created IS NULL THEN
SET NEW.or_created = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `paidall_employer_applicants`
--

CREATE TABLE `paidall_employer_applicants` (
  `paidall_id` int(10) unsigned NOT NULL,
  `paidall_or` varchar(255) DEFAULT NULL,
  `paidall_bill` int(10) unsigned DEFAULT NULL,
  `paidall_employer` int(10) unsigned DEFAULT NULL,
  `paidall_applicant` int(10) unsigned DEFAULT NULL,
  `paidall_amount` float unsigned DEFAULT NULL,
  `paidall_paid` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_employer_detail`
--

CREATE TABLE `payment_employer_detail` (
  `detail_id` bigint(20) unsigned NOT NULL,
  `detail_payment` int(10) unsigned DEFAULT '0',
  `detail_bill` int(10) unsigned DEFAULT '0',
  `detail_or` varchar(255) DEFAULT NULL,
  `detail_employer` int(10) unsigned DEFAULT '0',
  `detail_applicant` int(10) unsigned DEFAULT '0',
  `detail_fee` int(10) unsigned DEFAULT '0',
  `detail_amount` float unsigned DEFAULT '0',
  `detail_balance` float unsigned DEFAULT '0',
  `detail_createdby` int(10) unsigned DEFAULT '0',
  `detail_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Triggers `payment_employer_detail`
--
DELIMITER $$
CREATE TRIGGER `payment_employer_detail_insert` BEFORE INSERT ON `payment_employer_detail`
 FOR EACH ROW BEGIN

IF NEW.detail_created IS NULL THEN
SET NEW.detail_created = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_recruitment`
--

CREATE TABLE `payment_recruitment` (
  `payment_id` bigint(20) unsigned NOT NULL,
  `payment_or` varchar(255) DEFAULT NULL,
  `payment_applicant` int(10) unsigned DEFAULT '0',
  `payment_agent` int(10) unsigned DEFAULT '0',
  `payment_amount` float unsigned DEFAULT '0',
  `payment_bill` int(10) unsigned DEFAULT '0',
  `payment_createdby` int(10) unsigned DEFAULT '0',
  `payment_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `payment_recruitment`
--
DELIMITER $$
CREATE TRIGGER `payment_recruitment_insert` BEFORE INSERT ON `payment_recruitment`
 FOR EACH ROW BEGIN

IF NEW.payment_created IS NULL THEN
SET NEW.payment_created = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_worker_detail`
--

CREATE TABLE `payment_worker_detail` (
  `detail_id` bigint(20) unsigned NOT NULL,
  `detail_payment` int(10) unsigned DEFAULT NULL,
  `detail_bill` int(10) unsigned DEFAULT '0',
  `detail_or` varchar(255) DEFAULT NULL,
  `detail_applicant` int(10) unsigned DEFAULT '0',
  `detail_fee` int(10) unsigned DEFAULT '0',
  `detail_amount` float unsigned DEFAULT '0',
  `detail_balance` float unsigned DEFAULT '0' COMMENT 'optional',
  `detail_createdby` int(10) unsigned DEFAULT '0',
  `detail_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Triggers `payment_worker_detail`
--
DELIMITER $$
CREATE TRIGGER `payment_employer_detail_insert_copy` BEFORE INSERT ON `payment_worker_detail`
 FOR EACH ROW BEGIN

IF NEW.detail_created IS NULL THEN
SET NEW.detail_created = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int(10) unsigned NOT NULL,
  `position_name` varchar(255) NOT NULL,
  `position_type` varchar(10) DEFAULT NULL COMMENT '''Household'', ''Skilled''',
  `position_status` int(10) unsigned DEFAULT '0' COMMENT '0 = Inactive, 1 = Active',
  `position_createdby` int(10) unsigned DEFAULT NULL,
  `position_updatedby` int(10) unsigned DEFAULT NULL,
  `position_created` timestamp NULL DEFAULT NULL,
  `position_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`position_id`, `position_name`, `position_type`, `position_status`, `position_createdby`, `position_updatedby`, `position_created`, `position_updated`) VALUES
(1, 'WEB DEVELOPER', NULL, 1, 1, 1, '2015-03-26 16:39:18', '2015-03-26 16:39:18'),
(2, 'DOMESTIC HELPER', NULL, 1, 4, 4, '2015-03-28 00:14:10', '2015-03-28 00:14:10'),
(3, 'FEMALE CLEANER', NULL, 1, 4, 4, '2015-03-28 00:18:39', '2015-03-28 00:18:39'),
(4, 'MALE CLEANER', NULL, 1, 4, 4, '2015-03-28 00:18:54', '2015-03-28 00:18:54'),
(5, 'STAFF NURSE', NULL, 1, 4, 4, '2015-03-28 00:19:28', '2015-03-28 00:19:28'),
(6, 'WAITER', NULL, 1, 4, 4, '2015-03-28 00:21:35', '2015-03-28 00:21:35'),
(7, 'TRUCK DRIVER', NULL, 1, 4, 4, '2015-03-28 00:24:13', '2015-03-28 00:24:13'),
(8, 'COMPANY DRIVER', NULL, 1, 4, 4, '2015-03-28 00:24:30', '2015-03-28 00:24:30'),
(9, 'WAITRESS', NULL, 1, 4, 4, '2015-03-28 00:25:56', '2015-03-28 00:25:56'),
(10, 'FRONT DESK', NULL, 1, 4, 4, '2015-03-29 04:08:51', '2015-03-29 04:08:51'),
(11, 'CHEF', NULL, 1, 4, 4, '2015-03-29 04:14:04', '2015-03-29 04:14:04'),
(12, 'ASSISTANT CHEF', NULL, 1, 4, 4, '2015-03-29 04:14:37', '2015-03-29 04:14:37'),
(13, 'HOUSEKEEPING', NULL, 1, 4, 4, '2015-03-29 04:18:38', '2015-03-29 04:18:38'),
(14, 'WAITRESS', NULL, 1, 4, 4, '2015-03-29 04:19:31', '2015-03-29 04:19:31'),
(15, 'GARDENER', NULL, 1, 4, 4, '2015-03-29 04:22:11', '2015-03-29 04:22:11'),
(16, 'COMPANY DRIVER W/GCC', NULL, 1, 4, 4, '2015-03-29 04:32:47', '2015-03-29 04:32:47'),
(17, 'CASHIER', NULL, 1, 4, 4, '2015-03-29 04:41:00', '2015-03-29 04:41:00'),
(18, 'ACCOUNTANT', NULL, 1, 4, 4, '2015-03-29 04:41:41', '2015-03-29 04:41:41'),
(19, 'AIRCON TECH', NULL, 1, 4, 4, '2015-03-29 04:43:00', '2015-03-29 04:43:00'),
(20, 'SECRETARY', NULL, 1, 4, 4, '2015-03-29 04:45:15', '2015-03-29 04:45:15'),
(21, 'NAIL ARTIST', NULL, 1, 4, 4, '2015-03-29 04:46:00', '2015-03-29 04:46:00'),
(22, 'BEAUTICIAN (ALL AROUND)', NULL, 1, 4, 4, '2015-03-29 04:47:08', '2015-03-29 04:47:08'),
(23, 'CHEF', NULL, 1, 4, 4, '2015-04-01 04:11:16', '2015-04-01 04:11:16'),
(24, 'ASSISTANT CHEF', NULL, 1, 4, 4, '2015-04-01 04:11:33', '2015-04-01 04:11:33'),
(25, 'HOUSEKEEPING', NULL, 1, 4, 4, '2015-04-01 04:13:39', '2015-04-01 04:13:39'),
(26, 'WAITRESS', NULL, 1, 4, 4, '2015-04-01 04:14:22', '2015-04-01 04:14:22'),
(27, 'WAITER', NULL, 1, 4, 4, '2015-04-01 04:14:37', '2015-04-01 04:14:37');

--
-- Triggers `position`
--
DELIMITER $$
CREATE TRIGGER `position_insert` BEFORE INSERT ON `position`
 FOR EACH ROW BEGIN

IF NEW.position_created IS NULL THEN
SET NEW.position_created = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_agent`
--

CREATE TABLE `recruitment_agent` (
  `agent_id` int(10) unsigned NOT NULL,
  `agent_first` varchar(100) DEFAULT NULL,
  `agent_last` varchar(100) DEFAULT NULL,
  `agent_contacts` varchar(255) DEFAULT NULL,
  `agent_email` varchar(100) DEFAULT NULL,
  `agent_remarks` text,
  `agent_createdby` int(10) unsigned DEFAULT NULL,
  `agent_updatedby` int(10) unsigned DEFAULT NULL,
  `agent_created` timestamp NULL DEFAULT NULL,
  `agent_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Triggers `recruitment_agent`
--
DELIMITER $$
CREATE TRIGGER `marketing_agent_insert_copy` BEFORE INSERT ON `recruitment_agent`
 FOR EACH ROW BEGIN

IF NEW.agent_created IS NULL THEN
SET NEW.agent_created = CURRENT_TIMESTAMP(), NEW.agent_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `salary_transactions`
--

CREATE TABLE `salary_transactions` (
  `salary_transaction_id` int(11) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `applicant_fullname` varchar(500) NOT NULL,
  `basic_pay` varchar(50) NOT NULL,
  `total_deduction` varchar(500) NOT NULL,
  `total_allowance` varchar(500) NOT NULL,
  `total_miscellaneous` varchar(500) NOT NULL,
  `tax` varchar(500) NOT NULL,
  `net_income` varchar(500) NOT NULL,
  `salary_date` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_fullname` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_type` int(10) unsigned DEFAULT '0' COMMENT '1=Encoder, 2=Accounting, 3=Admin, 4=Super Admin, 5 = Employer, 6=Processing, 7=Recruitment',
  `user_status` int(10) unsigned DEFAULT NULL,
  `user_remarks` text,
  `user_lastlogin` timestamp NULL DEFAULT NULL,
  `user_createdby` int(10) unsigned DEFAULT NULL,
  `user_updatedby` int(10) unsigned DEFAULT NULL,
  `user_created` timestamp NULL DEFAULT NULL,
  `user_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `user_fullname`, `user_email`, `user_type`, `user_status`, `user_remarks`, `user_lastlogin`, `user_createdby`, `user_updatedby`, `user_created`, `user_updated`) VALUES
(1, 'brittle007', 'ac873fa11f1cd5abc102906508e70078', 'Klem Quiñones', 'clemquinones@gmail.com', 4, 1, NULL, '2015-04-15 09:33:56', 0, 0, '2014-10-04 06:22:29', '2015-04-15 09:33:56'),
(2, 'administrator', '816c22a885a6a91908f07eb16296c500', 'Administrator', 'admin@domain.com', 3, 1, '', '2015-03-17 20:46:48', 1, 1, '2015-01-31 05:51:41', '2015-03-17 23:46:48'),
(3, 'maybank', 'c537b8de5bf4199068aa56b01b209885', 'Maybank', '', 5, 1, NULL, '2015-04-08 22:25:44', 1, 1, '2015-03-26 06:54:05', '2015-04-08 08:25:44'),
(4, 'superadmin', '49eb2faa22423a848a9ec21a4029f4af', 'Super Admin', 'superadmin@yahoo.com', 4, 1, '', '2015-04-08 18:40:27', 1, 1, '2015-03-26 22:08:39', '2015-04-08 04:40:27'),
(5, 'jessa', 'b4a9ce3b76012fe1a792423417d9aa21', 'Jessa', 'info@stepupmanpower.com', 6, 1, '', '2015-03-30 22:56:46', 4, 4, '2015-03-28 21:31:44', '2015-03-30 08:56:46'),
(6, 'mark', 'e0b1dbee90e5a4443411676dfff119b5', 'Mark', 'info@stepupmanpower.com', 1, 1, '', '2015-04-01 18:16:02', 4, 4, '2015-03-31 00:02:01', '2015-04-01 04:16:02'),
(7, 'palau', '63c52c2f65c01fcb7bccac35aeee7cb6', 'PALAU', '', 5, 1, NULL, NULL, 4, 4, '2015-03-31 19:19:46', '2015-03-31 19:19:46'),
(8, 'adonis', 'b019672a89fc8bba6aa36d00210bdad1', 'ADONIS', 'EMPLOYERSAUDI@YAHOO.COM', 5, 1, NULL, NULL, 4, 4, '2015-03-31 21:46:25', '2015-03-31 21:46:25'),
(9, 'dubai', 'b391a68cdbea738a8f0c50fff4f69a51', 'Mr. Dubai', 'Dubai@dubai.com', 5, 1, NULL, NULL, 4, 4, '2015-04-01 03:20:00', '2015-04-01 03:20:00'),
(10, 'oman', 'a1f35c5dbc2660e957343f60655ba62a', 'Mr. Oman', 'Oman@oman.com', 5, 1, NULL, NULL, 4, 4, '2015-04-01 03:22:06', '2015-04-01 03:22:06'),
(11, 'qatar', 'f87b867b4e6d028e2766f227e66c3449', 'Mr. Qatar', 'qatar@qatar.com', 5, 1, NULL, NULL, 4, 4, '2015-04-01 03:23:54', '2015-04-01 03:23:54'),
(12, 'jordan', 'b36eadcdc83d9941da37071ac376bac4', 'Mr. Jordan', 'jordan@jordan.com', 5, 1, NULL, NULL, 4, 4, '2015-04-01 03:36:53', '2015-04-01 03:36:53'),
(13, 'hk', 'f5dac946fa65a00ff42a4ec2555fee2f', 'Mr. HK', 'hk@hk.com', 5, 1, NULL, NULL, 4, 4, '2015-04-01 21:13:26', '2015-04-01 21:13:26'),
(14, 'mr phil', 'ac1c77136fc07b9dde33a70179c5934e', 'MR PHIL', '', 5, 1, NULL, NULL, 4, 4, '2015-04-01 21:14:53', '2015-04-01 21:14:53');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `user_insert` BEFORE INSERT ON `user`
 FOR EACH ROW BEGIN

-- Allocate empty `user_created` field
IF NEW.user_created IS NULL THEN
SET NEW.user_created = CURRENT_TIMESTAMP(), NEW.user_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `type_id` int(10) unsigned NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `type_status` int(10) unsigned DEFAULT '1',
  `type_color` varchar(10) DEFAULT NULL,
  `type_createdby` int(10) unsigned DEFAULT NULL,
  `type_updatedby` int(10) unsigned DEFAULT NULL,
  `type_created` timestamp NULL DEFAULT NULL,
  `type_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`type_id`, `type_name`, `type_status`, `type_color`, `type_createdby`, `type_updatedby`, `type_created`, `type_updated`) VALUES
(1, 'Encoder', 1, 'default', 1, 1, '2014-10-15 09:59:41', '2014-10-28 06:28:26'),
(2, 'Accounting (Staff)', 1, 'info', 1, 1, '2014-10-15 09:59:42', '2014-11-27 10:03:30'),
(3, 'Administrator', 1, 'success', 1, 1, '2014-10-15 09:59:43', '2014-10-28 06:28:31'),
(4, 'Super Administrator', 1, 'danger', 1, 1, '2014-10-15 09:59:44', '2014-10-28 06:28:36'),
(5, 'Employer', 1, 'default', 1, 1, '2014-10-15 09:59:45', '2014-10-28 06:28:39'),
(6, 'Processing', 1, 'primary', 1, 1, '2014-10-15 10:01:57', '2014-10-28 06:28:42'),
(7, 'Recruitment', 1, 'primary', 1, 1, '2014-10-15 10:02:02', '2014-10-28 06:28:47'),
(8, 'Accounting (Head)', 1, 'info', 1, 1, '2014-11-27 10:03:44', '2014-11-27 10:03:44');

--
-- Triggers `user_types`
--
DELIMITER $$
CREATE TRIGGER `user_type_insert` BEFORE INSERT ON `user_types`
 FOR EACH ROW BEGIN

-- Allocate empty `user_created` field
IF NEW.type_created IS NULL THEN
SET NEW.type_created = CURRENT_TIMESTAMP(), NEW.type_updated = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `voucher_id` bigint(20) unsigned NOT NULL,
  `voucher_number` varchar(255) DEFAULT NULL,
  `voucher_check` varchar(255) DEFAULT NULL,
  `voucher_amount` float unsigned DEFAULT NULL,
  `voucher_marketing_agency` int(10) unsigned DEFAULT NULL,
  `voucher_marketing_agent` int(10) unsigned DEFAULT NULL,
  `voucher_recruitment_agent` int(10) unsigned DEFAULT NULL,
  `voucher_employer` int(10) unsigned DEFAULT NULL,
  `voucher_applicant` int(10) unsigned DEFAULT NULL,
  `voucher_status` int(10) unsigned DEFAULT '0',
  `voucher_approvedby` int(10) unsigned DEFAULT NULL,
  `voucher_remarks` text,
  `voucher_date` date DEFAULT NULL,
  `voucher_createdby` int(10) unsigned DEFAULT NULL,
  `voucher_created` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Triggers `voucher`
--
DELIMITER $$
CREATE TRIGGER `voucher_insert` BEFORE INSERT ON `voucher`
 FOR EACH ROW BEGIN

IF NEW.voucher_created IS NULL THEN
SET NEW.voucher_created = CURRENT_TIMESTAMP();
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `applicants_logs_view`
--
DROP TABLE IF EXISTS `applicants_logs_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `applicants_logs_view` AS select `log`.`log_id` AS `log_id`,`log`.`log_applicant` AS `log_applicant`,`log`.`log_employer` AS `log_employer`,`log`.`log_status` AS `log_status`,`log`.`log_country` AS `log_country`,`log`.`log_date` AS `log_date`,`log`.`log_remarks` AS `log_remarks`,`log`.`log_createdby` AS `log_createdby`,`log`.`log_created` AS `log_created`,`c`.`country_id` AS `country_id`,`c`.`country_name` AS `country_name`,`c`.`country_code` AS `country_code`,`c`.`country_abbr` AS `country_abbr`,`e`.`employer_id` AS `employer_id`,`e`.`employer_user` AS `employer_user`,`e`.`employer_source_agency` AS `employer_source_agency`,`e`.`employer_source_agent` AS `employer_source_agent`,`e`.`employer_no` AS `employer_no`,`e`.`employer_name` AS `employer_name`,`e`.`employer_contact_person` AS `employer_contact_person`,`e`.`employer_contact` AS `employer_contact`,`e`.`employer_email` AS `employer_email`,`e`.`employer_address` AS `employer_address`,`e`.`employer_country` AS `employer_country`,`e`.`employer_remarks` AS `employer_remarks`,`u`.`user_id` AS `user_id`,`u`.`user_name` AS `user_name`,`u`.`user_password` AS `user_password`,`u`.`user_fullname` AS `user_fullname`,`u`.`user_email` AS `user_email`,`u`.`user_type` AS `user_type`,`u`.`user_status` AS `user_status`,`u`.`user_updated` AS `user_updated`,`a`.`applicant_id` AS `applicant_id`,`a`.`applicant_first` AS `applicant_first`,`a`.`applicant_middle` AS `applicant_middle`,`a`.`applicant_last` AS `applicant_last`,concat(`a`.`applicant_first`,' ',`a`.`applicant_middle`,' ',`a`.`applicant_last`) AS `applicant_name`,`a`.`applicant_suffix` AS `applicant_suffix`,`a`.`applicant_birthdate` AS `applicant_birthdate`,`a`.`applicant_age` AS `applicant_age`,`a`.`applicant_gender` AS `applicant_gender`,`a`.`applicant_contacts` AS `applicant_contacts`,`a`.`applicant_address` AS `applicant_address`,`a`.`applicant_email` AS `applicant_email`,`a`.`applicant_nationality` AS `applicant_nationality`,`a`.`applicant_civil_status` AS `applicant_civil_status`,`a`.`applicant_religion` AS `applicant_religion`,`a`.`applicant_languages` AS `applicant_languages`,`a`.`applicant_height` AS `applicant_height`,`a`.`applicant_weight` AS `applicant_weight`,`a`.`applicant_position_type` AS `applicant_position_type`,`a`.`applicant_preferred_position` AS `applicant_preferred_position`,`a`.`applicant_expected_salary` AS `applicant_expected_salary`,`a`.`applicant_preferred_country` AS `applicant_preferred_country`,`a`.`applicant_other_skills` AS `applicant_other_skills`,`a`.`applicant_cv` AS `applicant_cv`,`a`.`applicant_photo` AS `applicant_photo`,`a`.`applicant_status` AS `applicant_status`,`a`.`applicant_source` AS `applicant_source`,`a`.`applicant_remarks` AS `applicant_remarks`,`a`.`applicant_date_applied` AS `applicant_date_applied`,`a`.`applicant_employer` AS `applicant_employer`,`a`.`applicant_job` AS `applicant_job`,`a`.`applicant_slug` AS `applicant_slug`,`e`.`employer_slug` AS `employer_slug` from ((((`applicant_log` `log` join `applicant` `a` on((`a`.`applicant_id` = `log`.`log_applicant`))) left join `user` `u` on((`u`.`user_id` = `log`.`log_createdby`))) left join `employer` `e` on((`e`.`employer_id` = `log`.`log_employer`))) left join `country` `c` on((`c`.`country_id` = `log`.`log_country`))) order by `log`.`log_date` desc,`log`.`log_created` desc,`log`.`log_createdby` desc;

-- --------------------------------------------------------

--
-- Structure for view `applicant_view`
--
DROP TABLE IF EXISTS `applicant_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY INVOKER VIEW `applicant_view` AS select `a`.`applicant_id` AS `applicant_id`,`a`.`applicant_first` AS `applicant_first`,`a`.`applicant_middle` AS `applicant_middle`,`a`.`applicant_last` AS `applicant_last`,concat(`a`.`applicant_first`,' ',`a`.`applicant_middle`,' ',`a`.`applicant_last`) AS `applicant_name`,`a`.`applicant_suffix` AS `applicant_suffix`,`a`.`applicant_birthdate` AS `applicant_birthdate`,`a`.`applicant_age` AS `applicant_age`,`a`.`applicant_gender` AS `applicant_gender`,`a`.`applicant_contacts` AS `applicant_contacts`,`a`.`applicant_address` AS `applicant_address`,`a`.`applicant_email` AS `applicant_email`,`a`.`applicant_nationality` AS `applicant_nationality`,`a`.`applicant_civil_status` AS `applicant_civil_status`,`a`.`applicant_religion` AS `applicant_religion`,`a`.`applicant_languages` AS `applicant_languages`,`a`.`applicant_height` AS `applicant_height`,`a`.`applicant_weight` AS `applicant_weight`,`a`.`applicant_position_type` AS `applicant_position_type`,`a`.`applicant_preferred_position` AS `applicant_preferred_position`,`a`.`applicant_expected_salary` AS `applicant_expected_salary`,`a`.`applicant_preferred_country` AS `applicant_preferred_country`,`a`.`applicant_other_skills` AS `applicant_other_skills`,`a`.`applicant_cv` AS `applicant_cv`,`a`.`applicant_photo` AS `applicant_photo`,`a`.`applicant_status` AS `applicant_status`,`a`.`applicant_source` AS `applicant_source`,`a`.`applicant_remarks` AS `applicant_remarks`,`a`.`applicant_date_applied` AS `applicant_date_applied`,`a`.`applicant_createdby` AS `applicant_createdby`,`a`.`applicant_updatedby` AS `applicant_updatedby`,`a`.`applicant_created` AS `applicant_created`,`a`.`applicant_updated` AS `applicant_updated`,`ae`.`education_id` AS `education_id`,`ae`.`education_applicant` AS `education_applicant`,`ae`.`education_mba` AS `education_mba`,`ae`.`education_mba_course` AS `education_mba_course`,`ae`.`education_mba_year` AS `education_mba_year`,`ae`.`education_college` AS `education_college`,`ae`.`education_college_skills` AS `education_college_skills`,`ae`.`education_college_year` AS `education_college_year`,`ae`.`education_others` AS `education_others`,`ae`.`education_others_year` AS `education_others_year`,`ae`.`education_highschool` AS `education_highschool`,`ae`.`education_highschool_year` AS `education_highschool_year`,`ap`.`passport_id` AS `passport_id`,`ap`.`passport_applicant` AS `passport_applicant`,`ap`.`passport_number` AS `passport_number`,`ap`.`passport_expiration` AS `passport_expiration`,`ap`.`passport_visible` AS `passport_visible`,`ac`.`certificate_id` AS `certificate_id`,`ac`.`certificate_applicant` AS `certificate_applicant`,`ac`.`certificate_tesda` AS `certificate_tesda`,`ac`.`certificate_info_sheet` AS `certificate_info_sheet`,`ac`.`certificate_authenticated` AS `certificate_authenticated`,`ac`.`certificate_authenticated_nbi` AS `certificate_authenticated_nbi`,`ac`.`certificate_insurance` AS `certificate_insurance`,`ac`.`certificate_medical_clinic` AS `certificate_medical_clinic`,`ac`.`certificate_medical_exam_date` AS `certificate_medical_exam_date`,`ac`.`certificate_medical_result` AS `certificate_medical_result`,`ac`.`certificate_medical_remarks` AS `certificate_medical_remarks`,`ac`.`certificate_medical_expiration` AS `certificate_medical_expiration`,`ac`.`certificate_pdos` AS `certificate_pdos`,`ac`.`certificate_pt_result` AS `certificate_pt_result`,`ac`.`certificate_pt_result_date` AS `certificate_pt_result_date`,`ac`.`certificate_philhealth` AS `certificate_philhealth`,`ac`.`certificate_m1b` AS `certificate_m1b`,`ar`.`requirement_id` AS `requirement_id`,`ar`.`requirement_applicant` AS `requirement_applicant`,`ar`.`requirement_visa` AS `requirement_visa`,`ar`.`requirement_visa_date` AS `requirement_visa_date`,`ar`.`requirement_visa_release_date` AS `requirement_visa_release_date`,`ar`.`requirement_visa_expiration` AS `requirement_visa_expiration`,`ar`.`requirement_oec_number` AS `requirement_oec_number`,`ar`.`requirement_oec_submission_date` AS `requirement_oec_submission_date`,`ar`.`requirement_oec_release_date` AS `requirement_oec_release_date`,`ar`.`requirement_owwa_certificate` AS `requirement_owwa_certificate`,`ar`.`requirement_owwa_schedule` AS `requirement_owwa_schedule`,`ar`.`requirement_contract` AS `requirement_contract`,`ar`.`requirement_mofa` AS `requirement_mofa`,`ar`.`requirement_job_offer` AS `requirement_job_offer`,`p`.`position_id` AS `position_id`,`p`.`position_name` AS `position_name`,`c`.`country_id` AS `country_id`,`c`.`country_name` AS `country_name`,`c`.`country_code` AS `country_code`,`c`.`country_abbr` AS `country_abbr`,`ra`.`agent_id` AS `agent_id`,`ra`.`agent_first` AS `agent_first`,`ra`.`agent_last` AS `agent_last`,`ar`.`requirement_remarks` AS `requirement_remarks`,`ar`.`requirement_school_records` AS `requirement_school_records`,`ar`.`requirement_coe` AS `requirement_coe`,`ar`.`requirement_picture_status` AS `requirement_picture_status`,`ar`.`requirement_trade_test` AS `requirement_trade_test`,`j`.`job_id` AS `job_id`,`j`.`job_employer` AS `job_employer`,`j`.`job_position` AS `job_position`,`j`.`job_gender` AS `job_gender`,`j`.`job_salary` AS `job_salary`,`j`.`job_total` AS `job_total`,`j`.`job_occupied` AS `job_occupied`,`j`.`job_name` AS `job_name`,`j`.`job_content` AS `job_content`,`j`.`job_status` AS `job_status`,`j`.`job_remarks` AS `job_remarks`,`u`.`user_id` AS `user_id`,`u`.`user_name` AS `user_name`,`u`.`user_password` AS `user_password`,`u`.`user_fullname` AS `user_fullname`,`u`.`user_email` AS `user_email`,`u`.`user_type` AS `user_type`,`u`.`user_status` AS `user_status`,`u`.`user_lastlogin` AS `user_lastlogin`,`a`.`applicant_slug` AS `applicant_slug`,`a`.`applicant_employer` AS `applicant_employer`,`a`.`applicant_job` AS `applicant_job`,`j`.`job_revenue` AS `job_revenue`,`e`.`employer_id` AS `employer_id`,`e`.`employer_user` AS `employer_user`,`e`.`employer_no` AS `employer_no`,`e`.`employer_name` AS `employer_name`,`e`.`employer_remarks` AS `employer_remarks`,`e`.`employer_contact_person` AS `employer_contact_person`,`e`.`employer_contact` AS `employer_contact`,`e`.`employer_email` AS `employer_email`,`e`.`employer_address` AS `employer_address`,`e`.`employer_country` AS `employer_country`,`e`.`employer_source_agency` AS `employer_source_agency`,`e`.`employer_source_agent` AS `employer_source_agent`,`e`.`employer_agency_commission` AS `employer_agency_commission`,`e`.`employer_agent_commission` AS `employer_agent_commission`,`ar`.`requirement_offer_salary` AS `requirement_offer_salary`,`ar`.`requirement_ticket` AS `requirement_ticket`,`ap`.`passport_issue_place` AS `passport_issue_place`,`ap`.`passport_issue` AS `passport_issue`,`a`.`applicant_paid` AS `applicant_paid` from ((((((((((`applicant` `a` left join `applicant_education` `ae` on((`ae`.`education_applicant` = `a`.`applicant_id`))) left join `applicant_passport` `ap` on((`ap`.`passport_applicant` = `a`.`applicant_id`))) left join `applicant_certificate` `ac` on((`ac`.`certificate_applicant` = `a`.`applicant_id`))) left join `applicant_requirement` `ar` on((`ar`.`requirement_applicant` = `a`.`applicant_id`))) left join `position` `p` on((`p`.`position_id` = `a`.`applicant_preferred_position`))) left join `country` `c` on((`c`.`country_id` = `a`.`applicant_preferred_country`))) left join `recruitment_agent` `ra` on((`ra`.`agent_id` = `a`.`applicant_source`))) left join `job` `j` on((`ar`.`requirement_job_offer` = `j`.`job_id`))) left join `user` `u` on((`a`.`applicant_updatedby` = `u`.`user_id`))) left join `employer` `e` on((`a`.`applicant_employer` = `e`.`employer_id`)));

-- --------------------------------------------------------

--
-- Structure for view `billing_employer_view`
--
DROP TABLE IF EXISTS `billing_employer_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `billing_employer_view` AS select `b`.`bill_id` AS `bill_id`,`b`.`bill_employer` AS `bill_employer`,`b`.`bill_applicant` AS `bill_applicant`,`b`.`bill_amount` AS `bill_amount`,`b`.`bill_employer_cost` AS `bill_employer_cost`,`b`.`bill_applicant_cost` AS `bill_applicant_cost`,`b`.`bill_employer_deposit` AS `bill_employer_deposit`,`b`.`bill_applicant_deposit` AS `bill_applicant_deposit`,`b`.`bill_status` AS `bill_status`,`b`.`bill_remarks` AS `bill_remarks`,`b`.`bill_createdby` AS `bill_createdby`,`b`.`bill_updatedby` AS `bill_updatedby`,`b`.`bill_created` AS `bill_created`,`b`.`bill_updated` AS `bill_updated`,`e`.`employer_id` AS `employer_id`,`e`.`employer_user` AS `employer_user`,`e`.`employer_no` AS `employer_no`,`e`.`employer_name` AS `employer_name`,`e`.`employer_remarks` AS `employer_remarks`,`e`.`employer_contact_person` AS `employer_contact_person`,`e`.`employer_contact` AS `employer_contact`,`e`.`employer_email` AS `employer_email`,`e`.`employer_address` AS `employer_address`,`e`.`employer_country` AS `employer_country`,`e`.`employer_source_agency` AS `employer_source_agency`,`e`.`employer_source_agent` AS `employer_source_agent`,`e`.`employer_agency_commission` AS `employer_agency_commission`,`e`.`employer_agent_commission` AS `employer_agent_commission`,`e`.`employer_agency_commission_from` AS `employer_agency_commission_from`,`e`.`employer_agent_commission_from` AS `employer_agent_commission_from`,`e`.`employer_slug` AS `employer_slug`,`e`.`employer_createdby` AS `employer_createdby`,`e`.`employer_updatedby` AS `employer_updatedby`,`e`.`employer_created` AS `employer_created`,`e`.`employer_updated` AS `employer_updated`,sum(`b`.`bill_employer_cost`) AS `amount`,sum(`b`.`bill_employer_deposit`) AS `debit`,sum((`b`.`bill_employer_cost` - `b`.`bill_employer_deposit`)) AS `credit`,count(`b`.`bill_applicant`) AS `applicants` from (`bill` `b` join `employer` `e` on((`b`.`bill_employer` = `e`.`employer_id`))) group by `b`.`bill_employer`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applicant`
--
ALTER TABLE `applicant`
  ADD PRIMARY KEY (`applicant_id`);

--
-- Indexes for table `applicant_certificate`
--
ALTER TABLE `applicant_certificate`
  ADD PRIMARY KEY (`certificate_id`);

--
-- Indexes for table `applicant_education`
--
ALTER TABLE `applicant_education`
  ADD PRIMARY KEY (`education_id`);

--
-- Indexes for table `applicant_experiences`
--
ALTER TABLE `applicant_experiences`
  ADD PRIMARY KEY (`experience_id`);

--
-- Indexes for table `applicant_files`
--
ALTER TABLE `applicant_files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `applicant_log`
--
ALTER TABLE `applicant_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `applicant_passport`
--
ALTER TABLE `applicant_passport`
  ADD PRIMARY KEY (`passport_id`);

--
-- Indexes for table `applicant_preferred_countries`
--
ALTER TABLE `applicant_preferred_countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `applicant_preferred_positions`
--
ALTER TABLE `applicant_preferred_positions`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `applicant_requirement`
--
ALTER TABLE `applicant_requirement`
  ADD PRIMARY KEY (`requirement_id`);

--
-- Indexes for table `applicant_salary`
--
ALTER TABLE `applicant_salary`
  ADD PRIMARY KEY (`applicant_salary_id`);

--
-- Indexes for table `applicant_salary_record`
--
ALTER TABLE `applicant_salary_record`
  ADD PRIMARY KEY (`applicant_salary_record_id`);

--
-- Indexes for table `applicant_skills`
--
ALTER TABLE `applicant_skills`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `archive_applicant`
--
ALTER TABLE `archive_applicant`
  ADD PRIMARY KEY (`applicant_id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`detail_id`);

--
-- Indexes for table `bill_payment_applicant`
--
ALTER TABLE `bill_payment_applicant`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `bill_payment_employer`
--
ALTER TABLE `bill_payment_employer`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `category_positions`
--
ALTER TABLE `category_positions`
  ADD PRIMARY KEY (`rel_id`);

--
-- Indexes for table `commission_marketing_agency`
--
ALTER TABLE `commission_marketing_agency`
  ADD PRIMARY KEY (`commission_id`);

--
-- Indexes for table `commission_marketing_agent`
--
ALTER TABLE `commission_marketing_agent`
  ADD PRIMARY KEY (`commission_id`);

--
-- Indexes for table `commission_recruitment_agent`
--
ALTER TABLE `commission_recruitment_agent`
  ADD PRIMARY KEY (`commission_id`);

--
-- Indexes for table `contract_marketing_agency`
--
ALTER TABLE `contract_marketing_agency`
  ADD PRIMARY KEY (`contract_id`);

--
-- Indexes for table `contract_marketing_agent`
--
ALTER TABLE `contract_marketing_agent`
  ADD PRIMARY KEY (`contract_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `deployed`
--
ALTER TABLE `deployed`
  ADD PRIMARY KEY (`deployed_id`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`employer_id`);

--
-- Indexes for table `employer_reservation`
--
ALTER TABLE `employer_reservation`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indexes for table `employer_selected`
--
ALTER TABLE `employer_selected`
  ADD PRIMARY KEY (`selected_id`);

--
-- Indexes for table `fee`
--
ALTER TABLE `fee`
  ADD PRIMARY KEY (`fee_id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `job_fee`
--
ALTER TABLE `job_fee`
  ADD PRIMARY KEY (`fee_id`);

--
-- Indexes for table `marketing_agency`
--
ALTER TABLE `marketing_agency`
  ADD PRIMARY KEY (`agency_id`);

--
-- Indexes for table `marketing_agent`
--
ALTER TABLE `marketing_agent`
  ADD PRIMARY KEY (`agent_id`);

--
-- Indexes for table `meta`
--
ALTER TABLE `meta`
  ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `or`
--
ALTER TABLE `or`
  ADD PRIMARY KEY (`or_id`);

--
-- Indexes for table `paidall_employer_applicants`
--
ALTER TABLE `paidall_employer_applicants`
  ADD PRIMARY KEY (`paidall_id`);

--
-- Indexes for table `payment_employer_detail`
--
ALTER TABLE `payment_employer_detail`
  ADD PRIMARY KEY (`detail_id`);

--
-- Indexes for table `payment_recruitment`
--
ALTER TABLE `payment_recruitment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payment_worker_detail`
--
ALTER TABLE `payment_worker_detail`
  ADD PRIMARY KEY (`detail_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `recruitment_agent`
--
ALTER TABLE `recruitment_agent`
  ADD PRIMARY KEY (`agent_id`);

--
-- Indexes for table `salary_transactions`
--
ALTER TABLE `salary_transactions`
  ADD PRIMARY KEY (`salary_transaction_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applicant`
--
ALTER TABLE `applicant`
  MODIFY `applicant_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `applicant_certificate`
--
ALTER TABLE `applicant_certificate`
  MODIFY `certificate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `applicant_education`
--
ALTER TABLE `applicant_education`
  MODIFY `education_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `applicant_experiences`
--
ALTER TABLE `applicant_experiences`
  MODIFY `experience_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `applicant_files`
--
ALTER TABLE `applicant_files`
  MODIFY `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `applicant_log`
--
ALTER TABLE `applicant_log`
  MODIFY `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `applicant_passport`
--
ALTER TABLE `applicant_passport`
  MODIFY `passport_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `applicant_preferred_countries`
--
ALTER TABLE `applicant_preferred_countries`
  MODIFY `country_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `applicant_preferred_positions`
--
ALTER TABLE `applicant_preferred_positions`
  MODIFY `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `applicant_requirement`
--
ALTER TABLE `applicant_requirement`
  MODIFY `requirement_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `applicant_salary`
--
ALTER TABLE `applicant_salary`
  MODIFY `applicant_salary_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `applicant_salary_record`
--
ALTER TABLE `applicant_salary_record`
  MODIFY `applicant_salary_record_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `applicant_skills`
--
ALTER TABLE `applicant_skills`
  MODIFY `skill_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `archive_applicant`
--
ALTER TABLE `archive_applicant`
  MODIFY `applicant_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `bill_payment_applicant`
--
ALTER TABLE `bill_payment_applicant`
  MODIFY `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bill_payment_employer`
--
ALTER TABLE `bill_payment_employer`
  MODIFY `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `category_positions`
--
ALTER TABLE `category_positions`
  MODIFY `rel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `commission_marketing_agency`
--
ALTER TABLE `commission_marketing_agency`
  MODIFY `commission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `commission_marketing_agent`
--
ALTER TABLE `commission_marketing_agent`
  MODIFY `commission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `commission_recruitment_agent`
--
ALTER TABLE `commission_recruitment_agent`
  MODIFY `commission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `contract_marketing_agency`
--
ALTER TABLE `contract_marketing_agency`
  MODIFY `contract_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contract_marketing_agent`
--
ALTER TABLE `contract_marketing_agent`
  MODIFY `contract_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `deployed`
--
ALTER TABLE `deployed`
  MODIFY `deployed_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `employer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `employer_reservation`
--
ALTER TABLE `employer_reservation`
  MODIFY `reservation_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employer_selected`
--
ALTER TABLE `employer_selected`
  MODIFY `selected_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fee`
--
ALTER TABLE `fee`
  MODIFY `fee_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `job_fee`
--
ALTER TABLE `job_fee`
  MODIFY `fee_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=385;
--
-- AUTO_INCREMENT for table `marketing_agency`
--
ALTER TABLE `marketing_agency`
  MODIFY `agency_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `marketing_agent`
--
ALTER TABLE `marketing_agent`
  MODIFY `agent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `meta`
--
ALTER TABLE `meta`
  MODIFY `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `or`
--
ALTER TABLE `or`
  MODIFY `or_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `paidall_employer_applicants`
--
ALTER TABLE `paidall_employer_applicants`
  MODIFY `paidall_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payment_employer_detail`
--
ALTER TABLE `payment_employer_detail`
  MODIFY `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `payment_recruitment`
--
ALTER TABLE `payment_recruitment`
  MODIFY `payment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_worker_detail`
--
ALTER TABLE `payment_worker_detail`
  MODIFY `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `recruitment_agent`
--
ALTER TABLE `recruitment_agent`
  MODIFY `agent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `salary_transactions`
--
ALTER TABLE `salary_transactions`
  MODIFY `salary_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `voucher_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
