#include "..\script_component.hpp"
/*
 * Author: Glowbal - Modified by AZF Team 
 * Bandages open wounds on the given body part of the patient.
 * 
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 * 4: Item User <OBJECT>
 * 5: Used Item <STRING>
 * 6: Create litter <BOOL>
 * 7: Bandage effectiveness coefficient <NUMBER> (default: 1)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "Head", "FieldDressing"] call ace_medical_treatment_fnc_bandage
 *
 * Public: No
 */

_this set [7, _this param [7, 1]]; // set bandage effectiveness coefficient
[QACEGVAR(medical_treatment,bandaged), _this] call CBA_fnc_localEvent; // Raise event with reference so mods can modify this

params ["_medic", "_patient", "_bodyPart", "_classname", "", "", "", "_bandageEffectiveness"];

[_patient, "activity", ACELSTRING(medical_treatment,Activity_bandagedPatient), [[_medic, false, true] call ACEFUNC(common,getName)]] call ACEFUNC(medical_treatment,addToLog);

if ([_medic] call ACEFUNC(medical_treatment,isMedic)) then {
	// Medics are more practised at applying bandages
	_bandageEffectiveness = _bandageEffectiveness * GVAR(medicMultiplier);
};

[QACEGVAR(medical_treatment,bandageLocal), [_patient, _bodyPart, _classname, _bandageEffectiveness], _patient] call CBA_fnc_targetEvent;
