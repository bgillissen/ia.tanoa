/*
Author: 

	Quiksilver

Last modified: 

	12/05/2014

Description:

	Main AO mission control
		
______________________________________________*/

zuesMission = 0;

private ["_mission","_missionList","_currentMission","_nextMission","_loopTimeout"];

_loopTimeout = 20;

_missionList = [
	"ravi-ta",
	"saintgeorge",
	"sosovu",
	"tuvanaka",
	"bala",
	"main"
];

while { true } do {	
	
	_mission = _missionList call BIS_fnc_selectRandom;
	_currentMission = execVM format ["mission\main\islands\%1.sqf", _mission];
	
	waitUntil {
		sleep 5;
		scriptDone _currentMission
	};
	sleep _loopTimeout;
};
	
	
