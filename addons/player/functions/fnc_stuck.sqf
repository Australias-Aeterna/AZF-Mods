#include "..\script_component.hpp"
/*
 * Author: AZF Mods team
 * Moves the player to a safe position if they are stuck.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call azf_player_azf_stuck
 *
 * Public: No
 */

if (isServer) exitWith {};

_pos = [player, 1, 20, 8, 0, 20, 0] call BIS_fnc_findSafePos;
_announcement = profileName + " was stuck. Moved to a safe position.";
player setPos _pos;
_announcement remoteExec ["systemchat", 0, false];
