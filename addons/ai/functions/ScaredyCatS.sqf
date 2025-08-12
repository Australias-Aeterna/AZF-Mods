params ["_trg"];
hasSurrendered = _trg getVariable ["hasSurrendered",false];
if !(hasSurrendered) exitWith {
_trg setVariable ["hasSurrendered", true, true];
[_trg] joinSilent grpNull; //To stop them trying to respond to or issue orders, limited numbers of scaredycats should keep excess groups low
_trg setBehaviour "CARELESS";
_trg disableAI "TARGET"; _trg disableAI "WEAPONAIM"; //Probably unneeded with careless but just making sure.
_trg directSay "SentHoldFireInCombat";
sleep 1;
_baddyguns = weapons _trg;
_baddydrop = createvehicle [ "weaponholdersimulated",[(getPos _trg select 0), getpos _trg select 1,(getPos _trg select 2)],[], 0, "NONE"]; 
_baddydrop setPosATL [(getPosATL _trg select 0), (getPosATL _trg select 1)+1, (getPosATL _trg select 2)+1.5];
{_baddydrop addWeaponCargoGlobal [_x,1]} forEach _baddyguns; 
_baddydrop setVelocity [0, 0.75, 0];
removeAllWeapons _trg; 
sleep 1; 
[_trg, true] call ACE_captives_fnc_setSurrendered;
};

/*
_this joinSilent grpNull; //To stop them trying to respond to or issue orders, limited numbers of scaredycats should keep excess groups low
_this setBehaviour "CARELESS";
_this disableAI "TARGET"; _this disableAI "WEAPONAIM"; //Probably unneeded with careless but just making sure.
_this directSay "SentHoldFireInCombat";
sleep 1;
_baddyguns = 1;
_baddydrop = createvehicle [ "weaponholdersimulated",[(getPos _this select 0), getpos _this select 1,(getPos _this select 2)],[], 0, "NONE"]; 
{_baddydrop addWeaponCargoGlobal [_x,1]} forEach _baddyguns; 
_baddydrop setVelocity [0, 0, 0];
removeAllWeapons _this; 
sleep 1; 
[_this, true] call ACE_captives_fnc_setSurrendered; 
*/