/*
Author: Quiksilver
Date modified: 12/10/2014 ArmA 1.30
*/

if (!(respawnInventory_Saved)) exitWith {systemChat "No gear saved for quick-loading!";};
if (loading_inventory) exitWith {systemChat "Loading gear, please wait ...";};
loading_inventory = true;
[player,[player,"ClassGear"]] call BIS_fnc_loadInventory;
systemChat "Gear loaded";
[] spawn {
	sleep 3;
	loading_inventory = false;
};