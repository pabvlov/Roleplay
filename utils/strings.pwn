forward SendClientMessageInRange(playerid, const text[], const color[], const radius);
public SendClientMessageInRange(playerid, const text[], const color[], const radius) 
{
    
    new 
        Float:x, 
        Float:y, 
        Float:z,
        msg[144], 
        name[24];

    GetPlayerPos(playerid, x, y, z);
    GetPlayerName(playerid, name, sizeof(name));

    for(new i = 0; i < MAX_PLAYERS; i++) {
        new Float: pDistanceFromPoint;
        pDistanceFromPoint = GetPlayerDistanceFromPoint(i, x, y, z);
        if (IsPlayerInRangeOfPoint(i, radius, x, y, z))
        {
            format(msg, sizeof(msg), "%s %s", name, text);
            if (pDistanceFromPoint <= 30.0) 
            { 
                SendClientMessage(playerid, 0xC2A2DAAA, msg); 
                break;
            }
            
        }
    }
	
}