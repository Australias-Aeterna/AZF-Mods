[
	QGVAR(blurUnconScreen),
	"CHECKBOX",
	"Blur screen instead of using blackout effects",
	[AZF_SETTINGS, "Medical"],
	false,
	false
] call CBA_fnc_addSetting;

[
    QGVAR(unconSpectator),
    "CHECKBOX",
    "Enable Unconscious Spectator",
    [AZF_SETTINGS, "Medical"],
    false,
    true
] call CBA_fnc_addSetting;

[
	QGVAR(medicMultiplier),
	"SLIDER",
	["Medic Multiplier", "How much more effective bandages are when applied by a medic"],
	[AZF_SETTINGS, "Medical"],
	[1, 10, 2, 1],
	false
] call CBA_fnc_addSetting;

// [
// 	QGVAR(bloodRegenLimit),
// 	"SLIDER",
// 	["Blood Regeneration Limit", "The maximum amount of blood that can be regenerated when you are not bleeding"],
// 	[AZF_SETTINGS, "Medical"],
// 	[3, 6, 3.7, 1],
// 	false
// ] call CBA_fnc_addSetting;

[
	QGVAR(stableVitalsBloodThreshold),
	"SLIDER",
	["ACE Stable Vitals Blood Threshold", "The minimum amount of blood you need to wake up from unconsciousness"],
	[AZF_SETTINGS, "Medical"],
	[3, 6, 3.7, 1],
	false
] call CBA_fnc_addSetting;
