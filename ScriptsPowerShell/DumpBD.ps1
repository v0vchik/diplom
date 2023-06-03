# Path to mysqldump executable
$MysqldumpPath = "C:\Program Files\MySQL\DBBackup\mysqldump.exe"
$DefaultsFile = "C:\Program Files\MySQL\DBBackup\my.cnf"

# Path to save the backup file
$BackupDir = "C:\Program Files\MySQL\DBBackup"

# Get the current date and time
$DateTime = Get-Date -Format "yyyyMMdd_HHmmss"

# Create the backup file name with the date and time
$BackupFile = "$BackupDir\backup_$DateTime.sql"

$Command = "& '$MysqldumpPath' --defaults-file='$DefaultsFile' --user=$DBUser --password='1928Vv$' --host=$DBServer $DBName > '$BackupFile'"

Invoke-Expression -Command $Command