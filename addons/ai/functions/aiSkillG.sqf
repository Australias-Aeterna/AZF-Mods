/* 
* AI skill Setter from AAF Settings
* https// community.bistudio.com/wiki/BIS_fnc_EXP_camp_setSkill
*
*/
// missionNamespace getVariable ["aaf_mission", false]// AAF cba mission settings check
// if !(aaf_mission) exitWith {};
missionNamespace getVariable ["aaf_aiDifficulty", "Editor"];
// If (aaf_aiDifficulty == "Editor") exitWith {}// Leave editor set skills

// _skillset = 0.50;
/*switch (aaf_aiDifficulty) do {
		case "Civilian": {
			_skillset = 0.0
		};
		    case "Insurgents": {
			_skillset = 0.25
		};
		    case "Regular": {
			_skillset = 0.50
		};
		    case "Professional": {
			_skillset = 0.75
		};
		    case "SpecialForces": {
			_skillset = 1.0
		};
	};
	[east, _skillset, _skillset, _skillset, _skillset] call BIS_fnc_EXP_camp_setSkill;
	[west, _skillset, _skillset, _skillset, _skillset] call BIS_fnc_EXP_camp_setSkill;
	[independent, _skillset, _skillset, _skillset, _skillset] call BIS_fnc_EXP_camp_setSkill;
*/
_skillsetb = 0.50;
_skillseti = 0.50;
_skillseto = 0.50;
switch (aaf_aiDifficultyB) do {
	case "Editor": {};
	case "Civilian": {
		_skillsetb = 0.0;
		[west, _skillsetb, _skillsetb, _skillsetb, _skillsetb] call BIS_fnc_EXP_camp_setSkill;
	};
	case "Insurgents": {
		_skillsetb = 0.25;
		[west, _skillsetb, _skillsetb, _skillsetb, _skillsetb] call BIS_fnc_EXP_camp_setSkill;
	};
	case "Regular": {
		_skillsetb = 0.50;
		[west, _skillsetb, _skillsetb, _skillsetb, _skillsetb] call BIS_fnc_EXP_camp_setSkill;
	};
	case "Professional": {
		_skillsetb = 0.75;
		[west, _skillsetb, _skillsetb, _skillsetb, _skillsetb] call BIS_fnc_EXP_camp_setSkill;
	};
	case "SpecialForces": {
		_skillsetb = 1.0;
		[west, _skillsetb, _skillsetb, _skillsetb, _skillsetb] call BIS_fnc_EXP_camp_setSkill;
	};
};
switch (aaf_aiDifficultyI) do {
	case "Editor": {};
	case "Civilian": {
		_skillseti = 0.0;
		[independent, _skillseti, _skillseti, _skillseti, _skillseti] call BIS_fnc_EXP_camp_setSkill;
	};
	case "Insurgents": {
		_skillseti = 0.25;
		[independent, _skillseti, _skillseti, _skillseti, _skillseti] call BIS_fnc_EXP_camp_setSkill;
	};
	case "Regular": {
		_skillseti = 0.50;
		[independent, _skillseti, _skillseti, _skillseti, _skillseti] call BIS_fnc_EXP_camp_setSkill;
	};
	case "Professional": {
		_skillseti = 0.75;
		[independent, _skillseti, _skillseti, _skillseti, _skillseti] call BIS_fnc_EXP_camp_setSkill;
	};
	case "SpecialForces": {
		_skillseti = 1.0;
		[independent, _skillseti, _skillseti, _skillseti, _skillseti] call BIS_fnc_EXP_camp_setSkill;
	};
};
switch (aaf_aiDifficultyO) do {
	case "Editor": {};
	case "Civilian": {
		_skillseto = 0.0;
		[east, _skillseto, _skillseto, _skillseto, _skillseto] call BIS_fnc_EXP_camp_setSkill;
	};
	case "Insurgents": {
		_skillseto = 0.25;
		[east, _skillseto, _skillseto, _skillseto, _skillseto] call BIS_fnc_EXP_camp_setSkill;
	};
	case "Regular": {
		_skillseto = 0.50;
		[east, _skillseto, _skillseto, _skillseto, _skillseto] call BIS_fnc_EXP_camp_setSkill;
	};
	case "Professional": {
		_skillseto = 0.75;
		[east, _skillseto, _skillseto, _skillseto, _skillseto] call BIS_fnc_EXP_camp_setSkill;
	};
	case "SpecialForces": {
		_skillseto = 1.0;
		[east, _skillseto, _skillseto, _skillseto, _skillseto] call BIS_fnc_EXP_camp_setSkill;
	};
};

// [west, _skillsetb, _skillsetb, _skillsetb, _skillsetb] call BIS_fnc_EXP_camp_setSkill;
// [independent, _skillseti, _skillseti, _skillseti, _skillseti] call BIS_fnc_EXP_camp_setSkill;
// [east, _skillseto, _skillseto, _skillseto, _skillseto] call BIS_fnc_EXP_camp_setSkill;

/*
	[west, _skillsetb, _skillsetb, _skillsetb, _skillsetb] call BIS_fnc_EXP_camp_setSkill;
	[independent, _skillseti, _skillseti, _skillseti, _skillseti] call BIS_fnc_EXP_camp_setSkill;
	[east, _skillseto, _skillseto, _skillseto, _skillseto] call BIS_fnc_EXP_camp_setSkill;
*/

/*zeus spawned version idea: Need to create a master creatorplaced EH then plug the gear stripper and skill code in through script calls? There is a different EH for object placed and group placed so hopefully this will be easier.
	this addEventHandler ["CuratorGroupPlaced", {
		params ["_curator", "_group"];
	}];
*/
