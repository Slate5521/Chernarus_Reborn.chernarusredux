// (LOCAL) MIKO_fnc_getRandomAmbience
// DESCRIPTION: Get a random ambience sound.
//      AUTHOR: EMIKO
// LAST UPDATE: 8/9/2023
// 
// FROM ☆HOSTILES☆ WITH LOVE. Vsegda gotov!

private ["_returnVal"];

_returnVal = selectRandomWeighted MIKO_globalAmbienceSoundsDay;

if(sunOrMoon < 1) then
{	// Night
	_returnVal  = selectRandomWeighted MIKO_globalAmbienceSoundsNoc;
};

_returnVal