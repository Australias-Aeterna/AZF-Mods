/*/////////////////////////////////////////////////////////////////////////////////////////////////
Author: AAF
Description: AAF_Functions post-Init Global
			Runs AFTER objects are initialised
Parameters: none
Returns: nothing
Example: none
*//////////////////////////////////////////////////////////////////////////////////////////////////
missionNamespace getVariable ["aaf_mission", false];//AAF cba mission settings check
if !(aaf_mission) exitwith {};
if (isServer) then {//SERVER //////////////////////////////////////////////////////////////////////
	["Initialize", [true]] call BIS_fnc_dynamicGroups;
	missionNamespace getVariable ["aaf_reducer", false];
	missionNamespace getVariable ["aaf_Blufor_Stripper", false];
	missionNamespace getVariable ["aaf_Opfor_Stripper", false];
	missionNamespace getVariable ["aaf_indie_Stripper", false];
	missionNamespace getVariable ["aaf_civvy_Stripper", false];
//	missionNamespace getVariable ["aaf_Zeusspawned_Stripper", false];
//	missionNamespace getVariable ["AAF_scaredyCatEnabler", false];
	
	if (aaf_reducer) then {
		f_var_reducerAggressiveness = 2;
		_reducer = [30] spawn aaf_fnc_rInit;
	};
	//_aafGrpClean = [] spawn aaf_fnc_grpclean;//empty group cleaner
	{_x deleteGroupWhenEmpty true} forEach allGroups;//group cleaner redux
	_aafaiResupply = [] spawn aaf_fnc_aiResupply;//ai resupply
	{
		_x addEventHandler ["CuratorGroupPlaced", 
		{params ["_curator", "_group"];
		_group deleteGroupWhenEmpty true;
		}];
	} foreach allCurators;  //allCurators seems to not work with all my stuff, not sure if the group delete actually works or not

/* Maybe remoteexec these? Put it outside the isserver? What's the locality of the zeus modules? I always assumed server but might not be
	{	//AI SKILL SETTER FOR ZEUS PLACED UNITS
		_x addEventHandler ["CuratorGroupPlaced", 
			{params ["_curator", "_group"];
				if (aaf_debugmode) then{systemChat "Zeus Group Placed EH Activated"};
				if (side _group == west) then {
				switch (aaf_aiDifficultyB) do {
					case "Editor": {};
					case "Civilian": {{_x setSkill 0}forEach units _group;if (aaf_debugmode) then{systemChat "BLUFOR group placed, 0% Skill"};};
					case "Insurgents": {{_x setSkill 0.25}forEach units _group;if (aaf_debugmode) then{systemChat "BLUFOR group placed, 25% Skill"};};
					case "Regular": {{_x setSkill 0.5}forEach units _group;if (aaf_debugmode) then{systemChat "BLUFOR group placed, 50% Skill"};};
					case "Professional": {{_x setSkill 0.75}forEach units _group;if (aaf_debugmode) then{systemChat "BLUFOR group placed, 75% Skill"};};
					case "SpecialForces": {{_x setSkill 1}forEach units _group;if (aaf_debugmode) then{systemChat "BLUFOR group placed, 100% Skill"};};
				};};
				if (side _group == Independent) then {
				switch (aaf_aiDifficultyI) do {
					case "Editor": {};
					case "Civilian": {{_x setSkill 0}forEach units _group;if (aaf_debugmode) then{systemChat "INDFOR group placed, 0% Skill"};};
					case "Insurgents": {{_x setSkill 0.25}forEach units _group;if (aaf_debugmode) then{systemChat "INDFOR group placed, 25% Skill"};};
					case "Regular": {{_x setSkill 0.5}forEach units _group;if (aaf_debugmode) then{systemChat "INDFOR group placed, 50% Skill"};};
					case "Professional": {{_x setSkill 0.75}forEach units _group;if (aaf_debugmode) then{systemChat "INDFOR group placed, 75% Skill"};};
					case "SpecialForces": {{_x setSkill 1}forEach units _group;if (aaf_debugmode) then{systemChat "INDFOR group placed, 100% Skill"};};
				};};
				if (side _group == east) then {
				switch (aaf_aiDifficultyO) do {
					case "Editor": {};
					case "Civilian": {{_x setSkill 0}forEach units _group;if (aaf_debugmode) then{systemChat "OPFOR group placed, 0% Skill"};};
					case "Insurgents": {{_x setSkill 0.25}forEach units _group;if (aaf_debugmode) then{systemChat "OPFOR group placed, 25% Skill"};};
					case "Regular": {{_x setSkill 0.5}forEach units _group;if (aaf_debugmode) then{systemChat "OPFOR group placed, 50% Skill"};};
					case "Professional": {{_x setSkill 0.75}forEach units _group;if (aaf_debugmode) then{systemChat "OPFOR group placed, 75% Skill"};};
					case "SpecialForces": {{_x setSkill 1}forEach units _group;if (aaf_debugmode) then{systemChat "OPFOR group placed, 100% Skill"};};
				};};
			}
		];
		_x addEventHandler["CuratorObjectPlaced", {  //ZEUS PLACED SINGLE UNITS
			params["_curator","_entity"];  
			if (aaf_debugmode) then{systemChat "Zeus Unit Placed EH Activated"};
			if (_entity isKindOf "LandVehicle") then {  
				_crew = crew _entity;  
				{ 
				if (side _entity == west) then { 
				switch (aaf_aiDifficultyB) do { 
				case "Editor": {}; 
				case "Civilian": {{_x setSkill 0}forEach _crew;if (aaf_debugmode) then{systemChat "BLUFOR unit placed, 0% Skill"};}; 
				case "Insurgents": {{_x setSkill 0.25}forEach _crew;if (aaf_debugmode) then{systemChat "BLUFOR unit placed, 25% Skill"};}; 
				case "Regular": {{_x setSkill 0.5}forEach _crew;if (aaf_debugmode) then{systemChat "BLUFOR unit placed, 50% Skill"};}; 
				case "Professional": {{_x setSkill 0.75}forEach _crew;if (aaf_debugmode) then{systemChat "BLUFOR unit placed, 75% Skill"};}; 
				case "SpecialForces": {{_x setSkill 1}forEach _crew;if (aaf_debugmode) then{systemChat "BLUFOR unit placed, 100% Skill"};}; 
				};}; 
				if (side _entity == Independent) then { 
				switch (aaf_aiDifficultyI) do { 
				case "Editor": {}; 
				case "Civilian": {{_x setSkill 0}forEach _crew;if (aaf_debugmode) then{systemChat "INDFOR unit placed, 0% Skill"};}; 
				case "Insurgents": {{_x setSkill 0.25}forEach _crew;if (aaf_debugmode) then{systemChat "INDFOR unit placed, 25% Skill"};}; 
				case "Regular": {{_x setSkill 0.5}forEach _crew;if (aaf_debugmode) then{systemChat "INDFOR unit placed, 50% Skill"};}; 
				case "Professional": {{_x setSkill 0.75}forEach _crew;if (aaf_debugmode) then{systemChat "INDFOR unit placed, 75% Skill"};}; 
				case "SpecialForces": {{_x setSkill 1}forEach _crew;if (aaf_debugmode) then{systemChat "INDFOR unit placed, 100% Skill"};}; 
				};}; 
				if (side _entity == east) then { 
				switch (aaf_aiDifficultyO) do { 
				case "Editor": {}; 
				case "Civilian": {{_x setSkill 0}forEach _crew;if (aaf_debugmode) then{systemChat "OPFOR unit placed, 0% Skill"};}; 
				case "Insurgents": {{_x setSkill 0.25}forEach _crew;if (aaf_debugmode) then{systemChat "OPFOR unit placed, 25% Skill"};}; 
				case "Regular": {{_x setSkill 0.5}forEach _crew;if (aaf_debugmode) then{systemChat "OPFOR unit placed, 50% Skill"};}; 
				case "Professional": {{_x setSkill 0.75}forEach _crew;if (aaf_debugmode) then{systemChat "OPFOR unit placed, 75% Skill"};}; 
				case "SpecialForces": {{_x setSkill 1}forEach _crew;if (aaf_debugmode) then{systemChat "OPFOR unit placed, 100% Skill"};}; 
				};};} forEach _crew; 
			}
			else  
			{ 
				if (side _entity == west) then { 
				switch (aaf_aiDifficultyB) do { 
				case "Editor": {}; 
				case "Civilian": {_entity setSkill 0;if (aaf_debugmode) then{systemChat "BLUFOR unit placed, 0% Skill"};}; 
				case "Insurgents": {_entity setSkill 0.25;if (aaf_debugmode) then{systemChat "BLUFOR unit placed, 25% Skill"};}; 
				case "Regular": {_entity setSkill 0.5;if (aaf_debugmode) then{systemChat "BLUFOR unit placed, 50% Skill"};}; 
				case "Professional": {_entity setSkill 0.75;if (aaf_debugmode) then{systemChat "BLUFOR unit placed, 75% Skill"};}; 
				case "SpecialForces": {_entity setSkill 1;if (aaf_debugmode) then{systemChat "BLUFOR unit placed, 100% Skill"};}; 
				};}; 
				if (side _entity == Independent) then { 
				switch (aaf_aiDifficultyI) do { 
				case "Editor": {}; 
				case "Civilian": {_entity setSkill 0;if (aaf_debugmode) then{systemChat "INDFOR unit placed, 0% Skill"};}; 
				case "Insurgents": {_entity setSkill 0.25;if (aaf_debugmode) then{systemChat "INDFOR unit placed, 25% Skill"};}; 
				case "Regular": {_entity setSkill 0.5;if (aaf_debugmode) then{systemChat "INDFOR unit placed, 50% Skill"};}; 
				case "Professional": {_entity setSkill 0.75;if (aaf_debugmode) then{systemChat "INDFOR unit placed, 75% Skill"};}; 
				case "SpecialForces": {_entity setSkill 1;if (aaf_debugmode) then{systemChat "INDFOR unit placed, 100% Skill"};}; 
				};}; 
				if (side _entity == east) then { 
				switch (aaf_aiDifficultyO) do { 
				case "Editor": {}; 
				case "Civilian": {_entity setSkill 0;if (aaf_debugmode) then{systemChat "OPFOR unit placed, 0% Skill"};}; 
				case "Insurgents": {_entity setSkill 0.25;if (aaf_debugmode) then{systemChat "OPFOR unit placed, 25% Skill"};}; 
				case "Regular": {_entity setSkill 0.5;if (aaf_debugmode) then{systemChat "OPFOR unit placed, 50% Skill"};}; 
				case "Professional": {_entity setSkill 0.75;if (aaf_debugmode) then{systemChat "OPFOR unit placed, 75% Skill"};}; 
				case "SpecialForces": {_entity setSkill 1;if (aaf_debugmode) then{systemChat "OPFOR unit placed, 100% Skill"};}; 
				};}; 
			};
		}];
	} foreach (allMissionObjects "ModuleCurator_F");
*/
	[] spawn aaf_fnc_gearStripper;//Apply gear stripper EH to editor placed units
/* Whatever solution I find to the skill setter (and I fucking WILL find one) will apply here too.
	{
		_x addEventHandler["CuratorObjectPlaced", { 
			params["_curator","_entity"]; 
			if (aaf_Zeusspawned_Stripper) exitwith {};
			if (aaf_debugmode) then{systemChat "Zeus Gear Stripper EH Activated"};
			if (side _entity in selectedfactions) then {
			if (_entity isKindOf "LandVehicle") then { 
				_crew = crew _entity; 
				{ 
				_x addEventHandler [
				"Killed", {params["_killed","_killer","_instigator"];(_this select 0) spawn { 
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
								case "ACE_launch_NLAW_ready_F": {_launcherL = "ACE_launch_NLAW_ready_F";  _launcherU = "ACE_launch_NLAW_used_F";};
								case "CUP_launch_NLAW_Loaded": {_launcherL = "CUP_launch_NLAW_Loaded";  _launcherU = "CUP_launch_NLAW_Used";};
								case "CUP_launch_M72A6_Special_Loaded": {_launcherL = "CUP_launch_M72A6_Special_Loaded";  _launcherU = "CUP_launch_M72A6_Special_Used";};
								case "CUP_launch_M72A6_Loaded": {_launcherL = "CUP_launch_M72A6_Loaded";  _launcherU = "CUP_launch_M72A6_Used";};
								case "CUP_launch_M136_Loaded": {_launcherL = "CUP_launch_M136_Loaded";  _launcherU = "CUP_launch_M136_Used";};
								case "CUP_launch_Igla_Loaded": {_launcherL = "CUP_launch_Igla_Loaded";  _launcherU = "CUP_launch_Igla_Used";};
								case "CUP_launch_9K32Strela_Loaded": {_launcherL = "CUP_launch_9K32Strela_Loaded";  _launcherU = "CUP_launch_9K32Strela_Used";};
								case "CUP_launch_FIM92Stinger_Loaded": {_launcherL = "CUP_launch_FIM92Stinger_Loaded";  _launcherU = "CUP_launch_FIM92Stinger_Used";};      
								case "CUP_launch_BF3_Loaded": {_launcherL = "CUP_launch_BF3_Loaded";  _launcherU = "CUP_launch_PzF3_Used";};
								case "CUP_launch_HCPF3_Loaded": {_launcherL = "CUP_launch_HCPF3_Loaded";  _launcherU = "CUP_launch_PzF3_Used";};
								case "CUP_launch_PzF3_Loaded": {_launcherL = "CUP_launch_PzF3_Loaded";  _launcherU = "CUP_launch_PzF3_Used";};
								case "CUP_launch_APILAS_Loaded": {_launcherL = "CUP_launch_APILAS_Loaded";  _launcherU = "CUP_launch_APILAS_Used";};
								case "CUP_launch_RPG26_Loaded": {_launcherL = "CUP_launch_RPG26_Loaded";  _launcherU = "CUP_launch_RPG26_Used";};
								case "CUP_launch_RPG18_Loaded": {_launcherL = "CUP_launch_RPG18_Loaded";  _launcherU = "CUP_launch_RPG18_Used";};
								case "CUP_launch_RShG2_Loaded": {_launcherL = "CUP_launch_RShG2_Loaded";  _launcherU = "CUP_launch_RShG2_Used";};
								case "cwr3_launch_redeye_loaded": {_launcherL = "cwr3_launch_redeye_loaded";  _launcherU = "cwr3_launch_redeye_used";};
								case "cwr3_launch_m72a3_loaded": {_launcherL = "cwr3_launch_m72a3_loaded";  _launcherU = "cwr3_launch_m72a3_used";};
								case "cwr3_launch_rpg75_loaded": {_launcherL = "cwr3_launch_rpg75_loaded";  _launcherU = "cwr3_launch_rpg75_used";};
								case "gm_fim43_oli": {_launcherL = "gm_fim43_oli";  _launcherU = "gm_fim43_spent_oli";};
								case "gm_m72a3_oli": {_launcherL = "gm_m72a3_oli";  _launcherU = "gm_m72a3_spent_oli";};
								case "gm_9k32m_oli": {_launcherL = "gm_9k32m_oli";  _launcherU = "gm_9k32m_spent_oli";};
								case "vn_m72": {_launcherL = "vn_m72";  _launcherU = "vn_m72_used";};
								case "SPE_PzFaust_60m": {_launcherL = "SPE_PzFaust_60m";  _launcherU = "SPE_PzFaust_60m_used";};
								case "SPE_PzFaust_30m": {_launcherL = "SPE_PzFaust_30m";  _launcherU = "SPE_PzFaust_30m_used";};
								case "SPE_Faustpatrone": {_launcherL = "SPE_Faustpatrone";  _launcherU = "SPE_Faustpatrone_used";};
								case "NORTH_fin_panzerfaust30_ready": {_launcherL = "NORTH_fin_panzerfaust30_ready";  _launcherU = "NORTH_fin_panzerfaust30_used";};
								case "NORTH_fin_panzerfaustKlein_ready": {_launcherL = "NORTH_fin_panzerfaustKlein_ready";  _launcherU = "NORTH_fin_panzerfaustKlein_used";};
								case "LIB_PzFaust_60m": {_launcherL = "LIB_PzFaust_60m";  _launcherU = "LIB_PzFaust_60m_used";};
								case "LIB_PzFaust_30m": {_launcherL = "LIB_PzFaust_30m";  _launcherU = "LIB_PzFaust_30m_used";};
								case "LIB_Faustpatrone": {_launcherL = "LIB_Faustpatrone";  _launcherU = "LIB_Faustpatrone_used";};
								case "fow_w_pzfaust_60": {_launcherL = "fow_w_pzfaust_60";  _launcherU = "fow_w_pzfaust_60_used";};
								case "fow_w_pzfaust_30_klein": {_launcherL = "fow_w_pzfaust_30_klein";  _launcherU = "fow_w_pzfaust_30_klein_used";};
								case "fow_w_pzfaust_30": {_launcherL = "fow_w_pzfaust_30";  _launcherU = "fow_w_pzfaust_30_used";};
								case "fow_w_pzfaust_100": {_launcherL = "fow_w_pzfaust_100";  _launcherU = "fow_w_pzfaust_100_used";};
								default {};
							};
							switch (AAF_medSupplyGlobal) do 
							{
								case "NoReduction": {};
								case "Suffocating": 
								{
									_this removeItems 'FirstAidKit';_this removeItems 'Medikit';
									if (isClass(configfile >> "CfgPatches" >> "gm_core")) then 
									{
									_this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
									};
									if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then 
									{
									_this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
									};

									if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then 
									{
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
									_medSupplyFinal = selectrandom [_medSupply0,_medSupply1,_medSupply2,_medSupply3,_medSupply4,_medSupply5,_medSupply6,_medSupply7,_medSupply8,_medSupply9];
									_isMed = _this getUnitTrait "Medic";
									if (_isMed) then {_medSupplyFinal = _medSupplyFinal + _extramed};
								};
								case "Severe": 
								{
									_this removeItems 'FirstAidKit';_this removeItems 'Medikit';
									if (isClass(configfile >> "CfgPatches" >> "gm_core")) then 
									{
									_this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
									};
									if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then 
									{
									_this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
									};

									if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then 
									{
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
									_medSupplyFinal = selectrandom [_medSupply0,_medSupply1,_medSupply2,_medSupply3,_medSupply4,_medSupply5,_medSupply6,_medSupply7,_medSupply8,_medSupply9];
									_isMed = _this getUnitTrait "Medic";
									if (_isMed) then {_medSupplyFinal = _medSupplyFinal + _extramed};
								};
								case "Significant": 
								{
									_this removeItems 'FirstAidKit';_this removeItems 'Medikit';
									if (isClass(configfile >> "CfgPatches" >> "gm_core")) then 
									{
									_this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
									};
									if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then 
									{
									_this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
									};

									if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then 
									{
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
									_medSupplyFinal = selectrandom [_medSupply0,_medSupply1,_medSupply2,_medSupply3,_medSupply4,_medSupply5,_medSupply6,_medSupply7,_medSupply8,_medSupply9];
									_isMed = _this getUnitTrait "Medic";
									if (_isMed) then {_medSupplyFinal = _medSupplyFinal + _extramed};
								};

								case "Serious": 
								{
									_this removeItems 'FirstAidKit';_this removeItems 'Medikit';
									if (isClass(configfile >> "CfgPatches" >> "gm_core")) then 
									{
									_this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
									};
									if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then 
									{
									_this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
									};

									if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then 
									{
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
									_medSupplyFinal = selectrandom [_medSupply0,_medSupply1,_medSupply2,_medSupply3,_medSupply4,_medSupply5,_medSupply6,_medSupply7,_medSupply8,_medSupply9];
									_isMed = _this getUnitTrait "Medic";
									if (_isMed) then {_medSupplyFinal = _medSupplyFinal + _extramed};
								};

								case "Slight": 
								{
									_this removeItems 'FirstAidKit';_this removeItems 'Medikit';
									if (isClass(configfile >> "CfgPatches" >> "gm_core")) then 
									{
									_this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
									};
									if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then 
									{
									_this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
									};

									if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then 
									{
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
									_medSupplyFinal = selectrandom [_medSupply0,_medSupply1,_medSupply2,_medSupply3,_medSupply4,_medSupply5,_medSupply6,_medSupply7,_medSupply8,_medSupply9];
									_isMed = _this getUnitTrait "Medic";
									if (_isMed) then {_medSupplyFinal = _medSupplyFinal + _extramed};
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
									_latSupplyFinal = selectrandom [_latSupply0,_latSupply1,_latSupply2,_latSupply3,_latSupply4,_latSupply5,_latSupply6,_latSupply7,_latSupply8,_latSupply9];
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
									_latSupplyFinal = selectrandom [_latSupply0,_latSupply1,_latSupply2,_latSupply3,_latSupply4,_latSupply5,_latSupply6,_latSupply7,_latSupply8,_latSupply9];
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
									_latSupplyFinal = selectrandom [_latSupply0,_latSupply1,_latSupply2,_latSupply3,_latSupply4,_latSupply5,_latSupply6,_latSupply7,_latSupply8,_latSupply9];
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
									_latSupplyFinal = selectrandom [_latSupply0,_latSupply1,_latSupply2,_latSupply3,_latSupply4,_latSupply5,_latSupply6,_latSupply7,_latSupply8,_latSupply9];
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
									_latSupplyFinal = selectrandom [_latSupply0,_latSupply1,_latSupply2,_latSupply3,_latSupply4,_latSupply5,_latSupply6,_latSupply7,_latSupply8,_latSupply9];
								};
								default {};
							};
							switch (AAF_ammoSupplyGlobal) do
							{
								case "NoReduction": {};
								case "Suffocating": {_ammoSupplyFinal = "_this setvehicleammo selectrandom [0.05,0.08,0.1,0.13,0.15,0.18];"};
								case "Severe": {_ammoSupplyFinal = "_this setvehicleammo selectrandom [0.8,0.11,0.13,0.16,0.19,0.21];"};
								case "Significant": {_ammoSupplyFinal = "_this setvehicleammo selectrandom [0.15,0.18,0.2,0.23,0.25,0.31];"};
								case "Serious": {_ammoSupplyFinal = "_this setvehicleammo selectrandom [0.35,0.38,0.4,0.43,0.45,0.49];"};
								case "Slight": {_ammoSupplyFinal = "_this setvehicleammo selectrandom [0.45,0.48,0.51,0.55,0.58,0.63];"};
								default {};
							};
						_stripperValues = _ammoSupplyFinal + _latSupplyFinal + _medSupplyFinal;
						_stripperCommand = compile _stripperValues;
						call _stripperCommand;
					};
				}
			];
			} forEach _crew;
			} else 
			{ 
			_entity addEventHandler [
				"Killed", {params["_killed","_killer","_instigator"];(_this select 0) spawn {
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
					case "ACE_launch_NLAW_ready_F": {_launcherL = "ACE_launch_NLAW_ready_F";  _launcherU = "ACE_launch_NLAW_used_F";};
					case "CUP_launch_NLAW_Loaded": {_launcherL = "CUP_launch_NLAW_Loaded";  _launcherU = "CUP_launch_NLAW_Used";};
					case "CUP_launch_M72A6_Special_Loaded": {_launcherL = "CUP_launch_M72A6_Special_Loaded";  _launcherU = "CUP_launch_M72A6_Special_Used";};
					case "CUP_launch_M72A6_Loaded": {_launcherL = "CUP_launch_M72A6_Loaded";  _launcherU = "CUP_launch_M72A6_Used";};
					case "CUP_launch_M136_Loaded": {_launcherL = "CUP_launch_M136_Loaded";  _launcherU = "CUP_launch_M136_Used";};
					case "CUP_launch_Igla_Loaded": {_launcherL = "CUP_launch_Igla_Loaded";  _launcherU = "CUP_launch_Igla_Used";};
					case "CUP_launch_9K32Strela_Loaded": {_launcherL = "CUP_launch_9K32Strela_Loaded";  _launcherU = "CUP_launch_9K32Strela_Used";};
					case "CUP_launch_FIM92Stinger_Loaded": {_launcherL = "CUP_launch_FIM92Stinger_Loaded";  _launcherU = "CUP_launch_FIM92Stinger_Used";};      
					case "CUP_launch_BF3_Loaded": {_launcherL = "CUP_launch_BF3_Loaded";  _launcherU = "CUP_launch_PzF3_Used";};
					case "CUP_launch_HCPF3_Loaded": {_launcherL = "CUP_launch_HCPF3_Loaded";  _launcherU = "CUP_launch_PzF3_Used";};
					case "CUP_launch_PzF3_Loaded": {_launcherL = "CUP_launch_PzF3_Loaded";  _launcherU = "CUP_launch_PzF3_Used";};
					case "CUP_launch_APILAS_Loaded": {_launcherL = "CUP_launch_APILAS_Loaded";  _launcherU = "CUP_launch_APILAS_Used";};
					case "CUP_launch_RPG26_Loaded": {_launcherL = "CUP_launch_RPG26_Loaded";  _launcherU = "CUP_launch_RPG26_Used";};
					case "CUP_launch_RPG18_Loaded": {_launcherL = "CUP_launch_RPG18_Loaded";  _launcherU = "CUP_launch_RPG18_Used";};
					case "CUP_launch_RShG2_Loaded": {_launcherL = "CUP_launch_RShG2_Loaded";  _launcherU = "CUP_launch_RShG2_Used";};
					case "cwr3_launch_redeye_loaded": {_launcherL = "cwr3_launch_redeye_loaded";  _launcherU = "cwr3_launch_redeye_used";};
					case "cwr3_launch_m72a3_loaded": {_launcherL = "cwr3_launch_m72a3_loaded";  _launcherU = "cwr3_launch_m72a3_used";};
					case "cwr3_launch_rpg75_loaded": {_launcherL = "cwr3_launch_rpg75_loaded";  _launcherU = "cwr3_launch_rpg75_used";};
					case "gm_fim43_oli": {_launcherL = "gm_fim43_oli";  _launcherU = "gm_fim43_spent_oli";};
					case "gm_m72a3_oli": {_launcherL = "gm_m72a3_oli";  _launcherU = "gm_m72a3_spent_oli";};
					case "gm_9k32m_oli": {_launcherL = "gm_9k32m_oli";  _launcherU = "gm_9k32m_spent_oli";};
					case "vn_m72": {_launcherL = "vn_m72";  _launcherU = "vn_m72_used";};
					case "SPE_PzFaust_60m": {_launcherL = "SPE_PzFaust_60m";  _launcherU = "SPE_PzFaust_60m_used";};
					case "SPE_PzFaust_30m": {_launcherL = "SPE_PzFaust_30m";  _launcherU = "SPE_PzFaust_30m_used";};
					case "SPE_Faustpatrone": {_launcherL = "SPE_Faustpatrone";  _launcherU = "SPE_Faustpatrone_used";};
					case "NORTH_fin_panzerfaust30_ready": {_launcherL = "NORTH_fin_panzerfaust30_ready";  _launcherU = "NORTH_fin_panzerfaust30_used";};
					case "NORTH_fin_panzerfaustKlein_ready": {_launcherL = "NORTH_fin_panzerfaustKlein_ready";  _launcherU = "NORTH_fin_panzerfaustKlein_used";};
					case "LIB_PzFaust_60m": {_launcherL = "LIB_PzFaust_60m";  _launcherU = "LIB_PzFaust_60m_used";};
					case "LIB_PzFaust_30m": {_launcherL = "LIB_PzFaust_30m";  _launcherU = "LIB_PzFaust_30m_used";};
					case "LIB_Faustpatrone": {_launcherL = "LIB_Faustpatrone";  _launcherU = "LIB_Faustpatrone_used";};
					case "fow_w_pzfaust_60": {_launcherL = "fow_w_pzfaust_60";  _launcherU = "fow_w_pzfaust_60_used";};
					case "fow_w_pzfaust_30_klein": {_launcherL = "fow_w_pzfaust_30_klein";  _launcherU = "fow_w_pzfaust_30_klein_used";};
					case "fow_w_pzfaust_30": {_launcherL = "fow_w_pzfaust_30";  _launcherU = "fow_w_pzfaust_30_used";};
					case "fow_w_pzfaust_100": {_launcherL = "fow_w_pzfaust_100";  _launcherU = "fow_w_pzfaust_100_used";};
					default {};
				};
				switch (AAF_medSupplyGlobal) do
				{
					case "NoReduction": {};
					case "Suffocating": 
					{
						_this removeItems 'FirstAidKit';_this removeItems 'Medikit';
						if (isClass(configfile >> "CfgPatches" >> "gm_core")) then 
						{
						_this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
						};
						if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then 
						{
						_this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
						};

						if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then 
						{
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
						_medSupplyFinal = selectrandom [_medSupply0,_medSupply1,_medSupply2,_medSupply3,_medSupply4,_medSupply5,_medSupply6,_medSupply7,_medSupply8,_medSupply9];
						_isMed = _this getUnitTrait "Medic";
						if (_isMed) then {_medSupplyFinal = _medSupplyFinal + _extramed};
					};
					case "Severe": 
					{
						_this removeItems 'FirstAidKit';_this removeItems 'Medikit';
						if (isClass(configfile >> "CfgPatches" >> "gm_core")) then 
						{
						_this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
						};
						if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then 
						{
						_this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
						};

						if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then 
						{
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
						_medSupplyFinal = selectrandom [_medSupply0,_medSupply1,_medSupply2,_medSupply3,_medSupply4,_medSupply5,_medSupply6,_medSupply7,_medSupply8,_medSupply9];
						_isMed = _this getUnitTrait "Medic";
						if (_isMed) then {_medSupplyFinal = _medSupplyFinal + _extramed};
					};
					case "Significant": 
					{
						_this removeItems 'FirstAidKit';_this removeItems 'Medikit';
						if (isClass(configfile >> "CfgPatches" >> "gm_core")) then 
						{
						_this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
						};
						if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then 
						{
						_this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
						};

						if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then 
						{
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
						_medSupplyFinal = selectrandom [_medSupply0,_medSupply1,_medSupply2,_medSupply3,_medSupply4,_medSupply5,_medSupply6,_medSupply7,_medSupply8,_medSupply9];
						_isMed = _this getUnitTrait "Medic";
						if (_isMed) then {_medSupplyFinal = _medSupplyFinal + _extramed};
					};

					case "Serious": 
					{
						_this removeItems 'FirstAidKit';_this removeItems 'Medikit';
						if (isClass(configfile >> "CfgPatches" >> "gm_core")) then 
						{
						_this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
						};
						if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then 
						{
						_this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
						};

						if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then 
						{
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
						_medSupplyFinal = selectrandom [_medSupply0,_medSupply1,_medSupply2,_medSupply3,_medSupply4,_medSupply5,_medSupply6,_medSupply7,_medSupply8,_medSupply9];
						_isMed = _this getUnitTrait "Medic";
						if (_isMed) then {_medSupplyFinal = _medSupplyFinal + _extramed};
					};

					case "Slight": 
					{
						_this removeItems 'FirstAidKit';_this removeItems 'Medikit';
						if (isClass(configfile >> "CfgPatches" >> "gm_core")) then 
						{
						_this removeItems 'gm_ge_army_burnBandage';_this removeItems 'gm_gc_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeBandage';_this removeItems 'gm_ge_army_gauzeCompress';_this removeItems 'gm_gc_army_medbox';_this removeItems 'gm_ge_army_medkit_80';_this removeItems 'gm_gc_army_medkit';_this removeItems 'gm_ge_firstaidkit_vehicle';_this removeItems 'gm_gc_firstaidkit_vehicle';_this removeItems 'gm_ge_army_firstaidkit_vehicle';
						};
						if (isClass(configfile >> "CfgPatches" >> "data_f_vietnam")) then 
						{
						_this removeItems 'vn_b_item_medikit_01';_this removeItems 'vn_o_item_firstaidkit';_this removeItems 'vn_b_item_firstaidkit';
						};

						if (isClass(configfile >> "CfgPatches" >> "ww2_spe_core_c_core_c")) then 
						{
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
						_medSupplyFinal = selectrandom [_medSupply0,_medSupply1,_medSupply2,_medSupply3,_medSupply4,_medSupply5,_medSupply6,_medSupply7,_medSupply8,_medSupply9];
						_isMed = _this getUnitTrait "Medic";
						if (_isMed) then {_medSupplyFinal = _medSupplyFinal + _extramed};
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
						_latSupplyFinal = selectrandom [_latSupply0,_latSupply1,_latSupply2,_latSupply3,_latSupply4,_latSupply5,_latSupply6,_latSupply7,_latSupply8,_latSupply9];
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
						_latSupplyFinal = selectrandom [_latSupply0,_latSupply1,_latSupply2,_latSupply3,_latSupply4,_latSupply5,_latSupply6,_latSupply7,_latSupply8,_latSupply9];
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
						_latSupplyFinal = selectrandom [_latSupply0,_latSupply1,_latSupply2,_latSupply3,_latSupply4,_latSupply5,_latSupply6,_latSupply7,_latSupply8,_latSupply9];
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
						_latSupplyFinal = selectrandom [_latSupply0,_latSupply1,_latSupply2,_latSupply3,_latSupply4,_latSupply5,_latSupply6,_latSupply7,_latSupply8,_latSupply9];
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
						_latSupplyFinal = selectrandom [_latSupply0,_latSupply1,_latSupply2,_latSupply3,_latSupply4,_latSupply5,_latSupply6,_latSupply7,_latSupply8,_latSupply9];
					};
					default {};
				};
				switch (AAF_ammoSupplyGlobal) do
				{
					case "NoReduction": {};
					case "Suffocating": {_ammoSupplyFinal = "_this setvehicleammo selectrandom [0.05,0.08,0.1,0.13,0.15,0.18];"};
					case "Severe": {_ammoSupplyFinal = "_this setvehicleammo selectrandom [0.8,0.11,0.13,0.16,0.19,0.21];"};
					case "Significant": {_ammoSupplyFinal = "_this setvehicleammo selectrandom [0.15,0.18,0.2,0.23,0.25,0.31];"};
					case "Serious": {_ammoSupplyFinal = "_this setvehicleammo selectrandom [0.35,0.38,0.4,0.43,0.45,0.49];"};
					case "Slight": {_ammoSupplyFinal = "_this setvehicleammo selectrandom [0.45,0.48,0.51,0.55,0.58,0.63];"};
					default {};
				};
				_stripperValues = _ammoSupplyFinal + _latSupplyFinal + _medSupplyFinal;
				_stripperCommand = compile _stripperValues;
				call _stripperCommand; 
				};
			}]; 
			}; 
		};}];
	} forEach (allMissionObjects "ModuleCurator_F");

	if (AAF_scaredyCatEnabler) then {
		[] spawn aaf_fnc_scaredyCatC;
	};
*/

};
if (hasInterface) then {//PLAYER //////////////////////////////////////////////////////////////////
	["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
	missionNamespace getVariable ["aaf_loadout", false];
	player setVariable ["Saved_Loadout", nil];
	if !(aaf_loadout) then { //Alias modified to make checked save the gear on death, unchecked save the gear on spawn. That way there's no 2 player killed EHs fighting if a MM wants gear on death like it'd have been in the template version.
		player setVariable["Saved_Loadout", getUnitLoadout player];
		if (aaf_DebugMode) then {systemchat "I saved ya loadout"};
		player addEventHandler ["respawn",{ player setUnitLoadout (player getVariable["Saved_Loadout",[]]);} ];
	} 
	else 
	{
		// Save player loadout when player dies then re-apply loadout when they respawn
		if (aaf_DebugMode) then {systemchat "I'll save ya loadout when you kick the bucket"};
		player addEventHandler ["Killed", { player setVariable ["AAF_DeathLoadout", getUnitLoadout player]; }];
		player addEventHandler ["Respawn", { private _loadout = player getVariable "AAF_DeathLoadout"; if (!isNil "_loadout") then { removeAllWeapons player;
		removeGoggles player;
		removeHeadgear player;
		removeVest player;
		removeUniform player;
		removeAllAssignedItems player;
		clearAllItemsFromBackpack player;
		removeBackpack player;
		player setUnitLoadout _loadout; }; }];
	};
};
//GLOBAL///////////////////////////////////////////////////////////////////////////////////////////
missionNamespace getvariable ["aaf_intro", false];//Intro Setting check
if (aaf_intro) then { [] spawn aaf_fnc_intro;};

//ALIAS STUFF /////////////////////////////////////////////////////////////////////////////////////////

//	[] spawn aaf_fnc_scaredyCatS;

///////////////////////////////////////////////////////////////////////////////////////////////////////