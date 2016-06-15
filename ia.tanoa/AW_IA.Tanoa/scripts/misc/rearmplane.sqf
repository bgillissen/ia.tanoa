private ["_veh"];
_veh = _this select 0;

if (_veh isKindOf "ParachuteBase" || !alive _veh) exitWith {};

if (!(_veh isKindOf "plane")) exitWith { 
	_veh vehicleChat "This pad is for plane service only, soldier!"; 
};

_veh vehicleChat "Servicing airplane, this will take about 3 minutes";

_veh setFuel 0;

//---------- RE-ARMING
_veh vehicleChat "Re-arming ...";
sleep 60;
_veh setVehicleAmmo 1;
_veh vehicleChat "Re-armed (100%).";

//---------- REPAIRING
_veh vehicleChat "Repairing ...";
sleep 60;
_veh setDamage 0;
_veh vehicleChat "Repaired (100%).";

//---------- REFUELING
_veh vehicleChat "Refueling ...";
sleep 60;
_veh setFuel 1;
_veh vehicleChat "Refuelled (100%).";

//---------- FINISHED
sleep 1;
_veh vehicleChat "Service complete.";