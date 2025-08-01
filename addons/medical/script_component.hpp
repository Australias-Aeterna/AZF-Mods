#define COMPONENT medical
#define COMPONENT_BEAUTIFIED Medical
#include "\z\AZF\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MAIN
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MAIN
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MAIN
#endif

#include "\z\AZF\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineCommonGrids.inc"

#define POS_X(N) ((N) * GUI_GRID_W + GUI_GRID_CENTER_X)
#define POS_Y(N) ((N) * GUI_GRID_H + GUI_GRID_CENTER_Y)
#define POS_W(N) ((N) * GUI_GRID_W)
#define POS_H(N) ((N) * GUI_GRID_H)

#define IDC_TITLE 1200
#define IDC_NAME 1210
#define IDC_TRIAGE 1300
#define IDC_EXAMINE 1310
#define IDC_BANDAGE 1320
#define IDC_MEDICATION 1330
#define IDC_AIRWAY 1340
#define IDC_ADVANCED 1350
#define IDC_DRAG 1360
#define IDC_TOGGLE 1370
#define IDC_TRIAGE_DIVIDER 1380
#define IDC_TOGGLE_DIVIDER 1390

