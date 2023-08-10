["ace_unconscious", 
{
	params ["_unit", "_isUnconscious"];
	
	// Check if they're a player.
	if(isPlayer _unit && _isUnconscious) then
	{
		// Play the alert sound to everyone except for those who are unconscious.
		remoteExec ["MIKO_fnc_unconsciousAlert", group _unit];
	};
}] call CBA_fnc_addEventHandler;