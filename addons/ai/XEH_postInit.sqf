#include "script_component.hpp"

GVAR(stripper_sides) = {}
{
	{
		if (_x select 0) then {
			// if the side is set, add it to the stripper sides
			GVAR(stripper_sides) pushBack _x select 1;
		};
	} forEach [[GVAR(stripper_west), west], [GVAR(stripper_independent), independent], [GVAR(stripper_east), east], [GVAR(stripper_civilian), civilian]];
}

["CAManBase", "Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if (isPlayer _unit) exitWith {};
	if (_unit getVariable [QGVAR(isNotStripped)])
	if (side _unit in GVAR(stripper_sides)) then {
		[_unit] call FUNC(gearStripper);
	}
}] call CBA_fnc_addClassEventHandler;
