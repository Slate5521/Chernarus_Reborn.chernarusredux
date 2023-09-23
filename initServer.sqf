["Initialize"] call BIS_fnc_dynamicGroups; // Initializes the Dynamic Groups framework

// ================================
// <UNCON LOGIC>
["ace_unconscious", 
{	// Passed to each local machine.
	params ["_unit", "_isUnconscious"];
	
	// Check if they're a player, unconscious, and in the same group.
	if(isPlayer _unit && _isUnconscious && (group player) isEqualTo (group _unit)) then
	{
		// Play the alert sound.
		call "MIKO_fnc_unconsciousAlert";
	};
}] call CBA_fnc_addEventHandler;

// ================================
// <EARTHQUAKE LOGIC>
_EQwaitTime = 40; // How long to wait in seconds for an earthquake, init at start.
_EQlast     = 0;  // How long it has been since an earthquake.

// ================================
// <AMBIENCE LOGIC>
_AMwaitTime = 40;
_AMlast     = -100;

// ================================
// <SPAM LOOP>
//

while {true} do 
{
	// Check if it's time for an earthquake.
	if(time >= _EQlast + _EQwaitTime) then
	{
		[-1] call MIKO_fnc_anomalousEarthquake;
						// 2 min, 3.2 min, and 6.4min
		_EQwaitTime = floor(random [120, 192, 384]);
		_EQlast = time;
	};
	
	if(time >= _AMlast + _AMwaitTime) then 
	{
		(call MIKO_fnc_getRandomAmbience) remoteExec ["MIKO_fnc_doAmbienceSound", allPlayers];
		_AMwaitTime = floor (random[20, 60, 80]);
		_AMlast = time;
	};

	sleep 6;
};