forward SendClientMessageInRange(playerid, const text[]);
public SendClientMessageInRange(playerid, const text[]) 
{
	new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);

	for(new i = 0; i < MAX_PLAYERS; i++) {
		if (IsPlayerInRangeOfPoint(i, 30.0, x, y, z))
		{
			SendClientMessage(playerid,0xFFFFFFFF,"Estas cerca de alguien que hablo");
		}
	}
}