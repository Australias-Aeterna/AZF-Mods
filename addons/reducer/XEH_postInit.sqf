#include "script_component.hpp"

if (!hasInterface) exitWith {};//Disable server and headless running

//CBA KEYBINDINGS /////////////////////////////////////////////////////////////////////////////////
/*
[//Hide HUD keybind
	"azf Extras",
	"azf_HideHud",
	"Hide HUD",
	{
		[] call azf_fnc_hideHUDkeybind;
	},
	{},
	[0x44,[false, false, false]],
	false,
	0,
	true
] call CBA_fnc_addKeybind;
*/

/*
[	"azf Extras", //Mod name
	"azf_HideHud", //action ID
	"Hide HUD", //Display name
	{
		[] call azf_fnc_hideHUDkeybind;
	}, //downcode
	{},//upcode
	[0x44,[false, false, false]], //default keybind in DIK code
	false, //Fire while being held
	0, //Delay in seconds
	true //overwrite key
] call CBA_fnc_addKeybind;
*/
