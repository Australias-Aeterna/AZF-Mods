#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
		name = COMPONENT_NAME;
		author = "AZF";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"cba_main"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
	};
};


#include "CfgEventHandlers.hpp"
#include "cfgDifficultyPresets.hpp" //New custom preset
