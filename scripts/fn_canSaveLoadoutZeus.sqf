// (SERVER) MIKO_fnc_canSaveLoadout
// PARAMS: 
//  _arsenal [object] The arsenal object.
//
// DESCRIPTION: Allows an arsenal to be a save point for players. Runs during the mission.
//      AUTHOR: EMIKO
// LAST UPDATE: 6/27/2023
// 
// FROM ☆HOSTILES☆ WITH LOVE. Vsegda gotov!

params ["_arsenal"];

[_arsenal] remoteExec ["MIKO_fnc_canSaveLoadout", allPlayers - allCurators];