#define MAX_CARS 500
#define MAX_PLAYER_KEYS 3

enum CAR
{
    Id,
    Brand,
    Float:pos[4],
};

enum E_PLAYER
{
	Id,
	Name[MAX_PLAYER_NAME],
    Float:pos[4],
    Keys[MAX_PLAYER_KEYS],
    Cash,
};

hook OnPlayerConnect(playerid) {
    InitializePlayer(playerid);
    return 1;
}

new Players[MAX_PLAYERS][E_PLAYER];

forward InitializePlayer(playerid);
public InitializePlayer(playerid) {
    new query[128], pname[24];
    GetPlayerName(playerid, pname, sizeof(pname));
    mysql_format(g_Sql, query, sizeof(query), "SELECT * FROM players where Name = '%e'", pname);
    mysql_tquery(g_Sql, query, "OnPlayerDataLoaded", "d", playerid);
}

forward OnPlayerDataLoaded(playerid);
public OnPlayerDataLoaded(playerid)
{
    new pname[24];
    GetPlayerName(playerid, pname, sizeof(pname));
	if(cache_num_rows() == 1)
	{
        //new formatted[128];
        cache_get_value_name(0, "Name", Players[playerid][Name], MAX_PLAYER_NAME);
        cache_get_value_float(0, "X", Players[playerid][pos][0]);
        cache_get_value_float(0, "Y", Players[playerid][pos][1]);
        cache_get_value_float(0, "Z", Players[playerid][pos][2]);
        cache_get_value_float(0, "Rotation", Players[playerid][pos][3]);
        cache_get_value_name_int(0, "Cash", Players[playerid][Cash]);
        //format(formatted, sizeof(formatted), "user: %s, user bd: %s, x: %f, y: %f, z: %f", pname, Players[playerid][Name], Players[playerid][pos][0], Players[playerid][pos][1], Players[playerid][pos][2]);
        //print(formatted);
        SetSpawnInfo( playerid, 0, 1, Players[playerid][pos][0],Players[playerid][pos][1],Players[playerid][pos][2],Players[playerid][pos][3], 26, 36, 28, 150, 0, 0 );
	}
	return 1;
}

public OnPlayerDisconnect(playerid, reason) {
    new query[144], Float:position[4], pname[MAX_PLAYER_NAME];
    GetPlayerPos(playerid, position[0], position[1], position[2]);
    GetPlayerFacingAngle(playerid, position[3]);
    GetPlayerName(playerid, pname, sizeof(pname));
    
    mysql_format(g_Sql, query, sizeof(query), "UPDATE players SET `X` = '%f', `Y` = '%f', `Z` = '%f', `Rotation` = '%f' where Name = '%e'", position[0], position[1], position[2], position[3], pname);
    mysql_tquery(g_Sql, query);
}
