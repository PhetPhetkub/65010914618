
  CREATE OR REPLACE PACKAGE "ODMRSYS"."ODMR_ENGINE_OUTPUT" 
AUTHID CURRENT_USER AS

  PROCEDURE MODELDETAILS_PROG(p_job_name IN VARCHAR2, p_chain_step IN VARCHAR2);
  PROCEDURE TESTDETAILS_PROG(p_job_name IN VARCHAR2, p_chain_step IN VARCHAR2);
  PROCEDURE FILTERDETAILS_PROG(p_job_name IN VARCHAR2, p_chain_step IN VARCHAR2);

END;
/
