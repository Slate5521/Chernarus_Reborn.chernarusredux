// (LOCAL) MIKO_fnc_trySpawnVic
// PARAMS: 
//  _playerMove [object] Where to move the player if they are inside the pen at spawn.
//  _penBounds [trigger] The pen to try and spawn a vehicle inside of.
//  _class [string] The class of vehicle to spawn.
//  _camo [string] The camo of the vehicle.
//  _options [array] Garage / appearance options.
//  _angle [integer] Angle of spawned vehicle.
//
// DESCRIPTION: Try to spawn a vehicle inside a pen.
//      AUTHOR: EMIKO
// LAST UPDATE: 7/10/2023
// 
// FROM ☆HOSTILES☆ WITH LOVE. Vsegda gotov!

params ["_penBounds", "_class", "_camo", "_options", "_angle"];

if(count ((vehicles + allUnits + allPlayers + allDead) inAreaArray _penBounds) > 0) 
	exitWith 
	{
		hint "SPAWN AREA OCCUPIED. CLEAR SPACE BEFORE SPAWNING VEHICLE.";
	};

_newVehicle = [
	_class,
	getPosASL _penBounds,
	_angle
] call {
	params ["_class", "_pos", "_angle"];
	
	_newVehicle = _class createVehicle _pos;
	_newVehicle setDir _angle;
	_newVehicle setPosASL _pos;

	// Wait one frame.
	sleep 0.001;

	_newVehicle
}; [
    _newVehicle,
    [_camo, 1], 
    _options
] call BIS_fnc_initVehicle;
