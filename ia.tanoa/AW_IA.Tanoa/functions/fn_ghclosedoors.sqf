private ["_veh"];
_veh = vehicle player;
_veh animateDoor ['door_R',0];
_veh animateDoor ['door_L',0];
_veh setVariable ["door_open",FALSE,TRUE];