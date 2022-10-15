// generated by "sampctl package init"
#include <a_samp>
#include <a_mysql>
//#include <YSI-Coding/y_hooks>

// globar vars
#define SQL_HOST "localhost"
#define SQL_USER "root"
#define SQL_PASS ""
#define SQL_DB "creative"
new MySQL:g_Sql;

// enums
enum {
	DIALOG_WELCOME
};
enum E_PLAYER
{
	Id,
	Name[MAX_PLAYER_NAME]
};
new Players[MAX_PLAYERS][E_PLAYER];


main() 
{
	// write code here and run "sampctl package build" to compile
	// then run "sampctl package run" to run it
	print("Gamemode iniciado");
	return 1;
}

public OnPlayerConnect(playerid)
{
	new query[128], pname[MAX_PLAYER_NAME];	

    SetSpawnInfo( playerid, 0, 1, 1958.33, 1343.12, 15.36, 269.15, 26, 36, 28, 150, 0, 0 );
	ShowPlayerDialog(playerid, DIALOG_WELCOME, DIALOG_STYLE_MSGBOX, "Holi", "Bienvenido mi rey", "Close", "");
 
	GetPlayerName(playerid, pname, sizeof(pname));
 
	mysql_format(g_Sql, query, sizeof(query), "INSERT INTO `players` (Name, Password) VALUES ('%e', 'uwu')", pname);
	mysql_tquery(g_Sql, query);
    return 1;
}

public OnGameModeInit() {
	SendRconCommand("mapname Los Santos");
	SendRconCommand("changemode Roleplay");
	SendRconCommand("gamemodetext Roleplay");
	SendRconCommand("language ES");
	ConnectMySQL();
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	if (dialogid == DIALOG_WELCOME) {
		if (response) return SpawnPlayer(playerid);
	}
	return 0;
}

forward ConnectMySQL();
public ConnectMySQL()
{
	g_Sql = mysql_connect("127.0.0.1", "root", "", "creative");

	return 1;
}