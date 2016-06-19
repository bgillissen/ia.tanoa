/*
Author: Quiksilver
Last modified: 13/10/2014 ArmA 1.30 by Quiksilver
Description: Separate pilot respawn
*/

if (PARAMS_PilotRespawn == 0) exitWith {};

_pos = getMarkerPos "respawn_heli";
_helipilots = ["B_Helipilot_F","B_helicrew_F","O_Helipilot_F","O_helicrew_F","I_Helipilot_F","I_helicrew_F"];
_iamhelipilot = ({typeOf player == _x} count _helipilots) > 0;
if (_iamhelipilot) then {
	player setDir 140;
	player setPosATL [(((_pos select 0) + random 3) - random 6),(((_pos select 1) + random 3) - random 6),0];;
};


_pos = getMarkerPos "respawn_jet";
_jetpilots = ["B_Pilot_F","O_Pilot_F","I_Pilot_F"];
_iamjetpilot = ({typeOf player == _x} count _jetpilots) > 0;
if (_iamjetpilot) then {
	player setDir 140;
	player setPosATL [(((_pos select 0) + random 3) - random 6),(((_pos select 1) + random 3) - random 6),0];;
};