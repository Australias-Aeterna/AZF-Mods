
if ( aaf_skill) then {
    {[_x, aaf_skillMin, aaf_skillAimMin, aaf_skillMax, aaf_skillAimMax] call BIS_fnc_EXP_camp_setSkill;} forEach [west, independent, east];
};
