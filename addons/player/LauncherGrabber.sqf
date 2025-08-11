//INTENT: Make a keybind to pick up a launcher within 2.5m to stop arma fuckery when you need a launcher ASAP
_box = nil;
_boxContents = nil;
_weapon = nil;
_holderList = nil;
_holderlist = nearestObjects [player, ["WeaponHolderSimulated","GroundWeaponHolder"], 2.5];
{_boxContents = weaponCargo _x;_weapon = _boxContents select 0;if (_weapon isKindOf ["Launcher", configFile >> "CfgWeapons"]) exitwith {player action ["TakeWeapon", _x, _weapon];}} forEach _holderList;


//([player, _x] call BIS_fnc_isInFrontOf)  //This didn't work but feels like it should. Technically not a problem having them pick up things in a 360 radius since its only 2m anyway but it'd feel neater having it forward only


/*
nearbyboxes = [];
_newLauncher = nil;
_closestLauncher = nil;
_launcherPickup = player nearObjects 5; ["WeaponHolderSimulated"];
_box = (player nearObjects ["WeaponHolderSimulated", 5]) select 0; 
_boxContents = weaponCargo _box;
_weapon = _boxContents select 0;		  
if (_weapon isKindOf ["Launcher", configFile >> "CfgWeapons"]) then {player action ["TakeWeapon", _box, _weapon];}
_holderlist = nearestObjects [player, ["WeaponHolderSimulated"], 5];
{_boxContents = weaponCargo _x;_weapon = _boxContents select 0;if (_weapon isKindOf ["Launcher", configFile >> "CfgWeapons"]) exitwith {player action ["TakeWeapon", _x, _weapon];}} forEach _holderList;
_holderList = player nearObjects 5; ["WeaponHolderSimulated"];
{_boxContents = weaponCargo _x;_weapon = _boxContents select 0;if (_weapon isKindOf ["Launcher", configFile >> "CfgWeapons"]) then {nearbyboxes pushBackUnique _x;}} forEach _holderList;
_closestLauncher = nearestObjects [player, nearbyboxes];
_newLauncher = _closestLauncher select 0;
player action ["TakeWeapon", _closestLauncher, _newLauncher];
*/