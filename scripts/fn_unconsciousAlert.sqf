// (LOCAL) MIKO_fnc_unconsciousAlert
// PARAMS: 
//
// DESCRIPTION: Alerts a client to a user going unconscious.
//      AUTHOR: EMIKO
// LAST UPDATE: 9/23/2023
// 
// FROM ☆HOSTILES☆ WITH LOVE. Vsegda gotov!

params ["_unit", "_isUnconscious"];

// Initialize this variable.
if(isNil "MIKO_UnconsciousLastAlert") then
{
	MIKO_UnconsciousLastAlert = 0;
};

// Only play once every half second to prevent The Great Deafening upon the inevitable mass casualty.
if(diag_tickTime + 0.5 >= MIKO_UnconsciousLastAlert) then
{
	
	playSound "MIKOalertUnconscious";
	MIKO_UnconsciousLastAlert = diag_tickTime;
};