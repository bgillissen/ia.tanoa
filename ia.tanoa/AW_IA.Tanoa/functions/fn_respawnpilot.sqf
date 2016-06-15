/*
Author: Quiksilver
Last modified: 13/10/2014 ArmA 1.30 by Quiksilver
Description: Separate pilot respawn
*/

if (PARAMS_PilotRespawn == 0) exitWith {};

_pos = getMarkerPos "respawn_pilot";
_pilots = ["rhsusf_army_ocp_helipilot", "rhsusf_airforce_jetpilot"];
_iampilot = ({typeOf player == _x} count _pilots) > 0;
if (_iampilot) then {
	player setDir 140;
	player setPosATL [(((_pos select 0) + random 3) - random 6),(((_pos select 1) + random 3) - random 6),0];;
};