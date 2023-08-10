// (LOCAL) MIKO_fnc_canSaveLoadout
// PARAMS: 
//  _arsenal [object] The arsenal object.
//
// DESCRIPTION: Allows an arsenal to be a save point for players.
//      AUTHOR: EMIKO
// LAST UPDATE: 6/28/2023
// 
// FROM ☆HOSTILES☆ WITH LOVE. Vsegda gotov!

// Don't know why, but it will only work with the selector. Trying to set it to params breaks it.  
// I am not interested in trying to figure out why, either. 
private _arsenal = (_this select 0);

_arsenal addAction
[
	"<t color='#FFFF00'>Save Loadout</t>",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_unitLoadout = getUnitLoadout _caller;
		_caller setVariable ["MIKO_SAVED_LOADOUT", _unitLoadout, true];
		"Loadout Saved!" remoteExec ["hint", _caller];
	},
	nil,
	50,
	true,
	false,
	"",
	"_target distance _this < 4",
	4
];