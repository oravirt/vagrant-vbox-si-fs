# Oracle defaults & customizations
VALID_VERSIONS  = ['18.3.0.0','12.2.0.1','12.1.0.2','12.1.0.1','11.2.0.4','11.2.0.3']
if ENV['dbver']
 DBVER = ENV['dbver']
else
 DBVER = '18.3.0.0'
end
if ENV['giver']
 GIVER = ENV['giver']
else
 GIVER = '18.3.0.0'
end
if ENV['dbtype']
 DBTYPE = ENV['dbtype']
else
 DBTYPE = 'SI'
end
if ENV['dbstorage']
 DBSTORAGE = ENV['dbstorage']
else
 DBSTORAGE = 'FS'
end
if ENV['datafile_dest']
 DATAFILE_DEST = ENV['datafile_dest']
else
 DATAFILE_DEST = '/u02/oradata'
end
if ENV['recoveryfile_dest']
 RECOVERYFILE_DEST = ENV['recoveryfile_dest']
else
 RECOVERYFILE_DEST = '/u02/fra'
end
if ENV['dbname']
 DBNAME = ENV['dbname']
else
 DBNAME = 'orclcdb'
end
if ENV['cdb']
 CDB = ENV['cdb']
else
 CDB = "true"
end
if ENV['pdbname']
 PDBNAME = ENV['pdbname']
else
 PDBNAME = "orclpdb"
end
if ENV['numpdbs']
 NUMPDBS = ENV['numpdbs']
else
 NUMPDBS = "1"
end
if ENV['dbmem']
 DBMEM = ENV['dbmem']
else
 DBMEM = "1024"
end
if ENV['ron_service']
 RON_SERVICE = ENV['ron_service']
else
 RON_SERVICE = "#{DBNAME}_serv"
end
if ENV['redolog_size']
 REDOLOG_SIZE = ENV['redolog_size']
else
 REDOLOG_SIZE = "50M"
end
if ENV['redolog_groups']
 REDOLOG_GROUPS = ENV['redolog_groups']
else
 REDOLOG_GROUPS = "3"
end
if ENV['archivelog']
 ARCHIVELOG = ENV['archivelog']
else
 ARCHIVELOG = "false"
end
if ENV['force_logging']
 FORCE_LOGGING = ENV['force_logging']
else
 FORCE_LOGGING = "false"
end
if ENV['flashback']
 FLASHBACK = ENV['flashback']
else
 FLASHBACK = "false"
end
if ENV['apply_patches_gi']
 APPLY_PATCHES_GI = ENV['apply_patches_gi']
else
 APPLY_PATCHES_GI = "false"
end
if ENV['apply_patches_db']
 APPLY_PATCHES_DB = ENV['apply_patches_db']
else
 APPLY_PATCHES_DB = "false"
end

if VALID_VERSIONS.include? DBVER
else
 puts
 puts "valid versions are: #{VALID_VERSIONS}"
 puts "Your choice - dbver: #{DBVER} & giver: #{GIVER}"
 puts "exiting"
 exit 99
end

if VALID_VERSIONS.include? GIVER
else
 puts
 puts "valid versions are: #{VALID_VERSIONS}"
 puts "Your choice - dbver: #{DBVER} & giver: #{GIVER}"
 puts "exiting"
 exit 99
end

if DBVER > GIVER
 puts
 puts "The Grid Infrastructure version (giver) must be higher or the same as the Database version (dbver)"
 puts "Your choice - dbver: #{DBVER} & giver: #{GIVER}"
 puts "exiting"
 exit 99
end



# DB_HOMES_CONFIG = {"db1":{
# home: "db1",
# version: "#{DBVER}",
# edition: "EE",
# }}

DB_HOMES_INSTALLED = [{
home: "db1",
state: "present"
}]

ORACLE_DATABASES = [{
home: "db1",
oracle_db_name: "#{DBNAME}",
oracle_db_type: "#{DBTYPE}",
is_container: "#{CDB}",
pdb_prefix: "#{PDBNAME}",
num_pdbs: "#{NUMPDBS}",
storage_type: "#{DBSTORAGE}",
datafile_dest: "#{DATAFILE_DEST}",
recoveryfile_dest: "#{RECOVERYFILE_DEST}",
oracle_db_mem_totalmb: "#{DBMEM}",
service_name: "#{RON_SERVICE}",
oracle_database_type: "MULTIPURPOSE",
redolog_size: "#{REDOLOG_SIZE}",
redolog_groups: "#{REDOLOG_GROUPS}",
listener_name: "LISTENER",
listener_port: "1521",
archivelog: "#{ARCHIVELOG}",
flashback: "#{FLASHBACK}",
force_logging: "#{FORCE_LOGGING}",
state: "present",
"init_parameters": [
  {"name":"db_create_file_dest", "value":"#{DATAFILE_DEST}","scope":"both","state":"present"},
  {"name":"db_create_online_log_dest_1","value":"#{RECOVERYFILE_DEST}","scope":"both","state":"present"},
  {"name":"db_recovery_file_dest","value":"#{DATAFILE_DEST}","scope":"both","state":"present"},
  {"name":"db_recovery_file_dest_size","value":"20G","scope":"both","state":"present"}
 ]
}]
# End Oracle customizations
