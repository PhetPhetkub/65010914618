-- Run this script to migrate an existing ODMRSYS account
-- Warning: Data base will be put into restricted mode until migration is completed.
-- All sessions with role of ODMRUSER will be disconnected.
-- @migrateodmr.sql

set serveroutput on

EXECUTE dbms_output.put_line('Start Data Miner Repository Upgrade Process.');
EXECUTE dbms_output.put_line('');
EXECUTE dbms_output.put_line('Note: If the upgrade fails, the db may be left in restricted mode.');
EXECUTE dbms_output.put_line('In that case, run the following command as sysdba to set db back to unrestricted mode:');
EXECUTE dbms_output.put_line('alter system disable restricted session;');

WHENEVER SQLERROR EXIT SQL.SQLCODE;
-- check to insure that no workflows are either queued or active.
-- Abort the process if this condition exists.
@insureWorkflowsInactive.sql

-- update the status of the repository
EXECUTE dbms_output.put_line('Update repository status to NOT_LOADED.');
EXECUTE dbms_output.put_line('');
@updateRepositoryProperty.sql REPOSITORY_STATUS  NOT_LOADED

-- restrict further sessions to avoid deadload during migration
@alterDBRestrictSession.sql

-- disconnect any existing odmruser sessions, or odmrsys sessions
@disconnectODMRSessions.sql DR

-- migrate repository
@migrateodmrhelper.sql

-- unrestrict database sessions
@alterDBUnRestrictSession.sql

-- fail if the versions do not match the target versions provided as parameters
-- only test for repository version as the worfklow schema version upgrade is skipped for some db versions
@validateVersionUpgrade.sql '11.2.1.1.5' '11.2.1.1.1'

-- update the status of the repository
EXECUTE dbms_output.put_line('');
EXECUTE dbms_output.put_line('Update repository status to LOADED.');
EXECUTE dbms_output.put_line('');
@updateRepositoryProperty.sql REPOSITORY_STATUS  LOADED

EXECUTE dbms_output.put_line('');
EXECUTE dbms_output.put_line('End of Data Miner Repository Upgrade Process.');
EXECUTE dbms_output.put_line('');

exit;
