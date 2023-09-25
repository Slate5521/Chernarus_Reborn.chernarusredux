call compile preprocessFileLineNumbers "loadouts.sqf";

waitUntil {!isNull player};

// ================================
// <RESPAWN LOGIC>
//

if(typeOf player == "VirtualCurator_F") 
	exitWith
	{
		player setUnitLoadout [[],[],[],[],[],["TFAR_mr3000",[]],"","CUP_PMC_G_thug",[],["ItemMap","","TFAR_anprc152","ItemCompass","ItemWatch",""]],[];
		player allowDamage false;
		player enableSimulation false;
	};

// Check if there's a saved loadout. Also grab a default loadout while we're at it.
// Note: I'm not concerned with the performance impact of possibly generating two 
//		 loadouts every respawn because it's an infrequent operation.
_savedLoadout   = player getVariable "MIKO_SAVED_LOADOUT";
_defaultLoadout = [player] call MIKO_loadoutScript; // Located at .\loadouts.sqf

// Check if there's a saved loadout.
if(isNil "_savedLoadout") then
{	// There's no saved loadout - use default.
	player setUnitLoadout _defaultLoadout;
}
else 
{	// There's a saved loadout - use it.
	player setUnitLoadout _savedLoadout;
};

//
// </RESPAWN LOGIC>
// ================================

if(true) exitWith {}; 