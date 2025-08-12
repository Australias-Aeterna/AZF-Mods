//Mabe remoteexec the application of the EH to players? Maybe check if the functions fire for every player (I think they would) and remove the forEach since every player will be running it anyway, just put the if variable check

//Code if scaredycat is ticked in aaf options
{
   SC_CLNT = addMissionEventHandler ["EachFrame",{  //MissionEH used because regular EH doesn't have eachframe 
   private ["_trg"];  
   _trg = cursorObject; 
   _wuss = _trg getVariable ["hasSurrendered", false]; 
   _plrGun = currentWeapon player; 
      if ((_plrGun)!="") then {
         if !(_wuss) then { 
            if (_trg isKindOf "CAManBase") then { 
               if ((player distance _trg) < 11) then {
//               _flashed = _trg getVariable ["ace_grenades_flashReactionDebounce", 0];
//               if (_flashed) > 15 then {_flashfear = selectrandom [1,2,3,4]; switch (_flashfear) do {case 1:{};case 2:{};case 3:{_trg setVariable ["ScaredyCat",1,true]};case 4:{};}};
               _scaredyn = _trg getVariable ["ScaredyCat", 0];  
               _compliancecall=[player] call acre_api_fnc_isSpeaking;
               if (_compliancecall) then { 
               if (_scaredyn==1) then {[_trg] remoteExec ["AAF_fnc_ScaredyCatS", 2, false];};
//                  sleep 1; 
   }}}}}}]
} forEach allPlayers;


//add _trg getVariable ["ace_grenades_flashReactionDebounce", 0] and force scaredycat if over a certain value. Unlikely to have units multiflashed