[
	"aaf_Blufor_Stripper",
	"CHECKBOX",
	["BLUFOR (Editor Placed Only)", "Apply gear stripper effects to all editor placed Blufor units."]// DisplayName + ToolTip
	["AAF Settings", "Gear Stripper - Faction Settings"]// Settings menu + sub-category
	false, // Value info
	1, // isGlobal
	{}// Script
] call CBA_Settings_fnc_init;

[
	"aaf_Opfor_Stripper",
	"CHECKBOX",
	["OPFOR (Editor Placed Only)", "Apply gear stripper effects to all editor placed Opfor units."]// DisplayName + ToolTip
	["AAF Settings", "Gear Stripper - Faction Settings"]// Settings menu + sub-category
	false// Value info
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"aaf_indie_Stripper",
	"CHECKBOX",
	["Independent (Editor Placed Only)", "Apply gear stripper effects to all editor placed Independent units."]// DisplayName + ToolTip
	["AAF Settings", "Gear Stripper - Faction Settings"]// Settings menu + sub-category
	false// Value info
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"aaf_Civvy_Stripper",
	"CHECKBOX",
	["Civilian (Editor Placed Only)", "Apply gear stripper effects to all editor placed Civilian units."]// DisplayName + ToolTip
	["AAF Settings", "Gear Stripper - Faction Settings"]// Settings menu + sub-category
	false// Value info
	1,
	{}
] call CBA_Settings_fnc_init;
/*
	[
	"aaf_Zeusspawned_Stripper", // This is now an excluder but I can't be fucked renaming the variable, it's not user facing anyway. Fuck it, it strips the ability to apply the gear stripper away from the zeus, there you go.
		"CHECKBOX", 
	["Exclude Zeus Spawned Units", "Prevent zeus placed units from getting gear stripper effects."]// DisplayName + ToolTip
	["AAF Settings", "Gear Stripper - Faction Settings"]// Settings menu + sub-category
	false// Value info
		1, 
		{}
	] call CBA_Settings_fnc_init;
*/
[
	"AAF_ammoSupplyGlobal",
	"LIST",
	["Ammunition Supply Levels", "Determines chances to recover ammunition"],
	["AAF Settings", "Gear Stripper - Severity Settings"],
	[["NoReduction", "Suffocating", "Severe", "Significant", "Serious", "Slight"], ["No Reduction", "Extremely Limited", "Severely Limited", "Significantly Limited", "Seriously Limited", "Slightly Limited"], 0],
	true
] call CBA_Settings_fnc_init;

[
	"AAF_medSupplyGlobal",
	"LIST",
	["Medical Supply Levels", "Determines the chances to recover medical supplies"],
	["AAF Settings", "Gear Stripper - Severity Settings"],
	[["NoReduction", "Suffocating", "Severe", "Significant", "Serious", "Slight"], ["No Reduction", "Extremely Limited", "Severely Limited", "Significantly Limited", "Seriously Limited", "Slightly Limited"], 0],
	true
] call CBA_Settings_fnc_init;

[
	"AAF_LATSupplyGlobal",
	"LIST",
	["Disposable Launcher Levels", "Determines the chances to recover disposable AT"],
	["AAF Settings", "Gear Stripper - Severity Settings"],
	[["NoReduction", "Suffocating", "Severe", "Significant", "Serious", "Slight"], ["No Reduction", "Extremely Limited", "Severely Limited", "Significantly Limited", "Seriously Limited", "Slightly Limited"], 0],
	true
] call CBA_Settings_fnc_init;
/*
	[
	"AAF_scaredyCatEnabler", // Enabling the entire scaredycat system
		"CHECKBOX", 
	["Enable Scaredycat", "Units with Scaredycat ticked in their unit properties will surrender if a player within 10m points a weapon at them and verbally orders them to surrender."]// DisplayName + ToolTip
	["AAF Settings", "Scaredycat Surrender System"]// Settings menu + sub-category
	false// Value info
		1, 
		{}
	] call CBA_Settings_fnc_init;
*/

[
	"aaf_aiDifficultyB",
	"LIST",
	["BLUFOR (Editor Placed Only)", "Set AI difficulty for BLUFOR"],
	["AAF Settings", "AI Difficulty"],
	[["Editor", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], ["No change from Editor Values", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], 0],
	true
] call CBA_Settings_fnc_init;
[
	"aaf_aiDifficultyI",
	"LIST",
	["Independent (Editor Placed Only)", "Set AI difficulty for INDFOR"],
	["AAF Settings", "AI Difficulty"],
	[["Editor", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], ["No change from Editor Values", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], 0],
	true
] call CBA_Settings_fnc_init;

[
	"aaf_aiDifficultyO",
	"LIST",
	["OPFOR (Editor Placed Only)", "Set AI difficulty for OPFOR"],
	["AAF Settings", "AI Difficulty"],
	[["Editor", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], ["No change from Editor Values", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], 0],
	true
] call CBA_Settings_fnc_init;
