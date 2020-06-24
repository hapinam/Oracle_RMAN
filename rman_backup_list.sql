select
SESSION_KEY, INPUT_TYPE, STATUS,
to_char(START_TIME,'mm/dd/yy hh24:mi') start_time,
to_char(END_TIME,'mm/dd/yy hh24:mi')   end_time,
round(elapsed_seconds/3600,2)           Hours,
OUTPUT_BYTES_DISPLAY                   "Size"
from V$RMAN_BACKUP_JOB_DETAILS
order by session_key desc;



###This script will report on all backups – full, incremental and archivelog backups
--------------------------------------------------------------------------------------
col STATUS format a9
col hrs format 999.99
select
SESSION_KEY, INPUT_TYPE, STATUS,
to_char(START_TIME,'mm/dd/yy hh24:mi') start_time,
to_char(END_TIME,'mm/dd/yy hh24:mi')   end_time,
elapsed_seconds/3600                   hrs
from V$RMAN_BACKUP_JOB_DETAILS
order by session_key;



###This script will report all on full and incremental backups, not archivelog backups
---------------------------------------------------------------------------------------
col STATUS format a9
col hrs format 999.99
select
SESSION_KEY, INPUT_TYPE, STATUS,
to_char(START_TIME,'mm/dd/yy hh24:mi') start_time,
to_char(END_TIME,'mm/dd/yy hh24:mi')   end_time,
elapsed_seconds/3600                   hrs
from V$RMAN_BACKUP_JOB_DETAILS
where input_type='DB INCR'
order by session_key;