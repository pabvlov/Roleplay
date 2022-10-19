// enums
enum {
	DIALOG_WELCOME
};

public OnPlayerConnect(playerid)
{
	//new query[128];
	new pname[MAX_PLAYER_NAME], msg[128];	

    
	GetPlayerName(playerid, pname, sizeof(pname));

	format(msg, sizeof(msg), "Hola %s, te damos la bienvenida a la version %s", pname, ver);
 
	ShowPlayerDialog(playerid, DIALOG_WELCOME, DIALOG_STYLE_MSGBOX, "Bienvenido", msg, "Close", "");

	//mysql_format(g_Sql, query, sizeof(query), "INSERT INTO `players` (Name, Password) VALUES ('%e', 'uwu')", pname);
	//mysql_tquery(g_Sql, query);
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	if (dialogid == DIALOG_WELCOME) {
		if (response) return SpawnPlayer(playerid);
	}
	return 0;
}
