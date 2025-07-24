params ["_medic"];

_effectiveness = 2;
if ([_medic] call ace_medical_treatment_isMedic) then {
	// Medics are more practised at applying bandages
	_effectiveness = _effectiveness * 2;
}

_effectiveness
