/*
MySQL Backup
Source Server Version: 5.5.24
Source Database: ics-ipac-v50
Date: 3/17/2015 17:59:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `applicant`
-- ----------------------------
DROP TABLE IF EXISTS `applicant`;
CREATE TABLE `applicant` (
  `applicant_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `applicant_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`applicant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `applicant_certificate`
-- ----------------------------
DROP TABLE IF EXISTS `applicant_certificate`;
CREATE TABLE `applicant_certificate` (
  `certificate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `certificate_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`certificate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `applicant_education`
-- ----------------------------
DROP TABLE IF EXISTS `applicant_education`;
CREATE TABLE `applicant_education` (
  `education_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `education_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `applicant_experiences`
-- ----------------------------
DROP TABLE IF EXISTS `applicant_experiences`;
CREATE TABLE `applicant_experiences` (
  `experience_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `experience_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`experience_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `applicant_files`
-- ----------------------------
DROP TABLE IF EXISTS `applicant_files`;
CREATE TABLE `applicant_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_applicant` int(10) unsigned DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `file_size` varchar(100) DEFAULT NULL,
  `file_mime` varchar(10) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_status` int(11) DEFAULT '0' COMMENT '1=Active, 0=Archived',
  `file_createdby` int(10) unsigned DEFAULT NULL,
  `file_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `applicant_log`
-- ----------------------------
DROP TABLE IF EXISTS `applicant_log`;
CREATE TABLE `applicant_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_applicant` int(10) unsigned NOT NULL,
  `log_employer` int(10) unsigned DEFAULT NULL,
  `log_status` int(10) unsigned NOT NULL,
  `log_country` int(10) unsigned NOT NULL COMMENT '`country`.`country_id`',
  `log_date` date DEFAULT NULL,
  `log_remarks` text,
  `log_createdby` int(10) unsigned NOT NULL,
  `log_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `applicant_passport`
-- ----------------------------
DROP TABLE IF EXISTS `applicant_passport`;
CREATE TABLE `applicant_passport` (
  `passport_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `passport_applicant` int(10) unsigned DEFAULT NULL,
  `passport_number` varchar(100) DEFAULT NULL,
  `passport_issue` date DEFAULT NULL,
  `passport_issue_place` varchar(255) DEFAULT NULL,
  `passport_expiration` date DEFAULT NULL,
  `passport_visible` tinyint(4) DEFAULT '0',
  `passport_createdby` int(10) unsigned DEFAULT NULL,
  `passport_updatedby` int(10) unsigned DEFAULT NULL,
  `passport_created` timestamp NULL DEFAULT NULL,
  `passport_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`passport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `applicant_preferred_countries`
-- ----------------------------
DROP TABLE IF EXISTS `applicant_preferred_countries`;
CREATE TABLE `applicant_preferred_countries` (
  `country_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_applicant` int(10) unsigned DEFAULT NULL,
  `country_country` int(10) unsigned DEFAULT NULL,
  `country_createdby` int(10) unsigned DEFAULT NULL,
  `country_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `applicant_preferred_positions`
-- ----------------------------
DROP TABLE IF EXISTS `applicant_preferred_positions`;
CREATE TABLE `applicant_preferred_positions` (
  `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position_applicant` int(10) unsigned DEFAULT NULL,
  `position_position` int(10) unsigned DEFAULT NULL,
  `position_createdby` int(10) unsigned DEFAULT NULL,
  `position_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `applicant_requirement`
-- ----------------------------
DROP TABLE IF EXISTS `applicant_requirement`;
CREATE TABLE `applicant_requirement` (
  `requirement_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `requirement_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`requirement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `applicant_salary`
-- ----------------------------
DROP TABLE IF EXISTS `applicant_salary`;
CREATE TABLE `applicant_salary` (
  `applicant_salary_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`applicant_salary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `applicant_salary_record`
-- ----------------------------
DROP TABLE IF EXISTS `applicant_salary_record`;
CREATE TABLE `applicant_salary_record` (
  `applicant_salary_record_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`applicant_salary_record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `applicant_skills`
-- ----------------------------
DROP TABLE IF EXISTS `applicant_skills`;
CREATE TABLE `applicant_skills` (
  `skill_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `skill_applicant` int(10) unsigned NOT NULL,
  `skill_name` varchar(255) NOT NULL,
  `skill_created` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `archive_applicant`
-- ----------------------------
DROP TABLE IF EXISTS `archive_applicant`;
CREATE TABLE `archive_applicant` (
  `applicant_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `applicant_archivedby` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `bill`
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `bill_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `bill_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `bill_detail`
-- ----------------------------
DROP TABLE IF EXISTS `bill_detail`;
CREATE TABLE `bill_detail` (
  `detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `detail_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `bill_payment_applicant`
-- ----------------------------
DROP TABLE IF EXISTS `bill_payment_applicant`;
CREATE TABLE `bill_payment_applicant` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_or` varchar(255) DEFAULT NULL,
  `payment_bill` int(10) unsigned DEFAULT NULL,
  `payment_applicant` int(10) unsigned DEFAULT NULL,
  `payment_amount` float unsigned DEFAULT NULL,
  `payment_remarks` text,
  `payment_createdby` int(10) unsigned DEFAULT NULL,
  `payment_updatedby` int(10) unsigned DEFAULT NULL,
  `payment_created` timestamp NULL DEFAULT NULL,
  `payment_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `bill_payment_employer`
-- ----------------------------
DROP TABLE IF EXISTS `bill_payment_employer`;
CREATE TABLE `bill_payment_employer` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_or` varchar(255) DEFAULT NULL,
  `payment_bill` int(10) unsigned DEFAULT NULL,
  `payment_employer` int(10) unsigned DEFAULT NULL,
  `payment_amount` float unsigned DEFAULT NULL,
  `payment_remarks` text,
  `payment_createdby` int(10) unsigned DEFAULT NULL,
  `payment_updatedby` int(10) unsigned DEFAULT NULL,
  `payment_created` timestamp NULL DEFAULT NULL,
  `payment_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `category_photo` varchar(255) DEFAULT NULL,
  `category_createdby` int(10) unsigned DEFAULT NULL,
  `category_created` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `category_positions`
-- ----------------------------
DROP TABLE IF EXISTS `category_positions`;
CREATE TABLE `category_positions` (
  `rel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rel_category` int(10) unsigned DEFAULT NULL,
  `rel_position` int(10) unsigned DEFAULT NULL,
  `rel_position_type` varchar(255) DEFAULT NULL COMMENT '''Household'', ''Skilled''',
  `rel_createdby` int(10) unsigned DEFAULT NULL,
  `rel_created` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `commission_marketing_agency`
-- ----------------------------
DROP TABLE IF EXISTS `commission_marketing_agency`;
CREATE TABLE `commission_marketing_agency` (
  `commission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `commission_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `commission_marketing_agent`
-- ----------------------------
DROP TABLE IF EXISTS `commission_marketing_agent`;
CREATE TABLE `commission_marketing_agent` (
  `commission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `commission_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `commission_recruitment_agent`
-- ----------------------------
DROP TABLE IF EXISTS `commission_recruitment_agent`;
CREATE TABLE `commission_recruitment_agent` (
  `commission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `commission_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`commission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `contract_marketing_agency`
-- ----------------------------
DROP TABLE IF EXISTS `contract_marketing_agency`;
CREATE TABLE `contract_marketing_agency` (
  `contract_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `contract_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `contract_marketing_agent`
-- ----------------------------
DROP TABLE IF EXISTS `contract_marketing_agent`;
CREATE TABLE `contract_marketing_agent` (
  `contract_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `contract_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) NOT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `country_abbr` varchar(10) DEFAULT NULL,
  `country_createdby` int(10) unsigned DEFAULT NULL,
  `country_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `deployed`
-- ----------------------------
DROP TABLE IF EXISTS `deployed`;
CREATE TABLE `deployed` (
  `deployed_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `deployed_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`deployed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `employer`
-- ----------------------------
DROP TABLE IF EXISTS `employer`;
CREATE TABLE `employer` (
  `employer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `employer_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `employer_reservation`
-- ----------------------------
DROP TABLE IF EXISTS `employer_reservation`;
CREATE TABLE `employer_reservation` (
  `reservation_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reservation_employer` int(10) unsigned DEFAULT NULL,
  `reservation_applicant` int(10) unsigned DEFAULT NULL,
  `reservation_expiration` date DEFAULT NULL,
  `reservation_status` tinyint(3) unsigned DEFAULT '0',
  `reservation_remarks` text,
  `reservation_date` date DEFAULT NULL,
  `reservation_createdby` int(10) unsigned DEFAULT NULL,
  `reservation_updatedby` int(10) unsigned DEFAULT NULL,
  `reservation_created` timestamp NULL DEFAULT NULL,
  `reservation_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reservation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `employer_selected`
-- ----------------------------
DROP TABLE IF EXISTS `employer_selected`;
CREATE TABLE `employer_selected` (
  `selected_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `selected_employer` int(10) unsigned DEFAULT NULL,
  `selected_applicant` int(10) unsigned DEFAULT NULL,
  `selected_remarks` text,
  `selected_date` date DEFAULT NULL,
  `selected_createdby` int(10) unsigned DEFAULT NULL,
  `selected_updatedby` int(10) unsigned DEFAULT NULL,
  `selected_created` timestamp NULL DEFAULT NULL,
  `selected_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`selected_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `fee`
-- ----------------------------
DROP TABLE IF EXISTS `fee`;
CREATE TABLE `fee` (
  `fee_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fee_name` varchar(150) DEFAULT NULL,
  `fee_group` varchar(100) DEFAULT NULL,
  `fee_shareable` tinyint(4) DEFAULT '0',
  `fee_createdby` int(10) unsigned DEFAULT NULL,
  `fee_updatedby` int(10) unsigned DEFAULT NULL,
  `fee_created` timestamp NULL DEFAULT NULL,
  `fee_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `job_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `job_fee`
-- ----------------------------
DROP TABLE IF EXISTS `job_fee`;
CREATE TABLE `job_fee` (
  `fee_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `fee_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `marketing_agency`
-- ----------------------------
DROP TABLE IF EXISTS `marketing_agency`;
CREATE TABLE `marketing_agency` (
  `agency_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(100) DEFAULT NULL,
  `agency_contact_person` varchar(255) DEFAULT NULL,
  `agency_contacts` varchar(255) DEFAULT NULL,
  `agency_address` varchar(255) DEFAULT NULL,
  `agency_email` varchar(100) DEFAULT NULL,
  `agency_remarks` text,
  `agency_createdby` int(10) unsigned DEFAULT NULL,
  `agency_updatedby` int(10) unsigned DEFAULT NULL,
  `agency_created` timestamp NULL DEFAULT NULL,
  `agency_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `marketing_agent`
-- ----------------------------
DROP TABLE IF EXISTS `marketing_agent`;
CREATE TABLE `marketing_agent` (
  `agent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_agency` int(11) DEFAULT NULL,
  `agent_first` varchar(100) DEFAULT NULL,
  `agent_last` varchar(100) DEFAULT NULL,
  `agent_contacts` varchar(255) DEFAULT NULL,
  `agent_email` varchar(100) DEFAULT NULL,
  `agent_remarks` text,
  `agent_createdby` int(10) unsigned DEFAULT NULL,
  `agent_updatedby` int(10) unsigned DEFAULT NULL,
  `agent_created` timestamp NULL DEFAULT NULL,
  `agent_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `meta`
-- ----------------------------
DROP TABLE IF EXISTS `meta`;
CREATE TABLE `meta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meta_parent` int(10) unsigned DEFAULT NULL,
  `meta_type` varchar(100) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` text,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `options`
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(160) NOT NULL,
  `option_value` varchar(160) NOT NULL,
  `option_remarks` varchar(500) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `or`
-- ----------------------------
DROP TABLE IF EXISTS `or`;
CREATE TABLE `or` (
  `or_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `or_number` varchar(255) DEFAULT NULL,
  `or_amount` float unsigned DEFAULT NULL,
  `or_employer` int(10) unsigned DEFAULT NULL,
  `or_applicant` int(10) unsigned DEFAULT NULL,
  `or_status` int(10) unsigned DEFAULT '0',
  `or_approvedby` int(10) unsigned DEFAULT '0',
  `or_remarks` text,
  `or_date` date DEFAULT NULL,
  `or_createdby` int(10) unsigned DEFAULT NULL,
  `or_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`or_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `paidall_employer_applicants`
-- ----------------------------
DROP TABLE IF EXISTS `paidall_employer_applicants`;
CREATE TABLE `paidall_employer_applicants` (
  `paidall_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paidall_or` varchar(255) DEFAULT NULL,
  `paidall_bill` int(10) unsigned DEFAULT NULL,
  `paidall_employer` int(10) unsigned DEFAULT NULL,
  `paidall_applicant` int(10) unsigned DEFAULT NULL,
  `paidall_amount` float unsigned DEFAULT NULL,
  `paidall_paid` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`paidall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `payment_employer_detail`
-- ----------------------------
DROP TABLE IF EXISTS `payment_employer_detail`;
CREATE TABLE `payment_employer_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `detail_payment` int(10) unsigned DEFAULT '0',
  `detail_bill` int(10) unsigned DEFAULT '0',
  `detail_or` varchar(255) DEFAULT NULL,
  `detail_employer` int(10) unsigned DEFAULT '0',
  `detail_applicant` int(10) unsigned DEFAULT '0',
  `detail_fee` int(10) unsigned DEFAULT '0',
  `detail_amount` float unsigned DEFAULT '0',
  `detail_balance` float unsigned DEFAULT '0',
  `detail_createdby` int(10) unsigned DEFAULT '0',
  `detail_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `payment_recruitment`
-- ----------------------------
DROP TABLE IF EXISTS `payment_recruitment`;
CREATE TABLE `payment_recruitment` (
  `payment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_or` varchar(255) DEFAULT NULL,
  `payment_applicant` int(10) unsigned DEFAULT '0',
  `payment_agent` int(10) unsigned DEFAULT '0',
  `payment_amount` float unsigned DEFAULT '0',
  `payment_bill` int(10) unsigned DEFAULT '0',
  `payment_createdby` int(10) unsigned DEFAULT '0',
  `payment_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `payment_worker_detail`
-- ----------------------------
DROP TABLE IF EXISTS `payment_worker_detail`;
CREATE TABLE `payment_worker_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `detail_payment` int(10) unsigned DEFAULT NULL,
  `detail_bill` int(10) unsigned DEFAULT '0',
  `detail_or` varchar(255) DEFAULT NULL,
  `detail_applicant` int(10) unsigned DEFAULT '0',
  `detail_fee` int(10) unsigned DEFAULT '0',
  `detail_amount` float unsigned DEFAULT '0',
  `detail_balance` float unsigned DEFAULT '0' COMMENT 'optional',
  `detail_createdby` int(10) unsigned DEFAULT '0',
  `detail_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(255) NOT NULL,
  `position_type` varchar(10) DEFAULT NULL COMMENT '''Household'', ''Skilled''',
  `position_status` int(10) unsigned DEFAULT '0' COMMENT '0 = Inactive, 1 = Active',
  `position_createdby` int(10) unsigned DEFAULT NULL,
  `position_updatedby` int(10) unsigned DEFAULT NULL,
  `position_created` timestamp NULL DEFAULT NULL,
  `position_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `recruitment_agent`
-- ----------------------------
DROP TABLE IF EXISTS `recruitment_agent`;
CREATE TABLE `recruitment_agent` (
  `agent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_first` varchar(100) DEFAULT NULL,
  `agent_last` varchar(100) DEFAULT NULL,
  `agent_contacts` varchar(255) DEFAULT NULL,
  `agent_email` varchar(100) DEFAULT NULL,
  `agent_remarks` text,
  `agent_createdby` int(10) unsigned DEFAULT NULL,
  `agent_updatedby` int(10) unsigned DEFAULT NULL,
  `agent_created` timestamp NULL DEFAULT NULL,
  `agent_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `salary_transactions`
-- ----------------------------
DROP TABLE IF EXISTS `salary_transactions`;
CREATE TABLE `salary_transactions` (
  `salary_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`salary_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `user_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `user_types`
-- ----------------------------
DROP TABLE IF EXISTS `user_types`;
CREATE TABLE `user_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) DEFAULT NULL,
  `type_status` int(10) unsigned DEFAULT '1',
  `type_color` varchar(10) DEFAULT NULL,
  `type_createdby` int(10) unsigned DEFAULT NULL,
  `type_updatedby` int(10) unsigned DEFAULT NULL,
  `type_created` timestamp NULL DEFAULT NULL,
  `type_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `voucher`
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `voucher_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `voucher_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
--  View definition for `applicants_logs_view`
-- ----------------------------
DROP VIEW IF EXISTS `applicants_logs_view`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `applicants_logs_view` AS select `log`.`log_id` AS `log_id`,`log`.`log_applicant` AS `log_applicant`,`log`.`log_employer` AS `log_employer`,`log`.`log_status` AS `log_status`,`log`.`log_country` AS `log_country`,`log`.`log_date` AS `log_date`,`log`.`log_remarks` AS `log_remarks`,`log`.`log_createdby` AS `log_createdby`,`log`.`log_created` AS `log_created`,`c`.`country_id` AS `country_id`,`c`.`country_name` AS `country_name`,`c`.`country_code` AS `country_code`,`c`.`country_abbr` AS `country_abbr`,`e`.`employer_id` AS `employer_id`,`e`.`employer_user` AS `employer_user`,`e`.`employer_source_agency` AS `employer_source_agency`,`e`.`employer_source_agent` AS `employer_source_agent`,`e`.`employer_no` AS `employer_no`,`e`.`employer_name` AS `employer_name`,`e`.`employer_contact_person` AS `employer_contact_person`,`e`.`employer_contact` AS `employer_contact`,`e`.`employer_email` AS `employer_email`,`e`.`employer_address` AS `employer_address`,`e`.`employer_country` AS `employer_country`,`e`.`employer_remarks` AS `employer_remarks`,`u`.`user_id` AS `user_id`,`u`.`user_name` AS `user_name`,`u`.`user_password` AS `user_password`,`u`.`user_fullname` AS `user_fullname`,`u`.`user_email` AS `user_email`,`u`.`user_type` AS `user_type`,`u`.`user_status` AS `user_status`,`u`.`user_updated` AS `user_updated`,`a`.`applicant_id` AS `applicant_id`,`a`.`applicant_first` AS `applicant_first`,`a`.`applicant_middle` AS `applicant_middle`,`a`.`applicant_last` AS `applicant_last`,concat(`a`.`applicant_first`,' ',`a`.`applicant_middle`,' ',`a`.`applicant_last`) AS `applicant_name`,`a`.`applicant_suffix` AS `applicant_suffix`,`a`.`applicant_birthdate` AS `applicant_birthdate`,`a`.`applicant_age` AS `applicant_age`,`a`.`applicant_gender` AS `applicant_gender`,`a`.`applicant_contacts` AS `applicant_contacts`,`a`.`applicant_address` AS `applicant_address`,`a`.`applicant_email` AS `applicant_email`,`a`.`applicant_nationality` AS `applicant_nationality`,`a`.`applicant_civil_status` AS `applicant_civil_status`,`a`.`applicant_religion` AS `applicant_religion`,`a`.`applicant_languages` AS `applicant_languages`,`a`.`applicant_height` AS `applicant_height`,`a`.`applicant_weight` AS `applicant_weight`,`a`.`applicant_position_type` AS `applicant_position_type`,`a`.`applicant_preferred_position` AS `applicant_preferred_position`,`a`.`applicant_expected_salary` AS `applicant_expected_salary`,`a`.`applicant_preferred_country` AS `applicant_preferred_country`,`a`.`applicant_other_skills` AS `applicant_other_skills`,`a`.`applicant_cv` AS `applicant_cv`,`a`.`applicant_photo` AS `applicant_photo`,`a`.`applicant_status` AS `applicant_status`,`a`.`applicant_source` AS `applicant_source`,`a`.`applicant_remarks` AS `applicant_remarks`,`a`.`applicant_date_applied` AS `applicant_date_applied`,`a`.`applicant_employer` AS `applicant_employer`,`a`.`applicant_job` AS `applicant_job`,`a`.`applicant_slug` AS `applicant_slug`,`e`.`employer_slug` AS `employer_slug` from ((((`applicant_log` `log` join `applicant` `a` on((`a`.`applicant_id` = `log`.`log_applicant`))) left join `user` `u` on((`u`.`user_id` = `log`.`log_createdby`))) left join `employer` `e` on((`e`.`employer_id` = `log`.`log_employer`))) left join `country` `c` on((`c`.`country_id` = `log`.`log_country`))) order by `log`.`log_date` desc,`log`.`log_created` desc,`log`.`log_createdby` desc;

-- ----------------------------
--  View definition for `applicant_view`
-- ----------------------------
DROP VIEW IF EXISTS `applicant_view`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY INVOKER VIEW `applicant_view` AS select `a`.`applicant_id` AS `applicant_id`,`a`.`applicant_first` AS `applicant_first`,`a`.`applicant_middle` AS `applicant_middle`,`a`.`applicant_last` AS `applicant_last`,concat(`a`.`applicant_first`,' ',`a`.`applicant_middle`,' ',`a`.`applicant_last`) AS `applicant_name`,`a`.`applicant_suffix` AS `applicant_suffix`,`a`.`applicant_birthdate` AS `applicant_birthdate`,`a`.`applicant_age` AS `applicant_age`,`a`.`applicant_gender` AS `applicant_gender`,`a`.`applicant_contacts` AS `applicant_contacts`,`a`.`applicant_address` AS `applicant_address`,`a`.`applicant_email` AS `applicant_email`,`a`.`applicant_nationality` AS `applicant_nationality`,`a`.`applicant_civil_status` AS `applicant_civil_status`,`a`.`applicant_religion` AS `applicant_religion`,`a`.`applicant_languages` AS `applicant_languages`,`a`.`applicant_height` AS `applicant_height`,`a`.`applicant_weight` AS `applicant_weight`,`a`.`applicant_position_type` AS `applicant_position_type`,`a`.`applicant_preferred_position` AS `applicant_preferred_position`,`a`.`applicant_expected_salary` AS `applicant_expected_salary`,`a`.`applicant_preferred_country` AS `applicant_preferred_country`,`a`.`applicant_other_skills` AS `applicant_other_skills`,`a`.`applicant_cv` AS `applicant_cv`,`a`.`applicant_photo` AS `applicant_photo`,`a`.`applicant_status` AS `applicant_status`,`a`.`applicant_source` AS `applicant_source`,`a`.`applicant_remarks` AS `applicant_remarks`,`a`.`applicant_date_applied` AS `applicant_date_applied`,`a`.`applicant_createdby` AS `applicant_createdby`,`a`.`applicant_updatedby` AS `applicant_updatedby`,`a`.`applicant_created` AS `applicant_created`,`a`.`applicant_updated` AS `applicant_updated`,`ae`.`education_id` AS `education_id`,`ae`.`education_applicant` AS `education_applicant`,`ae`.`education_mba` AS `education_mba`,`ae`.`education_mba_course` AS `education_mba_course`,`ae`.`education_mba_year` AS `education_mba_year`,`ae`.`education_college` AS `education_college`,`ae`.`education_college_skills` AS `education_college_skills`,`ae`.`education_college_year` AS `education_college_year`,`ae`.`education_others` AS `education_others`,`ae`.`education_others_year` AS `education_others_year`,`ae`.`education_highschool` AS `education_highschool`,`ae`.`education_highschool_year` AS `education_highschool_year`,`ap`.`passport_id` AS `passport_id`,`ap`.`passport_applicant` AS `passport_applicant`,`ap`.`passport_number` AS `passport_number`,`ap`.`passport_expiration` AS `passport_expiration`,`ap`.`passport_visible` AS `passport_visible`,`ac`.`certificate_id` AS `certificate_id`,`ac`.`certificate_applicant` AS `certificate_applicant`,`ac`.`certificate_tesda` AS `certificate_tesda`,`ac`.`certificate_info_sheet` AS `certificate_info_sheet`,`ac`.`certificate_authenticated` AS `certificate_authenticated`,`ac`.`certificate_authenticated_nbi` AS `certificate_authenticated_nbi`,`ac`.`certificate_insurance` AS `certificate_insurance`,`ac`.`certificate_medical_clinic` AS `certificate_medical_clinic`,`ac`.`certificate_medical_exam_date` AS `certificate_medical_exam_date`,`ac`.`certificate_medical_result` AS `certificate_medical_result`,`ac`.`certificate_medical_remarks` AS `certificate_medical_remarks`,`ac`.`certificate_medical_expiration` AS `certificate_medical_expiration`,`ac`.`certificate_pdos` AS `certificate_pdos`,`ac`.`certificate_pt_result` AS `certificate_pt_result`,`ac`.`certificate_pt_result_date` AS `certificate_pt_result_date`,`ac`.`certificate_philhealth` AS `certificate_philhealth`,`ac`.`certificate_m1b` AS `certificate_m1b`,`ar`.`requirement_id` AS `requirement_id`,`ar`.`requirement_applicant` AS `requirement_applicant`,`ar`.`requirement_visa` AS `requirement_visa`,`ar`.`requirement_visa_date` AS `requirement_visa_date`,`ar`.`requirement_visa_release_date` AS `requirement_visa_release_date`,`ar`.`requirement_visa_expiration` AS `requirement_visa_expiration`,`ar`.`requirement_oec_number` AS `requirement_oec_number`,`ar`.`requirement_oec_submission_date` AS `requirement_oec_submission_date`,`ar`.`requirement_oec_release_date` AS `requirement_oec_release_date`,`ar`.`requirement_owwa_certificate` AS `requirement_owwa_certificate`,`ar`.`requirement_owwa_schedule` AS `requirement_owwa_schedule`,`ar`.`requirement_contract` AS `requirement_contract`,`ar`.`requirement_mofa` AS `requirement_mofa`,`ar`.`requirement_job_offer` AS `requirement_job_offer`,`p`.`position_id` AS `position_id`,`p`.`position_name` AS `position_name`,`c`.`country_id` AS `country_id`,`c`.`country_name` AS `country_name`,`c`.`country_code` AS `country_code`,`c`.`country_abbr` AS `country_abbr`,`ra`.`agent_id` AS `agent_id`,`ra`.`agent_first` AS `agent_first`,`ra`.`agent_last` AS `agent_last`,`ar`.`requirement_remarks` AS `requirement_remarks`,`ar`.`requirement_school_records` AS `requirement_school_records`,`ar`.`requirement_coe` AS `requirement_coe`,`ar`.`requirement_picture_status` AS `requirement_picture_status`,`ar`.`requirement_trade_test` AS `requirement_trade_test`,`j`.`job_id` AS `job_id`,`j`.`job_employer` AS `job_employer`,`j`.`job_position` AS `job_position`,`j`.`job_gender` AS `job_gender`,`j`.`job_salary` AS `job_salary`,`j`.`job_total` AS `job_total`,`j`.`job_occupied` AS `job_occupied`,`j`.`job_name` AS `job_name`,`j`.`job_content` AS `job_content`,`j`.`job_status` AS `job_status`,`j`.`job_remarks` AS `job_remarks`,`u`.`user_id` AS `user_id`,`u`.`user_name` AS `user_name`,`u`.`user_password` AS `user_password`,`u`.`user_fullname` AS `user_fullname`,`u`.`user_email` AS `user_email`,`u`.`user_type` AS `user_type`,`u`.`user_status` AS `user_status`,`u`.`user_lastlogin` AS `user_lastlogin`,`a`.`applicant_slug` AS `applicant_slug`,`a`.`applicant_employer` AS `applicant_employer`,`a`.`applicant_job` AS `applicant_job`,`j`.`job_revenue` AS `job_revenue`,`e`.`employer_id` AS `employer_id`,`e`.`employer_user` AS `employer_user`,`e`.`employer_no` AS `employer_no`,`e`.`employer_name` AS `employer_name`,`e`.`employer_remarks` AS `employer_remarks`,`e`.`employer_contact_person` AS `employer_contact_person`,`e`.`employer_contact` AS `employer_contact`,`e`.`employer_email` AS `employer_email`,`e`.`employer_address` AS `employer_address`,`e`.`employer_country` AS `employer_country`,`e`.`employer_source_agency` AS `employer_source_agency`,`e`.`employer_source_agent` AS `employer_source_agent`,`e`.`employer_agency_commission` AS `employer_agency_commission`,`e`.`employer_agent_commission` AS `employer_agent_commission`,`ar`.`requirement_offer_salary` AS `requirement_offer_salary`,`ar`.`requirement_ticket` AS `requirement_ticket`,`ap`.`passport_issue_place` AS `passport_issue_place`,`ap`.`passport_issue` AS `passport_issue`,`a`.`applicant_paid` AS `applicant_paid` from ((((((((((`applicant` `a` left join `applicant_education` `ae` on((`ae`.`education_applicant` = `a`.`applicant_id`))) left join `applicant_passport` `ap` on((`ap`.`passport_applicant` = `a`.`applicant_id`))) left join `applicant_certificate` `ac` on((`ac`.`certificate_applicant` = `a`.`applicant_id`))) left join `applicant_requirement` `ar` on((`ar`.`requirement_applicant` = `a`.`applicant_id`))) left join `position` `p` on((`p`.`position_id` = `a`.`applicant_preferred_position`))) left join `country` `c` on((`c`.`country_id` = `a`.`applicant_preferred_country`))) left join `recruitment_agent` `ra` on((`ra`.`agent_id` = `a`.`applicant_source`))) left join `job` `j` on((`ar`.`requirement_job_offer` = `j`.`job_id`))) left join `user` `u` on((`a`.`applicant_updatedby` = `u`.`user_id`))) left join `employer` `e` on((`a`.`applicant_employer` = `e`.`employer_id`)));

-- ----------------------------
--  View definition for `billing_employer_view`
-- ----------------------------
DROP VIEW IF EXISTS `billing_employer_view`;
CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `billing_employer_view` AS select `b`.`bill_id` AS `bill_id`,`b`.`bill_employer` AS `bill_employer`,`b`.`bill_applicant` AS `bill_applicant`,`b`.`bill_amount` AS `bill_amount`,`b`.`bill_employer_cost` AS `bill_employer_cost`,`b`.`bill_applicant_cost` AS `bill_applicant_cost`,`b`.`bill_employer_deposit` AS `bill_employer_deposit`,`b`.`bill_applicant_deposit` AS `bill_applicant_deposit`,`b`.`bill_status` AS `bill_status`,`b`.`bill_remarks` AS `bill_remarks`,`b`.`bill_createdby` AS `bill_createdby`,`b`.`bill_updatedby` AS `bill_updatedby`,`b`.`bill_created` AS `bill_created`,`b`.`bill_updated` AS `bill_updated`,`e`.`employer_id` AS `employer_id`,`e`.`employer_user` AS `employer_user`,`e`.`employer_no` AS `employer_no`,`e`.`employer_name` AS `employer_name`,`e`.`employer_remarks` AS `employer_remarks`,`e`.`employer_contact_person` AS `employer_contact_person`,`e`.`employer_contact` AS `employer_contact`,`e`.`employer_email` AS `employer_email`,`e`.`employer_address` AS `employer_address`,`e`.`employer_country` AS `employer_country`,`e`.`employer_source_agency` AS `employer_source_agency`,`e`.`employer_source_agent` AS `employer_source_agent`,`e`.`employer_agency_commission` AS `employer_agency_commission`,`e`.`employer_agent_commission` AS `employer_agent_commission`,`e`.`employer_agency_commission_from` AS `employer_agency_commission_from`,`e`.`employer_agent_commission_from` AS `employer_agent_commission_from`,`e`.`employer_slug` AS `employer_slug`,`e`.`employer_createdby` AS `employer_createdby`,`e`.`employer_updatedby` AS `employer_updatedby`,`e`.`employer_created` AS `employer_created`,`e`.`employer_updated` AS `employer_updated`,sum(`b`.`bill_employer_cost`) AS `amount`,sum(`b`.`bill_employer_deposit`) AS `debit`,sum((`b`.`bill_employer_cost` - `b`.`bill_employer_deposit`)) AS `credit`,count(`b`.`bill_applicant`) AS `applicants` from (`bill` `b` join `employer` `e` on((`b`.`bill_employer` = `e`.`employer_id`))) group by `b`.`bill_employer`;

-- ----------------------------
--  Procedure definition for `COMPUTE_AGE`
-- ----------------------------
DROP FUNCTION IF EXISTS `COMPUTE_AGE`;
DELIMITER ;;
CREATE  FUNCTION `COMPUTE_AGE`(`birthdate` date) RETURNS int(11)
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
	RETURN TIMESTAMPDIFF(YEAR, birthdate, CURRENT_TIMESTAMP());
END
;;
DELIMITER ;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `country` VALUES ('1','MALAYSIA','','',NULL,'2014-10-05 19:05:11'), ('2','SINGAPORE',NULL,NULL,NULL,'2014-10-05 19:05:26'), ('3','HONGKONG',NULL,'HK',NULL,'2014-10-05 19:05:30'), ('4','BRUNEI',NULL,NULL,NULL,'2014-10-05 19:05:32'), ('5','KUWAIT',NULL,NULL,NULL,'2014-10-05 19:05:38'), ('6','BAHRAIN',NULL,NULL,NULL,'2014-10-05 19:05:39'), ('7','SAUDI ARABIA','','SAU','1','2014-10-13 01:37:08'), ('8','TAIWAN','02','TAI','1','2014-10-13 01:38:09'), ('9','UNITED STATES','','US','1','2014-11-04 02:08:02'), ('10','SOUTH KOREA','','SK','1','2014-11-04 02:08:18');
INSERT INTO `fee` VALUES ('1','Placement Fee',NULL,'1','1','1','2014-11-02 06:21:13','2014-11-02 06:22:24'), ('2','Service Fee',NULL,'0','1','1','2014-11-02 06:21:16','2014-11-02 06:22:23'), ('3','PDOS','Cost of Documentation','0','1','1','2014-11-02 06:21:16','2014-11-02 06:22:23'), ('4','TRADE TEST','Cost of Documentation','0','1','1','2014-11-02 06:21:20','2014-11-02 06:22:23'), ('5','MEDICAL TEST','Cost of Documentation','0','1','1','2014-11-02 06:21:23','2014-11-02 06:22:23'), ('6','VISA','Processing Fee','0','1','1','2014-11-02 06:21:25','2014-11-02 06:22:22'), ('7','AIRFARE','Processing Fee','0','1','1','2014-11-02 06:21:44','2014-11-02 06:22:22'), ('8','POEA','Processing Fee','0','1','1','2014-11-02 06:21:45','2014-11-02 06:22:22'), ('9','OWWA','Processing Fee','0','1','1','2014-11-02 06:21:48','2014-11-02 06:22:22'), ('10','INSURANCE','Processing Fee','0','1','1','2014-11-02 06:21:56','2014-11-02 06:22:22'), ('11','PHILHELATH','Processing Fee','0','1','1','2014-11-15 14:08:31','2014-11-15 14:08:42'), ('12','PAGIBIG','Processing Fee','0','1','1','2014-11-15 14:08:40','2014-11-15 14:08:41');
INSERT INTO `job` VALUES ('1','1','1','Any',NULL,'100000','2000000','10','3','WEB DEVELOPER','','40','39300','1','','2','2','2015-03-06 22:26:07','2015-03-11 04:12:27');
INSERT INTO `job_fee` VALUES ('1','1','1','15000','1','1','0','0','2','2','2015-03-06 22:26:07','2015-03-06 22:32:41'), ('2','1','2','10000','1','0','10000','0','2','2','2015-03-06 22:26:07','2015-03-06 22:32:41'), ('3','1','3','2000','1','0','2000','0','2','2','2015-03-06 22:26:07','2015-03-06 22:32:41'), ('4','1','4','3000','1','0','3000','0','2','2','2015-03-06 22:26:07','2015-03-06 22:32:41'), ('5','1','5','2000','1','0','2000','0','2','2','2015-03-06 22:26:07','2015-03-06 22:32:41'), ('6','1','6','5000','1','0','5000','0','2','2','2015-03-06 22:26:07','2015-03-06 22:32:41'), ('7','1','7','200','1','0','200','0','2','2','2015-03-06 22:26:07','2015-03-06 22:32:41'), ('8','1','8','0','1','0','0','0','2','2','2015-03-06 22:26:07','2015-03-06 22:32:41'), ('9','1','9','0','1','0','0','0','2','2','2015-03-06 22:26:07','2015-03-06 22:32:41'), ('10','1','10','0','1','0','0','0','2','2','2015-03-06 22:26:07','2015-03-06 22:32:41'), ('11','1','11','2000','0','1','0','2000','2','2','2015-03-06 22:26:07','2015-03-06 22:32:41'), ('12','1','12','100','0','1','0','100','2','2','2015-03-06 22:26:07','2015-03-06 22:32:41');
INSERT INTO `meta` VALUES ('1','0','fee','dollar-exchange','40');
INSERT INTO `options` VALUES ('1','tax - single','18','This is on Percent','2015-01-07 11:45:55','2015-01-07 11:45:55','0000-00-00 00:00:00'), ('2','tax - married','17','This is on Percent','2015-01-07 11:45:55','2015-01-07 11:45:55','0000-00-00 00:00:00'), ('3','tax - Single w/ 1 Dependent','16','This is on Percent','2015-01-07 11:45:55','2015-01-07 11:45:55','0000-00-00 00:00:00'), ('4','tax - Single w/ 2 Dependents','15','This is on Percent','2015-01-07 11:45:55','2015-01-07 11:45:55','0000-00-00 00:00:00'), ('5','tax - Single w/ 3 Dependents','14','This is on Percent','2015-01-07 11:45:55','2015-01-07 11:45:55','0000-00-00 00:00:00'), ('6','tax - Single w/ 4 Dependents','13','This is on Percent','2015-01-07 11:45:55','2015-01-07 11:45:55','0000-00-00 00:00:00'), ('7','tax - Married w/ 1 Dependents','15','This is on Percent','2015-01-07 11:45:55','2015-01-07 11:45:55','0000-00-00 00:00:00'), ('8','tax - Married w/ 2 Dependents','14','This is on Percent','2015-01-07 11:45:55','2015-01-07 11:45:55','0000-00-00 00:00:00'), ('9','tax - Married w/ 3 Dependents','13','This is on Percent','2015-01-07 11:45:55','2015-01-07 11:45:55','0000-00-00 00:00:00'), ('10','tax - Married w/ 4 Dependents','12','This is on Percent','2015-01-07 11:45:55','2015-01-07 11:45:55','0000-00-00 00:00:00'), ('11','withholding_tax','1','value must be 1 or 2. if 1(withholding tax deduct on first cutoff and other deductions (like sss,pag-ibig,philhealth) on second cutoff)','2015-01-07 11:45:55','2015-01-07 11:45:55','0000-00-00 00:00:00');
INSERT INTO `user` VALUES ('1','brittle007','ac873fa11f1cd5abc102906508e70078','Klem Quiñones','clemquinones@gmail.com','4','1',NULL,'2015-03-13 07:01:55','0','0','2014-10-04 00:22:29','2015-03-12 18:01:55'), ('2','administrator','816c22a885a6a91908f07eb16296c500','Administrator','admin@domain.com','3','1','','2015-03-17 14:46:48','1','1','2015-01-30 22:51:41','2015-03-17 17:46:48');
INSERT INTO `user_types` VALUES ('1','Encoder','1','default','1','1','2014-10-15 03:59:41','2014-10-28 00:28:26'), ('2','Accounting (Staff)','1','info','1','1','2014-10-15 03:59:42','2014-11-27 03:03:30'), ('3','Administrator','1','success','1','1','2014-10-15 03:59:43','2014-10-28 00:28:31'), ('4','Super Administrator','1','danger','1','1','2014-10-15 03:59:44','2014-10-28 00:28:36'), ('5','Employer','1','default','1','1','2014-10-15 03:59:45','2014-10-28 00:28:39'), ('6','Processing','1','primary','1','1','2014-10-15 04:01:57','2014-10-28 00:28:42'), ('7','Recruitment','1','primary','1','1','2014-10-15 04:02:02','2014-10-28 00:28:47'), ('8','Accounting (Head)','1','info','1','1','2014-11-27 03:03:44','2014-11-27 03:03:44');

-- ----------------------------
--  Trigger definition for `applicant`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `applicant_insert` BEFORE INSERT ON `applicant` FOR EACH ROW BEGIN

-- Compute the age from input birthdate
SET NEW.applicant_age = COMPUTE_AGE(NEW.applicant_birthdate);

-- Allocate empty `applicant_created` field
IF NEW.applicant_created IS NULL THEN
SET NEW.applicant_created = CURRENT_TIMESTAMP(), NEW.applicant_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `applicant_edit` BEFORE UPDATE ON `applicant` FOR EACH ROW BEGIN

-- Compute the age from input birthdate
SET NEW.applicant_age = COMPUTE_AGE(NEW.applicant_birthdate);

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `applicant_certificate`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `applicant_certificate_insert` BEFORE INSERT ON `applicant_certificate` FOR EACH ROW BEGIN

-- Allocate empty `certificate_created` field
IF NEW.certificate_created IS NULL THEN
SET NEW.certificate_created = CURRENT_TIMESTAMP(), NEW.certificate_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `applicant_education`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `applicant_education_insert` BEFORE INSERT ON `applicant_education` FOR EACH ROW BEGIN

-- Allocate empty `education_created` field
IF NEW.education_created IS NULL THEN
SET NEW.education_created = CURRENT_TIMESTAMP(), NEW.education_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `applicant_experiences`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `applicant_experience_insert` BEFORE INSERT ON `applicant_experiences` FOR EACH ROW BEGIN

IF NEW.experience_created IS NULL THEN
SET NEW.experience_created = CURRENT_TIMESTAMP(), NEW.experience_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `applicant_files`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `applicant_files_insert` BEFORE INSERT ON `applicant_files` FOR EACH ROW BEGIN

-- Allocate empty `file_created` field
IF NEW.file_created IS NULL THEN
SET NEW.file_created = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `applicant_log`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `applicant_log_insert` BEFORE INSERT ON `applicant_log` FOR EACH ROW BEGIN

-- Allocate empty `log_created` field
IF NEW.log_created IS NULL THEN
SET NEW.log_created = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `applicant_passport`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `applicant_passport_insert` BEFORE INSERT ON `applicant_passport` FOR EACH ROW BEGIN

IF NEW.passport_created IS NULL THEN
SET NEW.passport_created = CURRENT_TIMESTAMP(), NEW.passport_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `applicant_preferred_countries`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `applicant_preferred_countries_insert` BEFORE INSERT ON `applicant_preferred_countries` FOR EACH ROW BEGIN

-- Allocate empty `country_created` field
IF NEW.country_created IS NULL THEN
SET NEW.country_created = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `applicant_preferred_positions`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `applicant_preferred_positions_insert` BEFORE INSERT ON `applicant_preferred_positions` FOR EACH ROW BEGIN

-- Allocate empty `position_created` field
IF NEW.position_created IS NULL THEN
SET NEW.position_created = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `applicant_requirement`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `applicant_requirement_insert` BEFORE INSERT ON `applicant_requirement` FOR EACH ROW BEGIN

-- Allocate empty `requirement_created` field
IF NEW.requirement_created IS NULL THEN
SET NEW.requirement_created = CURRENT_TIMESTAMP(), NEW.requirement_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `applicant_skills`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `applicant_skill_insert` BEFORE INSERT ON `applicant_skills` FOR EACH ROW BEGIN

IF NEW.skill_created IS NULL THEN
SET NEW.skill_created = CURRENT_TIMESTAMP();
END IF;
END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `bill`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `bill_insert` BEFORE INSERT ON `bill` FOR EACH ROW BEGIN

IF NEW.bill_created IS NULL THEN
SET NEW.bill_created = CURRENT_TIMESTAMP(), NEW.bill_updated = CURRENT_TIMESTAMP();

END IF;

END
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `bill_edit` BEFORE UPDATE ON `bill` FOR EACH ROW BEGIN

IF NEW.bill_employer_deposit >= NEW.bill_employer_cost AND NEW.bill_applicant_deposit >= NEW.bill_applicant_cost THEN
SET NEW.bill_status = 1;
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `bill_detail`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `bill_detail_insert` BEFORE INSERT ON `bill_detail` FOR EACH ROW BEGIN

SET NEW.detail_employer_balance = NEW.detail_employer_cost - NEW.detail_employer_deposit;

IF NEW.detail_created IS NULL THEN
SET NEW.detail_created = CURRENT_TIMESTAMP(), NEW.detail_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `bill_detail_edit` BEFORE UPDATE ON `bill_detail` FOR EACH ROW BEGIN

SET NEW.detail_employer_balance = NEW.detail_employer_cost - NEW.detail_employer_deposit;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `category`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `category_insert` BEFORE INSERT ON `category` FOR EACH ROW BEGIN

IF NEW.category_created IS NULL THEN
SET NEW.category_created = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `category_positions`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `category_position_insert` BEFORE INSERT ON `category_positions` FOR EACH ROW BEGIN

IF NEW.rel_created IS NULL THEN
SET NEW.rel_created = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `country`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `country_insert` BEFORE INSERT ON `country` FOR EACH ROW BEGIN

IF NEW.country_created IS NULL THEN
SET NEW.country_created = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `deployed`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `deployed_insert` BEFORE INSERT ON `deployed` FOR EACH ROW BEGIN

-- Allocate empty `deployed_created` field
IF NEW.deployed_created IS NULL THEN
SET NEW.deployed_created = CURRENT_TIMESTAMP(), NEW.deployed_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `employer`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `employer_insert` BEFORE INSERT ON `employer` FOR EACH ROW BEGIN

-- Allocate empty `employer_created` field
IF NEW.employer_created IS NULL THEN
SET NEW.employer_created = CURRENT_TIMESTAMP(), NEW.employer_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `employer_reservation`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `employer_selection_insert_copy` BEFORE INSERT ON `employer_reservation` FOR EACH ROW BEGIN

-- Allocate empty `reservation_created` field
IF NEW.reservation_created IS NULL THEN
SET NEW.reservation_created = CURRENT_TIMESTAMP(), NEW.reservation_updated = CURRENT_TIMESTAMP();
END IF;

IF NEW.reservation_expiration IS NULL THEN
SET NEW.reservation_expiration = DATE_ADD(CURRENT_DATE(), INTERVAL 1 WEEK);
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `employer_selected`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `employer_selected_insert` BEFORE INSERT ON `employer_selected` FOR EACH ROW BEGIN

IF NEW.selected_created IS NULL THEN
SET NEW.selected_created = CURRENT_TIMESTAMP(), NEW.selected_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `fee`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `fee_insert` BEFORE INSERT ON `fee` FOR EACH ROW BEGIN

-- Allocate empty `fee_created` field
IF NEW.fee_created IS NULL THEN
SET NEW.fee_created = CURRENT_TIMESTAMP(), NEW.fee_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `job`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `job_insert` BEFORE INSERT ON `job` FOR EACH ROW BEGIN

IF NEW.job_created IS NULL THEN
SET NEW.job_created = CURRENT_TIMESTAMP(), NEW.job_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `job_fee`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `job_fee_insert` BEFORE INSERT ON `job_fee` FOR EACH ROW BEGIN

-- Allocate empty `fee_created` field
IF NEW.fee_created IS NULL THEN
SET NEW.fee_created = CURRENT_TIMESTAMP(), NEW.fee_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `marketing_agency`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `marketing_agency_insert` BEFORE INSERT ON `marketing_agency` FOR EACH ROW BEGIN

IF NEW.agency_created IS NULL THEN
SET NEW.agency_created = CURRENT_TIMESTAMP(), NEW.agency_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `marketing_agent`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `marketing_agent_insert` BEFORE INSERT ON `marketing_agent` FOR EACH ROW BEGIN

IF NEW.agent_created IS NULL THEN
SET NEW.agent_created = CURRENT_TIMESTAMP(), NEW.agent_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `or`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `or_insert` BEFORE INSERT ON `or` FOR EACH ROW BEGIN

IF NEW.or_created IS NULL THEN
SET NEW.or_created = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `payment_employer_detail`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `payment_employer_detail_insert` BEFORE INSERT ON `payment_employer_detail` FOR EACH ROW BEGIN

IF NEW.detail_created IS NULL THEN
SET NEW.detail_created = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `payment_recruitment`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `payment_recruitment_insert` BEFORE INSERT ON `payment_recruitment` FOR EACH ROW BEGIN

IF NEW.payment_created IS NULL THEN
SET NEW.payment_created = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `payment_worker_detail`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `payment_employer_detail_insert_copy` BEFORE INSERT ON `payment_worker_detail` FOR EACH ROW BEGIN

IF NEW.detail_created IS NULL THEN
SET NEW.detail_created = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `position`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `position_insert` BEFORE INSERT ON `position` FOR EACH ROW BEGIN

IF NEW.position_created IS NULL THEN
SET NEW.position_created = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `recruitment_agent`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `marketing_agent_insert_copy` BEFORE INSERT ON `recruitment_agent` FOR EACH ROW BEGIN

IF NEW.agent_created IS NULL THEN
SET NEW.agent_created = CURRENT_TIMESTAMP(), NEW.agent_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `user`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `user_insert` BEFORE INSERT ON `user` FOR EACH ROW BEGIN

-- Allocate empty `user_created` field
IF NEW.user_created IS NULL THEN
SET NEW.user_created = CURRENT_TIMESTAMP(), NEW.user_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `user_types`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `user_type_insert` BEFORE INSERT ON `user_types` FOR EACH ROW BEGIN

-- Allocate empty `user_created` field
IF NEW.type_created IS NULL THEN
SET NEW.type_created = CURRENT_TIMESTAMP(), NEW.type_updated = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;

-- ----------------------------
--  Trigger definition for `voucher`
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `voucher_insert` BEFORE INSERT ON `voucher` FOR EACH ROW BEGIN

IF NEW.voucher_created IS NULL THEN
SET NEW.voucher_created = CURRENT_TIMESTAMP();
END IF;

END
;;
DELIMITER ;
