#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
		name = COMPONENT_NAME;
		authors = "AZF";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"cba_main", "azf_main", "ace_medical_treatment"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
	};
};


#include "CfgEventHandlers.hpp"
#include "ACE_Medical_Treatment.hpp"
