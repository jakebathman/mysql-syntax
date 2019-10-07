USE dbbb;

DELIMITER $$

DROP PROCEDURE IF EXISTS `migrationDatabase` $$
CREATE PROCEDURE `migrationDatabase`()
BEGIN

    DECLARE done INT DEFAULT 0;
    DECLARE db VARCHAR(255);
    DECLARE appDBs CURSOR FOR SELECT schema_name FROM information_schema.schemata WHERE schema_name LIKE 'lorem_ipsum%';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    set @preMsg = "";
    set @nbMigrate = 0;
    set @nbresult = 0;
    OPEN appDBs;
    REPEAT
        FETCH appDBs INTO db;
        IF NOT done THEN
            
            set @dbname = db;
            set @dbLength = CHAR_LENGTH(@dbname);

            if @dbLength > 3 then
                if SUBSTRING(@dbname, 1, 3) = "lorem_ipsum" then
                    
                    SET @s = concat(" INSERT INTO `", @dbname, "`.`AclFunctionalityUrl` VALUES
                        
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'basket'),                         0 '/home.php', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'noTemplate'),                     0 '/doc/basketNoTemplate.php', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'searchSection'),                  0 '/search.php', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'purchaseOrder'),                  1 '^/purchaseorders/.{1,}$', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'help'),                           0 '/help.php', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'help'),                           0 '/about.php', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'template'),                       1 '^/template/.{1,}$', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'workflow'),                       1 '^/workflow/.{1,}$', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'system'),                         1 '^/admin/.{1,}$', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'addDocument'),                    0 'uploadform.php', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'addDocument'),                    0 '/doc/upload.php', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'batchProcessing'),                0 '/doc/batchProcessing.php', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'batchProcessing'),                0 '/doc/batchProcessingBody.php', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'batchProcessing'),                0 '/doc/batchProcessingTableContent.php', JSON_ARRAY(), JSON_ARRAY()),
                        
                        
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'detectDocument'),                 0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'affectDocument'),                 0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'simpleSearch'),                   0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'advancedSearch'),                 0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'mailShare'),                      0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'addPurchaseOrder'),               0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'editPrurchaseOrderProvider'),     0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'editPrurchaseOrderItem'),         0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'editPrurchaseOrderCompany'),      0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'addTemplate'),                    0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'addWorkflow'),                    0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'editUser'),                       0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'editGroup'),                      0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'editCompany'),                    0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'editLicence'),                    0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'generalConfig'),                  0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'basketConfig'),                   0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'outgoingMail'),                   0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'incomingMail'),                   0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'hotFolder'),                      0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'externalConnection'),             0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'documentType'),                   0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'workflowStatus'),                 0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'globalField'),                    0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'globalColumn'),                   0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'globalFormula'),                  0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'templateGroup'),                  0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'groupTreatment'),                 0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'characterFilter'),                0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'listData'),                       0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'systemInfo'),                     0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'supportTools'),                   0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'indexation'),                     0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'autocreateTemplate'),             0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'module1'),                        0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'module2'),                        0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'module3'),                        0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'module4'),                        0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'module5'),                        0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'module6'),                        0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'module7'),                        0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'module8'),                        0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'module11'),                       0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'module22'),                       0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'module33'),                       0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'module44'),                       0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'addin'),                          0 '', JSON_ARRAY(), JSON_ARRAY()),
                        (0, (SELECT id FROM `", @dbname, "`.`AclFunctionality` WHERE name = 'profile'),                        0 '', JSON_ARRAY(), JSON_ARRAY())
                        
                    ");
                    PREPARE stmt1 FROM @s1; EXECUTE stmt1; DEALLOCATE PREPARE stmt1;
                    
                    
	            end if;
            end if;
        set @nbresult = @nbresult + 1;
        END IF;

    UNTIL done END REPEAT;
    CLOSE appDBs;

    SELECT concat(@preMsg, "Procedure executé sur : ", @nbresult, " database trouvé. ") AS result;
END;
$$

DELIMITER ;


CALL start_migration(129, "2.5 #11", "call dbbb.migrationDatabase()");

USE dbbb;
DROP PROCEDURE IF EXISTS `migrationDatabase`;
