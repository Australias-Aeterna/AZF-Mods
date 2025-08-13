#include "script_component.hpp"

GVAR(stripperSides) = [];
{
	{
		if (_x select 0) then {
			// if the side is set, add it to the stripper sides
			GVAR(stripperSides) pushBack _x select 1;
		};
	} forEach [[GVAR(stripperWest), west], [GVAR(stripperIndependent), independent], [GVAR(stripperEast), east], [GVAR(stripperCivilian), civilian]];
};

GVAR(medkits) = QUOTE(getNumber (_x >>'itemInfo' >> 'type') == TYPE_MEDIKIT) configClasses (configFile >> "CfgWeapons");
GVAR(firstAidKits) = QUOTE(getNumber (_x >>'itemInfo' >> 'type') == TYPE_MEDIKIT) configClasses (configFile >> "CfgWeapons");

["CAManBase", "Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if (isPlayer _unit) exitWith {};
	if (_unit getVariable [QGVAR(isNotStripped), false]) exitWith {};
	if (side _unit in GVAR(stripperSides)) then {
		[_unit] call FUNC(ammoStripper);
		[_unit] call FUNC(latStripper);
		[_unit] call FUNC(medicalStripper);
	};
}] call CBA_fnc_addClassEventHandler;

cleanup = [{
	{
		if ((alive _x count (units _x)) == 0) then {
			deleteGroup _x;
		};
	} forEach allGroups;
}, 600] call CBA_fnc_addPerFrameHandler;
