///////////////////////////////////////////////////////////////////////////////////////////////////
//AFK function

//TODO
//Cut FADE - Text "AFK"
//
// EXPANSION IDEA: When selecting AFK to return, it pauses and brings up a dialogue asking if you want 
// to TP to the nearest group member. Add a disclaimer saying it might be a bad idea if they're all
// dead or you're in front of the group. That way it's the players fault if they get fucked over.
//
// How to prevent abuse? Minimum time AFK before dialogue is an option and UnAFKs normally otherwise?
//
// Maybe increase font size for AFK just to make it super obvious.
//
// Add a joke one for rajiin that calls him a lazy bastard for being AFK?
//
///////////////////////////////////////////////////////////////////////////////////////////////////

#include "..\script_component.hpp"
/*
 Author: AZF Mod team
 Moves the player to a safe location when they go AFK.

 Arguments:
 0: Description <OBJECT>

 Return Value:
 Description <OBJECT>

 Example:
 [] call azf_player_fnc_afk
*/


if (player getVariable ["afk", false]) then {
	player setPosASL [getPosASL player select 0, getPosASL player select 1, (getPosASL player select 2) +50];//Move them back
	
    playerLocation = getPos player;
    afkImage = nearestObjects [playerLocation, ["UserTexture1MF"], 2];
	
    {deleteVehicle x} forEach afkImage;
	
    player enableSimulationGlobal true;
	player hideObjectGlobal false;
	
    announcement = profilename + " is back from AFK";
	announcement remoteExec ["systemchat", 0, false];
	
    player setVariable ["afk", false, 0];
	cutText [" ", "BLACK IN", 1];

} else {
    if isNull objectParent player exitWith {
        hintSilent "You cannot go AFK while in a vehicle.";
    };
	cutText ["AFK", "BLACK OUT", 0.001];

	player setVariable ["afk", true, 0];

	relativePosition = [0,1,1];
	worldPosition = player modelToWorld relativePosition;
	playerDirection = getDir player;
	afkDirection = (playerDirection + 180);

	afkImage = createVehicle ["UserTexture1MF", worldPosition, [], 0, "NONE"];
	afkImage setObjectTextureGlobal [0,"#(rgb,512,512,3)text(0,0,""Caveat"",0.8,""#0000ff7f"",""#ff0000"",""AFK"")"];
	afkImage setDir afkDirection;
	afkImage setpos worldPosition;
	afkImage allowDamage false;

	announcement = profilename + " is AFK";
	announcement remoteExec ["systemchat", 0, false];

	player enableSimulationGlobal false;
	player hideObjectGlobal true;
	player setPosASL [getPosASL player select 0, getPosASL player select 1, (getPosASL player select 2) -50];//Move away
};
