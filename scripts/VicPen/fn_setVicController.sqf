// (LOCAL) MIKO_fnc_setVicController
// PARAMS: 
//  _laptop [object] The laptop we're adding the spawn options to.
//  _playerMove [object] Where to move the player if they get in the way.
//  _penBounds [trigger] The bounds of the vehicle pen.
//  _options [array] The vehicles that are available to spawn.
//
// DESCRIPTION: Sets up a laptop to be able to spawn vehicles.
//      AUTHOR: EMIKO
// LAST UPDATE: 7/8/2023
// 
// FROM ☆HOSTILES☆ WITH LOVE. Vsegda gotov!

params ["_laptop", "_penBounds", "_options", "_angle"];

// Add clear action
_laptop addAction
[
	"<t color='#ff0000'>DELETE VICS, AI, AND DEAD</t>",
	{
		params ["_object", "_caller", "_ID", "_passedVars"]; 
			
		_passedVars 
		params ["_penBounds"];

		// Attempt to clear and wait for success message.
		if(_penBounds call MIKO_fnc_clearVicPen) then
		{	// Success!
			hint "Successfully cleared spawn area.";
		} else
		{	// Not a success.
			hint "Unable to fully clear spawn area. Check if players are inside vehicles?";
		}
	},
	[_penBounds],
	1.5,
	true,
	false,
	"",
	"_target distance _this < 4",
	4
];

// Add all the other shit
{
	_x 
	params ["_title", "_category", "_miscTag", "_class", "_camo", "_options"];

	_laptop addAction 
	[
		_category + ": " + _title,
		{
			params ["_object", "_caller", "_ID", "_passedVars"]; 
			
			_passedVars 
			params ["_penBounds", "_class", "_camo", "_options", "_angle"];

			[
				_penBounds, 
				_class, 
				_camo, 
				_options,
				_angle
			] call MIKO_fnc_trySpawnVic; 
		},
		[_penBounds, _class, _camo, _options, _angle],
		1.5,
		true,
		false,
		"",
		"_target distance _this < 4",
		4
	]

} forEach _options;