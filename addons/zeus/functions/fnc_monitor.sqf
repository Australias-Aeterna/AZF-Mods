/*
	Title: FPS Monitoring Script
	Author: Dylan Plecki (Naught) - AZF mod Team
	Version: 1.0.2.1 - v1.0 RC b1
	
	Description:
	Monitors and displays FPS of the server and clients on
	a regular interval with a silent hint in this format:
	local FPS: minFPS - avgFPS
	Server FPS: minFPS - avgFPS / count
	Headless FPS: avgMinFPS - avgAvgFPS / count
	Client FPS: avgMinFPS - avgAvgFPS / count
	This script can be loaded and executed on any machine, 
	without a need to install anything on the others.
	
	Syntax:
call azf_zeus_fnc_monitor; // Turns off script
delayInt call azf_zeus_fnc_monitor; // Turns on/off script with delay
	
	Requirements:
	Arma 3 1.0
	Arma 2 OA 1.62
	CBA A2/OA/A3 1.0
	
	License:
	Copyright © 2013 Dylan Plecki. All rights reserved.
	Except where otherwise noted, this work is licensed under CC BY 4.0, 
available for reference at <http// creativecommons.org/licenses/by/4.0/>.
*/

_this spawn {
	private ["_delay"];
	_delay = if ((count _this) > 0) then {
		_this select 0
	} else {
		0
	};
	_syncTime = 3;
	if (_delay >= _syncTime) then {
		_delay = _delay - _syncTime
	};
	if (isNil "init") then {
		init = true;
		clientID = nil;
		syncData = [-1, 0, 0];
		[0, {
			clientID = owner _this;
			[ "clientID", clientID ] remoteExec ["setVariable", 0, true];
		}, player] call CBA_fnc_globalExecute;
		waitUntil {
			!isNil "clientID"
		};
		"syncData" remoteExec ["setVariable", 0, true];
	};
	if ((_delay > 0) && (isNil "handle")) then {
		handle = [_syncTime, _delay] spawn {
			waitUntil {
				data = [[0, 0, 0], [0, 0, 0], [0, 0, 0]];
				[-2, {
					if (isNil "machine") then {
						machine = switch (true) do {
							case (isServer): {
								0
							};
							case (!hasInterface && !isDedicated): {
								1
							};
							default {
								2
							};
						};
					};
					syncData = [machine, diag_fps, diag_fpsmin];
					[ "syncData", syncData ] remoteExec ["setVariable", 0, true];
				}, [clientID]] call CBA_fnc_globalExecute;
				uiSleep (_this select 0);
				private ["_output"];
				_output = [];
				{
					_output = _output + [
						round((_x select 1) / ((_x select 2) max (1))),
						round((_x select 0) / ((_x select 2) max (1))),
						(_x select 2)
					];
				} forEach data;
				hintSilent format (["Local FPS: %1 - %2\nServer FPS: %3 - %4 / %5\nHeadless FPS: %6 - %7 / %8\nClient FPS: %9 - %10 / %11",
					round(diag_fpsmin),
					round(diag_fps)
				] + _output);
				uiSleep (_this select 1);
				false;
			};
		};
		hintSilent format["FPS Monitoring Started.\n%1 Second Interval.", (_delay + _syncTime)];
	} else {
		terminate handle;
		handle = nil;
		hintSilent "FPS Monitoring Stopped.";
		sleep 3;
		hintSilent "";
	};
};
