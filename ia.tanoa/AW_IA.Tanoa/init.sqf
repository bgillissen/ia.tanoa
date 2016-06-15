/*
@filename: init.sqf
Author:
	
	Quiksilver

Last modified:

	12/05/2014
	
Description:

	Things that may run on both server and client.
	Deprecated initialization file, still using until the below is correctly partitioned between server and client.
______________________________________________________*/

["Initialize"] call BIS_fnc_dynamicGroups;

for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do {
	call compile format
	[
		"PARAMS_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};


call compile preprocessFile "scripts\=BTC=_revive\=BTC=_revive_init.sqf";		// revive

call compile preprocessFile "scripts\radiofreq.sqf";							// TFAR RadioFreqs

tf_no_auto_long_range_radio = true; 	//so player do not spawn with longrange radio as backpacks
TF_give_microdagr_to_soldier = false; 	//so player do not have Dagr in theyr inventory

//Advanced Sling Loading
missionNamespace setVariable ["SA_ASL_HEAVY_LIFTING_ENABLED", false, true];
missionNamespace setVariable ["ASL_SUPPORTED_VEHICLES_OVERRIDE", ["Helicopter"], true]; 
missionNamespace setVariable ["ASL_SLING_RULES_OVERRIDE",[	["Helicopter", "CAN_SLING", "All"],
															["Helicopter", "CANT_SLING", "Air"],
															["Helicopter", "CANT_SLING", "Tank"],
															["Helicopter", "CANT_SLING", "IFV"],
															["Helicopter", "CANT_SLING", "Truck"]
														 ], true]; 
//Advanced Towing														 
missionNamespace setVariable ["SA_TOW_SUPPORTED_VEHICLES_OVERRIDE", ["Car", "Truck", "Ship"], true ];														 
missionNamespace setVariable ["SA_TOW_RULES_OVERRIDE", [	["Car", 	"CAN_TOW", "Car"], 
															["Truck", 	"CAN_TOW", "Truck"], 
															["Truck", 	"CAN_TOW", "Car"], 
															["Ship", 	"CAN_TOW", "Ship"] 
													   ], true];