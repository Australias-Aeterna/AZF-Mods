#include "..\script_component.hpp"

params ["_unit"];
{
	_launcher = secondaryWeapon _unit;
	try {
		_launcherUsed = cba_disposable_UsedLaunchers get _launcher;
	} catch {};

	if (!isNil "_launcherUsed") then {
		switch (GVAR(latSupplyGlobal)) do
		{
			case "NoReduction": {};
			case "Suffocating":
			{
				_newLauncher = selectRandomWeighted [_launcherUsed, 0.9, _launcher]
			};
			case "Severe":
			{
				_newLauncher = selectRandomWeighted [_launcherUsed, 0.8, _launcher]
			};
			case "Significant":
			{
				_newLauncher = selectRandomWeighted [_launcherUsed, 0.6, _launcher]
			};

			case "Serious":
			{
				_newLauncher = selectRandomWeighted [_launcherUsed, 0.5, _launcher]
			};

			case "Slight":
			{
				_newLauncher = selectRandomWeighted [_launcherUsed, 0.3, _launcher]
			};
			default {};
		};
		if (!GVAR(latSupplyGlobal) isEqualTo "NoReduction") then {
			_unit removeWeaponGlobal _launcher;
			_unit addWeaponGlobal _newLauncher;
		};
	};
};
