#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        author = "AZF";
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main", "zen_main"};
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};


#include "CfgEventHandlers.hpp"
#include "CfgDifficultyPresets.hpp" //New custom preset
#include "CfgAiSkill.hpp" //AI Skill settings

