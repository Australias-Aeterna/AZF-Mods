radioTypes = [
    "ACRE_PRC343",
    "ACRE_PRC152",
    "ACRE_PRC148",
    "ACRE_PRC117F",
    "ACRE_PRC77",
    "ACRE_BF888S",
    "ACRE_SEM70",
    "ACRE_SEM52SL"
];

playerRadios = [];
{
    if ([player, _x] call acre_api_fnc_hasKindOfRadio) then {
        radio = ([_x] call acre_api_fnc_getRadioByType);
        ear = [radio] call acre_api_fnc_getRadioSpatial;
        channel = [radio] call acre_api_fnc_getRadioChannel;
        volume = [radio] call acre_api_fnc_getRadioVolume;
        playerRadios set [_x, [radio, ear, channel, volume]];
    };
} forEach radioTypes;

playerRadioPushToTalk = [] call acre_api_fnc_getMultiPushToTalkAssignment;
playerLocation = getPosASL player;
playerDirection = getDir player;
playerLoadout = getUnitLoadout player;
playerMedical = [player] call ace_medical_fnc_serializeState;

player hideObjectGlobal true;

cutText [" ", "BLACK OUT", 1];
sleep 1;

removeAllWeapons player;
removeBackpack player;
removeVest player;
removeUniform player;
removeAllAssignedItems player;
setPlayerRespawnTime 0;
forceRespawn player;
waitUntil {
	playerRespawnTime == -1
};
_plrCorpse = allDeadMen select {
	_x distance2D _plrLoc < 3
} select 0;
setPlayerRespawnTime 10;
sleep 1;

player setPosASL _plrLoc;
player setDir _plrDir;
player setUnitLoadout _plrGear;
{
	[player, _medState] call ace_medical_fnc_deserializeState;
} call CBA_fnc_directCall;
deleteVehicle _plrCorpse;
player hideObjectGlobal false;
cutText [" ", "BLACK IN", 1];
sleep 1;

{
    radio = playerRadios get _x;
    [player, radio select 0] call acre_api_fnc_giveRadio;
    [radio select 0, radio select 1] call acre_api_fnc_setRadioSpatial;
    [radio select 0, radio select 2] call acre_api_fnc_setRadioChannel;
    [radio select 0, radio select 3] call acre_api_fnc_setRadioVolume;
} forEach radioTypes;

[[playerRadioPushToTalk]] call acre_api_fnc_setMultiPushToTalkAssignment;

// [[PTT343, PTT152, PTT148, PTT117F, PTT77, PTTBF888S, PTTSEM70, PTTSEM52SL]] call acre_api_fnc_setMultiPushToTalkAssignment;
// Radio PTT can change. get/set PTT button with acre_api_fnc_getMultiPushToTalkAssignment / acre_api_fnc_setMultiPushToTalkAssignment
