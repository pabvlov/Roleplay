#define SQL_HOST "localhost"
#define SQL_USER "root"
#define SQL_PASS ""
#define SQL_DB "creative"
new MySQL:g_Sql;

forward ConnectMySQL();
public ConnectMySQL()
{
	g_Sql = mysql_connect("127.0.0.1", "root", "", "creative");

	return 1;
}