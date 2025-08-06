#define DEBUG_SYNCHRONOUS
#include "\x\cba\addons\main\script_macros_common.hpp"

#undef DFUNC
#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)
#undef QFUNC
#undef QEFUNC
#define QFUNC(var1) QUOTE(DFUNC(var1))
#define QEFUNC(var1,var2) QUOTE(DEFUNC(var1,var2))


#define AZF_SETTINGS "ANZIF Settings"

#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

#define QUADRUPLE(var1,var2,var3,var4) ##var1##_##var2##_##var3##_##var4

// ACE macros
#define ACEGVAR(var1,var2) TRIPLES(ace,var1,var2)
#define QACEGVAR(var1,var2) QUOTE(ACEGVAR(var1,var2))
#define ACEFUNC(var1,var2) QUADRUPLE(ace,var1,fnc,var2)
#define QACEFUNC(var1,var2) QUOTE(ACEFUNC(var1,var2))
#define ACELSTRING(var1,var2) QUOTE(TRIPLES(STR,DOUBLES(ace,var1),var2))
#define ACEPATHTOF(var1, var2) PATHTOF_SYS(z,var1,var2)
#define ACEQPATHTOF(var1, var2) QUOTE(ACEPATHOF(var1, var2))
#define ACELINKFUNC(var1,var2) {_this call ACEFUNC(var1,var2)}

