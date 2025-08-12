#include "..\script_component.hpp"
params ["_unit"];
{
    _uniform = uniformContainer _unit;
	_vest = vestContainer _unit;
	_backpack = backpackContainer _unit;

	if (!(GVAR(medicalSupplyGlobal) isEqualTo "NoReduction")) then {
		{
			_unit removeItems _x;
		} forEach GVAR(medkits);
		{
			_unit removeItems _x;
		} forEach GVAR(firstAidKits);
	};

	_medicalBase = [[], [['ACE_fieldDressing', 1]], [['ACE_morphine', 1]], [['ACE_tourniquet', 1]], [['ACE_splint', 1]], [['ACE_fieldDressing', 1], ['ACE_morphine', 1]], [['ACE_fieldDressing', 1], ['ACE_splint', 1]], [['ACE_fieldDressing', 1], ['ACE_tourniquet', 1]], [['ACE_fieldDressing', 2]], [['ACE_fieldDressing', 1], ['ACE_splint', 1], ['ACE_tourniquet', 1]], [['ACE_fieldDressing', 1], ['ACE_morphine', 1], ['ACE_tourniquet', 1]], [['ACE_fieldDressing', 1], ['ACE_splint', 1], ['ACE_morphine', 1]]];
	_medicalMedic = [[['ACE_fieldDressing', 2], ['ACE_morphine', 1]], [['ACE_fieldDressing', 2], ['ACE_morphine', 1], ['ACE_tourniquet', 1]], [['ACE_fieldDressing', 2], ['ACE_morphine', 1], ['ACE_tourniquet', 1]], [['ACE_fieldDressing', 3], ['ACE_morphine', 1], ['ACE_epinephrine', 1], ['ACE_tourniquet', 1]], [['ACE_fieldDressing', 4], ['ACE_morphine', 1], ['ACE_epinephrine', 1], ['ACE_tourniquet', 1]]];
	_medicalWeightsSuffocating = [0.6, 0.1, 0.1, 0.1, 0.05, 0, 0, 0, 0.05, 0, 0];
	_medicalWeightsSevere = [0.6, 0.2, 0.1, 0.1, 0.05, 0, 0, 0, 0.05, 0, 0];
	_medicalWeightsSignificant = [0.6, 0.1, 0.1, 0.1, 0.05, 0.1, 0, 0, 0, 0, 0];
	_medicalWeightsSerious = [0.5, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0, 0];
	_medicalWeightsSlight = [0.3, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1];
	_medicalSaline = [[], 0.9, ['ACE_salineIV_250', 1], 0.1];
	switch (GVAR(medicalSupplyGlobal)) do
	{
		case "NoReduction": {};
		case "Suffocating":
		{
			_medicalUniform = _medicalBase selectRandomWeighted _medicalWeightsSuffocating;
			if (_unit getUnitTrait "Medic") then {
				_medicalBackpack pushBack _medicalMedic select 0;
			};
		};
		case "Severe":
		{
			_medicalUniform = _medicalBase selectRandomWeighted _medicalWeightsSevere;
			if (_unit getUnitTrait "Medic") then {
				_medicalBackpack pushBack _medicalMedic select 1;
			};
		};
		case "Significant":
		{
			_medicalUniform = _medicalBase selectRandomWeighted _medicalWeightsSignificant;
			if (_unit getUnitTrait "Medic") then {
				_medicalBackpack pushBack _medicalMedic select 2;
			};
		};

		case "Serious":
		{
			_medicalUniform = _medicalBase selectRandomWeighted _medicalWeightsSerious;
			if (_unit getUnitTrait "Medic") then {
				_medicalBackpack pushBack _medicalMedic select 3;
				_medicalBackpack pushBack selectRandomWeighted _medicalSaline;
			};
		};

		case "Slight":
		{
			_medicalUniform = _medicalBase selectRandomWeighted _medicalWeightsSlight;
			if (_unit getUnitTrait "Medic") then {
				_medicalBackpack pushBack _medicalMedic select 4;
				_medicalBackpack pushBack selectRandomWeighted _medicalSaline;
			};
		};
		default {
			exitWith{};
		};
	};

	{
		_uniform addItemCargoGlobal _x;
	} forEach _medicalUniform;
	if (!isNil "_medicalBackpack") then {
		{
			_backpack addItemCargoGlobal _x;
		} forEach _medicalBackpack;
	};
};
