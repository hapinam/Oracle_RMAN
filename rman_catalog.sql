--Create tablespace rman first

CREATE USER rman IDENTIFIED BY rman
  TEMPORARY TABLESPACE temp 
  DEFAULT TABLESPACE rman
  QUOTA UNLIMITED ON rman;

GRANT resource,connect,RECOVERY_CATALOG_OWNER TO rman;

rman CATALOG rman/rman@catdb

CREATE CATALOG;

REGISTER DATABASE;