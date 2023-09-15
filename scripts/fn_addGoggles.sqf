// (SERVER) MIKO_fnc_addGoggles
// PARAMS: 
//  _unit [object] The unit this script is being called on. 
//  _side [string] The 3 letter side-code of this unit. Affects it cosmetically.
//
// DESCRIPTION: Add a mask to every unit in a group. Masks are from S.T.A.L.K.E.R. + CBRN Equipment 
//				so this has a dependency on that.
//      AUTHOR: EMIKO
// LAST UPDATE: 6/27/2023
// 
// FROM ☆HOSTILES☆ WITH LOVE. Vsegda gotov!


params["_unit", "_side"];
{
	// Default mask in case of an invalid side.
	_mask = "SE_PPM88";

	switch(_side) do
	{ 	//SCE_G_CN2F,CAU_G_CBRN_m04_hoodless,CAU_G_CBRN_m50_hoodless,SE_GP5,SE_PPM88,SE_M17,SE_GP21,SE_GP7,SE_G_M334,SE_PBF,SE_Respirator,SE_Respirator_Goggles
		case "RUS": { _mask = "SCE_G_CN2F"; };
		case "GER": { _mask = "CAU_G_CBRN_m04_hoodless"; };
		case "USA": { _mask = "CAU_G_CBRN_m50_hoodless"; };
		case "BAN": { _mask = selectRandom ["SE_GP5", "SE_PPM88", "SE_M17" ]; };
		case "ZOM": { _mask = selectRandom ["SCE_G_CN2F", "SE_GP21", "SE_GP5", "SE_GP7", "SE_M17", "SE_G_M334", "SE_PBF", "SE_PPM88", "SE_Respirator", "SE_Respirator_Goggles"]; };
	};
	_x addGoggles _mask;
} forEach units _unit;