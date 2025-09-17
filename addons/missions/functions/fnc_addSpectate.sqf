#include "..\script_component.hpp"
/*
 Author: AZF Mod team
 Adds a spectate action to the player when they enter a defined area.

 Arguments:
 0: None <OBJECT>

 Return Value:
 None <OBJECT>

 Example:
 [] call azf_missions_fnc_addSpectate
*/


private _target = param [0, objNull];
if !(hasInterface) exitwith {};

if (isnil "azf_fnc_spectate") then {
	azf_fnc_spectate = {
		['Initialize', [player, [], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
		sleep 1;
		waitUntil {(inputaction 'action' >0) || (inputaction 'actionContext' >0) || (inputaction 'user20' >0) || (!triggerActivated azf_spectateTrigger)};
		hint '';
		sleep 0.5;
		['Terminate'] call BIS_fnc_EGSpectator;
		if !(isnil 'TFAR_fnc_forceSpectator') then {
			[player, false] call TFAR_fnc_forceSpectator;
		};
	};
};

if (isnil "azf_spectateTrigger") then {
	azf_spectateTrigger = createTrigger ["EmptyDetector",getpos _target,false];
	azf_spectateTrigger setTriggerActivation ["ANYPLAYER","PRESENT",true];
	azf_spectateTrigger setTriggerArea [12,12,0,false,0];
	azf_spectateTrigger setTriggerStatements [
		"player in thisList",
		"specAction = player addAction ['Spectate',
			{
				[true,false,false] call ace_spectator_fnc_setSpectator;
				private _sides = [WEST,EAST,independent,civilian];
				_sides = _sides - [side player];
				[[side player], _sides] call ace_spectator_fnc_updateSides;
			},nil, 1.5, false, true, '', 'true', 15, false, ''];
		private _txt = [parseText 'In Spectate Area',lineBreak,'Use scroll wheel to enter Spectator mode',lineBreak,lineBreak,'To leave Spectator mode', lineBreak,'Press Escape'];
		hint (composeText _txt);",
		"player removeAction specAction;
		hint '';
		[false] call ace_spectator_fnc_setSpectator;
		if !(isnil 'TFAR_fnc_forceSpectator') then {
			[player, false] call TFAR_fnc_forceSpectator;
		};"
	];
} else {
	['azf: Spectate area already defined. One only.'] call BIS_fnc_error;
	diag_log 'azf: Spectate area already defined. One only please.';
};
