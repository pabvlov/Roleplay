forward SendClientMessageInRange(playerid, const text[], const color[], const Float:radius);
public SendClientMessageInRange(playerid, const text[], const color[], const Float:radius) 
{
    new 
        Float:x, 
        Float:y, 
        Float:z;

    GetPlayerPos(playerid, x, y, z);

    for(new i = 0; i < GetMaxPlayers(); i++) {
        if(!IsPlayerConnected(i)) break;
        new msg2[128], nombre[24];
        GetPlayerName(i, nombre, 24);
        format(msg2, sizeof(msg2), "radius: %f, pDistanceFromPoint: %f, i: %d, nombre: %s, jugadores: %d",  radius, GetPlayerDistanceFromPoint(i, x, y, z), i, nombre, GetMaxPlayers());
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
        }
    }
	
}