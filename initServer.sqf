["Initialize"] call BIS_fnc_dynamicGroups; // Initializes the Dynamic Groups framework

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
		//_AMwaitTime = floor (random[60, 80, 140]);
		_AmwaitTime = 2;
		_AMlast = time;
	};

	sleep 6;
};