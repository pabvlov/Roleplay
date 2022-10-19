YCMD:me(playerid, params[], help)
{
	if(isnull(params)) {
        SendClientMessage(playerid, 0xFFFFFFFF, "[!] USO -> /me accion.");
    } else {
        new msg[128], name[24];
        GetPlayerName(playerid, name, sizeof(name));
        format(msg, sizeof(msg), "%s %s", name, params);
        SendClientMessageInRange(playerid, msg, "/me", 30.0);
    }
    return 1;
}

YCMD:do(playerid, params[], help)
{
	if(isnull(params)) {
        SendClientMessage(playerid, 0xFFFFFFFF, "[!] USO -> /do entorno.");
    } else {
        new msg[128], name[24];
        GetPlayerName(playerid, name, sizeof(name));
        format(msg, sizeof(msg), "[Entorno de %s] %s", name, params);
        SendClientMessageInRange(playerid, msg, "/do", 30.0);
    }
    return 1;
}

YCMD:unity(playerid, params[], help)
{
	SetPlayerPos(playerid, 1774.4281, -1860.3768, 13.2201);
    return 1;
}