
-- ---------------------------------------------------------------------------------------------------------------------
-- 3. Neuen User für den Zugriff der App auf die DB anlegen und mit Berechtigungen versehenAnlegen der Datenbank
-- ---------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------
-- 3.1 Aus Sicherheitsgründen können wir den root-user (Zugriffsprofile) für den Zugriff auf die DB nicht gebrauchen.
--     Wir müssen einen neuen User anlegen, allerdings mit beschränkten Zugriffsrechten auf die DB
--     Damit wir den neuen User nicht doppelt anlegen, lassen wir uns alle DB-User anzeigen.
-- ---------------------------------------------------------------------------------------------------------------------
SELECT user FROM mysql.user;

-- ---------------------------------------------------------------------------------------------------------------------
-- 3.2 Gegebenenfalls müssen wir DB-User löschen
-- ---------------------------------------------------------------------------------------------------------------------
DROP USER 'absenzenApp'@'localhost';


-- ---------------------------------------------------------------------------------------------------------------------
-- 3.3 Aus Sicherheitsgründen können wir den root-user für unseren Zugriff auf die DB nicht gebrauchen.
--     Daher legen wir einen neuen User an mit eingeschränkten Berechtigungen.
-- ---------------------------------------------------------------------------------------------------------------------
CREATE USER  'absenzenApp'@'localhost' IDENTIFIED BY'bzz123';
ALTER USER 'absenzenApp'@'localhost' IDENTIFIED WITH mysql_native_password BY 'bzz123';
--    host: 'localhost',
--    user: 'appAdmin',
--    password: 'appAdminPW',
--    database: 'appDB',

-- ---------------------------------------------------------------------------------------------------------------------
-- 3.4 Privilegien/Berechtigungen setzten für die neuen User auf der neuen DB
-- ---------------------------------------------------------------------------------------------------------------------
GRANT all privileges ON absenzen.* TO 'absenzenApp'@'localhost';


-- ---------------------------------------------------------------------------------------------------------------------
-- 3.5 Berechtigungen müssen jetzt noch aktiviert werden
-- ---------------------------------------------------------------------------------------------------------------------
FLUSH PRIVILEGES;

-- ---------------------------------------------------------------------------------------------------------------------
-- 3.6 Berechtigungen anzeigen lassen
-- ---------------------------------------------------------------------------------------------------------------------
SELECT user,host FROM mysql.user;
SHOW GRANTS FOR absenzenApp@localhost;
