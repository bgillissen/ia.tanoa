private ["_veh","_cond"];
_veh = vehicle player;
_cond = ( (_veh isKindOf "B_Heli_Transport_01_F") || (_veh isKindOf "B_Heli_Transport_01_camo_F") || (_veh isKindOf "B_CTRG_Heli_Transport_01_tropic_F") );
if ( _cond ) then { _cond = (_veh getVariable "door_open"); }; 
_cond;