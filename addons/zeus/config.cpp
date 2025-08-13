#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"azf_common", "zen_main"};
        author = "AZF";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
