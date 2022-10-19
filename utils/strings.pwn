forward SendClientMessageInRange(playerid, const text[], const color[], const Float:radius);
public SendClientMessageInRange(playerid, const text[], const color[], const Float:radius) 
{
    new 
        Float:x, 
        Float:y, 
        Float:z;

    GetPlayerPos(playerid, x, y, z);

    for(new i = 0; i < GetMaxPlayers(); i++) {

        if(!IsPlayerConnected(i)) continue;
        new msg2[128], nombre[24], Float: pDistanceFromPoint = GetPlayerDistanceFromPoint(i, x, y, z);
        GetPlayerName(i, nombre, 24);
        format(msg2, sizeof(msg2), "radius: %f, pDistanceFromPoint: %f, i: %d, nombre: %s, jugadores: %d",  radius, pDistanceFromPoint, i, nombre, GetMaxPlayers());
        print(msg2);
        if (IsPlayerInRangeOfPoint(i, radius, x, y, z))
        {
            if(strcmp(color, "/me") == 0) 
            {
                SendClientMessage(i, 0xC2A2DAAA, text); 
            } 
            if (strcmp(color, "/do") == 0)
            {
                SendClientMessage(i, 0x90EE90AA, text); 
            }
            if (strcmp(color, "say") == 0)
            {
                if(pDistanceFromPoint > radius / 2) { SendClientMessage(i, 0x6E6E6E6E, text); continue; }
                if(pDistanceFromPoint > radius / 4) { SendClientMessage(i, 0x8C8C8C8C, text); continue; }
                if(pDistanceFromPoint > radius / 8) { SendClientMessage(i, 0xAAAAAAAA, text); continue; }
                if(pDistanceFromPoint > radius / 12) { SendClientMessage(i, 0xC8C8C8C8, text); continue; }
                if(pDistanceFromPoint > radius / 16) { SendClientMessage(i, 0x3E3E3E3E, text); continue; }
                else { SendClientMessage(i, 0xE6E6E6E6, text); continue; }
            }
        }
    }
	
}

public OnPlayerText(playerid, text[])
{
    new pText[144], name[24];
    GetPlayerName(playerid, name, sizeof(name));
    format(pText, sizeof (pText), "%s dice: %s", name, text);
    SendClientMessageInRange(playerid, pText, "say", 20);
    return 0; // ignore the default text and send the custom one
}