class CfgVehicles {//ACE Self-Interaction Actions
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class AAF_Actions {
				displayName = "AAF Actions";
				condition = "true";
				exceptions[] = {};
				icon = "\aaf_functions\img\AAF_icon.paa";
				class aaf_afk {//AFK self-interaction
					displayName = "AFK";
					condition = "true";//Condition to show the action
					exceptions[] = {};
					statement = "[] call AAF_fnc_AFK";
					icon = "\a3\ui_f\data\igui\cfg\simpletasks\types\Use_ca.paa";
				};
				class aaf_stuck {//Stuck in a Rock self-interaction
					displayName = "I'm stuck in a rock!";
					condition = "true";
					exceptions[] = {};
					statement = "[] call AAF_fnc_Stuck";
					icon = "\a3\ui_f\data\map\mapcontrol\Rock_CA.paa";
				};
				class aaf_SHBF {//Super Head Bug Fix self-interaction
					displayName = "Super Head Bug Fix™";
					condition = "true";
					exceptions[] = {};
					statement = "[] spawn AAF_fnc_SHBF";//can suspend
					icon = "\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa";
				};
			};
		};
	};
};
