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
#include <../modules/accounts/accounts.pwn>
#include <../modules/login.pwn>
#include <../modules/general/commands.pwn> 
#include <../modules/factions/factions.pwn>


#if !defined isnull
    #define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif


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
	AddStaticVehicleEx (470, 1791.9729,-1860.7401,13.2197,269.3767, -1, -1, 15); // patriot at start
    AddStaticVehicleEx (510, 1791.9729,-1860.7401,20.2197,269.3767, -1, -1, 15); // bike at start
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





