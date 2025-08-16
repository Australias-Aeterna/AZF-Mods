/*
	    AI skill Setter from AAF Settings
    https// community.bistudio.com/wiki/BIS_fnc_EXP_camp_setSkill
*/

// difficulty to skill mapping
private _difficultyMap = [
	["Civilian", 0.0],
	["Insurgents", 0.25],
	["Regular", 0.50],
	["Professional", 0.75],
	["SpecialForces", 1.0]
];

params ["_side", "_difficulty"];

if (_difficulty isEqualTo "Editor") exitWith {}; // Leave editor set skills

private _skill = _difficultyMap select { _x#0 isEqualTo _difficulty } param [0, [], []] param [1, 0.50];

[_side, _skill, _skill, _skill, _skill] call BIS_fnc_EXP_camp_setSkill;

// Example usage with missionNamespace variables
