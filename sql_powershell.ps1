[void][system.reflection.Assembly]::LoadWithPartialName("MySql.Data")
$dbusername = 'root'
$dbpassword = 'Welcome22'
$connStr ="server=localhost;Persist Security Info=false;user id=" + $dbusername + ";pwd=" + $dbpassword + ";"
$conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connStr)
$conn.Open()
$dbname = 'adinfo'

$cmd = New-Object MySql.Data.MySqlClient.MySqlCommand
$cmd.Connection  = $conn
#$cmd.CommandText = "DROP DATABASE IF EXISTS " + $dbname
#$cmd.ExecuteNonQuery()
#$cmd.CommandText = 'CREATE SCHEMA `' + $dbname + '`'
#$cmd.ExecuteNonQuery()
$cmd.CommandText = 'USE ' + $dbname
$cmd.ExecuteNonQuery()
#$cmd.CommandText = 'CREATE TABLE providernames (`providername` varchar(100) default NULL)'
#$cmd.ExecuteNonQuery()
$conn.close()
#
#$sql = New-Object MySql.Data.MySqlClient.MySqlCommand
#$sql.Connection = $conn
$conn.Open()
$providernames = Get-WmiObject -Class Win32_MappedLogicalDisk | select ProviderName
foreach($provider in $providernames) {
    $cmd.CommandText = "INSERT INTO providernames (`providername`) VALUES ('$provider')"
}
$cmd.ExecuteNonQuery()
$conn.close()












