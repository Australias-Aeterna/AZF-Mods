[
	QGVAR(stripperWest),
	"CHECKBOX",
	["BLUFOR (Editor Placed Only)", "Apply gear stripper effects to all editor placed Blufor units."],
	[AZF_SETTINGS, "Gear Stripper - Faction Settings"],
	false,
	true
] call CBA_Settings_fnc_init;

[
	QGVAR(stripperEast),
	"CHECKBOX",
	["OPFOR (Editor Placed Only)", "Apply gear stripper effects to all editor placed Opfor units."],
	[AZF_SETTINGS, "Gear Stripper - Faction Settings"],
	false,
	true
] call CBA_Settings_fnc_init;

[
	QGVAR(stripperIndependent),
	"CHECKBOX",
	["Independent (Editor Placed Only)", "Apply gear stripper effects to all editor placed Independent units."],
	[AZF_SETTINGS, "Gear Stripper - Faction Settings"],
	false,
	true
] call CBA_Settings_fnc_init;

[
	QGVAR(stripperCivilian),
	"CHECKBOX",
	["Civilian (Editor Placed Only)", "Apply gear stripper effects to all editor placed Civilian units."],
	[AZF_SETTINGS, "Gear Stripper - Faction Settings"],
	false,
	true
] call CBA_Settings_fnc_init;

[
	QGVAR(ammoSupplyGlobal),
	"LIST",
	["Ammunition Supply Levels", "Determines chances to recover ammunition"],
	[AZF_SETTINGS, "Gear Stripper - Severity Settings"],
	[["NoReduction", "Suffocating", "Severe", "Significant", "Serious", "Slight"], ["No Reduction", "Extremely Limited", "Severely Limited", "Significantly Limited", "Seriously Limited", "Slightly Limited"], 0],
	true
] call CBA_Settings_fnc_init;

[
	QGVAR(medicalSupply),
	"LIST",
	["Medical Supply Levels", "Determines the chances to recover medical supplies"],
	[AZF_SETTINGS, "Gear Stripper - Severity Settings"],
	[["NoReduction", "Suffocating", "Severe", "Significant", "Serious", "Slight"], ["No Reduction", "Extremely Limited", "Severely Limited", "Significantly Limited", "Seriously Limited", "Slightly Limited"], 0],
	true
] call CBA_Settings_fnc_init;

[
	QGVAR(latSupplyGlobal),
	"LIST",
	["Disposable Launcher Levels", "Determines the chances to recover disposable AT"],
	[AZF_SETTINGS, "Gear Stripper - Severity Settings"],
	[["NoReduction", "Suffocating", "Severe", "Significant", "Serious", "Slight"], ["No Reduction", "Extremely Limited", "Severely Limited", "Significantly Limited", "Seriously Limited", "Slightly Limited"], 0],
	true
] call CBA_Settings_fnc_init;

/*
[
"AAF_scaredyCatEnabler", // Enabling the entire scaredycat system
            "CHECKBOX", 
        ["Enable Scaredycat", "Units with Scaredycat ticked in their unit properties will surrender if a player within 10m points a weapon at them and verbally orders them to surrender."]
        ["AAF Settings", "Scaredycat Surrender System"]
false// Value info
            1, 
            {}
] call CBA_Settings_fnc_init;
*/

[
	QGVAR(aiDifficultyWest),
	"LIST",
	["BLUFOR (Editor Placed Only)", "Set AI difficulty for BLUFOR"],
	[AZF_SETTINGS, "AI Difficulty"],
	[["Editor", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], ["No change from Editor Values", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], 0],
	true
] call CBA_Settings_fnc_init;

[
	QGVAR(aiDifficultyIndependent),
	"LIST",
	["Independent (Editor Placed Only)", "Set AI difficulty for INDFOR"],
	[AZF_SETTINGS, "AI Difficulty"],
	[["Editor", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], ["No change from Editor Values", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], 0],
	true
] call CBA_Settings_fnc_init;

[
	QGVAR(aiDifficultyEast),
	"LIST",
	["OPFOR (Editor Placed Only)", "Set AI difficulty for OPFOR"],
	[AZF_SETTINGS, "AI Difficulty"],
	[["Editor", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], ["No change from Editor Values", "Civilian", "Insurgents", "Regular", "Professional", "SpecialForces"], 0],
	true
] call CBA_Settings_fnc_init;
