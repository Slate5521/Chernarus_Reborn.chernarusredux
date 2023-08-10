// (LOCAL) MIKO_fnc_earthquakeNotification
// PARAMS: 
//  _intensity [int] How intense the earthquake is.
//
// DESCRIPTION: Play earthquake warning on client.
//      AUTHOR: EMIKO
//  DEPENDENCY: https://steamcommunity.com/workshop/filedetails/?id=1383903166
// LAST UPDATE: 6/27/2023
// 
// FROM ☆HOSTILES☆ WITH LOVE. Vsegda gotov!

params ["_intensity"];

// Very hacky ik but by playing this twice on same frame it'll have 2x the volume and help player to hear it over the background chaos.
playSound "click"; playSound "click";
sleep 0.23;
for "_i" from 1 to _intensity do {
	_beep = selectRandom ["da_2_beep1_high_2", "da_2_beep1_high_1"];
	
	playSound _beep; playSound _beep;
	sleep 0.23 * (_i + 1);
};