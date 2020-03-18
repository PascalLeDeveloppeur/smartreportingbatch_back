-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: smart_reporting_batch6
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'smart_reporting_batch6'
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_authentication`(IN `p_admin_pseudo` VARCHAR(50))
BEGIN
DECLARE v_pseudo_exists INT(1) DEFAULT 0;
DECLARE v_message TINYTEXT;

-- On vérifie si le pseudo existe
SELECT id INTO v_pseudo_exists FROM srb_admin
WHERE admin_pseudo = p_admin_pseudo;

IF (v_pseudo_exists > 0) THEN
	SELECT id, encrypted_admin_password FROM srb_admin
	WHERE admin_pseudo = p_admin_pseudo;
ELSE
	SET v_message = "Pseudo doesn't exist";
	SELECT v_message;
END IF;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_if_new_admin_is_needed`(IN `p_admin_pseudo` VARCHAR(50))
BEGIN
DECLARE v_is_admin_exists INT;
  DECLARE v_is_admin_pending INT;
  DECLARE v_pseudo_already_exists INT;
  DECLARE v_message TINYTEXT DEFAULT "";
  
  SELECT COUNT(*) INTO v_is_admin_exists  -- On compte le nombre d'occurrence qui correspond à la requête qui suit et on l’insère dans la variable << v_is_admin_exists >>
  FROM srb_admin;
  
  IF (v_is_admin_exists > 0) THEN
		SELECT COUNT(*) INTO v_pseudo_already_exists
		FROM srb_admin
        WHERE admin_pseudo = p_admin_pseudo;
        
        
        IF (v_pseudo_already_exists > 0) THEN
			SET v_message = "Pseudo already exists";
		ELSE
			SELECT COUNT(*) INTO v_is_admin_pending
			FROM srb_admin
			WHERE admin_pseudo = "Ready to register admin";
			
			IF (v_is_admin_pending < 1) THEN
				SET v_message = "No admin pending";
			ELSE
                SET v_message = "Ready to register admin";
			END IF;
		END IF;
        
        
    
		
	ELSE
		INSERT INTO srb_token_and_scope
            (token, has_full_scope, has_provider_scope, has_member_scope)
            VALUES("Token pending", 1, 1, 1);
            
            INSERT INTO srb_admin
            (admin_pseudo, fk_srb_token_and_scope_id)
            VALUES("Ready to register admin", LAST_INSERT_ID());
            
            SET v_message = "Ready to register admin";
            
    END IF;
    
    SELECT v_message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_log_notification`()
BEGIN
DECLARE log_notification INT;
SELECT count(*) INTO log_notification from srb_log
	WHERE on_off_notification = 1;
SELECT log_notification;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_all_about_admin`()
BEGIN
DECLARE v_message TINYTEXT DEFAULT "No more admin in database";
SET foreign_key_checks = 0;
TRUNCATE TABLE srb_token_and_scope;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE srb_admin;

SELECT v_message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_all_batches_and_media_and_log`()
BEGIN
DECLARE v_message TINYTEXT DEFAULT "Tout a été vidé";
set foreign_key_checks = 0;
truncate TABLE srb_media;
set foreign_key_checks = 0;
truncate TABLE srb_media_history;
set foreign_key_checks = 0;
truncate TABLE srb_log;
set foreign_key_checks = 0;
truncate TABLE srb_batch;
set foreign_key_checks = 0;
truncate TABLE srb_media_member_network_provider;
    
SELECT v_message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_credential_for_automation`()
BEGIN
SELECT srb_credential.id, srb_service_provider.name AS service_provider, srb_network.network_name AS network, srb_credential.service_provider_username, srb_credential.service_provider_password, srb_credential.service_provider_authorization_link,
srb_credential.service_provider_code, srb_credential.service_provider_page_id, srb_credential.service_provider_token, srb_credential.service_provider_refresh_token, srb_credential.service_provider_long_time_token,
srb_credential.fk_srb_network_id AS network_id, srb_credential.fk_srb_service_provider_id AS service_provider_id
FROM srb_credential
INNER JOIN srb_network
ON srb_credential.fk_srb_network_id = srb_network.id
INNER JOIN srb_service_provider
ON srb_credential.fk_srb_service_provider_id = srb_service_provider.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_scope_for_admin_jwt`(IN `p_admin_id` INT)
BEGIN
SELECT * FROM srb_token_and_scope
    INNER JOIN srb_admin
    ON srb_admin.fk_srb_token_and_scope_id = srb_token_and_scope.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_admin_token`(IN `p_token_id` INT, `p_admin_token` TEXT)
BEGIN
DECLARE v_done INT(1) DEFAULT 0;
DECLARE v_message TINYTEXT;

UPDATE srb_token_and_scope
SET token = p_admin_token
WHERE id = p_token_id;

SELECT id INTO v_done FROM srb_token_and_scope
WHERE id = p_token_id; 

IF (v_done < 1) THEN
	SET v_message = "An issue has occured!";
ELSE
	SET v_message = "Admin Token inserted!";
END IF;

SELECT v_message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_link_media_and_member_part1`()
BEGIN
  -- Le but de l'opération est de lier les médias aux membres des providers
  -- Cette procédure stockée récupère les keyword et les provider_id
  -- de la table srb_member_keyword afin de les envoyer en paramètre à la
  -- procédure stockée sp_get_media_v2_by_network_part2
  
  -- Déclaration de variables locales
  DECLARE v_keyword TINYTEXT;
	DECLARE v_provider_id INT;
	DECLARE v_stop_loop TINYINT DEFAULT 0;

	-- Déclaration du curseur
  DECLARE curs_keyword CURSOR FOR
	SELECT keyword, fk_srb_service_provider_id
	FROM srb_member_keyword;

	-- Déclaration pour sortir de la boucle (condition not found)
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_stop_loop = 1;
    
    -- Ouverture du curseur (démarrage)
    OPEN curs_keyword;
    
    -- Boucle qui va déplacer le curseur
    loop_media: LOOP
    
		-- Récupértion et stockage des données par le curseur
    FETCH curs_keyword INTO v_keyword, v_provider_id;
        
        -- Si la condition est vrai, on sort de la boucle
        IF v_stop_loop = 1 THEN
			LEAVE loop_media;
		END IF;
        
        -- Appel de la procédure suivante avec en paramètre, les données
        -- récupérées par le curseur
        CALL sp_link_media_and_member_part2(v_provider_id, v_keyword);
        
	END LOOP;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_link_media_and_member_part2`(IN `p_provider_id` TINYINT, IN `p_keyword` TINYTEXT)
BEGIN
DECLARE v_member_id INT;
DECLARE v_keyword_id INT;
DECLARE v_media_id INT;
DECLARE v_provider_id INT;
DECLARE v_network_id TINYINT;
DECLARE v_stop_loop TINYINT DEFAULT 0;

DECLARE curs_media CURSOR FOR
SELECT srb_media.id AS media_id, fk_srb_network_id AS network_id, p_provider_id
FROM srb_media
INNER JOIN srb_batch
ON fk_srb_batch_id = srb_batch.id
WHERE srb_media.json REGEXP p_keyword AND  srb_media.fk_srb_service_provider_id = p_provider_id;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_stop_loop = 1;

OPEN curs_media;
loop_media: LOOP

	FETCH curs_media INTO v_media_id, v_network_id, v_provider_id;
	IF v_stop_loop = 1 THEN
		LEAVE loop_media;
	END IF;
	
	SELECT fk_srb_service_member_id, id INTO v_member_id, v_keyword_id
	FROM srb_member_keyword
	WHERE fk_srb_network_id = v_network_id AND keyword = p_keyword AND fk_srb_service_provider_id = p_provider_id;
	
	
	INSERT INTO srb_media_member_network_provider
	(fk_srb_media_id, fk_srb_member_keyword_fk_srb_service_member_id, fk_srb_member_keyword_fk_srb_service_provider_id, fk_srb_member_keyword_fk_srb_network_id, fk_srb_member_keyword_id)
	VALUES (v_media_id, v_member_id, v_provider_id, v_network_id, v_keyword_id)
	ON DUPLICATE KEY UPDATE fk_srb_media_id = fk_srb_media_id;
	
	SELECT * FROM srb_media_member_network_provider;
   
END LOOP;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_register_admin`(IN `p_admin_pseudo` VARCHAR(50), IN `p_encrypted_admin_password` VARCHAR(255))
BEGIN
-- Le premier admin enregistré est automatiquement le super admin. Son token sera donc full scope.
DECLARE v_message TINYTEXT;
  DECLARE v_is_done TINYINT;
	SELECT id INTO @v_new_admin_token_id
  FROM srb_token_and_scope
  WHERE token = "Token pending";
  
  UPDATE srb_admin
  SET admin_pseudo = p_admin_pseudo, encrypted_admin_password = p_encrypted_admin_password, 
  fk_srb_token_and_scope_id = @v_new_admin_token_id;
  
  SELECT COUNT(*) INTO v_is_done 
  FROM srb_admin
  WHERE admin_pseudo = p_admin_pseudo;
  
  IF (v_is_done > 0) THEN
  SET v_message = "Registering succes!";
  ELSE
  SET v_message = "An issue has occured!";
  END IF;
  
  SELECT v_message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_show_all_about_admin`()
BEGIN
SELECT * FROM srb_admin;
SELECT * FROM srb_token_and_scope;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_show_all_batches_and_media_and_linked_media`()
BEGIN
SELECT * FROM srb_batch;
SELECT * FROM srb_media_history;
SELECT * FROM srb_media;
SELECT * FROM srb_log;
SELECT * FROM srb_media_member_network_provider;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_step1__before_request_to_api_for_batch`(IN `p_request` LONGTEXT, IN `p_fk_srb_service_provider_id` INT(11), IN `p_fk_srb_network_id` INT(11))
BEGIN
INSERT INTO srb_batch (json, fk_srb_service_provider_id, fk_srb_network_id)
VALUES ('{"start request in progress":""}', p_fk_srb_service_provider_id, p_fk_srb_network_id);

SET @batch_id = LAST_INSERT_ID();

INSERT INTO srb_log (request, status, request_start_datetime, fk_srb_batch_id, fk_srb_network_id, fk_srb_service_provider_id)
VALUES (p_request, 0, SYSDATE(6), @batch_id, p_fk_srb_network_id, p_fk_srb_service_provider_id);

SELECT status, fk_srb_batch_id AS batch_id
FROM srb_log
WHERE fk_srb_batch_id = @batch_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_step2__save_of_batch`(IN `p_batch_id` INT, IN `p_request_duration_to_api` FLOAT(6), IN `p_status` TINYINT, IN `p_json` JSON, IN `p_fk_srb_service_provider_id` TINYINT, IN `p_fk_srb_network_id` TINYINT)
BEGIN
DECLARE v_is_done INT;

DECLARE EXIT HANDLER FOR sqlstate '42000'
  BEGIN
    UPDATE srb_log
	SET `status`=-11, on_off_notification = 1
	WHERE fk_srb_batch_id = p_batch_id;
  END;
  
if (p_status < 0) then
	UPDATE srb_log
	SET request_duration = p_request_duration_to_api, `status` = -1, on_off_notification = 1
	WHERE fk_srb_batch_id = p_batch_id;
    UPDATE srb_batch
    SET `json` = '{"An issue has occured" : ""}'
    WHERE id = p_batch_id;
else
	UPDATE srb_log
	SET request_duration = p_request_duration_to_api, `status` = 10, batch_storage_start_datetime=SYSDATE(6), on_off_notification = 0
	WHERE fk_srb_batch_id = p_batch_id;

	UPDATE srb_batch
	SET json=p_json
	WHERE json like '%start request in progress%}' AND fk_srb_service_provider_id = p_fk_srb_service_provider_id AND fk_srb_network_id = p_fk_srb_network_id;

	select row_count() into v_is_done;
	IF (v_is_done IS NOT NULL) THEN
		UPDATE srb_log
		SET `status`=11
		WHERE fk_srb_batch_id = p_batch_id;
	ELSE
		UPDATE srb_log
		SET `status`=-11, on_off_notification = 1
		WHERE fk_srb_batch_id = p_batch_id;        
	END IF;
end if;

UPDATE srb_log
	SET batch_storage_duration = SYSDATE(6)-batch_storage_start_datetime
	WHERE fk_srb_batch_id = p_batch_id;

select `status` from srb_log
WHERE fk_srb_batch_id = p_batch_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_step3__save_of_media_history`(`p_service_provider_id` TINYINT, `p_network_id` TINYINT, IN `p_batch_id` INT, IN `p_is_automated_mode` TINYINT)
BEGIN
DECLARE v_current_json INT DEFAULT 0; -- Cette valeur sera incrémentée afin de parcourir le tableau fournit par le batch    
    DECLARE v_network_name TINYTEXT;
    DECLARE v_json_id, v_created_date TINYTEXT;
    DECLARE v_json TEXT;
    DECLARE v_list_of_jsons JSON; -- Contiendra les objets jsons qui sont dans le tableau fournit par le batch    
    DECLARE v_is_done INT; -- Pour vérifier si une table a bien été modifiée     

    -- indique dans le log qu'on commence une opération    
    SELECT SYSDATE(6) INTO @date_debut_operation;
    
    SELECT `status` INTO @log_status
    FROM srb_log
    WHERE fk_srb_batch_id = p_batch_id;
    
    IF (@log_status = 11) THEN
		UPDATE srb_log
		SET `status`=110, media_history_storage_start_datetime = @date_debut_operation
		WHERE fk_srb_batch_id=p_batch_id;
		
		
		-- boucle pour parcourir le batch		
    SELECT json into v_list_of_jsons from srb_batch where srb_batch.id = p_batch_id;
		while v_current_json < json_length((v_list_of_jsons)) DO
		
			-- récupération de chaque json qui se trouve dans le batch			
      SELECT JSON_EXTRACT(v_list_of_jsons, CONCAT('$[', v_current_json, ']')) INTO v_json
			FROM srb_batch where srb_batch.id = p_batch_id;
			
			-- Détermination du réseau social pour pouvoir adapter la récupération des données			
      SELECT network_name INTO v_network_name from srb_network WHERE srb_network.id = p_network_id;
			
			CASE v_network_name

				WHEN 'facebook' then 
			
					SELECT JSON_EXTRACT(v_list_of_jsons, CONCAT('$[', v_current_json, '].id')),
						JSON_EXTRACT(v_list_of_jsons, CONCAT('$[', v_current_json, '].created_time'))				
					INTO v_json_id, v_created_date
					FROM srb_batch where srb_batch.id = p_batch_id;				
					
					-- Modification du format de la date fournie par le réseau social					
          SELECT (SELECT DATE_FORMAT(JSON_UNQUOTE(v_created_date), "%Y-%m-%d %H:%i:%s")) INTO @_posted_date;
					
				ELSE 
					SELECT 'Réseau social inconnu !';
			END CASE;
				
				-- Insertion de chaque json dans la table srb_media_history				
        if (v_json IS NOT NULL) then
					insert into srb_media_history
					(json_id, posted_date, json, fk_srb_service_provider_id, fk_srb_batch_id)
					value (v_json_id, @_posted_date, v_json, p_service_provider_id, p_batch_id);
				end if;
				set v_current_json = v_current_json + 1;
		end while;
		
		-- Vérifie si l'opération s'est bien déroulée		
    select row_count() into v_is_done;
		IF (v_is_done IS NOT NULL) THEN
			UPDATE srb_log
			SET `status`=111, media_history_storage_duration = (SYSDATE(6) - media_history_storage_start_datetime)
			WHERE fk_srb_batch_id=p_batch_id;
		ELSE
			UPDATE srb_log
			SET `status`=-111, on_off_notification = 1, media_history_storage_duration = (SYSDATE(6) - media_history_storage_start_datetime)
			WHERE fk_srb_batch_id=p_batch_id; 
		END IF;
	END IF;
	
    IF (p_is_automated_mode = 1) THEN
		CALL sp_step4__save_of_media(p_service_provider_id, p_network_id, p_batch_id);
    ELSE
		select `status`, fk_srb_batch_id
		FROM srb_log
		WHERE fk_srb_batch_id = p_batch_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_step4__save_of_media`(`p_service_provider_id` TINYINT, `p_network_id` TINYINT, IN `p_batch_id` INT)
BEGIN
DECLARE v_current_json INT DEFAULT 0;
DECLARE v_network_name TINYTEXT;
DECLARE v_json_id, v_created_date TINYTEXT;
DECLARE v_json TEXT;
DECLARE v_list_of_jsons JSON;
DECLARE v_is_done INT;

SELECT SYSDATE(6) INTO @date_debut_operation;
SELECT `status` INTO @log_status
    FROM srb_log
    WHERE fk_srb_batch_id = p_batch_id;
    
    IF (@log_status = 111) THEN
    
		UPDATE srb_log
		SET `status`=1110, media_storage_start_datetime = @date_debut_operation
		WHERE fk_srb_batch_id = p_batch_id;
		
		
		
		SELECT json into v_list_of_jsons from srb_batch where srb_batch.id = p_batch_id;
		while v_current_json < json_length((v_list_of_jsons)) DO
        SELECT JSON_EXTRACT(v_list_of_jsons, CONCAT('$[', v_current_json, ']'))
			INTO v_json
			FROM srb_batch where srb_batch.id = p_batch_id;
            
            SELECT network_name INTO v_network_name from srb_network WHERE srb_network.id = p_network_id;
			
			CASE v_network_name

				WHEN 'facebook' then 
			
					SELECT JSON_EXTRACT(v_list_of_jsons, CONCAT('$[', v_current_json, '].id')),
						JSON_EXTRACT(v_list_of_jsons, CONCAT('$[', v_current_json, '].created_time'))				
					INTO v_json_id, v_created_date
					FROM srb_batch where srb_batch.id = p_batch_id;
                    
                    SELECT (SELECT DATE_FORMAT(JSON_UNQUOTE(v_created_date), "%Y-%m-%d %H:%i:%s")) INTO @_posted_date;
					
				ELSE 
					SELECT 'Réseau social inconnu !';
			END CASE;
            
            if (v_json IS NOT NULL) then
					INSERT INTO srb_media				
					(json_id, posted_date, json, fk_srb_service_provider_id, fk_srb_batch_id)
					value (v_json_id, @_posted_date, v_json, p_service_provider_id, p_batch_id)
					ON DUPLICATE KEY UPDATE json_id = v_json_id, `json` = v_json;
				end if;
				set v_current_json = v_current_json + 1;
		end while;
        
        select row_count() into v_is_done;
		IF (v_is_done IS NOT NULL) THEN
			UPDATE srb_log
			SET `status`=1111, media_storage_duration = (SYSDATE(6) - media_storage_start_datetime)
			WHERE fk_srb_batch_id = p_batch_id;
		ELSE
			UPDATE srb_log
			SET `status`=-1111, on_off_notification = 1, media_storage_duration = (SYSDATE(6) - media_storage_start_datetime)
			WHERE fk_srb_batch_id = p_batch_id; 
		END IF;
	END IF;
    
    select `status`, fk_srb_batch_id
    FROM srb_log
    WHERE fk_srb_batch_id = p_batch_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-09 13:55:10
