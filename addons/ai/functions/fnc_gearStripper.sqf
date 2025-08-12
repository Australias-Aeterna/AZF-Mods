#include "..\script_component.hpp"
// GEAR STRIPPE//// //// //// //// //// //// //// //// //// //// //// //// //////////////////
// 
// Function based version. Can take severity levels from variables to determine
// supply deprivation
// 
//// //// //// //// //// //// //// //// //// //// //// //// /////////////////////////////////////////////

// to do: Consider adding a per-faction stripper so each can have different settings. Fiddly but far more flexible
/* 
    ["CAManBase", "Fired", {
        systemChat str _this
    }] call CBA_fnc_addClassEventHandler;
// possible way to add the EH to curator modules by default. Might not be practical without a major rewrite or turning the variables to global. Easier to make my own create zeus and add the EH in there? Might still need replication of code. The stripper checkboxes should be global at least, might just need the active code.
*/  

{
    params ["_unit"];
    {
        _medSupply0 = "";
        _medSupply1 = "";
        _medSupply2 = "";
        _medSupply3 = "";
        _medSupply4 = "";
        _medSupply5 = "";
        _medSupply6 = "";
        _medSupply7 = "";
        _medSupply8 = "";
        _medSupply9 = "";
        _medSupplyFinal = "";
        _latSupply0 = "";
        _latSupply1 = "";
        _latSupply2 = "";
        _latSupply3 = "";
        _latSupply4 = "";
        _latSupply5 = "";
        _latSupply6 = "";
        _latSupply7 = "";
        _latSupply8 = "";
        _latSupply9 = "";
        _latSupplyFinal = "";
        _ammoSupplyFinal = "";
        _stripperValues = "";
        _stripperCommand = "";
        _launcherL = "";
        _launcherU = "";
        _uniform = uniformContainer _this;
        _vest = vestContainer _this;
        _backpack = backpackContainer _this;
        weaponLauncher = secondaryWeapon _this;
        switch (weaponLauncher) do
        {};

        _this removeItems 'FirstAidKit';
        _this removeItems 'Medikit';
        if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
            _this removeItems 'gm_ge_army_burnBandage';
            _this removeItems 'gm_gc_army_gauzeBandage';
            _this removeItems 'gm_ge_army_gauzeBandage';
            _this removeItems 'gm_ge_army_gauzeCompress';
            _this removeItems 'gm_gc_army_medbox';
            _this removeItems 'gm_ge_army_medkit_80';
            _this removeItems 'gm_gc_army_medkit';
            _this removeItems 'gm_ge_firstaidkit_vehicle';
            _this removeItems 'gm_gc_firstaidkit_vehicle';
            _this removeItems 'gm_ge_army_firstaidkit_vehicle';
        };
        if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
            _this removeItems 'vn_b_item_medikit_01';
            _this removeItems 'vn_o_item_firstaidkit';
            _this removeItems 'vn_b_item_firstaidkit';
        };

        if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
            _this removeItems 'fow_i_fak_ger';
            _this removeItems 'fow_i_fak_ija';
            _this removeItems 'fow_i_fak_uk';
            _this removeItems 'fow_i_fak_us';
            _this removeItems 'fow_i_fak_us_red';
            _this removeItems 'CSA38_obvaz';
            _this removeItems 'SPE_GER_FirstAidKit';
            _this removeItems 'SPE_US_FirstAidKit';
            _this removeItems 'SPE_GER_medkit';
            _this removeItems 'SPE_US_medkit';
            _this removeItems 'CSA38_medikitWH';
        };

        switch (AAF_medSupplyGlobal) do
        {
            case "NoReduction": {};
            case "Suffocating":
            {
                _this removeItems 'FirstAidKit';
                _this removeItems 'Medikit';
                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                    _this removeItems 'gm_ge_army_burnBandage';
                    _this removeItems 'gm_gc_army_gauzeBandage';
                    _this removeItems 'gm_ge_army_gauzeBandage';
                    _this removeItems 'gm_ge_army_gauzeCompress';
                    _this removeItems 'gm_gc_army_medbox';
                    _this removeItems 'gm_ge_army_medkit_80';
                    _this removeItems 'gm_gc_army_medkit';
                    _this removeItems 'gm_ge_firstaidkit_vehicle';
                    _this removeItems 'gm_gc_firstaidkit_vehicle';
                    _this removeItems 'gm_ge_army_firstaidkit_vehicle';
                };
                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                    _this removeItems 'vn_b_item_medikit_01';
                    _this removeItems 'vn_o_item_firstaidkit';
                    _this removeItems 'vn_b_item_firstaidkit';
                };

                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                    _this removeItems 'fow_i_fak_ger';
                    _this removeItems 'fow_i_fak_ija';
                    _this removeItems 'fow_i_fak_uk';
                    _this removeItems 'fow_i_fak_us';
                    _this removeItems 'fow_i_fak_us_red';
                    _this removeItems 'CSA38_obvaz';
                    _this removeItems 'SPE_GER_FirstAidKit';
                    _this removeItems 'SPE_US_FirstAidKit';
                    _this removeItems 'SPE_GER_medkit';
                    _this removeItems 'SPE_US_medkit';
                    _this removeItems 'CSA38_medikitWH';
                };
                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];
                ";
                _medSupply1 = "";
                _medSupply2 = "";
                _medSupply3 = "";
                _medSupply4 = "";
                _medSupply5 = "";
                _medSupply6 = "";
                _medSupply7 = "";
                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];
                ";
                _medSupply9 = "";
                _extramed = "_backpack addItemCargoGlobal ['ACE_fieldDressing', 3];
                _backpack addItemCargoGlobal ['ACE_elasticBandage', 1];
                ";
                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                _isMed = _this getUnitTrait "Medic";
                if (_isMed) then {
                    _medSupplyFinal = _medSupplyFinal + _extramed
                };
            };
            case "Severe":
            {
                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];
                ";
                _medSupply1 = "";
                _medSupply2 = "";
                _medSupply3 = "";
                _medSupply4 = "_uniform addItemCargoGlobal ['ACE_tourniquet', 1];
                ";
                _medSupply5 = "";
                _medSupply6 = "";
                _medSupply7 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];
                ";
                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];
                ";
                _medSupply9 = "";
                _extramed = "_backpack addItemCargoGlobal ['ACE_fieldDressing', 3];
                _backpack addItemCargoGlobal ['ACE_elasticBandage', 2];
                ";
                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                _isMed = _this getUnitTrait "Medic";
                if (_isMed) then {
                    _medSupplyFinal = _medSupplyFinal + _extramed
                };
            };
            case "Significant":
            {
                _this removeItems 'FirstAidKit';
                _this removeItems 'Medikit';
                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                    _this removeItems 'gm_ge_army_burnBandage';
                    _this removeItems 'gm_gc_army_gauzeBandage';
                    _this removeItems 'gm_ge_army_gauzeBandage';
                    _this removeItems 'gm_ge_army_gauzeCompress';
                    _this removeItems 'gm_gc_army_medbox';
                    _this removeItems 'gm_ge_army_medkit_80';
                    _this removeItems 'gm_gc_army_medkit';
                    _this removeItems 'gm_ge_firstaidkit_vehicle';
                    _this removeItems 'gm_gc_firstaidkit_vehicle';
                    _this removeItems 'gm_ge_army_firstaidkit_vehicle';
                };
                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                    _this removeItems 'vn_b_item_medikit_01';
                    _this removeItems 'vn_o_item_firstaidkit';
                    _this removeItems 'vn_b_item_firstaidkit';
                };

                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                    _this removeItems 'fow_i_fak_ger';
                    _this removeItems 'fow_i_fak_ija';
                    _this removeItems 'fow_i_fak_uk';
                    _this removeItems 'fow_i_fak_us';
                    _this removeItems 'fow_i_fak_us_red';
                    _this removeItems 'CSA38_obvaz';
                    _this removeItems 'SPE_GER_FirstAidKit';
                    _this removeItems 'SPE_US_FirstAidKit';
                    _this removeItems 'SPE_GER_medkit';
                    _this removeItems 'SPE_US_medkit';
                    _this removeItems 'CSA38_medikitWH';
                };
                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];
                ";
                _medSupply1 = "";
                _medSupply2 = "";
                _medSupply3 = "";
                _medSupply4 = "_uniform addItemCargoGlobal ['ACE_tourniquet', 1];
                ";
                _medSupply5 = "";
                _medSupply6 = "";
                _medSupply7 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];
                _uniform addItemCargoGlobal ['ACE_morphine', 1];
                ";
                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];
                ";
                _medSupply9 = "";
                _extramed = "_backpack addItemCargoGlobal ['ACE_fieldDressing', 5];
                _backpack addItemCargoGlobal ['ACE_elasticBandage', 2];
                ";
                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                _isMed = _this getUnitTrait "Medic";
                if (_isMed) then {
                    _medSupplyFinal = _medSupplyFinal + _extramed
                };
            };

            case "Serious":
            {
                _this removeItems 'FirstAidKit';
                _this removeItems 'Medikit';
                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                    _this removeItems 'gm_ge_army_burnBandage';
                    _this removeItems 'gm_gc_army_gauzeBandage';
                    _this removeItems 'gm_ge_army_gauzeBandage';
                    _this removeItems 'gm_ge_army_gauzeCompress';
                    _this removeItems 'gm_gc_army_medbox';
                    _this removeItems 'gm_ge_army_medkit_80';
                    _this removeItems 'gm_gc_army_medkit';
                    _this removeItems 'gm_ge_firstaidkit_vehicle';
                    _this removeItems 'gm_gc_firstaidkit_vehicle';
                    _this removeItems 'gm_ge_army_firstaidkit_vehicle';
                };
                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                    _this removeItems 'vn_b_item_medikit_01';
                    _this removeItems 'vn_o_item_firstaidkit';
                    _this removeItems 'vn_b_item_firstaidkit';
                };

                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                    _this removeItems 'fow_i_fak_ger';
                    _this removeItems 'fow_i_fak_ija';
                    _this removeItems 'fow_i_fak_uk';
                    _this removeItems 'fow_i_fak_us';
                    _this removeItems 'fow_i_fak_us_red';
                    _this removeItems 'CSA38_obvaz';
                    _this removeItems 'SPE_GER_FirstAidKit';
                    _this removeItems 'SPE_US_FirstAidKit';
                    _this removeItems 'SPE_GER_medkit';
                    _this removeItems 'SPE_US_medkit';
                    _this removeItems 'CSA38_medikitWH';
                };
                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_elasticBandage', 1];
                _uniform addItemCargoGlobal ['ACE_morphine', 1];
                ";
                _medSupply1 = "";
                _medSupply2 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 2];
                ";
                _medSupply3 = "";
                _medSupply4 = "_uniform addItemCargoGlobal ['ACE_tourniquet', 1];
                ";
                _medSupply5 = "";
                _medSupply6 = "";
                _medSupply7 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];
                _uniform addItemCargoGlobal ['ACE_tourniquet', 1];
                ";
                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];
                ";
                _medSupply9 = "";
                _extramed = "_backpack addItemCargoGlobal ['ACE_fieldDressing', 4];
                _backpack addItemCargoGlobal ['ACE_elasticBandage', 2];
                ";
                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                _isMed = _this getUnitTrait "Medic";
                if (_isMed) then {
                    _medSupplyFinal = _medSupplyFinal + _extramed
                };
            };

            case "Slight":
            {
                _this removeItems 'FirstAidKit';
                _this removeItems 'Medikit';
                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                    _this removeItems 'gm_ge_army_burnBandage';
                    _this removeItems 'gm_gc_army_gauzeBandage';
                    _this removeItems 'gm_ge_army_gauzeBandage';
                    _this removeItems 'gm_ge_army_gauzeCompress';
                    _this removeItems 'gm_gc_army_medbox';
                    _this removeItems 'gm_ge_army_medkit_80';
                    _this removeItems 'gm_gc_army_medkit';
                    _this removeItems 'gm_ge_firstaidkit_vehicle';
                    _this removeItems 'gm_gc_firstaidkit_vehicle';
                    _this removeItems 'gm_ge_army_firstaidkit_vehicle';
                };
                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                    _this removeItems 'vn_b_item_medikit_01';
                    _this removeItems 'vn_o_item_firstaidkit';
                    _this removeItems 'vn_b_item_firstaidkit';
                };

                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                    _this removeItems 'fow_i_fak_ger';
                    _this removeItems 'fow_i_fak_ija';
                    _this removeItems 'fow_i_fak_uk';
                    _this removeItems 'fow_i_fak_us';
                    _this removeItems 'fow_i_fak_us_red';
                    _this removeItems 'CSA38_obvaz';
                    _this removeItems 'SPE_GER_FirstAidKit';
                    _this removeItems 'SPE_US_FirstAidKit';
                    _this removeItems 'SPE_GER_medkit';
                    _this removeItems 'SPE_US_medkit';
                    _this removeItems 'CSA38_medikitWH';
                };
                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];
                _uniform addItemCargoGlobal ['ACE_morphine', 1];
                ";
                _medSupply1 = "";
                _medSupply2 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 2];
                ";
                _medSupply3 = "";
                _medSupply4 = "_uniform addItemCargoGlobal ['ACE_tourniquet', 1];
                ";
                _medSupply5 = "";
                _medSupply6 = "_uniform addItemCargoGlobal ['ACE_elasticBandage', 2];
                _uniform addItemCargoGlobal ['ACE_morphine', 1];
                ";
                _medSupply7 = "_uniform addItemCargoGlobal ['ACE_elasticBandage', 1];
                _uniform addItemCargoGlobal ['ACE_tourniquet', 1];
                ";
                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];
                ";
                _medSupply9 = "";
                                                                                                                                _extramed = "_backpack addItemCargoGlobal ['ACE_bloodIV_250', 1];_backpack addItemCargoGlobal ['ACE_fieldDressing', 5];_backpack addItemCargoGlobal ['ACE_elasticBandage', 2];";// probably add a random element for blood, like a 25% chance to get it on slight and 10% on serious
                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                _isMed = _this getUnitTrait "Medic";
                if (_isMed) then {
                    _medSupplyFinal = _medSupplyFinal + _extramed
                };
            };
            default {};
        };

        switch (AAF_latSupplyGlobal) do
        {
            case "NoReduction": {};
            case "Suffocating":
            {
                _latSupply0 = "";
                _latSupply1 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply2 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply3 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply4 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply5 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply6 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply7 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply8 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply9 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
            };
            case "Severe":
            {
                _latSupply0 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply1 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply2 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply3 = "";
                _latSupply4 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply5 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply6 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply7 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply8 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply9 = "";
                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
            };
            case "Significant":
            {
                _latSupply0 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply1 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply2 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply3 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply4 = "";
                _latSupply5 = "";
                _latSupply6 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply7 = "";
                _latSupply8 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply9 = "";
                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
            };

            case "Serious":
            {
                _latSupply0 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply1 = "";
                _latSupply2 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply3 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply4 = "";
                _latSupply5 = "";
                _latSupply6 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply7 = "";
                _latSupply8 = "";
                _latSupply9 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
            };

            case "Slight":
            {
                _latSupply0 = "";
                _latSupply1 = "";
                _latSupply2 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply3 = "";
                _latSupply4 = "";
                _latSupply5 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply6 = "";
                _latSupply7 = "";
                _latSupply8 = "_this removeWeaponGlobal _launcherL;
                _this addWeaponGlobal _launcherU;
                ";
                _latSupply9 = "";
                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
            };
            default {};
        };

        switch (AAF_ammoSupplyGlobal) do
        {
            case "NoReduction": {};
            case "Suffocating": {
                _ammoSupplyFinal = "_this setVehicleAmmo selectRandom [0.05, 0.08, 0.1, 0.13, 0.15, 0.18];
                "
            };
            case "Severe": {
                _ammoSupplyFinal = "_this setVehicleAmmo selectRandom [0.8, 0.11, 0.13, 0.16, 0.19, 0.21];
                "
            };
            case "Significant": {
                _ammoSupplyFinal = "_this setVehicleAmmo selectRandom [0.15, 0.18, 0.2, 0.23, 0.25, 0.31];
                "
            };
            case "Serious": {
                _ammoSupplyFinal = "_this setVehicleAmmo selectRandom [0.35, 0.38, 0.4, 0.43, 0.45, 0.49];
                "
            };
            case "Slight": {
                _ammoSupplyFinal = "_this setVehicleAmmo selectRandom [0.45, 0.48, 0.51, 0.55, 0.58, 0.63];
                "
            };
            default {};
        };

                                                                // APPLICATION OF STRIPPER (As seen in bachelor parties)
        _stripperValues = _ammoSupplyFinal + _latSupplyFinal + _medSupplyFinal;
        _stripperCommand = compile _stripperValues;
                                                                call _stripperCommand;// Note to self: If I ever make a management sim, "Stripper Command" is definitely the name.
    };
}];
};
};
};
};
} forEach allUnits;
/*
                                {
        _x addEventHandler["CuratorObjectPlaced", {
            params["_curator", "_entity"]; 
                                                                                                if (side _entity in selectedfactions) then {
                if (_entity isKindOf "LandVehicle") then {
                    _crew = crew _entity; 
                                                                                                                                                                        {
                        _x addEventHandler [
                                                                                                                                                                                                                                "Killed", {
                                params["_killed", "_killer", "_instigator"];(_this select 0) spawn {
                                    _medSupply0 = "";
                                                                                                                                                                                                                                                                                                _medSupply1 = "";
                                                                                                                                                                                                                                                                                                _medSupply2 = "";
                                                                                                                                                                                                                                                                                                _medSupply3 = "";
                                                                                                                                                                                                                                                                                                _medSupply4 = "";
                                                                                                                                                                                                                                                                                                _medSupply5 = "";
                                                                                                                                                                                                                                                                                                _medSupply6 = "";
                                                                                                                                                                                                                                                                                                _medSupply7 = "";
                                                                                                                                                                                                                                                                                                _medSupply8 = "";
                                                                                                                                                                                                                                                                                                _medSupply9 = "";
                                                                                                                                                                                                                                                                                                _medSupplyFinal = "";
                                                                                                                                                                                                                                                                                                _latSupply0 = "";
                                                                                                                                                                                                                                                                                                _latSupply1 = "";
                                                                                                                                                                                                                                                                                                _latSupply2 = "";
                                                                                                                                                                                                                                                                                                _latSupply3 = "";
                                                                                                                                                                                                                                                                                                _latSupply4 = "";
                                                                                                                                                                                                                                                                                                _latSupply5 = "";
                                                                                                                                                                                                                                                                                                _latSupply6 = "";
                                                                                                                                                                                                                                                                                                _latSupply7 = "";
                                                                                                                                                                                                                                                                                                _latSupply8 = "";
                                                                                                                                                                                                                                                                                                _latSupply9 = "";
                                                                                                                                                                                                                                                                                                _latSupplyFinal = "";
                                                                                                                                                                                                                                                                                                _ammoSupplyFinal = "";
                                                                                                                                                                                                                                                                                                _stripperValues = "";
                                                                                                                                                                                                                                                                                                _stripperCommand = "";
                                                                                                                                                                                                                                                                                                _launcherL = ""; 
                                                                                                                                                                                                                                                                                                _launcherU = "";
                                                                                                                                                                                                                                                                                                _uniform = uniformContainer _this;
                                                                                                                                                                                                                                                                                                _vest = vestContainer _this;
                                                                                                                                                                                                                                                                                                _backpack = backpackContainer _this;
                                                                                                                                                                                                                                                                                                weaponLauncher = secondaryWeapon _this; 
                                                                                                                                                                                                                                                                                                switch (weaponLauncher) do
                                                                                                                                                                                                                                                                                                {
                                        case "ACE_launch_NLAW_ready_F": {
                                            _launcherL = "ACE_launch_NLAW_ready_F";  _launcherU = "ACE_launch_NLAW_used_F";
                                        };
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_NLAW_Loaded": {
                                            _launcherL = "CUP_launch_NLAW_Loaded";  _launcherU = "CUP_launch_NLAW_Used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_M72A6_Special_Loaded": {
                                            _launcherL = "CUP_launch_M72A6_Special_Loaded";  _launcherU = "CUP_launch_M72A6_Special_Used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_M72A6_Loaded": {
                                            _launcherL = "CUP_launch_M72A6_Loaded";  _launcherU = "CUP_launch_M72A6_Used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_M136_Loaded": {
                                            _launcherL = "CUP_launch_M136_Loaded";  _launcherU = "CUP_launch_M136_Used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_Igla_Loaded": {
                                            _launcherL = "CUP_launch_Igla_Loaded";  _launcherU = "CUP_launch_Igla_Used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_9K32Strela_Loaded": {
                                            _launcherL = "CUP_launch_9K32Strela_Loaded";  _launcherU = "CUP_launch_9K32Strela_Used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_FIM92Stinger_Loaded": {
                                            _launcherL = "CUP_launch_FIM92Stinger_Loaded";  _launcherU = "CUP_launch_FIM92Stinger_Used";
                                        };      
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_BF3_Loaded": {
                                            _launcherL = "CUP_launch_BF3_Loaded";  _launcherU = "CUP_launch_PzF3_Used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_HCPF3_Loaded": {
                                            _launcherL = "CUP_launch_HCPF3_Loaded";  _launcherU = "CUP_launch_PzF3_Used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_PzF3_Loaded": {
                                            _launcherL = "CUP_launch_PzF3_Loaded";  _launcherU = "CUP_launch_PzF3_Used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_APILAS_Loaded": {
                                            _launcherL = "CUP_launch_APILAS_Loaded";  _launcherU = "CUP_launch_APILAS_Used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_RPG26_Loaded": {
                                            _launcherL = "CUP_launch_RPG26_Loaded";  _launcherU = "CUP_launch_RPG26_Used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_RPG18_Loaded": {
                                            _launcherL = "CUP_launch_RPG18_Loaded";  _launcherU = "CUP_launch_RPG18_Used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "CUP_launch_RShG2_Loaded": {
                                            _launcherL = "CUP_launch_RShG2_Loaded";  _launcherU = "CUP_launch_RShG2_Used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "cwr3_launch_redeye_loaded": {
                                            _launcherL = "cwr3_launch_redeye_loaded";  _launcherU = "cwr3_launch_redeye_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "cwr3_launch_m72a3_loaded": {
                                            _launcherL = "cwr3_launch_m72a3_loaded";  _launcherU = "cwr3_launch_m72a3_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "cwr3_launch_rpg75_loaded": {
                                            _launcherL = "cwr3_launch_rpg75_loaded";  _launcherU = "cwr3_launch_rpg75_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "gm_fim43_oli": {
                                            _launcherL = "gm_fim43_oli";  _launcherU = "gm_fim43_spent_oli";
                                        };
                                                                                                                                                                                                                                                                                                                                case "gm_m72a3_oli": {
                                            _launcherL = "gm_m72a3_oli";  _launcherU = "gm_m72a3_spent_oli";
                                        };
                                                                                                                                                                                                                                                                                                                                case "gm_9k32m_oli": {
                                            _launcherL = "gm_9k32m_oli";  _launcherU = "gm_9k32m_spent_oli";
                                        };
                                                                                                                                                                                                                                                                                                                                case "vn_m72": {
                                            _launcherL = "vn_m72";  _launcherU = "vn_m72_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "SPE_PzFaust_60m": {
                                            _launcherL = "SPE_PzFaust_60m";  _launcherU = "SPE_PzFaust_60m_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "SPE_PzFaust_30m": {
                                            _launcherL = "SPE_PzFaust_30m";  _launcherU = "SPE_PzFaust_30m_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "SPE_Faustpatrone": {
                                            _launcherL = "SPE_Faustpatrone";  _launcherU = "SPE_Faustpatrone_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "NORTH_fin_panzerfaust30_ready": {
                                            _launcherL = "NORTH_fin_panzerfaust30_ready";  _launcherU = "NORTH_fin_panzerfaust30_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "NORTH_fin_panzerfaustKlein_ready": {
                                            _launcherL = "NORTH_fin_panzerfaustKlein_ready";  _launcherU = "NORTH_fin_panzerfaustKlein_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "LIB_PzFaust_60m": {
                                            _launcherL = "LIB_PzFaust_60m";  _launcherU = "LIB_PzFaust_60m_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "LIB_PzFaust_30m": {
                                            _launcherL = "LIB_PzFaust_30m";  _launcherU = "LIB_PzFaust_30m_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "LIB_Faustpatrone": {
                                            _launcherL = "LIB_Faustpatrone";  _launcherU = "LIB_Faustpatrone_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "fow_w_pzfaust_60": {
                                            _launcherL = "fow_w_pzfaust_60";  _launcherU = "fow_w_pzfaust_60_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "fow_w_pzfaust_30_klein": {
                                            _launcherL = "fow_w_pzfaust_30_klein";  _launcherU = "fow_w_pzfaust_30_klein_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "fow_w_pzfaust_30": {
                                            _launcherL = "fow_w_pzfaust_30";  _launcherU = "fow_w_pzfaust_30_used";
                                        };
                                                                                                                                                                                                                                                                                                                                case "fow_w_pzfaust_100": {
                                            _launcherL = "fow_w_pzfaust_100";  _launcherU = "fow_w_pzfaust_100_used";
                                        };
                                                                                                                                                                                                                                                                                                                                default {};
                                    };
                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                switch (AAF_medSupplyGlobal) do 
                                                                                                                                                                                                                                                                                                {
                                        case "NoReduction": {};
                                                                                                                                                                                                                                                                                                                                case "Suffocating": 
                                                                                                                                                                                                                                                                                                                                {
                                            _this removeItems 'FirstAidKit';_this removeItems 'Medikit';
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                                                _this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
                                            };
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                                                _this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
                                            };
                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                                                _this removeItems 'fow_i_fak_ger';_this removeItems 'fow_i_fak_ija';_this removeItems 'fow_i_fak_uk';_this removeItems 'fow_i_fak_us';_this removeItems 'fow_i_fak_us_red';_this removeItems 'CSA38_obvaz';_this removeItems 'SPE_GER_FirstAidKit';_this removeItems 'SPE_US_FirstAidKit';_this removeItems 'SPE_GER_medkit';_this removeItems 'SPE_US_medkit';_this removeItems 'CSA38_medikitWH';
                                            };
                                                                                                                                                                                                                                                                                                                                                                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply1 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply2 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply3 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply4 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply5 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply6 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply7 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply9 = "";
                                                                                                                                                                                                                                                                                                                                                                _extramed = "_backpack addItemCargoGlobal ['ACE_fieldDressing', 3];_backpack addItemCargoGlobal ['ACE_elasticBandage', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                                                                                                                                                                                                                                                                                                                                                                _isMed = _this getUnitTrait "Medic";
                                                                                                                                                                                                                                                                                                                                                                if (_isMed) then {
                                                _medSupplyFinal = _medSupplyFinal + _extramed
                                            };
                                        };
                                                                                                                                                                                                                                                                                                                                case "Severe": 
                                                                                                                                                                                                                                                                                                                                {
                                            _this removeItems 'FirstAidKit';_this removeItems 'Medikit';
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                                                _this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
                                            };
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                                                _this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
                                            };
                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                                                _this removeItems 'fow_i_fak_ger';_this removeItems 'fow_i_fak_ija';_this removeItems 'fow_i_fak_uk';_this removeItems 'fow_i_fak_us';_this removeItems 'fow_i_fak_us_red';_this removeItems 'CSA38_obvaz';_this removeItems 'SPE_GER_FirstAidKit';_this removeItems 'SPE_US_FirstAidKit';_this removeItems 'SPE_GER_medkit';_this removeItems 'SPE_US_medkit';_this removeItems 'CSA38_medikitWH';
                                            };
                                                                                                                                                                                                                                                                                                                                                                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply1 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply2 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply3 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply4 = "_uniform addItemCargoGlobal ['ACE_tourniquet', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply5 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply6 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply7 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply9 = "";
                                                                                                                                                                                                                                                                                                                                                                _extramed = "_backpack addItemCargoGlobal ['ACE_fieldDressing', 3];_backpack addItemCargoGlobal ['ACE_elasticBandage', 2];";
                                                                                                                                                                                                                                                                                                                                                                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                                                                                                                                                                                                                                                                                                                                                                _isMed = _this getUnitTrait "Medic";
                                                                                                                                                                                                                                                                                                                                                                if (_isMed) then {
                                                _medSupplyFinal = _medSupplyFinal + _extramed
                                            };
                                        };
                                                                                                                                                                                                                                                                                                                                case "Significant": 
                                                                                                                                                                                                                                                                                                                                {
                                            _this removeItems 'FirstAidKit';_this removeItems 'Medikit';
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                                                _this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
                                            };
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                                                _this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
                                            };
                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                                                _this removeItems 'fow_i_fak_ger';_this removeItems 'fow_i_fak_ija';_this removeItems 'fow_i_fak_uk';_this removeItems 'fow_i_fak_us';_this removeItems 'fow_i_fak_us_red';_this removeItems 'CSA38_obvaz';_this removeItems 'SPE_GER_FirstAidKit';_this removeItems 'SPE_US_FirstAidKit';_this removeItems 'SPE_GER_medkit';_this removeItems 'SPE_US_medkit';_this removeItems 'CSA38_medikitWH';
                                            };
                                                                                                                                                                                                                                                                                                                                                                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply1 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply2 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply3 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply4 = "_uniform addItemCargoGlobal ['ACE_tourniquet', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply5 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply6 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply7 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply9 = "";
                                                                                                                                                                                                                                                                                                                                                                _extramed = "_backpack addItemCargoGlobal ['ACE_fieldDressing', 5];_backpack addItemCargoGlobal ['ACE_elasticBandage', 2];";
                                                                                                                                                                                                                                                                                                                                                                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                                                                                                                                                                                                                                                                                                                                                                _isMed = _this getUnitTrait "Medic";
                                                                                                                                                                                                                                                                                                                                                                if (_isMed) then {
                                                _medSupplyFinal = _medSupplyFinal + _extramed
                                            };
                                        };
                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                case "Serious": 
                                                                                                                                                                                                                                                                                                                                {
                                            _this removeItems 'FirstAidKit';_this removeItems 'Medikit';
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                                                _this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
                                            };
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                                                _this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
                                            };
                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                                                _this removeItems 'fow_i_fak_ger';_this removeItems 'fow_i_fak_ija';_this removeItems 'fow_i_fak_uk';_this removeItems 'fow_i_fak_us';_this removeItems 'fow_i_fak_us_red';_this removeItems 'CSA38_obvaz';_this removeItems 'SPE_GER_FirstAidKit';_this removeItems 'SPE_US_FirstAidKit';_this removeItems 'SPE_GER_medkit';_this removeItems 'SPE_US_medkit';_this removeItems 'CSA38_medikitWH';
                                            };
                                                                                                                                                                                                                                                                                                                                                                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_elasticBandage', 1];_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply1 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply2 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 2];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply3 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply4 = "_uniform addItemCargoGlobal ['ACE_tourniquet', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply5 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply6 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply7 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];_uniform addItemCargoGlobal ['ACE_tourniquet', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply9 = "";
                                                                                                                                                                                                                                                                                                                                                                _extramed = "_backpack addItemCargoGlobal ['ACE_fieldDressing', 4];_backpack addItemCargoGlobal ['ACE_elasticBandage', 2];";
                                                                                                                                                                                                                                                                                                                                                                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                                                                                                                                                                                                                                                                                                                                                                _isMed = _this getUnitTrait "Medic";
                                                                                                                                                                                                                                                                                                                                                                if (_isMed) then {
                                                _medSupplyFinal = _medSupplyFinal + _extramed
                                            };
                                        };
                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                case "Slight": 
                                                                                                                                                                                                                                                                                                                                {
                                            _this removeItems 'FirstAidKit';_this removeItems 'Medikit';
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                                                _this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
                                            };
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                                                _this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
                                            };
                                                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                                                _this removeItems 'fow_i_fak_ger';_this removeItems 'fow_i_fak_ija';_this removeItems 'fow_i_fak_uk';_this removeItems 'fow_i_fak_us';_this removeItems 'fow_i_fak_us_red';_this removeItems 'CSA38_obvaz';_this removeItems 'SPE_GER_FirstAidKit';_this removeItems 'SPE_US_FirstAidKit';_this removeItems 'SPE_GER_medkit';_this removeItems 'SPE_US_medkit';_this removeItems 'CSA38_medikitWH';
                                            };
                                                                                                                                                                                                                                                                                                                                                                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply1 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply2 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 2];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply3 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply4 = "_uniform addItemCargoGlobal ['ACE_tourniquet', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply5 = "";
                                                                                                                                                                                                                                                                                                                                                                _medSupply6 = "_uniform addItemCargoGlobal ['ACE_elasticBandage', 2];_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply7 = "_uniform addItemCargoGlobal ['ACE_elasticBandage', 1];_uniform addItemCargoGlobal ['ACE_tourniquet', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                                                _medSupply9 = "";
                                                                                                                                                                                                                                                                                                                                                                _extramed = "_backpack addItemCargoGlobal ['ACE_bloodIV_250', 1];_backpack addItemCargoGlobal ['ACE_fieldDressing', 5];_backpack addItemCargoGlobal ['ACE_elasticBandage', 2];";
                                                                                                                                                                                                                                                                                                                                                                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                                                                                                                                                                                                                                                                                                                                                                _isMed = _this getUnitTrait "Medic";
                                                                                                                                                                                                                                                                                                                                                                if (_isMed) then {
                                                _medSupplyFinal = _medSupplyFinal + _extramed
                                            };
                                        };
                                                                                                                                                                                                                                                                                                                                default {};
                                    };
                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                switch (AAF_latSupplyGlobal) do  
                                                                                                                                                                                                                                                                                                {
                                        case "NoReduction": {};
                                                                                                                                                                                                                                                                                                                                case "Suffocating": 
                                                                                                                                                                                                                                                                                                                                {
                                            _latSupply0 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply1 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply2 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply3 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply4 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply5 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply6 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply7 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply8 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply9 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
                                        };
                                                                                                                                                                                                                                                                                                                                case "Severe": 
                                                                                                                                                                                                                                                                                                                                {
                                            _latSupply0 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply1 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply2 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply3 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply4 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply5 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply6 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply7 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply8 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply9 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
                                        };
                                                                                                                                                                                                                                                                                                                                case "Significant": 
                                                                                                                                                                                                                                                                                                                                {
                                            _latSupply0 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply1 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply2 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply3 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply4 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply5 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply6 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply7 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply8 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply9 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
                                        };
                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                case "Serious": 
                                                                                                                                                                                                                                                                                                                                {
                                            _latSupply0 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply1 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply2 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply3 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply4 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply5 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply6 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply7 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply8 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply9 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
                                        };
                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                case "Slight": 
                                                                                                                                                                                                                                                                                                                                {
                                            _latSupply0 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply1 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply2 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply3 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply4 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply5 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply6 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply7 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupply8 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                                                _latSupply9 = "";
                                                                                                                                                                                                                                                                                                                                                                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
                                        };
                                                                                                                                                                                                                                                                                                                                default {};
                                    };
                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                switch (AAF_ammoSupplyGlobal) do
                                                                                                                                                                                                                                                                                                {
                                        case "NoReduction": {};
                                                                                                                                                                                                                                                                                                                                case "Suffocating": {
                                            _ammoSupplyFinal = "_this setvehicleammo selectrandom [0.05, 0.08, 0.1, 0.13, 0.15, 0.18];"
                                        };
                                                                                                                                                                                                                                                                                                                                case "Severe": {
                                            _ammoSupplyFinal = "_this setvehicleammo selectrandom [0.8, 0.11, 0.13, 0.16, 0.19, 0.21];"
                                        };
                                                                                                                                                                                                                                                                                                                                case "Significant": {
                                            _ammoSupplyFinal = "_this setvehicleammo selectrandom [0.15, 0.18, 0.2, 0.23, 0.25, 0.31];"
                                        };
                                                                                                                                                                                                                                                                                                                                case "Serious": {
                                            _ammoSupplyFinal = "_this setvehicleammo selectrandom [0.35, 0.38, 0.4, 0.43, 0.45, 0.49];"
                                        };
                                                                                                                                                                                                                                                                                                                                case "Slight": {
                                            _ammoSupplyFinal = "_this setvehicleammo selectrandom [0.45, 0.48, 0.51, 0.55, 0.58, 0.63];"
                                        };
                                                                                                                                                                                                                                                                                                                                default {};
                                    };
                                                                                                                                                                                                                                                                                                _stripperValues = _ammoSupplyFinal + _latSupplyFinal + _medSupplyFinal;
                                                                                                                                                                                                                                                                                                _stripperCommand = compile _stripperValues;
                                                                                                                                                                                                                                                                                                call _stripperCommand;
                                };
                            }
                                                                                                                                                                                                ];
                    } forEach _crew;
                } else {
                    _entity addEventHandler [
                                                                                                                                                                                                "Killed", {
                            params["_killed", "_killer", "_instigator"];(_this select 0) spawn {
                                _medSupply0 = "";
                                                                                                                                                                                                                                                                _medSupply1 = "";
                                                                                                                                                                                                                                                                _medSupply2 = "";
                                                                                                                                                                                                                                                                _medSupply3 = "";
                                                                                                                                                                                                                                                                _medSupply4 = "";
                                                                                                                                                                                                                                                                _medSupply5 = "";
                                                                                                                                                                                                                                                                _medSupply6 = "";
                                                                                                                                                                                                                                                                _medSupply7 = "";
                                                                                                                                                                                                                                                                _medSupply8 = "";
                                                                                                                                                                                                                                                                _medSupply9 = "";
                                                                                                                                                                                                                                                                _medSupplyFinal = "";
                                                                                                                                                                                                                                                                _latSupply0 = "";
                                                                                                                                                                                                                                                                _latSupply1 = "";
                                                                                                                                                                                                                                                                _latSupply2 = "";
                                                                                                                                                                                                                                                                _latSupply3 = "";
                                                                                                                                                                                                                                                                _latSupply4 = "";
                                                                                                                                                                                                                                                                _latSupply5 = "";
                                                                                                                                                                                                                                                                _latSupply6 = "";
                                                                                                                                                                                                                                                                _latSupply7 = "";
                                                                                                                                                                                                                                                                _latSupply8 = "";
                                                                                                                                                                                                                                                                _latSupply9 = "";
                                                                                                                                                                                                                                                                _latSupplyFinal = "";
                                                                                                                                                                                                                                                                _ammoSupplyFinal = "";
                                                                                                                                                                                                                                                                _stripperValues = "";
                                                                                                                                                                                                                                                                _stripperCommand = "";
                                                                                                                                                                                                                                                                _launcherL = ""; 
                                                                                                                                                                                                                                                                _launcherU = "";
                                                                                                                                                                                                                                                                _uniform = uniformContainer _this;
                                                                                                                                                                                                                                                                _vest = vestContainer _this;
                                                                                                                                                                                                                                                                _backpack = backpackContainer _this;
                                                                                                                                                                                                                                                                weaponLauncher = secondaryWeapon _this; 
                                                                                                                                                                                                                                                                switch (weaponLauncher) do
                                                                                                                                                                                                                                                                {
                                    case "ACE_launch_NLAW_ready_F": {
                                        _launcherL = "ACE_launch_NLAW_ready_F";  _launcherU = "ACE_launch_NLAW_used_F";
                                    };
                                                                                                                                                                                                                                                                                                case "CUP_launch_NLAW_Loaded": {
                                        _launcherL = "CUP_launch_NLAW_Loaded";  _launcherU = "CUP_launch_NLAW_Used";
                                    };
                                                                                                                                                                                                                                                                                                case "CUP_launch_M72A6_Special_Loaded": {
                                        _launcherL = "CUP_launch_M72A6_Special_Loaded";  _launcherU = "CUP_launch_M72A6_Special_Used";
                                    };
                                                                                                                                                                                                                                                                                                case "CUP_launch_M72A6_Loaded": {
                                        _launcherL = "CUP_launch_M72A6_Loaded";  _launcherU = "CUP_launch_M72A6_Used";
                                    };
                                                                                                                                                                                                                                                                                                case "CUP_launch_M136_Loaded": {
                                        _launcherL = "CUP_launch_M136_Loaded";  _launcherU = "CUP_launch_M136_Used";
                                    };
                                                                                                                                                                                                                                                                                                case "CUP_launch_Igla_Loaded": {
                                        _launcherL = "CUP_launch_Igla_Loaded";  _launcherU = "CUP_launch_Igla_Used";
                                    };
                                                                                                                                                                                                                                                                                                case "CUP_launch_9K32Strela_Loaded": {
                                        _launcherL = "CUP_launch_9K32Strela_Loaded";  _launcherU = "CUP_launch_9K32Strela_Used";
                                    };
                                                                                                                                                                                                                                                                                                case "CUP_launch_FIM92Stinger_Loaded": {
                                        _launcherL = "CUP_launch_FIM92Stinger_Loaded";  _launcherU = "CUP_launch_FIM92Stinger_Used";
                                    };      
                                                                                                                                                                                                                                                                                                case "CUP_launch_BF3_Loaded": {
                                        _launcherL = "CUP_launch_BF3_Loaded";  _launcherU = "CUP_launch_PzF3_Used";
                                    };
                                                                                                                                                                                                                                                                                                case "CUP_launch_HCPF3_Loaded": {
                                        _launcherL = "CUP_launch_HCPF3_Loaded";  _launcherU = "CUP_launch_PzF3_Used";
                                    };
                                                                                                                                                                                                                                                                                                case "CUP_launch_PzF3_Loaded": {
                                        _launcherL = "CUP_launch_PzF3_Loaded";  _launcherU = "CUP_launch_PzF3_Used";
                                    };
                                                                                                                                                                                                                                                                                                case "CUP_launch_APILAS_Loaded": {
                                        _launcherL = "CUP_launch_APILAS_Loaded";  _launcherU = "CUP_launch_APILAS_Used";
                                    };
                                                                                                                                                                                                                                                                                                case "CUP_launch_RPG26_Loaded": {
                                        _launcherL = "CUP_launch_RPG26_Loaded";  _launcherU = "CUP_launch_RPG26_Used";
                                    };
                                                                                                                                                                                                                                                                                                case "CUP_launch_RPG18_Loaded": {
                                        _launcherL = "CUP_launch_RPG18_Loaded";  _launcherU = "CUP_launch_RPG18_Used";
                                    };
                                                                                                                                                                                                                                                                                                case "CUP_launch_RShG2_Loaded": {
                                        _launcherL = "CUP_launch_RShG2_Loaded";  _launcherU = "CUP_launch_RShG2_Used";
                                    };
                                                                                                                                                                                                                                                                                                case "cwr3_launch_redeye_loaded": {
                                        _launcherL = "cwr3_launch_redeye_loaded";  _launcherU = "cwr3_launch_redeye_used";
                                    };
                                                                                                                                                                                                                                                                                                case "cwr3_launch_m72a3_loaded": {
                                        _launcherL = "cwr3_launch_m72a3_loaded";  _launcherU = "cwr3_launch_m72a3_used";
                                    };
                                                                                                                                                                                                                                                                                                case "cwr3_launch_rpg75_loaded": {
                                        _launcherL = "cwr3_launch_rpg75_loaded";  _launcherU = "cwr3_launch_rpg75_used";
                                    };
                                                                                                                                                                                                                                                                                                case "gm_fim43_oli": {
                                        _launcherL = "gm_fim43_oli";  _launcherU = "gm_fim43_spent_oli";
                                    };
                                                                                                                                                                                                                                                                                                case "gm_m72a3_oli": {
                                        _launcherL = "gm_m72a3_oli";  _launcherU = "gm_m72a3_spent_oli";
                                    };
                                                                                                                                                                                                                                                                                                case "gm_9k32m_oli": {
                                        _launcherL = "gm_9k32m_oli";  _launcherU = "gm_9k32m_spent_oli";
                                    };
                                                                                                                                                                                                                                                                                                case "vn_m72": {
                                        _launcherL = "vn_m72";  _launcherU = "vn_m72_used";
                                    };
                                                                                                                                                                                                                                                                                                case "SPE_PzFaust_60m": {
                                        _launcherL = "SPE_PzFaust_60m";  _launcherU = "SPE_PzFaust_60m_used";
                                    };
                                                                                                                                                                                                                                                                                                case "SPE_PzFaust_30m": {
                                        _launcherL = "SPE_PzFaust_30m";  _launcherU = "SPE_PzFaust_30m_used";
                                    };
                                                                                                                                                                                                                                                                                                case "SPE_Faustpatrone": {
                                        _launcherL = "SPE_Faustpatrone";  _launcherU = "SPE_Faustpatrone_used";
                                    };
                                                                                                                                                                                                                                                                                                case "NORTH_fin_panzerfaust30_ready": {
                                        _launcherL = "NORTH_fin_panzerfaust30_ready";  _launcherU = "NORTH_fin_panzerfaust30_used";
                                    };
                                                                                                                                                                                                                                                                                                case "NORTH_fin_panzerfaustKlein_ready": {
                                        _launcherL = "NORTH_fin_panzerfaustKlein_ready";  _launcherU = "NORTH_fin_panzerfaustKlein_used";
                                    };
                                                                                                                                                                                                                                                                                                case "LIB_PzFaust_60m": {
                                        _launcherL = "LIB_PzFaust_60m";  _launcherU = "LIB_PzFaust_60m_used";
                                    };
                                                                                                                                                                                                                                                                                                case "LIB_PzFaust_30m": {
                                        _launcherL = "LIB_PzFaust_30m";  _launcherU = "LIB_PzFaust_30m_used";
                                    };
                                                                                                                                                                                                                                                                                                case "LIB_Faustpatrone": {
                                        _launcherL = "LIB_Faustpatrone";  _launcherU = "LIB_Faustpatrone_used";
                                    };
                                                                                                                                                                                                                                                                                                case "fow_w_pzfaust_60": {
                                        _launcherL = "fow_w_pzfaust_60";  _launcherU = "fow_w_pzfaust_60_used";
                                    };
                                                                                                                                                                                                                                                                                                case "fow_w_pzfaust_30_klein": {
                                        _launcherL = "fow_w_pzfaust_30_klein";  _launcherU = "fow_w_pzfaust_30_klein_used";
                                    };
                                                                                                                                                                                                                                                                                                case "fow_w_pzfaust_30": {
                                        _launcherL = "fow_w_pzfaust_30";  _launcherU = "fow_w_pzfaust_30_used";
                                    };
                                                                                                                                                                                                                                                                                                case "fow_w_pzfaust_100": {
                                        _launcherL = "fow_w_pzfaust_100";  _launcherU = "fow_w_pzfaust_100_used";
                                    };
                                                                                                                                                                                                                                                                                                default {};
                                };
                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                switch (AAF_medSupplyGlobal) do
                                                                                                                                                                                                                                                                {
                                    case "NoReduction": {};
                                                                                                                                                                                                                                                                                                case "Suffocating": 
                                                                                                                                                                                                                                                                                                {
                                        _this removeItems 'FirstAidKit';_this removeItems 'Medikit';
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                                            _this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
                                        };
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                                            _this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
                                        };
                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                                            _this removeItems 'fow_i_fak_ger';_this removeItems 'fow_i_fak_ija';_this removeItems 'fow_i_fak_uk';_this removeItems 'fow_i_fak_us';_this removeItems 'fow_i_fak_us_red';_this removeItems 'CSA38_obvaz';_this removeItems 'SPE_GER_FirstAidKit';_this removeItems 'SPE_US_FirstAidKit';_this removeItems 'SPE_GER_medkit';_this removeItems 'SPE_US_medkit';_this removeItems 'CSA38_medikitWH';
                                        };
                                                                                                                                                                                                                                                                                                                                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply1 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply2 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply3 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply4 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply5 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply6 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply7 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply9 = "";
                                                                                                                                                                                                                                                                                                                                _extramed = "_backpack addItemCargoGlobal ['ACE_fieldDressing', 3];_backpack addItemCargoGlobal ['ACE_elasticBandage', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                                                                                                                                                                                                                                                                                                                                _isMed = _this getUnitTrait "Medic";
                                                                                                                                                                                                                                                                                                                                if (_isMed) then {
                                            _medSupplyFinal = _medSupplyFinal + _extramed
                                        };
                                    };
                                                                                                                                                                                                                                                                                                case "Severe": 
                                                                                                                                                                                                                                                                                                {
                                        _this removeItems 'FirstAidKit';_this removeItems 'Medikit';
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                                            _this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
                                        };
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                                            _this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
                                        };
                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                                            _this removeItems 'fow_i_fak_ger';_this removeItems 'fow_i_fak_ija';_this removeItems 'fow_i_fak_uk';_this removeItems 'fow_i_fak_us';_this removeItems 'fow_i_fak_us_red';_this removeItems 'CSA38_obvaz';_this removeItems 'SPE_GER_FirstAidKit';_this removeItems 'SPE_US_FirstAidKit';_this removeItems 'SPE_GER_medkit';_this removeItems 'SPE_US_medkit';_this removeItems 'CSA38_medikitWH';
                                        };
                                                                                                                                                                                                                                                                                                                                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply1 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply2 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply3 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply4 = "_uniform addItemCargoGlobal ['ACE_tourniquet', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply5 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply6 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply7 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply9 = "";
                                                                                                                                                                                                                                                                                                                                _extramed = "_backpack addItemCargoGlobal ['ACE_fieldDressing', 3];_backpack addItemCargoGlobal ['ACE_elasticBandage', 2];";
                                                                                                                                                                                                                                                                                                                                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                                                                                                                                                                                                                                                                                                                                _isMed = _this getUnitTrait "Medic";
                                                                                                                                                                                                                                                                                                                                if (_isMed) then {
                                            _medSupplyFinal = _medSupplyFinal + _extramed
                                        };
                                    };
                                                                                                                                                                                                                                                                                                case "Significant": 
                                                                                                                                                                                                                                                                                                {
                                        _this removeItems 'FirstAidKit';_this removeItems 'Medikit';
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                                            _this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
                                        };
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                                            _this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
                                        };
                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                                            _this removeItems 'fow_i_fak_ger';_this removeItems 'fow_i_fak_ija';_this removeItems 'fow_i_fak_uk';_this removeItems 'fow_i_fak_us';_this removeItems 'fow_i_fak_us_red';_this removeItems 'CSA38_obvaz';_this removeItems 'SPE_GER_FirstAidKit';_this removeItems 'SPE_US_FirstAidKit';_this removeItems 'SPE_GER_medkit';_this removeItems 'SPE_US_medkit';_this removeItems 'CSA38_medikitWH';
                                        };
                                                                                                                                                                                                                                                                                                                                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply1 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply2 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply3 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply4 = "_uniform addItemCargoGlobal ['ACE_tourniquet', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply5 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply6 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply7 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply9 = "";
                                                                                                                                                                                                                                                                                                                                _extramed = "_backpack addItemCargoGlobal ['ACE_fieldDressing', 5];_backpack addItemCargoGlobal ['ACE_elasticBandage', 2];";
                                                                                                                                                                                                                                                                                                                                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                                                                                                                                                                                                                                                                                                                                _isMed = _this getUnitTrait "Medic";
                                                                                                                                                                                                                                                                                                                                if (_isMed) then {
                                            _medSupplyFinal = _medSupplyFinal + _extramed
                                        };
                                    };
                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                case "Serious": 
                                                                                                                                                                                                                                                                                                {
                                        _this removeItems 'FirstAidKit';_this removeItems 'Medikit';
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                                            _this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
                                        };
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                                            _this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
                                        };
                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                                            _this removeItems 'fow_i_fak_ger';_this removeItems 'fow_i_fak_ija';_this removeItems 'fow_i_fak_uk';_this removeItems 'fow_i_fak_us';_this removeItems 'fow_i_fak_us_red';_this removeItems 'CSA38_obvaz';_this removeItems 'SPE_GER_FirstAidKit';_this removeItems 'SPE_US_FirstAidKit';_this removeItems 'SPE_GER_medkit';_this removeItems 'SPE_US_medkit';_this removeItems 'CSA38_medikitWH';
                                        };
                                                                                                                                                                                                                                                                                                                                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_elasticBandage', 1];_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply1 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply2 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 2];";
                                                                                                                                                                                                                                                                                                                                _medSupply3 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply4 = "_uniform addItemCargoGlobal ['ACE_tourniquet', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply5 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply6 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply7 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];_uniform addItemCargoGlobal ['ACE_tourniquet', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply9 = "";
                                                                                                                                                                                                                                                                                                                                _extramed = "_backpack addItemCargoGlobal ['ACE_fieldDressing', 4];_backpack addItemCargoGlobal ['ACE_elasticBandage', 2];";
                                                                                                                                                                                                                                                                                                                                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                                                                                                                                                                                                                                                                                                                                _isMed = _this getUnitTrait "Medic";
                                                                                                                                                                                                                                                                                                                                if (_isMed) then {
                                            _medSupplyFinal = _medSupplyFinal + _extramed
                                        };
                                    };
                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                case "Slight": 
                                                                                                                                                                                                                                                                                                {
                                        _this removeItems 'FirstAidKit';_this removeItems 'Medikit';
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "gm_core")) then {
                                            _this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
                                        };
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then {
                                            _this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
                                        };
                                                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then {
                                            _this removeItems 'fow_i_fak_ger';_this removeItems 'fow_i_fak_ija';_this removeItems 'fow_i_fak_uk';_this removeItems 'fow_i_fak_us';_this removeItems 'fow_i_fak_us_red';_this removeItems 'CSA38_obvaz';_this removeItems 'SPE_GER_FirstAidKit';_this removeItems 'SPE_US_FirstAidKit';_this removeItems 'SPE_GER_medkit';_this removeItems 'SPE_US_medkit';_this removeItems 'CSA38_medikitWH';
                                        };
                                                                                                                                                                                                                                                                                                                                _medSupply0 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 1];_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply1 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply2 = "_uniform addItemCargoGlobal ['ACE_fieldDressing', 2];";
                                                                                                                                                                                                                                                                                                                                _medSupply3 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply4 = "_uniform addItemCargoGlobal ['ACE_tourniquet', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply5 = "";
                                                                                                                                                                                                                                                                                                                                _medSupply6 = "_uniform addItemCargoGlobal ['ACE_elasticBandage', 2];_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply7 = "_uniform addItemCargoGlobal ['ACE_elasticBandage', 1];_uniform addItemCargoGlobal ['ACE_tourniquet', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply8 = "_uniform addItemCargoGlobal ['ACE_morphine', 1];";
                                                                                                                                                                                                                                                                                                                                _medSupply9 = "";
                                                                                                                                                                                                                                                                                                                                _extramed = "_backpack addItemCargoGlobal ['ACE_bloodIV_250', 1];_backpack addItemCargoGlobal ['ACE_fieldDressing', 5];_backpack addItemCargoGlobal ['ACE_elasticBandage', 2];";
                                                                                                                                                                                                                                                                                                                                _medSupplyFinal = selectRandom [_medSupply0, _medSupply1, _medSupply2, _medSupply3, _medSupply4, _medSupply5, _medSupply6, _medSupply7, _medSupply8, _medSupply9];
                                                                                                                                                                                                                                                                                                                                _isMed = _this getUnitTrait "Medic";
                                                                                                                                                                                                                                                                                                                                if (_isMed) then {
                                            _medSupplyFinal = _medSupplyFinal + _extramed
                                        };
                                    };
                                                                                                                                                                                                                                                                                                default {};
                                };
                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                switch (AAF_latSupplyGlobal) do 
                                                                                                                                                                                                                                                                {
                                    case "NoReduction": {};
                                                                                                                                                                                                                                                                                                case "Suffocating": 
                                                                                                                                                                                                                                                                                                {
                                        _latSupply0 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply1 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply2 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply3 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply4 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply5 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply6 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply7 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply8 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply9 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
                                    };
                                                                                                                                                                                                                                                                                                case "Severe": 
                                                                                                                                                                                                                                                                                                {
                                        _latSupply0 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply1 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply2 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply3 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply4 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply5 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply6 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply7 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply8 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply9 = "";
                                                                                                                                                                                                                                                                                                                                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
                                    };
                                                                                                                                                                                                                                                                                                case "Significant": 
                                                                                                                                                                                                                                                                                                {
                                        _latSupply0 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply1 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply2 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply3 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply4 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply5 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply6 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply7 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply8 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply9 = "";
                                                                                                                                                                                                                                                                                                                                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
                                    };
                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                case "Serious": 
                                                                                                                                                                                                                                                                                                {
                                        _latSupply0 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply1 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply2 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply3 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply4 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply5 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply6 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply7 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply8 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply9 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
                                    };
                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                case "Slight": 
                                                                                                                                                                                                                                                                                                {
                                        _latSupply0 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply1 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply2 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply3 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply4 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply5 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply6 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply7 = "";
                                                                                                                                                                                                                                                                                                                                _latSupply8 = "_this removeWeaponGlobal _launcherL; _this addWeaponGlobal _launcherU;";
                                                                                                                                                                                                                                                                                                                                _latSupply9 = "";
                                                                                                                                                                                                                                                                                                                                _latSupplyFinal = selectRandom [_latSupply0, _latSupply1, _latSupply2, _latSupply3, _latSupply4, _latSupply5, _latSupply6, _latSupply7, _latSupply8, _latSupply9];
                                    };
                                                                                                                                                                                                                                                                                                default {};
                                };
                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                switch (AAF_ammoSupplyGlobal) do
                                                                                                                                                                                                                                                                {
                                    case "NoReduction": {};
                                                                                                                                                                                                                                                                                                case "Suffocating": {
                                        _ammoSupplyFinal = "_this setvehicleammo selectrandom [0.05, 0.08, 0.1, 0.13, 0.15, 0.18];"
                                    };
                                                                                                                                                                                                                                                                                                case "Severe": {
                                        _ammoSupplyFinal = "_this setvehicleammo selectrandom [0.8, 0.11, 0.13, 0.16, 0.19, 0.21];"
                                    };
                                                                                                                                                                                                                                                                                                case "Significant": {
                                        _ammoSupplyFinal = "_this setvehicleammo selectrandom [0.15, 0.18, 0.2, 0.23, 0.25, 0.31];"
                                    };
                                                                                                                                                                                                                                                                                                case "Serious": {
                                        _ammoSupplyFinal = "_this setvehicleammo selectrandom [0.35, 0.38, 0.4, 0.43, 0.45, 0.49];"
                                    };
                                                                                                                                                                                                                                                                                                case "Slight": {
                                        _ammoSupplyFinal = "_this setvehicleammo selectrandom [0.45, 0.48, 0.51, 0.55, 0.58, 0.63];"
                                    };
                                                                                                                                                                                                                                                                                                default {};
                                };
                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                _stripperValues = _ammoSupplyFinal + _latSupplyFinal + _medSupplyFinal;
                                                                                                                                                                                                                                                                _stripperCommand = compile _stripperValues;
                                                                                                                                                                                                                                                                call _stripperCommand;
                            };
                        }
                                                                                                                                                                ];
                };
            };
        }];
    } forEach (allMissionObjects "ModuleCurator_F");
*/
