// (SERVER) MIKO_fnc_anomalousEarthquake
// PARAMS:
//  _strength [integer] [-1, 4] The strength of the earthquake. -1 for random.
// VARIABLES: 
//  _ranDistrib [integer] [1, 100] The statistical distribution of the earthquake. Higher is more 
//                        intensity.
//  _intensity [integer] [1, 4] The intensity of the earthquake.
//
// DESCRIPTION: Perform an anomalous earthquake.
//      AUTHOR: EMIKO
// LAST UPDATE: 9/25/2023
// 
// FROM ☆HOSTILES☆ WITH LOVE. Vsegda gotov!

params ["_strength"];
private ["_ranDistrib", "_intensity"];
_intensity = _strength;

// Get the intensity.

if(_strength == -1) then
{
	_ranDistrib = floor(random 100) + 1;
	_intensity = 1;

	/* [ 0, 40) */if(_ranDistrib < 40)						then { _intensity = 1; };
	/* [40, 70) */if(_ranDistrib >= 40 && _ranDistrib < 70) then { _intensity = 2; };
	/* [70, 92) */if(_ranDistrib >= 70 && _ranDistrib < 95) then { _intensity = 3; };
	/* [92,100] */if(_ranDistrib >= 92)						then { _intensity = 4; };
};

_randomBoomSound = selectRandom["MIKO_blowout_boom_01", "MIKO_blowout_boom_02", "MIKO_blowout_boom_03", "MIKO_blowout_boom_04"];
_randomQuakeSound = selectRandom ["MIKO_blowout_ambient_rumble_01", "MIKO_blowout_ambient_rumble_02", "MIKO_blowout_ambient_rumble_03", "MIKO_blowout_ambient_rumble_04"];

// Alert players with anomaly detector.	
{ // forEach allPlayers
	[_randomBoomSound] remoteExec ["playSound", _x];

	uiSleep 0.337;
	[_randomQuakeSound] remoteExec ["playSound", _x];

	uiSleep 2 - _intensity / 2;

	_hasDetector = [_x, "AnomalyDetector"] call BIS_fnc_hasItem;
	if(_hasDetector) then {
		 [_intensity] remoteExec ["MIKO_fnc_earthquakeNotification", _x];
	};
	
} forEach allPlayers;
	
		  
sleep (6 - _intensity) + ((4.2 - _intensity) * random 4);
	
// Send earthquake command and post-processing to all players.
[_intensity] remoteExec ["BIS_fnc_earthquake"];
[_intensity] remoteExec ["MIKO_fnc_earthquakePP", allPlayers - allCurators];