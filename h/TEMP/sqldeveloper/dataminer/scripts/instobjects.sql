--creates tables/views/sequences/types
--initializes repository table entries
WHENEVER SQLERROR EXIT SQL.SQLCODE;


EXECUTE dbms_output.put_line('');
EXECUTE dbms_output.put_line('Create db objects (tables,views,types) in ODMRSYS');
EXECUTE dbms_output.put_line('');

CREATE TABLE ODMRSYS.ODMR$DEFAULT_STOPLISTS 
(
  WORD NVARCHAR2(2000) NOT NULL 
, LANGUAGE VARCHAR2(30) NOT NULL 
);

CREATE TABLE ODMRSYS.ODMR$DEBUG_LOG 
(
  WORKFLOW_JOB_ID VARCHAR2(30 CHAR) 
, PROJECT_NAME VARCHAR2(30 CHAR) 
, PROJECT_ID NUMBER 
, WORKFLOW_NAME VARCHAR2(30 CHAR) 
, WORKFLOW_ID NUMBER 
, NODE_ID VARCHAR2(30 BYTE) 
, NODE_NAME VARCHAR2(30 CHAR) 
, SUB_NODE_ID VARCHAR2(30 BYTE) 
, SUB_NODE_NAME VARCHAR2(30 CHAR) 
, OUTPUT_MSG VARCHAR2(4000 CHAR) 
, WORKFLOW_DATA CLOB 
, OUTPUT_CLOB CLOB 
, SESSION_USER VARCHAR2(30 CHAR) 
, SESSION_ID NUMBER 
, LOG_TIMESTAMP TIMESTAMP(6) 
) 
LOGGING 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
LOB (WORKFLOW_DATA) STORE AS SYS_LOB0000089634C00011$$ 
( 
  ENABLE STORAGE IN ROW 
  CHUNK 8192 
  RETENTION 
  NOCACHE 
  LOGGING 
  STORAGE 
  ( 
    INITIAL 65536 
    NEXT 1048576 
    MINEXTENTS 1 
    MAXEXTENTS 2147483645 
    FREELISTS 1 
    FREELIST GROUPS 1 
    BUFFER_POOL DEFAULT 
  )  
) 	
LOB (OUTPUT_CLOB) STORE AS SYS_LOB0000089634C00012$$ 
( 
  ENABLE STORAGE IN ROW 
  CHUNK 8192 
  RETENTION 
  NOCACHE 
  LOGGING 
  STORAGE 
  ( 
    INITIAL 65536 
    NEXT 1048576 
    MINEXTENTS 1 
    MAXEXTENTS 2147483645 
    FREELISTS 1 
    FREELIST GROUPS 1 
    BUFFER_POOL DEFAULT 
  )  
);

CREATE TABLE ODMRSYS.ODMR$WORKFLOW_JOBS 
(
  WORKFLOW_JOB_ID VARCHAR2(30 BYTE) NOT NULL 
, CREATION_TIME TIMESTAMP(6) NOT NULL 
, WORKFLOW_ID NUMBER NOT NULL 
, CONSTRAINT ODMR$WORKFLOW_JOBS_PK PRIMARY KEY 
  (
    WORKFLOW_JOB_ID 
  )
  ENABLE 
) 
LOGGING 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
);

CREATE TABLE ODMRSYS.ODMR$WORKFLOWS 
(
  WORKFLOW_ID NUMBER NOT NULL 
, WORKFLOW_NAME VARCHAR2(30 CHAR) NOT NULL 
, WORKFLOW_DATA SYS.XMLTYPE 
, CHAIN_NAME VARCHAR2(30 CHAR) 
, RUN_MODE VARCHAR2(30 CHAR) 
, STATUS VARCHAR2(30 CHAR) NOT NULL 
, CREATION_TIME TIMESTAMP(6) NOT NULL 
, LAST_UPDATED_TIME TIMESTAMP(6) 
, COMMENTS VARCHAR2(4000 CHAR) 
, PROJECT_ID NUMBER NOT NULL 
, CONSTRAINT ODMR$WORKFLOWS_PK PRIMARY KEY 
  (
    WORKFLOW_ID 
  )
  ENABLE 
) 
LOGGING 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
)
XMLTYPE COLUMN WORKFLOW_DATA store AS OBJECT RELATIONAL 
 XMLSCHEMA "http://xmlns.oracle.com/odmr11/odmr.xsd" ELEMENT "WorkflowProcess"
;

CREATE TABLE ODMRSYS.ODMR$WF_LOG 
(
  LOG_ID NUMBER NOT NULL 
, USER_NAME VARCHAR2(30 CHAR) NOT NULL 
, JOB_NAME VARCHAR2(30 CHAR) NOT NULL 
, PROJ_NAME VARCHAR2(30 CHAR) NOT NULL 
, PROJ_ID NUMBER NOT NULL 
, WF_NAME VARCHAR2(30 CHAR) NOT NULL 
, WF_ID NUMBER NOT NULL 
, NODE_NAME VARCHAR2(30 CHAR) NOT NULL 
, NODE_ID VARCHAR2(30 BYTE) NOT NULL 
, SUBNODE_NAME VARCHAR2(30 CHAR) 
, SUBNODE_ID VARCHAR2(30 BYTE) 
, LOG_TIMESTAMP TIMESTAMP(6) NOT NULL 
, LOG_DURATION INTERVAL DAY(3) TO SECOND(0) 
, LOG_TYPE VARCHAR2(30 CHAR) NOT NULL 
, LOG_SUBTYPE VARCHAR2(30 CHAR) NOT NULL 
, LOG_TASK VARCHAR2(30 CHAR) 
, LOG_MESSAGE NVARCHAR2(2000) 
, LOG_MESSAGE_DETAILS VARCHAR2(4000 CHAR) 
, CONSTRAINT ODMR$WF_LOG_PK PRIMARY KEY 
  (
    LOG_ID 
  )
  ENABLE 
) 
LOGGING 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
);

CREATE TABLE ODMRSYS.ODMR$WF_JOB_ARGS 
(
  CHAIN_STEP_NAME VARCHAR2(30 CHAR) NOT NULL 
, ARG_NAME VARCHAR2(60 CHAR) NOT NULL 
, ARG_DATA_TYPE VARCHAR2(30 CHAR) NOT NULL 
, ARG_STR_VALUE VARCHAR2(4000 CHAR) 
, ARG_NUM_VALUE NUMBER 
, WORKFLOW_JOB_ID VARCHAR2(30 BYTE) NOT NULL 
, CONSTRAINT ODMR$WF_JOB_ARGS_PK PRIMARY KEY 
  (
    WORKFLOW_JOB_ID 
  , CHAIN_STEP_NAME 
  , ARG_NAME 
  )
  ENABLE 
) 
LOGGING 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
);

CREATE TABLE ODMRSYS.ODMR$REPOSITORY_PROPERTIES 
(
  PROPERTY_NAME VARCHAR2(30 CHAR) NOT NULL 
, PROPERTY_NUM_VALUE NUMBER 
, PROPERTY_STR_VALUE VARCHAR2(30 CHAR) 
, "COMMENT" VARCHAR2(4000 CHAR) 
, CONSTRAINT ODMR$REPOSITORY_PROPERTIE_PK PRIMARY KEY 
  (
    PROPERTY_NAME 
  )
  ENABLE 
) 
LOGGING 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
);

INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_NUM_VALUE, "COMMENT") VALUES ('MAX_TARGET_DISTINCT_COUNT', 1000, 'Maximum number of distinc target values allowed in Classificaton Build Node.');
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_NUM_VALUE) VALUES ('UNIQUE_PERCENTAGE', 97);
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_NUM_VALUE) VALUES ('MAX_DISTINCT_CAT_CUTOFF', 60);
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_NUM_VALUE) VALUES ('PERCENT_UNI_THRESHOLD_CAT', 80);
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_NUM_VALUE) VALUES ('CUTOFF_FOR_NUMBER_FOR_CAT', 5);
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_NUM_VALUE) VALUES ('SPARSITY_CUTOFF', 90);
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_NUM_VALUE, "COMMENT") VALUES ('MAX_DISTINCT_STRAT_SAMPLE', 1000, 'Maximum number of distinct values allowed for the selected startified column in Sample Node.');
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_NUM_VALUE) VALUES ('MAX_WORKFLOW_LOG_COUNT', 100000);
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_STR_VALUE, "COMMENT") VALUES ('VERSION', '11.2.1.1.5', 'Version of the Repository');
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_NUM_VALUE, "COMMENT") VALUES ('MAX_NUM_THREADS', 10, 'Determines how many parallel workflow jobs are run within a single chain.');
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_STR_VALUE, "COMMENT") VALUES ('WORKFLOW_JOB_CLASS', 'DEFAULT_JOB_CLASS', 'Job class used to run the workflow.');
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_STR_VALUE, "COMMENT") VALUES ('REPOSITORY_STATUS', 'NOT_LOADED', 'Values: NOT_LOADED, LOADED');
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_STR_VALUE, "COMMENT") VALUES ('DEBUG_LOG', 'FALSE', 'Triggers log entries to be inserted into the debug log table.');
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_STR_VALUE, "COMMENT") VALUES ('SQL_TRACE', 'FALSE', 'Triggers SQL Trace files to be generated for worklow programs running in Oracle Scheduler.');
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_STR_VALUE, "COMMENT") VALUES ('SQL_TRACE_ID', 'LONG', 'Values: LONG, SHORT. Adds job specific trace ids to the sql trace file for better identification.');
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_STR_VALUE, "COMMENT") VALUES ('VALIDATE_WORKFLOW', 'FALSE', 'Values: TRUE, FALSE. Validate workflow during save operation.');
INSERT INTO ODMRSYS.ODMR$REPOSITORY_PROPERTIES (PROPERTY_NAME, PROPERTY_STR_VALUE, "COMMENT") VALUES ('WF_VERSION', '11.2.1.1.1', 'Supported workflow version');

-- Translation messages table
CREATE TABLE ODMRSYS.ODMR$MESSAGES 
(
  MESSAGE_ID NUMBER NOT NULL 
, LANGUAGE_ID VARCHAR2(5 CHAR) 
, MESSAGE NVARCHAR2(2000) 
, CONSTRAINT ODMR$MESSAGES_PK PRIMARY KEY 
  (
    MESSAGE_ID, LANGUAGE_ID 
  )
  ENABLE 
) 
LOGGING 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
);


CREATE INDEX ODMR$MESSAGES_MSG_ID_INDEX ON ODMRSYS.ODMR$MESSAGES (MESSAGE_ID);

CREATE INDEX ODMR$MESSAGES_LANG_ID_INDEX ON ODMRSYS.ODMR$MESSAGES (LANGUAGE_ID);
-- end of Translation messages table

CREATE TABLE ODMRSYS.ODMR$PROJECTS 
(
  USER_NAME VARCHAR2(30 CHAR) NOT NULL 
, PROJECT_ID NUMBER NOT NULL 
, PROJECT_NAME VARCHAR2(30 CHAR) NOT NULL 
, CREATION_TIME TIMESTAMP(6) NOT NULL 
, LAST_UPDATED_TIME TIMESTAMP(6) 
, COMMENTS VARCHAR2(4000 CHAR) 
, CONSTRAINT ODMR$PROJECTS_PK PRIMARY KEY 
  (
    PROJECT_ID 
  )
  ENABLE 
) 
LOGGING 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
);

ALTER TABLE ODMRSYS.ODMR$WORKFLOW_JOBS
ADD CONSTRAINT ODMR$WORKFLOW_JOBS_UK1 UNIQUE 
(
  WORKFLOW_ID 
, WORKFLOW_JOB_ID 
)
ENABLE;

ALTER TABLE ODMRSYS.ODMR$WORKFLOWS
ADD CONSTRAINT ODMR$WORKFLOWS_UK1 UNIQUE 
(
  PROJECT_ID 
, WORKFLOW_NAME 
)
ENABLE;

ALTER TABLE ODMRSYS.ODMR$PROJECTS
ADD CONSTRAINT ODMR$PROJECTS_UK1 UNIQUE 
(
  USER_NAME 
, PROJECT_ID 
)
ENABLE;

ALTER TABLE ODMRSYS.ODMR$WORKFLOW_JOBS
ADD CONSTRAINT ODMR$WORKFLOW_JOBS_FK FOREIGN KEY
(
  WORKFLOW_ID 
)
REFERENCES ODMRSYS.ODMR$WORKFLOWS
(
  WORKFLOW_ID  
)
ON DELETE CASCADE ENABLE;

ALTER TABLE ODMRSYS.ODMR$WORKFLOWS
ADD CONSTRAINT ODMR$WORKFLOWS_FK FOREIGN KEY
(
  PROJECT_ID 
)
REFERENCES ODMRSYS.ODMR$PROJECTS
(
  PROJECT_ID  
)
ON DELETE CASCADE ENABLE;

ALTER TABLE ODMRSYS.ODMR$WF_JOB_ARGS
ADD CONSTRAINT ODMR$WF_JOB_ARGS_FK FOREIGN KEY
(
  WORKFLOW_JOB_ID 
)
REFERENCES ODMRSYS.ODMR$WORKFLOW_JOBS
(
  WORKFLOW_JOB_ID  
)
ON DELETE CASCADE ENABLE;

CREATE OR REPLACE VIEW ODMRSYS.ODMR_USER_DEFAULT_STOPLISTS AS SELECT 
    WORD, LANGUAGE
FROM
  ODMRSYS.ODMR$DEFAULT_STOPLISTS;

CREATE OR REPLACE VIEW ODMRSYS.ODMR_USER_PROJECT_WORKFLOW AS SELECT
    ODMR$PROJECTS.PROJECT_ID,
    ODMR$PROJECTS.PROJECT_NAME,
    ODMR$PROJECTS.CREATION_TIME PJ_CREATION_TIME,
    ODMR$PROJECTS.LAST_UPDATED_TIME PJ_LAST_UPDATED_TIME,
    ODMR$PROJECTS.COMMENTS PJ_COMMENTS,
    ODMR$WORKFLOWS.WORKFLOW_ID,
    ODMR$WORKFLOWS.WORKFLOW_NAME,
    ODMR$WORKFLOWS.WORKFLOW_DATA,
    ODMR$WORKFLOWS.CHAIN_NAME,
    ODMR$WORKFLOWS.STATUS,
    ODMR$WORKFLOWS.CREATION_TIME WF_CREATION_TIME,
    ODMR$WORKFLOWS.LAST_UPDATED_TIME WF_LAST_UPDATED_TIME,
    ODMR$WORKFLOWS.COMMENTS WF_COMMENTS
FROM
    ODMRSYS.ODMR$WORKFLOWS,
    ODMRSYS.ODMR$PROJECTS
WHERE
    ODMR$PROJECTS.USER_NAME = SYS_CONTEXT('USERENV', 'SESSION_USER') AND ODMR$PROJECTS.PROJECT_ID = ODMR$WORKFLOWS.PROJECT_ID (+);

CREATE OR REPLACE VIEW ODMRSYS.ODMR_USER_WORKFLOW_JOBS AS SELECT
    ODMR$PROJECTS.PROJECT_ID,
    ODMR$PROJECTS.PROJECT_NAME,
    ODMR$WORKFLOWS.WORKFLOW_NAME,
    ODMR$WORKFLOWS.CHAIN_NAME "WORKFLOW_CHAIN_NAME",
    ODMR$WORKFLOWS.STATUS "WORKFLOW_STATUS",
    ODMR$WORKFLOW_JOBS.WORKFLOW_ID,
    ODMR$WORKFLOW_JOBS.WORKFLOW_JOB_ID "WORKFLOW_JOB_NAME",
    ODMR$WORKFLOW_JOBS.CREATION_TIME "JOB_CREATION_TIME"
FROM
    ODMRSYS.ODMR$WORKFLOW_JOBS,
    ODMRSYS.ODMR$WORKFLOWS,
    ODMRSYS.ODMR$PROJECTS
WHERE
    ODMR$WORKFLOW_JOBS.WORKFLOW_ID = ODMR$WORKFLOWS.WORKFLOW_ID
    AND ODMR$WORKFLOWS.PROJECT_ID = ODMR$PROJECTS.PROJECT_ID
    AND ODMR$PROJECTS.USER_NAME = SYS_CONTEXT('USERENV', 'SESSION_USER');

CREATE OR REPLACE VIEW ODMRSYS.ODMR_USER_WORKFLOW_LOG AS SELECT 
  LOG_ID,
  USER_NAME,
  JOB_NAME,
  PROJ_NAME,
  PROJ_ID,
  WF_NAME,
  WF_ID,
  NODE_ID,
  NODE_NAME,
  SUBNODE_NAME,
  SUBNODE_ID,
  LOG_TIMESTAMP,
  LOG_DURATION,
  LOG_TYPE,
  LOG_SUBTYPE,
  LOG_TASK,
  LOG_MESSAGE,
  LOG_MESSAGE_DETAILS
FROM ODMRSYS.ODMR$WF_LOG
WHERE
    ODMR$WF_LOG.USER_NAME = SYS_CONTEXT('USERENV', 'SESSION_USER');

CREATE OR REPLACE VIEW ODMRSYS.ODMR_MESSAGES AS SELECT 
  MESSAGE_ID,
  LANGUAGE_ID,
  MESSAGE 
FROM ODMRSYS.ODMR$MESSAGES;

CREATE OR REPLACE VIEW ODMRSYS.ODMR_REPOSITORY_PROPERTIES AS SELECT 
  PROPERTY_NAME,
  PROPERTY_NUM_VALUE,
  PROPERTY_STR_VALUE,
  "COMMENT" 
FROM ODMRSYS.ODMR$REPOSITORY_PROPERTIES;
   
CREATE OR REPLACE VIEW ODMRSYS.ODMR_USER_WORKFLOW_RUNNING AS SELECT "WORKFLOW_ID","WF_JOB_NAME","LOG_DATE","LOG_ID","NODE_ID","SUBNODE_ID","NODE_STATUS","SUBNODE_STATUS","NODE_START_TIME","NODE_RUN_TIME","ERROR_CODE","LOG_MESSAGE" FROM
(
  with
  s as (select
          JOB_NAME "WF_JOB_NAME",
          NULL "LOG_DATE",
          STEP_JOB_LOG_ID "LOG_ID",
          CASE WHEN SUBSTR(STEP_NAME, 1, ((INSTR(STEP_NAME, '$', 1, 1)) - LENGTH('$'))) IS NULL THEN
                 STEP_NAME
               ELSE SUBSTR(STEP_NAME, 1, ((INSTR(STEP_NAME, '$', 1, 1)) - LENGTH('$')))
               END "NODE_ID",
          CASE WHEN SUBSTR(STEP_NAME, 1, ((INSTR(STEP_NAME, '$', 1, 1)) - LENGTH('$'))) IS NOT NULL THEN
                 SUBSTR(STEP_NAME, (INSTR(STEP_NAME, '$', 1, 1))+LENGTH('$'), LENGTH(STEP_NAME) - (INSTR(STEP_NAME, '$', 1, 1)))
               ELSE NULL
               END "SUBNODE_ID",
          CASE WHEN STATE='NOT_STARTED'  THEN '00000001'
               WHEN STATE='SCHEDULED'    THEN '00000010'
               WHEN STATE='RUNNING'      THEN '00000100'
               WHEN STATE='PAUSED'       THEN '00001000'
               WHEN STATE='SUCCEEDED'    THEN '00010000'
               WHEN STATE='FAILED'       THEN '00100000'
               WHEN STATE='STOPPED'      THEN '01000000'
               WHEN STATE='STALLED'      THEN '10000000'
               END "ENCODE_STATUS",
          STATE "SUBNODE_STATUS",
          START_DATE "NODE_START_TIME",
          DURATION "NODE_RUN_TIME",
          ERROR_CODE "ERROR_CODE",
          NULL "LOG_MESSAGE"
        from USER_SCHEDULER_RUNNING_CHAINS where STEP_NAME IS NOT NULL),
  g as (select WF_JOB_NAME, NODE_ID, sys.mvaggrawbitor(ENCODE_STATUS) "NODE_STATUS"
        from s group by WF_JOB_NAME, NODE_ID)
  select
    w.WORKFLOW_ID,
    s.WF_JOB_NAME,
    s.LOG_DATE,
    s.LOG_ID,
    s.NODE_ID,
    s.SUBNODE_ID,
    /*
    CASE 
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00000001') = '00000001' THEN 'NOT_STARTED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00000010') = '00000010' THEN 'SCHEDULED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00001000') = '00001000' THEN 'PAUSED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '01000000') = '01000000' THEN 'STOPPED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '10000000') = '10000000' THEN 'STALLED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00100000') = '00100000' THEN 'FAILED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00000100') = '00000100' THEN 'RUNNING'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00010000') = '00010000' THEN 'SUCCEEDED'
    */
    CASE 
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00000100') = '00000100' THEN 'RUNNING'
        WHEN utl_raw.bit_or(g.NODE_STATUS, '00010000') = '00010000' THEN 'SUCCEEDED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00100000') = '00100000' THEN 'FAILED'
        WHEN utl_raw.bit_or(g.NODE_STATUS, '00000001') = '00000001' THEN 'NOT_STARTED'
        WHEN utl_raw.bit_or(g.NODE_STATUS, '00000010') = '00000010' THEN 'SCHEDULED'
        WHEN utl_raw.bit_or(g.NODE_STATUS, '00001000') = '00001000' THEN 'PAUSED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '01000000') = '01000000' THEN 'STOPPED'
        WHEN utl_raw.bit_or(g.NODE_STATUS, '10000000') = '10000000' THEN 'STALLED'
    ELSE 'UNKNOWN' END "NODE_STATUS",
    CASE WHEN SUBNODE_ID IS NOT NULL
         THEN s.SUBNODE_STATUS
         ELSE NULL END "SUBNODE_STATUS",
    s.NODE_START_TIME,
    s.NODE_RUN_TIME,
    s.ERROR_CODE,
    s.LOG_MESSAGE
  from s, g, ODMRSYS.ODMR_USER_WORKFLOW_JOBS w
  where s.WF_JOB_NAME = g.WF_JOB_NAME and s.WF_JOB_NAME = w.WORKFLOW_JOB_NAME and s.NODE_ID = g.NODE_ID
  order by LOG_DATE
);

CREATE OR REPLACE VIEW ODMRSYS.ODMR_USER_WORKFLOW_COMPLETE AS SELECT "WORKFLOW_ID","WF_JOB_NAME","LOG_DATE","LOG_ID","NODE_ID","SUBNODE_ID","NODE_STATUS","SUBNODE_STATUS","NODE_START_TIME","NODE_RUN_TIME","ERROR_CODE","LOG_MESSAGE" FROM
(
  with
  s as (select
          JOB_NAME "WF_JOB_NAME",
          LOG_DATE,
          LOG_ID,
          CASE WHEN SUBSTR(job_subname, 1, ((INSTR(job_subname, '$', 1, 1)) - LENGTH('$'))) IS NULL THEN
                 job_subname
               ELSE SUBSTR(job_subname, 1, ((INSTR(job_subname, '$', 1, 1)) - LENGTH('$')))
               END "NODE_ID",
          CASE WHEN SUBSTR(job_subname, 1, ((INSTR(job_subname, '$', 1, 1)) - LENGTH('$'))) IS NOT NULL THEN
                 SUBSTR(job_subname, (INSTR(job_subname, '$', 1, 1))+LENGTH('$'), LENGTH(job_subname) - (INSTR(job_subname, '$', 1, 1)))
               ELSE NULL
               END "SUBNODE_ID",
          CASE WHEN status='NOT_STARTED'  THEN '00000001'
               WHEN status='SCHEDULED'    THEN '00000010'
               WHEN status='RUNNING'      THEN '00000100'
               WHEN status='PAUSED'       THEN '00001000'
               WHEN status='SUCCEEDED'    THEN '00010000'
               WHEN status='FAILED'       THEN '00100000'
               WHEN status='STOPPED'      THEN '01000000'
               WHEN status='STALLED'      THEN '10000000'
               END "ENCODE_STATUS",
          STATUS "SUBNODE_STATUS",
          ACTUAL_START_DATE "NODE_START_TIME",
          RUN_DURATION "NODE_RUN_TIME",
          ERROR# "ERROR_CODE",
          CASE WHEN (INSTR(additional_info, ',', 1, 2)) > 0
               THEN LTRIM(SUBSTR(additional_info, (INSTR(additional_info, ',', 1, 2))+LENGTH(','), LENGTH(additional_info) - (INSTR(additional_info, ',', 1, 2))), ' ')
               ELSE NULL
          END "LOG_MESSAGE"
        from USER_SCHEDULER_JOB_RUN_DETAILS where job_subname IS NOT NULL),
  g as (select WF_JOB_NAME, NODE_ID, sys.mvaggrawbitor(ENCODE_STATUS) "NODE_STATUS"
        from s group by WF_JOB_NAME, NODE_ID)
  select
    w.WORKFLOW_ID,
    s.WF_JOB_NAME,
    s.LOG_DATE,
    s.LOG_ID,
    s.NODE_ID,
    s.SUBNODE_ID,
    /*
    CASE 
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00000001') = '00000001' THEN 'NOT_STARTED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00000010') = '00000010' THEN 'SCHEDULED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00001000') = '00001000' THEN 'PAUSED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '01000000') = '01000000' THEN 'STOPPED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '10000000') = '10000000' THEN 'STALLED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00100000') = '00100000' THEN 'FAILED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00000100') = '00000100' THEN 'RUNNING'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00010000') = '00010000' THEN 'SUCCEEDED'
    */
    CASE 
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00000100') = '00000100' THEN 'RUNNING'
        WHEN utl_raw.bit_or(g.NODE_STATUS, '00010000') = '00010000' THEN 'SUCCEEDED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '00100000') = '00100000' THEN 'FAILED'
        WHEN utl_raw.bit_or(g.NODE_STATUS, '00000001') = '00000001' THEN 'NOT_STARTED'
        WHEN utl_raw.bit_or(g.NODE_STATUS, '00000010') = '00000010' THEN 'SCHEDULED'
        WHEN utl_raw.bit_or(g.NODE_STATUS, '00001000') = '00001000' THEN 'PAUSED'
        WHEN utl_raw.bit_and(g.NODE_STATUS, '01000000') = '01000000' THEN 'STOPPED'
        WHEN utl_raw.bit_or(g.NODE_STATUS, '10000000') = '10000000' THEN 'STALLED'
    ELSE 'UNKNOWN' END "NODE_STATUS",
    CASE WHEN SUBNODE_ID IS NOT NULL
         THEN s.SUBNODE_STATUS
         ELSE NULL END "SUBNODE_STATUS",
    s.NODE_START_TIME,
    s.NODE_RUN_TIME,
    s.ERROR_CODE,
    s.LOG_MESSAGE
  from s, g, ODMRSYS.ODMR_USER_WORKFLOW_JOBS w
  where s.WF_JOB_NAME = g.WF_JOB_NAME and s.WF_JOB_NAME = w.WORKFLOW_JOB_NAME and s.NODE_ID = g.NODE_ID
  order by LOG_DATE
);

CREATE OR REPLACE VIEW ODMRSYS.ODMR_USER_WORKFLOW_ALL AS (
  SELECT "WORKFLOW_ID","WF_JOB_NAME","LOG_DATE","LOG_ID","NODE_ID","SUBNODE_ID","NODE_STATUS","SUBNODE_STATUS","NODE_START_TIME","NODE_RUN_TIME","ERROR_CODE","LOG_MESSAGE" FROM ODMRSYS.ODMR_USER_WORKFLOW_RUNNING r
  UNION
  SELECT "WORKFLOW_ID","WF_JOB_NAME","LOG_DATE","LOG_ID","NODE_ID","SUBNODE_ID","NODE_STATUS","SUBNODE_STATUS","NODE_START_TIME","NODE_RUN_TIME","ERROR_CODE","LOG_MESSAGE" FROM ODMRSYS.ODMR_USER_WORKFLOW_COMPLETE c WHERE c."WF_JOB_NAME"||c."NODE_ID"||c."SUBNODE_ID" NOT IN (SELECT n."WF_JOB_NAME"||n."NODE_ID"||n."SUBNODE_ID" FROM ODMRSYS.ODMR_USER_WORKFLOW_RUNNING n)
);

CREATE OR REPLACE VIEW ODMRSYS.ODMR_ALL_WORKFLOW_MODELS
AS
  select x.workflow_id "WF_ID", x.workflow_name "WF_NAME", t.NodeType "NODE_TYPE", t.NodeId "NODE_ID", t.NodeName "NODE_NAME", tt.ModelType "MODEL_TYPE", tt.ModelId "MODEL_ID", tt.ModelName "MODEL_NAME"
  from ODMRSYS.ODMR$WORKFLOWS x, ODMRSYS.ODMR$PROJECTS p,
    xmltable (xmlnamespaces(default 'http://xmlns.oracle.com/odmr11'), '//Nodes/*' 
    passing x.WORKFLOW_DATA 
    columns NodeType varchar2(30) path 'node-name(.)', 
    NodeId varchar2(30) path '@Id', 
    NodeName varchar2(30) path '@Name', 
    Models xmltype path 'Models') t, 
    xmltable (xmlnamespaces(default 'http://xmlns.oracle.com/odmr11'),'/Models/*' 
    passing t.Models 
    columns 
    ModelType varchar2(30) path 'node-name(.)', 
    ModelId varchar2(30) path '@Id', 
    ModelName varchar2(30) path '@Name') tt
  WHERE
    p.PROJECT_ID = x.PROJECT_ID (+);
  
COMMENT ON COLUMN ODMRSYS.ODMR$WORKFLOWS.RUN_MODE IS 'RUN, RERUN';

COMMENT ON COLUMN ODMRSYS.ODMR$WORKFLOWS.STATUS IS 'ACTIVE, INACTIVE, QUEUED';

CREATE INDEX ODMR$WORKFLOWS_INDEX ON ODMRSYS.ODMR$WORKFLOWS (PROJECT_ID);

CREATE INDEX ODMR$WF_LOG_PROJ_NAME_INDEX ON ODMRSYS.ODMR$WF_LOG (PROJ_NAME);

CREATE INDEX ODMR$WF_LOG_WF_NAME_INDEX ON ODMRSYS.ODMR$WF_LOG (WF_NAME);

CREATE INDEX ODMR$WF_LOG_JOB_NAME_INDEX ON ODMRSYS.ODMR$WF_LOG (JOB_NAME);

CREATE INDEX ODMR$WF_LOG_TYPE_INDEX ON ODMRSYS.ODMR$WF_LOG (LOG_TYPE);

CREATE INDEX ODMR$WF_LOG_STYPE_INDEX ON ODMRSYS.ODMR$WF_LOG (LOG_SUBTYPE);

CREATE INDEX ODMR$WF_LOG_TASK_INDEX ON ODMRSYS.ODMR$WF_LOG (LOG_TASK);

CREATE INDEX ODMR$WF_LOG_NODE_ID_INDEX ON ODMRSYS.ODMR$WF_LOG (NODE_ID);

CREATE INDEX ODMR$WF_LOG_WF_ID_INDEX ON ODMRSYS.ODMR$WF_LOG (WF_ID);

CREATE INDEX ODMR$WF_LOG_TIMESTMP_INDEX ON ODMRSYS.ODMR$WF_LOG (LOG_TIMESTAMP);

CREATE SEQUENCE ODMRSYS.ODMR$WORKFLOW_OBJECT_NAME_SEQ INCREMENT BY 1 START WITH 1 MAXVALUE 999999999999999999999999999 MINVALUE 1 NOCACHE;

CREATE SEQUENCE ODMRSYS.ODMR$WORKFLOW_ID_SEQ INCREMENT BY 1 MAXVALUE 999999999999999999999999999 MINVALUE 1 NOCACHE;

CREATE SEQUENCE ODMRSYS.ODMR$PROJECT_ID_SEQ INCREMENT BY 1 MAXVALUE 999999999999999999999999999 MINVALUE 1 NOCACHE;

CREATE SEQUENCE ODMRSYS.ODMR$LOG_ID_SEQ INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 NOCACHE;

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_NUM_COST 
AS OBJECT
(
  PREDICTION  NUMBER,
  PROBABILITY NUMBER,
  COST        NUMBER
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_NUM 
AS OBJECT
(
  PREDICTION  NUMBER,
  PROBABILITY NUMBER
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_CAT_COST 
AS OBJECT
(
  PREDICTION  VARCHAR2(128),
  PROBABILITY NUMBER,
  COST        NUMBER
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_CAT 
AS OBJECT
(
  PREDICTION  VARCHAR2(128),
  PROBABILITY NUMBER
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_SET_NUM_COST 
AS TABLE OF ODMRSYS.ODMR_PREDICTION_NUM_COST
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_SET_NUM 
AS TABLE OF ODMRSYS.ODMR_PREDICTION_NUM
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_SET_CAT_COST 
AS TABLE OF ODMRSYS.ODMR_PREDICTION_CAT_COST
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_SET_CAT 
AS TABLE OF ODMRSYS.ODMR_PREDICTION_CAT
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_FEATURE_NUM 
AS OBJECT
(
  FEATURE_ID  NUMBER,
  VALUE       NUMBER
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_FEATURE_SET_NUM 
AS TABLE OF ODMRSYS.ODMR_FEATURE_NUM
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_FEATURE_CAT 
AS OBJECT
(
  FEATURE_ID  VARCHAR2(128),
  VALUE       NUMBER
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_FEATURE_SET_CAT 
AS TABLE OF ODMRSYS.ODMR_FEATURE_CAT
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_CLUSTER_NUM 
AS OBJECT
(
  CLUSTER_ID  NUMBER,
  PROBABILITY NUMBER
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_CLUSTER_SET_NUM 
AS TABLE OF ODMRSYS.ODMR_CLUSTER_NUM
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_CLUSTER_CAT 
AS OBJECT
(
  CLUSTER_ID  VARCHAR2(128),
  PROBABILITY NUMBER
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_CLUSTER_SET_CAT 
AS TABLE OF ODMRSYS.ODMR_CLUSTER_CAT
/

-- 12.1 Apply output column types
CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_NUM_COSTF
AS OBJECT
(
  PREDICTION  BINARY_FLOAT,
  PROBABILITY BINARY_DOUBLE,
  COST        BINARY_DOUBLE
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_NUM_COSTD
AS OBJECT
(
  PREDICTION  BINARY_DOUBLE,
  PROBABILITY BINARY_DOUBLE,
  COST        BINARY_DOUBLE
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_NUM_COSTN
AS OBJECT
(
  PREDICTION  NUMBER,
  PROBABILITY BINARY_DOUBLE,
  COST        BINARY_DOUBLE
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_NUM_F
AS OBJECT
(
  PREDICTION  BINARY_FLOAT,
  PROBABILITY BINARY_DOUBLE
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_NUM_D
AS OBJECT
(
  PREDICTION  BINARY_DOUBLE,
  PROBABILITY BINARY_DOUBLE
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_NUM_N
AS OBJECT
(
  PREDICTION  NUMBER,
  PROBABILITY BINARY_DOUBLE
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_CAT_COSTPD
AS OBJECT
(
  PREDICTION  VARCHAR2(128),
  PROBABILITY BINARY_DOUBLE,
  COST        BINARY_DOUBLE
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_CATPD
AS OBJECT
(
  PREDICTION  VARCHAR2(128),
  PROBABILITY BINARY_DOUBLE
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_SET_NUM_COSTF
AS TABLE OF ODMRSYS.ODMR_PREDICTION_NUM_COSTF
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_SET_NUM_COSTD
AS TABLE OF ODMRSYS.ODMR_PREDICTION_NUM_COSTD
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_SET_NUM_COSTN
AS TABLE OF ODMRSYS.ODMR_PREDICTION_NUM_COSTN
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_SET_NUM_F
AS TABLE OF ODMRSYS.ODMR_PREDICTION_NUM_F
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_SET_NUM_D
AS TABLE OF ODMRSYS.ODMR_PREDICTION_NUM_D
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_SET_NUM_N
AS TABLE OF ODMRSYS.ODMR_PREDICTION_NUM_N
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_SET_CAT_COSTPD
AS TABLE OF ODMRSYS.ODMR_PREDICTION_CAT_COSTPD
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_PREDICTION_SET_CATPD
AS TABLE OF ODMRSYS.ODMR_PREDICTION_CATPD
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_FEATURE_NUMVD
AS OBJECT
(
  FEATURE_ID  NUMBER,
  VALUE       BINARY_DOUBLE
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_FEATURE_SET_NUMVD
AS TABLE OF ODMRSYS.ODMR_FEATURE_NUMVD
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_FEATURE_CATVD
AS OBJECT
(
  FEATURE_ID  VARCHAR2(128),
  VALUE       BINARY_DOUBLE
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_FEATURE_SET_CATVD
AS TABLE OF ODMRSYS.ODMR_FEATURE_CATVD
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_CLUSTER_NUMPD
AS OBJECT
(
  CLUSTER_ID  NUMBER,
  PROBABILITY BINARY_DOUBLE
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_CLUSTER_SET_NUMPD
AS TABLE OF ODMRSYS.ODMR_CLUSTER_NUMPD
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_CLUSTER_CATPD
AS OBJECT
(
  CLUSTER_ID  VARCHAR2(128),
  PROBABILITY BINARY_DOUBLE
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_CLUSTER_SET_CATPD
AS TABLE OF ODMRSYS.ODMR_CLUSTER_CATPD
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_HISTOGRAM_POINT 
AS OBJECT
( 
  ATTRIBUTE_NAME        		VARCHAR2(35),
  ATTRIBUTE_VALUE       		VARCHAR2(4000),
  GROUPING_ATTRIBUTE_NAME       VARCHAR2(35),
  GROUPING_ATTRIBUTE_VALUE      VARCHAR2(4000),
  ATTRIBUTE_PERCENT             NUMBER
)
/


CREATE OR REPLACE TYPE ODMRSYS.ODMR_HISTOGRAMS 
AS TABLE OF ODMRSYS.ODMR_HISTOGRAM_POINT
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_TRANSFORM_SETTING 
AS OBJECT
(
  XFORM_ID                NUMBER,
  SETTING_NAME            VARCHAR2(128),
  SETTING_STR_VALUE       VARCHAR2(4000),
  SETTING_NUM_VALUE       NUMBER
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_TRANSFORM_SETTINGS 
AS TABLE OF ODMRSYS.ODMR_TRANSFORM_SETTING
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_OBJECT_VALUES 
is TABLE OF VARCHAR2(4000)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_OBJECT_NAMES 
is TABLE OF VARCHAR2(35)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_OBJECT_IDS 
is TABLE OF NUMBER
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_NODE_REFERENCE 
AS OBJECT
(
  PROJECT_ID              NUMBER,
  PROJECT_NAME            VARCHAR2(30),
  WORKFLOW_ID             NUMBER,
  WORKFLOW_NAME           VARCHAR2(30),
  NODE_NAME               VARCHAR2(40),
  NODE_ID                 NUMBER,
  NODE_TYPE               VARCHAR(50),
  NODE_STATUS             VARCHAR(30)
)
/

CREATE OR REPLACE TYPE ODMRSYS.ODMR_NODE_REFERENCE_SET 
is TABLE OF ODMRSYS.ODMR_NODE_REFERENCE
/

-- Create Indexes on XML system generate tables to improve xml query performance
-- Node id indexes
 CREATE INDEX "ODMRSYS"."CLASSIFICATION_BUILD_N_ID_IDX"
  ON "CLASSIFICATION_BUILD_TAB" (extractValue(OBJECT_VALUE, '/ClassificationBuild/@Id'));
 
 CREATE INDEX "ODMRSYS"."DATA_PROFILE_N_ID_IDX"
  ON "DATA_PROFILE_TAB" (extractValue(OBJECT_VALUE, '/DataProfile/@Id'));

 CREATE INDEX "ODMRSYS"."DATA_SOURCE_N_ID_IDX"
  ON "DATA_SOURCE_TAB" (extractValue(OBJECT_VALUE, '/DataSource/@Id'));

 CREATE INDEX "ODMRSYS"."CREATE_TABLE_N_ID_IDX"
  ON "CREATE_TABLE_TAB" (extractValue(OBJECT_VALUE, '/CreateTable/@Id'));

 CREATE INDEX "ODMRSYS"."UPDATE_TABLE_N_ID_IDX"
  ON "UPDATE_TABLE_TAB" (extractValue(OBJECT_VALUE, '/UpdateTable/@Id'));

 CREATE INDEX "ODMRSYS"."AGGREGATION_N_ID_IDX"
  ON "AGGREGATION_TAB" (extractValue(OBJECT_VALUE, '/Aggregation/@Id'));

 CREATE INDEX "ODMRSYS"."TRANSFORMATION_N_ID_IDX"
  ON "TRANSFORMATION_TAB" (extractValue(OBJECT_VALUE, '/Transformation/@Id'));

 CREATE INDEX "ODMRSYS"."JOIN_N_ID_IDX"
  ON "JOIN_TAB" (extractValue(OBJECT_VALUE, '/Join/@Id'));

 CREATE INDEX "ODMRSYS"."BUILD_TEXT_REF_N_ID_IDX"
  ON "BUILD_TEXT_REF_TAB" (extractValue(OBJECT_VALUE, '/BuildTextRef/@Id'));

 CREATE INDEX "ODMRSYS"."APPLY_TEXT_N_ID_IDX"
  ON "APPLY_TEXT_TAB" (extractValue(OBJECT_VALUE, '/ApplyText/@Id'));

 CREATE INDEX "ODMRSYS"."BUILD_TEXT_N_ID_IDX"
  ON "BUILD_TEXT_TAB" (extractValue(OBJECT_VALUE, '/BuildText/@Id'));
  
 CREATE INDEX "ODMRSYS"."SAMPLE_N_ID_IDX"
  ON "SAMPLE_TAB" (extractValue(OBJECT_VALUE, '/Sample/@Id'));

 CREATE INDEX "ODMRSYS"."COLUMN_FILTER_N_ID_IDX"
  ON "COLUMN_FILTER_TAB" (extractValue(OBJECT_VALUE, '/ColumnFilter/@Id'));

 CREATE INDEX "ODMRSYS"."ROW_FILTER_N_ID_IDX"
  ON "ROW_FILTER_TAB" (extractValue(OBJECT_VALUE, '/RowFilter/@Id'));

 CREATE INDEX "ODMRSYS"."REGRESSION_BUILD_N_ID_IDX"
  ON "REGRESSION_BUILD_TAB" (extractValue(OBJECT_VALUE, '/RegressionBuild/@Id'));
  
 CREATE INDEX "ODMRSYS"."CLUSTERING_BUILD_N_ID_IDX"
  ON "CLUSTERING_BUILD_TAB" (extractValue(OBJECT_VALUE, '/ClusteringBuild/@Id'));

 CREATE INDEX "ODMRSYS"."ASSOCIATION_BUILD_N_ID_IDX"
  ON "ASSOCIATION_BUILD_TAB" (extractValue(OBJECT_VALUE, '/AssociationBuild/@Id'));

 CREATE INDEX "ODMRSYS"."FEATURE_EXT_BUILD_N_ID_IDX"
  ON "FEATURE_EXT_BUILD_TAB" (extractValue(OBJECT_VALUE, '/FeatureExtractionBuild/@Id'));

 CREATE INDEX "ODMRSYS"."ANOMALY_DET_BUILD_N_ID_IDX"
  ON "ANOMALY_DETECT_BUILD_TAB" (extractValue(OBJECT_VALUE, '/AnomalyDetectionBuild/@Id'));

 CREATE INDEX "ODMRSYS"."MODEL_N_ID_IDX"
  ON "MODEL_TAB" (extractValue(OBJECT_VALUE, '/Model/@Id'));

 CREATE INDEX "ODMRSYS"."APPLY_N_ID_IDX"
  ON "APPLY_TAB" (extractValue(OBJECT_VALUE, '/Apply/@Id'));

 CREATE INDEX "ODMRSYS"."TEST_N_ID_IDX"
  ON "TEST_TAB" (extractValue(OBJECT_VALUE, '/Test/@Id'));

 CREATE INDEX "ODMRSYS"."MODEL_DETAILS_N_ID_IDX"
  ON "MODEL_DETAILS_TAB" (extractValue(OBJECT_VALUE, '/ModelDetails/@Id'));

 CREATE INDEX "ODMRSYS"."TEST_DETAILS_N_ID_IDX"
  ON "TEST_DETAILS_TAB" (extractValue(OBJECT_VALUE, '/TestDetails/@Id'));

 CREATE INDEX "ODMRSYS"."FILTER_DETAILS_N_ID_IDX"
  ON "FILTER_DETAILS_TAB" (extractValue(OBJECT_VALUE, '/FilterDetails/@Id'));

-- indexes for model collection ids
 CREATE INDEX "ODMRSYS"."DECISION_TREE_M_ID_IDX"
  ON "DECISION_TREE_M_TAB" (extractValue(OBJECT_VALUE, '/DecisionTreeModel/@Id'));

 CREATE INDEX "ODMRSYS"."NAIVE_BAYES_M_ID_IDX"
  ON "NAIVE_BAYES_M_TAB" (extractValue(OBJECT_VALUE, '/NaiveBayesModel/@Id'));

 CREATE INDEX "ODMRSYS"."SUPT_VECTOR_MACH_C_M_ID_IDX"
  ON "SUPT_VECTOR_MACH_C_M_TAB" (extractValue(OBJECT_VALUE, '/CSupportVectorMachineModel/@Id'));

 CREATE INDEX "ODMRSYS"."GEN_LINEAR_C_M_ID_IDX"
  ON "GEN_LINEAR_C_M_TAB" (extractValue(OBJECT_VALUE, '/CGeneralizedLinearModel/@Id'));

 CREATE INDEX "ODMRSYS"."KMEANS_M_ID_IDX"
  ON "KMEANS_M_TAB" (extractValue(OBJECT_VALUE, '/KMeansModel/@Id'));

 CREATE INDEX "ODMRSYS"."OCLUSTER_M_ID_IDX"
  ON "OCLUSTER_M_TAB" (extractValue(OBJECT_VALUE, '/OClusterModel/@Id'));

 CREATE INDEX "ODMRSYS"."NON_NEG_MATRIX_M_ID_IDX"
  ON "NON_NEG_MATRIX_M_TAB" (extractValue(OBJECT_VALUE, '/NonNegativeMatrixFactorModel/@Id'));

 CREATE INDEX "ODMRSYS"."SUPT_VECTOR_MACH_R_M_ID_IDX"
  ON "SUPT_VECTOR_MACH_R_M_TAB" (extractValue(OBJECT_VALUE, '/RSupportVectorMachineModel/@Id'));

 CREATE INDEX "ODMRSYS"."GEN_LINEAR_R_M_ID_IDX"
  ON "GEN_LINEAR_R_M_TAB" (extractValue(OBJECT_VALUE, '/RGeneralizedLinearModel/@Id'));

 CREATE INDEX "ODMRSYS"."ANOM_DETECT_M_ID_IDX"
  ON "ANOM_DETECT_M_TAB" (extractValue(OBJECT_VALUE, '/AnomalyDetectionModel/@Id'));

 CREATE INDEX "ODMRSYS"."APRIORI_M_ID_IDX"
  ON "APRIORI_M_TAB" (extractValue(OBJECT_VALUE, '/AprioriModel/@Id'));

-- Create index on MiningAttribute
 CREATE INDEX "ODMRSYS"."MINING_ATTRIBUTE_NM_IDX"
  ON "MINING_ATTRIBUTE_TAB" (extractValue(OBJECT_VALUE, '/MiningAttribute/@Name'));

-- Create indexes on Link element
CREATE INDEX "ODMRSYS"."LINKS_TAB_FROM_IDX"
  ON "LINKS_TAB" (extractValue(OBJECT_VALUE, '/Link/@From'));

CREATE INDEX "ODMRSYS"."LINKS_TAB_TO_IDX"
  ON "LINKS_TAB" (extractValue(OBJECT_VALUE, '/Link/@To'));

-- Gather statistics to jump start optimizer
EXECUTE DBMS_STATS.GATHER_SCHEMA_STATS('ODMRSYS',DBMS_STATS.AUTO_SAMPLE_SIZE);


/* Example of XMLIndex definition
BEGIN
  --select count(*) from v$parameter where name = 'compatible' and value like '11.2.%';
  
  DBMS_XMLINDEX.registerParameter('idx_param',
  'XMLTable DATA_SOURCE_XMLIDX XMLNAMESPACES(DEFAULT ''http://xmlns.oracle.com/odmr11''),
        ''/WorkflowProcess/Nodes/DataSource''
        COLUMNS NodeType     VARCHAR2(30) PATH ''name()'',
                NodeId       VARCHAR2(30) PATH ''@Id'',
                NodeName     VARCHAR2(30) PATH ''@Name'',
                NodeStatus   VARCHAR2(30) PATH ''@Status''');
  EXECUTE IMMEDIATE 'CREATE INDEX WF_NODE_XMLINDEX ON ODMR$WORKFLOWS(WORKFLOW_DATA) INDEXTYPE IS XDB.XMLIndex PARAMETERS(''param idx_param'')';
  EXECUTE IMMEDIATE 'CREATE INDEX DATA_SOURCE_XMLIDX_IX ON DATA_SOURCE_XMLIDX(NodeId)';
  
  DBMS_XMLINDEX.registerParameter('idx_param_1',
  'ADD_GROUP GROUP CLASSIFICATION_BUILD_GRP
   XMLTable CLASSIFICATION_BUILD_XMLIDX XMLNAMESPACES(DEFAULT ''http://xmlns.oracle.com/odmr11''),
        ''/WorkflowProcess/Nodes/ClassificationBuild''
        COLUMNS NodeType     VARCHAR2(30) PATH ''name()'',
                NodeId       VARCHAR2(30) PATH ''@Id'',
                NodeName     VARCHAR2(30) PATH ''@Name'',
                NodeStatus   VARCHAR2(30) PATH ''@Status''');
  EXECUTE IMMEDIATE 'ALTER INDEX WF_NODE_XMLINDEX parameters (''param idx_param_1'');';
  EXECUTE IMMEDIATE 'CREATE INDEX CLASSIFICATION_BUILD_XMLIDX_IX ON CLASSIFICATION_BUILD_XMLIDX(NodeId)';
END;
*/