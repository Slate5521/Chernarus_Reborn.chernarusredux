// loadouts.sqf
// PARAMS: 
//  _unit [object]
//   The unit this script is being called on. 
//
// DESCRIPTION: Editable logic for default loadouts and spawn options.
//      AUTHOR: EMIKO
// LAST UPDATE: 6/27/2023
// 
// FROM ☆HOSTILES☆ WITH LOVE. Vsegda gotov!

MIKO_loadoutScript = 
{
	params ["_unit"];
	// _loadout [?Array]
	//	* Loadout to use.
	private ["_loadout"];

	/* ----------------------------------------------------------------
	// EDITABLE PART! EDIT THE FUCK OUT OF ME! */


	_randomUniform = selectRandom [ "CUP_U_B_GER_Flecktarn_1","CUP_U_B_GER_Flecktarn_2","CUP_U_B_GER_Flecktarn_3","CUP_U_B_GER_Flecktarn_4","CUP_U_B_GER_Flecktarn_5","CUP_U_B_GER_Flecktarn_6","CUP_U_B_GER_Flecktarn_7","CUP_U_B_GER_Flecktarn_8" ];
	
	// Default loadout. 
	_loadout = [[],[],["ACE_Flashlight_Maglite_ML300L","","","",[],[],""],[_randomUniform,[["ACE_fieldDressing",8],["ACE_elasticBandage",8],["ACE_packingBandage",8],["ACE_EarPlugs",1],["ACE_CableTie",2],["AnomalyDetector",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_morphine",3],["ACE_epinephrine",8],["ACE_splint",2],["ACE_tourniquet",2]]],["CUP_V_B_GER_Vest_2",[["ACE_Chemlight_UltraHiOrange",2,1],["bolts_infinite_mag",1,9999],["CUP_HandGrenade_M67",1,1],["SmokeShell",2,1]]],["B_AssaultPack_rgr",[["ACE_EntrenchingTool",1],["ACE_salineIV",2],["ACE_salineIV_500",2],["SE_GP21",1]]],"","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_rf7800str","ItemCompass","ItemWatch",""]],[];

	_roleDesc = roleDescription _unit;

	switch(roleDescription _unit) do
	{
		case "Medic":
		{
			_unit setUnitTrait ["loadCoef", (_unit getUnitTrait "loadCoef") / 8.0];
			_unit setUnitTrait ["medic", true];
		};
		case "Weapon Specialist":
		{
			_unit setUnitTrait ["loadCoef", (_unit getUnitTrait "loadCoef") / 16.0];
			_unit setUnitTrait ["explosiveSpecialist ", true];
		};
		case "Technician":
		{
			_unit setUnitTrait ["loadCoef", (_unit getUnitTrait "loadCoef") / 16.0];
			_unit setUnitTrait ["engineer", true];
			_unit setUnitTrait ["UAVHacker", true];
			_unit setUnitTrait ["explosiveSpecialist", true];
		}
	};

	_loadout
};