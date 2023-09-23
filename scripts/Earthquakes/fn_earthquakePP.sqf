// (LOCAL) MIKO_fnc_earthquakePP
// PARAMS: 
//  _intensity [integer] [1, 4] The intensity of the earthquake.
//
// DESCRIPTION: Applies post processing for the earthquake. And some sounds!
//      AUTHOR: EMIKO
//     MENTION: BRANDON for suggesting that I render the PP outside of player view and phase it 
//              into view, which stopped an issue I was having where the entire screen would flash
//              black and then fade out into what I wanted. 
// LAST UPDATE: 9/13/2023
// 
// FROM ☆HOSTILES☆ WITH LOVE. Vsegda gotov!

params ["_intensity"];
// _apSize [float]
//  * Size of the PP aperture.
// _offset [float]
//  * Image offset contrast.
private ["_apSize", "_offset"];

// If zeus do not apply PP.
if(typeOf player == "VirtualCurator_F") exitWith {};

_apSize = 0.8 - 0.1 * _intensity;
_offset = -0.99999 * _intensity - 0.09;

// Set up the post process up near invisible. 
_haloPPHandle = ppEffectCreate ["ColorCorrections", 1400];
_haloPPHandle ppEffectEnable true;
_haloPPHandle ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0.33,0.33,0.33,0],[1,1,0,0,0,0,1.11]];
_haloPPHandle ppEffectForceInNVG true;
_haloPPHandle ppEffectCommit 0;

// Fade in the post process to the effect we want.
_haloPPHandle ppEffectAdjust [0.23,0.6,_offset,[0,0,0,0],[1,1,1,1],[0.33,0.33,0.33,0],[_apSize,_apSize,0,0,0,0,1.11]];
_haloPPHandle ppEffectCommit 7 - _intensity; // Higher intensity = faster onset

// Wait til the quake stops.
waitUntil { !BIS_fnc_earthquake_inprogress };

// Fade out.
_haloPPHandle ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0.33,0.33,0.33,0],[1,1,0,0,0,0,1.11]];
_haloPPHandle ppEffectCommit 4 + _intensity; // Higher intensity = fades slower
	
// Wait until it fades before destroying post process.
waitUntil { ppEffectCommitted _haloPPHandle; };
uiSleep 1;
ppEffectDestroy _haloPPHandle; 