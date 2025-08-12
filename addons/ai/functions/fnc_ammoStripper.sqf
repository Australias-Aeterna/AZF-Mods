#include "..\script_component.hpp"

params ["_unit"];
{
	switch (GVAR(ammoSupplyGlobal)) do
	{
		case "NoReduction": {};
		case "Suffocating": {
			_unit setVehicleAmmo selectRandom [0.05, 0.08, 0.1, 0.13, 0.15, 0.18];
		};
		case "Severe": {
			_unit setVehicleAmmo selectRandom [0.8, 0.11, 0.13, 0.16, 0.19, 0.21];
		};
		case "Significant": {
			_unit setVehicleAmmo selectRandom [0.15, 0.18, 0.2, 0.23, 0.25, 0.31];
		};
		case "Serious": {
			_unit setVehicleAmmo selectRandom [0.35, 0.38, 0.4, 0.43, 0.45, 0.49];
		};
		case "Slight": {
			_unit setVehicleAmmo selectRandom [0.45, 0.48, 0.51, 0.55, 0.58, 0.63];
		};
		default {};
	};
};
