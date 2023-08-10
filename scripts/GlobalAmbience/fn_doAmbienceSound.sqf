// (LOCAL) MIKO_fnc_doAmbienceSound
// PARAMS:
//  _sound [string] The sound to play.
// DESCRIPTION: Play an ambience sound for all players.
//      AUTHOR: EMIKO
// LAST UPDATE: 8/9/2023
// 
// FROM ☆HOSTILES☆ WITH LOVE. Vsegda gotov!

params ["_sound"];
private ["_randomDir", "_randomDist", "_randomHeight"];

_randomDir = random 360;
_randomDist = 70 + (random 30);
_randomHeight = 0.75 + (random 1.5);
_playerPos = getPosASL player;
_randomPos = [_randomDist * (sin _randomDir), _randomDist * (cos _randomDir), _randomHeight];

playSound3D [_sound, -1, false, (_playerPos vectorAdd _randomPos), 5, 1, 300, 0, true];