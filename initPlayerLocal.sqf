// ================================
// DYNAMIC GROUPS FRAMEWORK
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; // Initializes the player/client side Dynamic Groups framework

["ace_unconscious", 
{	// Passed to each local machine.
	params ["_unit", "_isUnconscious"];
	
	// Check if they're a player, not the same person, unconscious, and in the same group.
	if(isPlayer _unit && _isUnconscious && !player isEqualTo _unit && (group player) isEqualTo (group _unit)) then
	{
		// Play the alert sound.
		call "MIKO_fnc_unconsciousAlert";
	};
}] call CBA_fnc_addEventHandler;

// ================================
// POST PROCESSING

if(typeOf player != "VirtualCurator_F") then
{
	MIKO_PP_colorC = ppEffectCreate ["ColorCorrections", 1500]; 
	MIKO_PP_colorC ppEffectEnable true; 
	MIKO_PP_colorC ppEffectAdjust [0.99,0.95,-0.0875,[1,1,1,0],[1,1,1.05,0.35],[0.35,0.2,0.35,-0.1],[0,0,0,0,0,0,-5]]; 
	MIKO_PP_colorC ppEffectCommit 1; 

	MIKO_PP_colorI = ppEffectCreate ["ColorInversion", 2500]; 
	MIKO_PP_colorI ppEffectEnable true; 
	MIKO_PP_colorI ppEffectAdjust [0.01,0,0.01]; 
	MIKO_PP_colorI ppEffectCommit 1;
};