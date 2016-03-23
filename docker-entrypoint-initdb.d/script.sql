CREATE DATABASE alfresco DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL PRIVILEGES ON alfresco.* TO alfresco@'%' IDENTIFIED BY 'alfrescopw';
GRANT SELECT,LOCK TABLES ON alfresco.* TO alfresco@'%' IDENTIFIED BY 'alfrescopw';
FLUSH PRIVILEGES;
