#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        author = "AZF";
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"azf_main"};
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};

#include "Cfg3DEN.hpp"
