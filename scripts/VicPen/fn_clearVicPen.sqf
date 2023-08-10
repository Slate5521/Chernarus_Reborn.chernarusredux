// (LOCAL) MIKO_fnc_clearVicPen
// PARAMS: 
//  _penBounds [trigger] Trigger to clear of vehicles, dead, and AI.
//
// DESCRIPTION: Clears a vehicle pen of vehicles, dead, and AI.
//      AUTHOR: EMIKO
// LAST UPDATE: 7/10/2023
// 
// FROM ☆HOSTILES☆ WITH LOVE. Vsegda gotov!

params ["_penBounds"];
// _success [boolean]
//  * if the deletion was success or not.
private ["_success"];

_success = true;

{	// Look through every found object and start processing them.
	private _crewList = crew _x;
	private _crewCount = count _crewList;

	// Check for crew count.
	if(_crewCount == 0) then
	{	// If no crew, it means this is an empty object.
		deleteVehicle _x;
		continue
	}
	else
	{	// Check if it's a single unit
		if(_x isEqualTo (_crewList select 0)) then
		{	// Vehicle and first crew are equal, meaning it's a unit.
			if(isPlayer _x && alive _x) then
			{	// It's an alive player. No success.
				_success = false;
				continue
			}
			else 
			{	// It's not an alive player. Could be a corpse, a destroyed vic, or an AI. Delete it.
				deleteVehicle _x;
				continue
			};
		}
		else
		{	// It does not refer to itself, so it must be a vehicle.

			// Check if it has a player in it.
			if((_crewList findIf { isPlayer _x }) > -1) then
			{	// It does. No success.
				_success = false;
				continue
			}
			else 
			{	// No player in it.
				deleteVehicleCrew _x;
				deleteVehicle _x;
			};
		};
	};
} foreach ((vehicles + allUnits + allDead + allPlayers) inAreaArray _penBounds);

_success