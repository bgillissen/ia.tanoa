/*
	File: fn_tawvdInit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master init for TAW View Distance (Addon version). If the script verson is present it will exit.
*/
if(!isMultiplayer) exitWith {};
tawvd_foot = 2200;
tawvd_car = 4000;
tawvd_air = 5000;
tawvd_addon_disable = true;

[] spawn {
	waitUntil {player == player};
	[] spawn TAWVD_fnc_trackViewDistance;
};