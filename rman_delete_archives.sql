###delete archivelogs except last 5 days###########
----------------------------------------------------

#!/bin/ksh
export ORACLE_HOME=$ORACLE_HOME
export ORACLE_SID=dbname
export DATE=`date "+%d%m%y_%H%M"`
$ORACLE_HOME/bin/rman target /  log=/home/oracle/logs/arc_del$DATE.log <<EOF
run {
allocate channel t1 type DISK;
allocate channel t2 type DISK;
allocate channel t3 type DISK;
crosscheck archivelog all;
delete noprompt obsolete;
delete noprompt expired archivelog all;
delete noprompt archivelog all;
delete noprompt archivelog all completed before "sysdate-5";
release channel t1;
release channel t2;
release channel t3;
}
EOF