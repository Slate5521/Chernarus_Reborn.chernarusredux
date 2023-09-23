// ================================
// DYNAMIC GROUPS FRAMEWORK
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; // Initializes the player/client side Dynamic Groups framework

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