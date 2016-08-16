// Made by Raz, data entry from Josh, Zissou and stuffed sheep Made on AhoyWorld this script features all magazines, most weapons, 
//Nato backpacks, Nato items, Nato clothes. You may use this on your mission start, please keep us credited! Enjoy.
// _null = [this] execVM "scripts\VAserver.sqf";

if (!isServer) exitWith {};

private ["_box"];
_box = _this select 0;
["AmmoboxInit",[_box,true,{true}]] call BIS_fnc_arsenal;