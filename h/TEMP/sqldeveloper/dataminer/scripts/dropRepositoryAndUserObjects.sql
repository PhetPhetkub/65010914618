-- Drops the ODMRSYS Repostory and all internal User objects created by ODMr
-- Example: @dropRepositoryAndUserObjects.sql 
-- Warning: The data base will be placed into restricted mode, not allowing any new non priv user 
-- connections during the dropping of the repository. Additionally, all connections assigned the role
-- of ODMRUSER will be disconnected.

SET SERVEROUTPUT ON;

WHENEVER OSERROR EXIT;
WHENEVER SQLERROR EXIT SQL.SQLCODE;

EXECUTE dbms_output.put_line('Start Data Miner Repository Drop Process.');
EXECUTE dbms_output.put_line('');

-- sets db in restricted mode
@@alterDBRestrictSession.sql

-- disconnects any odmr sessions
@@disconnectODMRSessions.sql DR

WHENEVER SQLERROR CONTINUE;

--Drop Users Internal Tables/Views created by ODMr
@@dropUserTablesViews.sql D

--Drop Oracle Scheduler Chain objects
@@dropSchedulerObjects.sql D

--Drop public synonyms of ODMRSyS
@@dropPublicSynonyms.sql 

WHENEVER SQLERROR EXIT SQL.SQLCODE;

--Drop ODMRSYS Repository
@@dropRepository.sql

-- disables db restricted mode
@@alterDBUnRestrictSession.sql

EXECUTE dbms_output.put_line('End Data Miner Repository Drop Process.');
EXECUTE dbms_output.put_line('');

exit;