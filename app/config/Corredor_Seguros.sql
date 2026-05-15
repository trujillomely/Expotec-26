CREATE TABLE `user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_address` int,
  `id_role` int,
  `dpi` bigint UNIQUE,
  `username` varchar(255),
  `lastname` varchar(255),
  `email` varchar(255) UNIQUE NOT NULL,
  `phone` varchar(255),
  `birth_date` date,
  `genre` char(1) COMMENT 'M=Masculino, F=Femenino',
  `password_hash` text NOT NULL,
  `avatar_url` varchar(255),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `status` boolean DEFAULT true
);

CREATE TABLE `role` (
  `id_role` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) UNIQUE,
  `description` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `status` boolean DEFAULT true
);

CREATE TABLE `permission` (
  `id_permission` int PRIMARY KEY AUTO_INCREMENT,
  `id_action` int,
  `name` varchar(255) UNIQUE,
  `description` text,
  `category` varchar(255),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `status` boolean DEFAULT true
);

CREATE TABLE `role_permission` (
  `id_role_permission` int PRIMARY KEY AUTO_INCREMENT,
  `id_role` int,
  `id_form_permission` int,
  `id_module_permission` int,
  `restriction_value` varchar(255),
  `restriction_description` text,
  `granted_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `status` boolean DEFAULT true
);

CREATE TABLE `insurance_company` (
  `id_insurance_company` int PRIMARY KEY AUTO_INCREMENT,
  `id_geo_coordinates` int,
  `id_address` int,
  `name` varchar(255),
  `nit` varchar(255) UNIQUE,
  `email` varchar(255),
  `phone` varchar(255),
  `website` varchar(255),
  `logo_url` varchar(255),
  `status` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `insurance_category` (
  `id_insurance_category` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` text,
  `status` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `insurance_type` (
  `id_insurance_type` int PRIMARY KEY AUTO_INCREMENT,
  `id_insurance_category` int,
  `name` varchar(255) UNIQUE,
  `description` text,
  `status` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `insurance_company_type` (
  `id_insurance_company` int,
  `id_insurance_type` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_insurance_company`, `id_insurance_type`)
);

CREATE TABLE `payment_frequency` (
  `id_payment_frequency` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `months_interval` int,
  `is_active` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `payment_schedule` (
  `id_payment_schedule` int PRIMARY KEY AUTO_INCREMENT,
  `id_policy` int,
  `installment_number` int,
  `due_date` date,
  `amount_due` decimal(12,2),
  `amount_paid` decimal(12,2),
  `payment_date` date,
  `payment_status` enum('Pendiente','Pagado','Atrasado','Parcial') DEFAULT 'Pendiente',
  `notes` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `payment_transaction` (
  `id_payment_transaction` int PRIMARY KEY AUTO_INCREMENT,
  `id_payment_schedule` int,
  `id_payment_method` int,
  `payment_date` date,
  `transaction_reference` varchar(255),
  `amount` decimal(12,2),
  `currency` varchar(255) DEFAULT 'GTQ',
  `confirmed` boolean DEFAULT false,
  `confirmed_at` timestamp,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `payment_method` (
  `id_payment_method` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` text,
  `requires_reference` boolean DEFAULT true,
  `is_online` boolean DEFAULT false,
  `status` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `policy` (
  `id_policy` int PRIMARY KEY AUTO_INCREMENT,
  `id_user` int,
  `id_insurance_company` int,
  `id_insurance_type` int,
  `id_payment_frequency` int,
  `policy_number` varchar(255) UNIQUE,
  `date_start` date,
  `date_expiration` date,
  `coverage_summary` text,
  `total_coverage_amount` decimal(10,2),
  `total_deductible_amount` decimal(10,2),
  `total_premium_amount` decimal(10,2),
  `renewable` boolean DEFAULT true,
  `status` enum('Activo','Expirado','Cancelado') DEFAULT 'Activo',
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `policy_coverage` (
  `id_policy_coverage` int PRIMARY KEY AUTO_INCREMENT,
  `id_policy` int,
  `coverage_name` varchar(255),
  `coverage_description` text,
  `coverage_amount` decimal(12,2),
  `deductible` decimal(12,2),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `status` boolean DEFAULT true
);

CREATE TABLE `policy_beneficiary` (
  `id_beneficiary` int PRIMARY KEY AUTO_INCREMENT,
  `id_policy` int,
  `id_address` int,
  `full_name` varchar(255),
  `relationship` varchar(255),
  `dpi` bigint,
  `birth_date` date,
  `email` varchar(255),
  `phone` varchar(255),
  `benefit_percentage` decimal(10,2),
  `notes` text,
  `status` varchar(255) DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `policy_history` (
  `id_policy_history` int PRIMARY KEY AUTO_INCREMENT,
  `id_policy` int,
  `id_user` int,
  `old_value` text,
  `new_value` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `policy_document` (
  `id_policy_document` int PRIMARY KEY AUTO_INCREMENT,
  `id_policy` int,
  `file_name` varchar(255),
  `file_url` text,
  `file_type` varchar(255),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `claim` (
  `id_claim` int PRIMARY KEY AUTO_INCREMENT,
  `id_policy` int,
  `id_user` int,
  `id_insured_service_provider` int,
  `id_claim_type` int,
  `claim_number` varchar(255) UNIQUE,
  `date_claim` date DEFAULT CURRENT_TIMESTAMP,
  `description` text,
  `amount_claimed` decimal(12,2),
  `status` enum('Activo','Inactivo','Pendiente','Aprovado') DEFAULT 'Pendiente',
  `resolution_date` date,
  `notes` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `claim_type` (
  `id_claim_type` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` text,
  `status` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `claim_history` (
  `id_claim_history` int PRIMARY KEY AUTO_INCREMENT,
  `id_claim` int,
  `previous_status` varchar(255),
  `new_status` varchar(255),
  `notes` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `claim_payment` (
  `id_claim_payment` int PRIMARY KEY AUTO_INCREMENT,
  `id_claim` int,
  `id_payment_method` int,
  `id_payment_transaction` int,
  `payment_date` date,
  `amount` decimal(12,2),
  `currency` varchar(255) DEFAULT 'GTQ',
  `receiver_name` varchar(255),
  `status` ENUM(
        'Pendiente',
        'Pagado',
        'Atrasado',
        'Parcial',
      	'Anulado'
    )
    DEFAULT 'Pendiente',
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `claim_document` (
  `id_claim_document` int PRIMARY KEY AUTO_INCREMENT,
  `id_claim` int,
  `file_name` text,
  `file_url` text,
  `file_type` text,
  `file_size` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE `service` (
  `id_service` int PRIMARY KEY AUTO_INCREMENT,
  `id_service_category` int,
  `name` varchar(255),
  `description` text,
  `service_type` varchar(255),
  `phone` varchar(255),
  `phone_secondary` varchar(255),
  `email` varchar(255),
  `website` varchar(255),
  `is_internal` boolean DEFAULT true,
  `status` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `service_category` (
  `id_service_category` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` text,
  `status` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `service_location` (
  `id_service_location` int PRIMARY KEY AUTO_INCREMENT,
  `id_service` int,
  `id_address` int,
  `id_geo_coordinates` int,
  `location_name` varchar(255),
  `phone` varchar(255),
  `schedule` text,
  `status` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `service_provider` (
  `id_service_provider` int PRIMARY KEY AUTO_INCREMENT,
  `id_address` int,
  `name` varchar(255),
  `description` text,
  `provider_type` varchar(255),
  `email` varchar(255),
  `phone` varchar(255),
  `website` varchar(255),
  `status` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `provider_category` (
  `id_service_provider` int,
  `id_service_category` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `status` boolean DEFAULT true,
  PRIMARY KEY (`id_service_provider`, `id_service_category`)
);

CREATE TABLE `provider_payment` (
  `id_provider_payment` int PRIMARY KEY AUTO_INCREMENT,
  `id_insured_service_provider` int,
  `id_payment_method` int,
  `payment_date` date,
  `amount` decimal(12,2),
  `currency` varchar(255) DEFAULT 'GTQ',
  `transaction_reference` varchar(255),
  `notes` text,
  `status` ENUM(
        'Pendiente',
        'Pagado',
        'Atrasado',
        'Parcial'
    )
    DEFAULT 'Pendiente',
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `provider_contract` (
  `id_contract` int PRIMARY KEY AUTO_INCREMENT,
  `id_service_provider` int,
  `id_insurance_company` int,
  `contract_number` varchar(255),
  `contract_name` varchar(255),
  `contract_type` varchar(255),
  `description` text,
  `start_date` date,
  `end_date` date,
  `renewal_type` varchar(255),
  `payment_terms` text,
  `monthly_amount` decimal(12,2),
  `total_amount` decimal(12,2),
  `currency` varchar(255) DEFAULT 'GTQ',
  `terms_conditions` text,
  `status` boolean DEFAULT true,
  `approved_at` timestamp,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `provider_contract_history` (
  `id_contract_history` int PRIMARY KEY AUTO_INCREMENT,
  `id_contract` int,
  `notes` text,
  `status` boolen DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `provider_contract_renewal` (
  `id_renewal` int PRIMARY KEY AUTO_INCREMENT,
  `id_previous_contract` int,
  `id_new_contract` int,
  `renewal_date` date,
  `new_amount` decimal(12,2),
  `processed_at` timestamp,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `status` boolean DEFAULT true,
);

CREATE TABLE `insured_service_provider` (
  `id_insurance_service_provider` int PRIMARY KEY AUTO_INCREMENT,
  `id_insurance_company` int,
  `id_service_provider` int,
  `id_service` int,
  `status` boolean DEFAULT true,
  ``created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `insurance_service_contract` (
  `id_insurance_service_contract` int PRIMARY KEY AUTO_INCREMENT,
  `id_insured_service_provider` int,
  `contract_number` varchar(255),
  `coverage_description` text,
  `service_limit` decimal(12,2),
  `service_cost` decimal(12,2),
  `currency` varchar(255) DEFAULT 'GTQ',
  `start_date` date,
  `end_date` date,
  `status` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `form_type` (
  `id_form_type` int PRIMARY KEY AUTO_INCREMENT,
  `id_current_version` int,
  `name` varchar(255),
  `description` text,
  `form_key` varchar(255),
  `category` varchar(255),
  `allow_download` boolean DEFAULT true,
  `allow_digital_fill` boolean DEFAULT true,
  `template_url` varchar(255),
  `status` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `form_field_type` (
  `id_form_field_type` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` text,
  `allows_option` boolean DEFAULT false,
  `allows_validation` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
  `status` boolean DEFAULT true
);

CREATE TABLE `form_field` (
  `id_form_field` int PRIMARY KEY AUTO_INCREMENT,
  `id_form_field_type` int,
  `id_form_type` int,
  `id_form_version` int,
  `id_form_section` int,
  `id_form_field_group` int,
  `name` varchar(255),
  `label` varchar(255),
  `placeholder` varchar(255),
  `help_text` text,
  `default_value` text,
  `is_visible` boolean DEFAULT true,
  `allowed_file_types` varchar(255),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `form_section` (
  `id_form_section` int PRIMARY KEY AUTO_INCREMENT,
  `id_form_version` int,
  `section_name` varchar(255),
  `section_description` text,
  `is_repeatable` boolean DEFAULT false,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `form_field_group` (
  `id_form_field_group` int PRIMARY KEY AUTO_INCREMENT,
  `id_form_section` int,
  `group_name` varchar(255),
  `group_description` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `status` boolean DEFAULT true
);

CREATE TABLE `form_field_option` (
  `id_form_field_option` int PRIMARY KEY AUTO_INCREMENT,
  `id_form_field` int,
  `option_label` varchar(255),
  `status` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE `form_submission` (
  `id_form_submission` int PRIMARY KEY AUTO_INCREMENT,
  `id_form_version` int,
  `id_user` int,
  `submission_number` varchar(255) UNIQUE,
  `status` enum(Borrador,Enviado) DEFAULT 'Enviado',
  `submitted_at` timestamp,
  `reviewed_at` timestamp,
  `review_notes` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE `form_submission_value` (
  `id_submission_value` int PRIMARY KEY AUTO_INCREMENT,
  `id_form_submission` int,
  `id_form_field` int,
  `field_value` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE `form_submission_history` (
  `id_submission_history` int PRIMARY KEY AUTO_INCREMENT,
  `id_form_submission` int,
  `changed_by` int,
  `previous_status` varchar(255),
  `new_status` varchar(255),
  `action` varchar(255),
  `notes` text,
  `changed_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `form_attachment` (
  `id_form_attachment` int PRIMARY KEY AUTO_INCREMENT,
  `id_form_submission` int,
  `id_form_field` int,
  `file_name` text,
  `file_url` text,
  `file_type` text,
  `file_size` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `form_template` (
  `id_form_template` int PRIMARY KEY AUTO_INCREMENT,
  `id_form_type` int,
  `template_name` text,
  `template_type` text,
  `template_url` text,
  `description` text,
  `is_default` boolean DEFAULT false,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `form_field_validation` (
  `id_validation` int PRIMARY KEY AUTO_INCREMENT,
  `id_form_field` int,
  `validation_type` text,
  `validation_value` text,
  `error_message` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `form_version` (
  `id_form_version` int PRIMARY KEY AUTO_INCREMENT,
  `id_form_type` int,
  `version_number` int,
  `description` text,
  `status` boolean DEFAULT true,
  `published_at` timestamp,
  `created_by` int,
  `approved_at` timestamp,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `form_version_changelog` (
  `id_changelog` int PRIMARY KEY AUTO_INCREMENT,
  `id_form_version` int,
  `change_type` varchar(255),
  `change_description` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `form_field_dependency` (
  `id_dependency` int PRIMARY KEY AUTO_INCREMENT,
  `id_source_field` int,
  `id_dependent_field` int,
  `condition_operator` varchar(255),
  `condition_value` text,
  `action` varchar(255),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `form_category` (
  `id_form_category` int PRIMARY KEY AUTO_INCREMENT,
  `category_name` varchar(255) UNIQUE NOT NULL,
  `description` text,
  `status` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `form_type_category` (
  `id_form_type` int,
  `id_form_category` int,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `status` boolean DEFAULT true,
  PRIMARY KEY (`id_form_type`, `id_form_category`)
);

CREATE TABLE `form_action` (
  `id_form_action` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `module_form` (
  `id_module_form` int PRIMARY KEY AUTO_INCREMENT,
  `id_module_config` int,
  `id_form_type` int
);

CREATE TABLE `notification_type` (
  `id_notification_type` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `default_importance` varchar(255) DEFAULT 'Normal',
  `template_subject` varchar(255),
  `template_body` text,
  `channels` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `notification` (
  `id_notification` int PRIMARY KEY AUTO_INCREMENT,
  `id_user` int,
  `id_notification_type` int,
  `reference_type` varchar(255),
  `title` varchar(255),
  `message` text,
  `link` varchar(255),
  `read` boolean DEFAULT false,
  `importance` varchar(255) DEFAULT 'Normal',
  `expiration_date` timestamp,
  `sent_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `read_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `module_config` (
  `id_module_config` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `table_name` text,
  `is_enabled` int DEFAULT 1,
  `requires_permission` boolean DEFAULT true,
  `config_data` text,
  `description` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `action` (
  `id_action` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` text,
  `is_system_action` boolean DEFAULT true,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `status` boolean DEFAULT true
);

CREATE TABLE `module_permission` (
  `id_module_permission` int PRIMARY KEY AUTO_INCREMENT,
  `id_module_config` int,
  `id_action` int,
  `permission_key` varchar(255) UNIQUE,
  `description` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `status` boolean DEFAULT true
);

CREATE TABLE `form_permission` (
  `id_form_permission` int PRIMARY KEY AUTO_INCREMENT,
  `id_form_type` int,
  `id_action` int,
  `permission_key` varchar(255) UNIQUE,
  `description` text,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `status` boolean DEFAULT true
);

CREATE TABLE `geo_coordinates` (
  `id_geo_coordinates` int PRIMARY KEY AUTO_INCREMENT,
  `latitude` decimal(10,6),
  `longitude` decimal(12,8),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `department` (
  `id_department` int PRIMARY KEY AUTO_INCREMENT,
  `department_name` varchar(255),
  `department_code` varchar(255),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `municipality` (
  `id_municipality` int PRIMARY KEY AUTO_INCREMENT,
  `id_department` int,
  `municipality_name` varchar(255),
  `municipality_code` varchar(255),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `locality` (
  `id_locality` int PRIMARY KEY AUTO_INCREMENT,
  `id_municipality` int,
  `locality_name` varchar(255),
  `locality_type` varchar(255),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `address` (
  `id_address` int PRIMARY KEY AUTO_INCREMENT,
  `id_locality` int,
  `address_line1` varchar(255),
  `address_line2` varchar(255),
  `postal_code` varchar(255),
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE `user` ADD FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`);

ALTER TABLE `user` ADD FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);

ALTER TABLE `permission` ADD FOREIGN KEY (`id_action`) REFERENCES `action` (`id_action`);

ALTER TABLE `role_permission` ADD FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);

ALTER TABLE `role_permission` ADD FOREIGN KEY (`id_form_permission`) REFERENCES `form_permission` (`id_form_permission`);

ALTER TABLE `role_permission` ADD FOREIGN KEY (`id_module_permission`) REFERENCES `module_permission` (`id_module_permission`);

ALTER TABLE `insurance_company` ADD FOREIGN KEY (`id_geo_coordinates`) REFERENCES `geo_coordinates` (`id_geo_coordinates`);

ALTER TABLE `insurance_company` ADD FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`);

ALTER TABLE `insurance_type` ADD FOREIGN KEY (`id_insurance_category`) REFERENCES `insurance_category` (`id_insurance_category`);

ALTER TABLE `insurance_company_type` ADD FOREIGN KEY (`id_insurance_company`) REFERENCES `insurance_company` (`id_insurance_company`);

ALTER TABLE `insurance_company_type` ADD FOREIGN KEY (`id_insurance_type`) REFERENCES `insurance_type` (`id_insurance_type`);

ALTER TABLE `payment_schedule` ADD FOREIGN KEY (`id_policy`) REFERENCES `policy` (`id_policy`);

ALTER TABLE `payment_transaction` ADD FOREIGN KEY (`id_payment_schedule`) REFERENCES `payment_schedule` (`id_payment_schedule`);

ALTER TABLE `payment_transaction` ADD FOREIGN KEY (`id_payment_method`) REFERENCES `payment_method` (`id_payment_method`);

ALTER TABLE `policy` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

ALTER TABLE `policy` ADD FOREIGN KEY (`id_insurance_company`) REFERENCES `insurance_company` (`id_insurance_company`);

ALTER TABLE `policy` ADD FOREIGN KEY (`id_insurance_type`) REFERENCES `insurance_type` (`id_insurance_type`);

ALTER TABLE `policy` ADD FOREIGN KEY (`id_payment_frequency`) REFERENCES `payment_frequency` (`id_payment_frequency`);

ALTER TABLE `policy_coverage` ADD FOREIGN KEY (`id_policy`) REFERENCES `policy` (`id_policy`);

ALTER TABLE `policy_beneficiary` ADD FOREIGN KEY (`id_policy`) REFERENCES `policy` (`id_policy`);

ALTER TABLE `policy_beneficiary` ADD FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`);

ALTER TABLE `policy_history` ADD FOREIGN KEY (`id_policy`) REFERENCES `policy` (`id_policy`);

ALTER TABLE `policy_history` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

ALTER TABLE `policy_document` ADD FOREIGN KEY (`id_policy`) REFERENCES `policy` (`id_policy`);

ALTER TABLE `claim` ADD FOREIGN KEY (`id_policy`) REFERENCES `policy` (`id_policy`);

ALTER TABLE `claim` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

ALTER TABLE `claim` ADD FOREIGN KEY (`id_insured_service_provider`) REFERENCES `insured_service_provider` (`id_insurance_service_provider`);

ALTER TABLE `claim` ADD FOREIGN KEY (`id_claim_type`) REFERENCES `claim_type` (`id_claim_type`);

ALTER TABLE `claim_history` ADD FOREIGN KEY (`id_claim`) REFERENCES `claim` (`id_claim`);

ALTER TABLE `claim_payment` ADD FOREIGN KEY (`id_claim`) REFERENCES `claim` (`id_claim`);

ALTER TABLE `claim_payment` ADD FOREIGN KEY (`id_payment_method`) REFERENCES `payment_method` (`id_payment_method`);

ALTER TABLE `claim_payment` ADD FOREIGN KEY (`id_payment_transaction`) REFERENCES `payment_transaction` (`id_payment_transaction`);

ALTER TABLE `claim_document` ADD FOREIGN KEY (`id_claim`) REFERENCES `claim` (`id_claim`);

ALTER TABLE `service` ADD FOREIGN KEY (`id_service_category`) REFERENCES `service_category` (`id_service_category`);

ALTER TABLE `service_location` ADD FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`);

ALTER TABLE `service_location` ADD FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`);

ALTER TABLE `service_location` ADD FOREIGN KEY (`id_geo_coordinates`) REFERENCES `geo_coordinates` (`id_geo_coordinates`);

ALTER TABLE `service_provider` ADD FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`);

ALTER TABLE `provider_category` ADD FOREIGN KEY (`id_service_provider`) REFERENCES `service_provider` (`id_service_provider`);

ALTER TABLE `provider_category` ADD FOREIGN KEY (`id_service_category`) REFERENCES `service_category` (`id_service_category`);

ALTER TABLE `provider_payment` ADD FOREIGN KEY (`id_insured_service_provider`) REFERENCES `insured_service_provider` (`id_insurance_service_provider`);

ALTER TABLE `provider_payment` ADD FOREIGN KEY (`id_payment_method`) REFERENCES `payment_method` (`id_payment_method`);

ALTER TABLE `provider_contract` ADD FOREIGN KEY (`id_service_provider`) REFERENCES `service_provider` (`id_service_provider`);

ALTER TABLE `provider_contract` ADD FOREIGN KEY (`id_insurance_company`) REFERENCES `insurance_company` (`id_insurance_company`);

ALTER TABLE `provider_contract_history` ADD FOREIGN KEY (`id_contract`) REFERENCES `provider_contract` (`id_contract`);

ALTER TABLE `provider_contract_renewal` ADD FOREIGN KEY (`id_previous_contract`) REFERENCES `provider_contract` (`id_contract`);

ALTER TABLE `provider_contract_renewal` ADD FOREIGN KEY (`id_new_contract`) REFERENCES `provider_contract` (`id_contract`);

ALTER TABLE `insured_service_provider` ADD FOREIGN KEY (`id_insurance_company`) REFERENCES `insurance_company` (`id_insurance_company`);

ALTER TABLE `insured_service_provider` ADD FOREIGN KEY (`id_service_provider`) REFERENCES `service_provider` (`id_service_provider`);

ALTER TABLE `insured_service_provider` ADD FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`);

ALTER TABLE `insurance_service_contract` ADD FOREIGN KEY (`id_insured_service_provider`) REFERENCES `insured_service_provider` (`id_insurance_service_provider`);

ALTER TABLE `form_type` ADD FOREIGN KEY (`id_current_version`) REFERENCES `form_version` (`id_form_version`);

ALTER TABLE `form_field` ADD FOREIGN KEY (`id_form_field_type`) REFERENCES `form_field_type` (`id_form_field_type`);

ALTER TABLE `form_field` ADD FOREIGN KEY (`id_form_type`) REFERENCES `form_type` (`id_form_type`);

ALTER TABLE `form_field` ADD FOREIGN KEY (`id_form_version`) REFERENCES `form_version` (`id_form_version`);

ALTER TABLE `form_field` ADD FOREIGN KEY (`id_form_section`) REFERENCES `form_section` (`id_form_section`);

ALTER TABLE `form_field` ADD FOREIGN KEY (`id_form_field_group`) REFERENCES `form_field_group` (`id_form_field_group`);

ALTER TABLE `form_section` ADD FOREIGN KEY (`id_form_version`) REFERENCES `form_version` (`id_form_version`);

ALTER TABLE `form_field_group` ADD FOREIGN KEY (`id_form_section`) REFERENCES `form_section` (`id_form_section`);

ALTER TABLE `form_field_option` ADD FOREIGN KEY (`id_form_field`) REFERENCES `form_field` (`id_form_field`);

ALTER TABLE `form_submission` ADD FOREIGN KEY (`id_form_version`) REFERENCES `form_version` (`id_form_version`);

ALTER TABLE `form_submission` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

ALTER TABLE `form_submission_value` ADD FOREIGN KEY (`id_form_submission`) REFERENCES `form_submission` (`id_form_submission`);

ALTER TABLE `form_submission_value` ADD FOREIGN KEY (`id_form_field`) REFERENCES `form_field` (`id_form_field`);

ALTER TABLE `form_submission_history` ADD FOREIGN KEY (`id_form_submission`) REFERENCES `form_submission` (`id_form_submission`);

ALTER TABLE `form_submission_history` ADD FOREIGN KEY (`changed_by`) REFERENCES `user` (`id`);

ALTER TABLE `form_attachment` ADD FOREIGN KEY (`id_form_submission`) REFERENCES `form_submission` (`id_form_submission`);

ALTER TABLE `form_attachment` ADD FOREIGN KEY (`id_form_field`) REFERENCES `form_field` (`id_form_field`);

ALTER TABLE `form_template` ADD FOREIGN KEY (`id_form_type`) REFERENCES `form_type` (`id_form_type`);

ALTER TABLE `form_field_validation` ADD FOREIGN KEY (`id_form_field`) REFERENCES `form_field` (`id_form_field`);

ALTER TABLE `form_version` ADD FOREIGN KEY (`id_form_type`) REFERENCES `form_type` (`id_form_type`);

ALTER TABLE `form_version` ADD FOREIGN KEY (`created_by`) REFERENCES `user` (`id`);

ALTER TABLE `form_version_changelog` ADD FOREIGN KEY (`id_form_version`) REFERENCES `form_version` (`id_form_version`);

ALTER TABLE `form_type_category` ADD FOREIGN KEY (`id_form_type`) REFERENCES `form_type` (`id_form_type`);

ALTER TABLE `form_type_category` ADD FOREIGN KEY (`id_form_category`) REFERENCES `form_category` (`id_form_category`);

ALTER TABLE `module_form` ADD FOREIGN KEY (`id_module_config`) REFERENCES `module_config` (`id_module_config`);

ALTER TABLE `module_form` ADD FOREIGN KEY (`id_form_type`) REFERENCES `form_type` (`id_form_type`);

ALTER TABLE `notification` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

ALTER TABLE `notification` ADD FOREIGN KEY (`id_notification_type`) REFERENCES `notification_type` (`id_notification_type`);

ALTER TABLE `module_permission` ADD FOREIGN KEY (`id_module_config`) REFERENCES `module_config` (`id_module_config`);

ALTER TABLE `module_permission` ADD FOREIGN KEY (`id_action`) REFERENCES `action` (`id_action`);

ALTER TABLE `form_permission` ADD FOREIGN KEY (`id_form_type`) REFERENCES `form_type` (`id_form_type`);

ALTER TABLE `form_permission` ADD FOREIGN KEY (`id_action`) REFERENCES `action` (`id_action`);

ALTER TABLE `municipality` ADD FOREIGN KEY (`id_department`) REFERENCES `department` (`id_department`);

ALTER TABLE `locality` ADD FOREIGN KEY (`id_municipality`) REFERENCES `municipality` (`id_municipality`);

ALTER TABLE `address` ADD FOREIGN KEY (`id_locality`) REFERENCES `locality` (`id_locality`);
