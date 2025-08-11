/*/////////////////////////////////////////////////////////////////////////////////////////////////
Author: AAF
Description: AAF_Functions Global Pre-Init Global
			AAF Functions replaces the old disfunctional AAF mission settings
			No exit conditions, These run client and server
Parameters: none
Returns: nothing
Example: none
*//////////////////////////////////////////////////////////////////////////////////////////////////
/* CBA_Settings_fnc_init
	_setting		Unique setting name. Matches resulting variable name STRING
	_settingType	Type of setting. Can be “CHECKBOX”, “EDITBOX”, “LIST”, “SLIDER” or “COLOR” STRING
	_title			Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
	_category		Category for the settings menu + optional sub-category <STRING, ARRAY>
	_valueInfo		Extra properties of the setting depending of _settingType.  See examples below <ANY>
	_isGlobal		1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
	_script			Script to execute when setting is changed.  (optional) <CODE>
	_needRestart	Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
*/
[//aaf_mission
	"aaf_mission",
	"CHECKBOX",
	["AAF Mission","Check this to turn on AAF Mission Functions"],//DisplayName + ToolTip
	["AAF Settings","AAF Mission Settings"],//Settings menu + sub-category
	false,//Value info
	1,//isGlobal
	{}//Script
] call CBA_Settings_fnc_init;
[//aaf_debugmode
	"aaf_debugmode",
	"CHECKBOX",
	["Debug Mode","For ModDev use, seriously leave it alone!"],
	["AAF Settings","AAF Mission Settings"],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;
[//aaf_Intro
	"aaf_intro",
	"CHECKBOX",
	["AAF Intro Enable","Enable Mission Intro Camera"],
	["AAF Settings","AAF Mission Settings"],
	false,
	1
] call CBA_Settings_fnc_init;
[//aaf_loadout - modified from original. Another innovation from AliasTech!
	"aaf_loadout",
	"CHECKBOX",
	["On Death Loadout Save","CHECKED: Players respawn with the gear they had when they died.   UNCHECKED: Players respawn with the gear they had when they first spawned"],
	["AAF Settings","AAF Mission Settings"],
	false,
	1
] call CBA_Settings_fnc_init;
[//aaf_reducer
	"aaf_reducer",
	"CHECKBOX",
	["AAF AI Reducer","Enable the AI Reducer (Range determined by dynamic simulation range)"],
	["AAF Settings","AAF Mission Settings"],
	false,
	1
] call CBA_Settings_fnc_init;
/*[//aaf_aiSkill
	"aaf_aiDifficulty",
	"LIST",
	["AAF AI Difficulty","Set AI difficulty"],
	["AAF Settings","AAF Mission Settings"],
	[["Editor","Civilian","Insurgents","Regular","Professional","SpecialForces"],["No change from Editor Values","Civilian","Insurgents","Regular","Professional","SpecialForces"],0],
	true
] call CBA_Settings_fnc_init;
*/
//SUGGESTED IDEA: Difficulty by faction so we can have shit indy but elite opfor. Broke the difficulty off into its sub-setting, add a B/I/O tag to the end of the vars, whack in a new case to the application check
[//aaf_aiSkillB
	"aaf_aiDifficultyB",
	"LIST",
	["BLUFOR (Editor Placed Only)","Set AI difficulty for BLUFOR"],
	["AAF Settings","AI Difficulty"],
	[["Editor","Civilian","Insurgents","Regular","Professional","SpecialForces"],["No change from Editor Values","Civilian","Insurgents","Regular","Professional","SpecialForces"],0],
	true
] call CBA_Settings_fnc_init;
[//aaf_aiSkillI
	"aaf_aiDifficultyI",
	"LIST",
	["Independent (Editor Placed Only)","Set AI difficulty for INDFOR"],
	["AAF Settings","AI Difficulty"],
	[["Editor","Civilian","Insurgents","Regular","Professional","SpecialForces"],["No change from Editor Values","Civilian","Insurgents","Regular","Professional","SpecialForces"],0],
	true
] call CBA_Settings_fnc_init;

[//aaf_aiSkillB
	"aaf_aiDifficultyO",
	"LIST",
	["OPFOR (Editor Placed Only)","Set AI difficulty for OPFOR"],
	["AAF Settings","AI Difficulty"],
	[["Editor","Civilian","Insurgents","Regular","Professional","SpecialForces"],["No change from Editor Values","Civilian","Insurgents","Regular","Professional","SpecialForces"],0],
	true
] call CBA_Settings_fnc_init;




//ALIAS STUFF /////////////////////////////////////////////////////////////////////////////////////////

[
	"aaf_Blufor_Stripper",
	"CHECKBOX",
	["BLUFOR (Editor Placed Only)","Apply gear stripper effects to all editor placed Blufor units."],//DisplayName + ToolTip
	["AAF Settings","Gear Stripper - Faction Settings"],//Settings menu + sub-category
	false,		//Value info
	1,			//isGlobal
	{}			//Script
] call CBA_Settings_fnc_init;

[
	"aaf_Opfor_Stripper",
	"CHECKBOX",
	["OPFOR (Editor Placed Only)","Apply gear stripper effects to all editor placed Opfor units."],//DisplayName + ToolTip
	["AAF Settings","Gear Stripper - Faction Settings"],//Settings menu + sub-category
	false,//Value info
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"aaf_indie_Stripper",
	"CHECKBOX",
	["Independent (Editor Placed Only)","Apply gear stripper effects to all editor placed Independent units."],//DisplayName + ToolTip
	["AAF Settings","Gear Stripper - Faction Settings"],//Settings menu + sub-category
	false,//Value info
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"aaf_Civvy_Stripper",
	"CHECKBOX",
	["Civilian (Editor Placed Only)","Apply gear stripper effects to all editor placed Civilian units."],//DisplayName + ToolTip
	["AAF Settings","Gear Stripper - Faction Settings"],//Settings menu + sub-category
	false,//Value info
	1,
	{}
] call CBA_Settings_fnc_init;
/*
[
	"aaf_Zeusspawned_Stripper", //This is now an excluder but I can't be fucked renaming the variable, it's not user facing anyway. Fuck it, it strips the ability to apply the gear stripper away from the zeus, there you go.
	"CHECKBOX",
	["Exclude Zeus Spawned Units","Prevent zeus placed units from getting gear stripper effects."],//DisplayName + ToolTip
	["AAF Settings","Gear Stripper - Faction Settings"],//Settings menu + sub-category
	false,//Value info
	1,
	{}
] call CBA_Settings_fnc_init;
*/
[
	"AAF_ammoSupplyGlobal",
	"LIST",
	["Ammunition Supply Levels","Determines chances to recover ammunition"],
	["AAF Settings","Gear Stripper - Severity Settings"],
	[["NoReduction","Suffocating","Severe","Significant","Serious","Slight"],["No Reduction","Extremely Limited","Severely Limited","Significantly Limited","Seriously Limited","Slightly Limited"],0],
	true
] call CBA_Settings_fnc_init;

[
	"AAF_medSupplyGlobal",
	"LIST",
	["Medical Supply Levels","Determines the chances to recover medical supplies"],
	["AAF Settings","Gear Stripper - Severity Settings"],
	[["NoReduction","Suffocating","Severe","Significant","Serious","Slight"],["No Reduction","Extremely Limited","Severely Limited","Significantly Limited","Seriously Limited","Slightly Limited"],0],
	true
] call CBA_Settings_fnc_init;

[
	"AAF_LATSupplyGlobal",
	"LIST",
	["Disposable Launcher Levels","Determines the chances to recover disposable AT"],
	["AAF Settings","Gear Stripper - Severity Settings"],
	[["NoReduction","Suffocating","Severe","Significant","Serious","Slight"],["No Reduction","Extremely Limited","Severely Limited","Significantly Limited","Seriously Limited","Slightly Limited"],0],
	true
] call CBA_Settings_fnc_init;
/*
[
	"AAF_scaredyCatEnabler", //Enabling the entire scaredycat system
	"CHECKBOX",
	["Enable Scaredycat","Units with Scaredycat ticked in their unit properties will surrender if a player within 10m points a weapon at them and verbally orders them to surrender."],//DisplayName + ToolTip
	["AAF Settings","Scaredycat Surrender System"],//Settings menu + sub-category
	false,//Value info
	1,
	{}
] call CBA_Settings_fnc_init;
*/


///////////////////////////////////////////////////////////////////////////////////////////////////////





//WORKING /////////////////////////////////////////////////////////////////////////////////////////
/*[//aaf_breakable
	"aaf_breakable",
	LIST,
	["AAF Breakable","Can AI equipment be damaged?"],
	["AAF Settings","Mission Settings"],
	["All Equipment", "Weapons only","Ammunition Only", "Launchers Only"],["All equipemnt get's damaged", "Only weapons can be damaged", "Only ammunition can be damaged"],
] call CBA_Settings_fnc_init;*/
/*[//aaf_rZone
	"aaf_rZone",
	"CHECKBOX",
	["AAF Zone Reducer","Enable reducer zones"],
	["AAF Settings","WiP"],
	false, //default
	1
] call CBA_Settings_fnc_init;*/
/*[//aaf_pSave
	"aaf_pSave",
	"CHECKBOX",
	["AAF Player Save","Enable player gear and location saving"],
	["AAF Settings","WiP"],
	false, //default
	1
] call CBA_Settings_fnc_init;*/
/*[//aaf_sSave
	"aaf_sSave",
	"CHECKBOX",
	["AAF Server Save","Enable server saving"],
	["AAF Settings","WiP"],
	false, //default
	1
] call CBA_Settings_fnc_init;*/
//CBA SKILL SETTINGS //////////////////////////////////////////////////////////////////////////////
/*
[//Skill setting
	"aaf_skill",
	"CHECKBOX",
	"Debug Mode",
	["AAF Settings","AI Skills"],
	true,
	1,//Global
	{}
] call CBA_Settings_fnc_init;
[//Skill Min
	"aaf_skillMin", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	"AI Skill Minimum", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	["AAF Settings", "AI Skills"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[0.00, 1.00, 0.50, 2, false], // data for this setting: [_min, _max, _default, _trailingDecimals, _isPercentage]
	true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{ call aaf_fnc_skill; } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
[//Skill Max
	"aaf_skillMax",
	"SLIDER",
	"AI Skill Maximum",
	["AAF Settings", "AI Skills"],
	[0.00, 1.00, 1.00, 2, false],
	true,
	{ call aaf_fnc_skill; }
] call CBA_Settings_fnc_init;
[//Skill Precision Min
	"aaf_skillAimMin",
	"SLIDER",
	"AI Aim Minimum",
	["AAF Settings", "AI Skills"],
	[0.00, 1.00, 0.15, 2, false],
	true,
	{ call aaf_fnc_skill; }
] call CBA_Settings_fnc_init;
[//Skill Precision Max
	"aaf_skillAimMax",
	"SLIDER",
	"AI Aim Maximum",
	["AAF Settings", "AI Skills"],
	[0.00, 1.00, 0.30 ,2, false],
	true,
	{ call aaf_fnc_skill; }
] call CBA_Settings_fnc_init;
*/
