/*
Author: Quiksilver, Ben
Last modified: 13/10/2014 ArmA 1.30 by Quiksilver
Description: Separate crew respawn
*/

if (PARAMS_CrewRespawn == 0) exitWith {};

_pos = getMarkerPos "respawn_crew";
_crews = ["rhsusf_army_ocp_crewman"];
_iamcrew = ({typeOf player == _x} count _crews) > 0;
if (_iamcrew) then {
	player setDir 320;
	player setPosATL [(((_pos select 0) + random 3) - random 6),(((_pos select 1) + random 3) - random 6),0];;
};