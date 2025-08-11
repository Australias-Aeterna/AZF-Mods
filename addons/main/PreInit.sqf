/*/////////////////////////////////////////////////////////////////////////////////////////////////
Author: AAF
Description: AAF_Functions Pre-init Client + Server
Parameters: none
Returns: nothing
Example: none
*//////////////////////////////////////////////////////////////////////////////////////////////////
if (hasInterface) then {//Client stuff. Typo fixed because "hasIntreface" isn't a command
	if !(canTriggerDynamicSimulation player) then {
		player triggerDynamicSimulation true;
	};
} else {//Server + HC stuff
	//xxxx
};
