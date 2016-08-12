private ["_veh"];
_veh = vehicle player;
_veh animateDoor ['door_R',1];
_veh animateDoor ['door_L',1];
_veh setVariable ["door_open",TRUE,TRUE];