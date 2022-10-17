// generated by "sampctl package init"
// gamemode from scratch by pabvlov
#include <a_samp>
#include <a_mysql>

//#include <YSI_Group\y_library>
#include <YSI_Coding\y_hooks>
#include <YSI_Visual\y_commands>

//Configuration
new ver[24] = "BETA 0.0.1"; /* Versión */
#include <../config/mysql.pwn>
#include <../config/colors.pwn>
//Utilities
#include <../utils/strings.pwn>
//Dependencies

//Custom libraries

// Modules

#include <../modules/login.pwn>


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


public OnGameModeInit() {
	SendRconCommand("mapname Los Santos");
	SendRconCommand("changemode Roleplay");
	SendRconCommand("gamemodetext Roleplay");
	SendRconCommand("language ES");
	ConnectMySQL(); // called in './modules/login.pwn'
	AddStaticVehicleEx (411, 1774.4281,-1860.3768,13.2201,269.7705, -1, -1, 15); // infernus at start
	
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if (newstate == PLAYER_STATE_DRIVER && oldstate == PLAYER_STATE_ONFOOT)
    {
        if (GetPlayerVehicleID(playerid) == 1)
        {
            AddVehicleComponent(1, 1010); // Nitro
            SendClientMessage(playerid, 0xFFFFFFAA, "Nitro added to the Infernus.");
        }
    }
    return 1;
}

YCMD:me(playerid,params[], help)
{
    SendClientMessageInRange(playerid, "Test cmd called and its working ?");
    return 1;
}

