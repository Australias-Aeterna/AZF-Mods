#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        authors = "AZF";
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main", "azf_main", "ace_medical_treatment", "ace_medical_gui"};
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
#include "ACE_Medical_Treatment.hpp"
#include "gui.hpp"
