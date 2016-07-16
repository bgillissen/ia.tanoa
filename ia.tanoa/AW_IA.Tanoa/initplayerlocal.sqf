/*
@filename: initPlayerLocal.sqf
Author:
	
	Quiksilver

Last modified:

	29/10/2014 ArmA 1.32 by Quiksilver
	
Description:

	Client scripts and event handlers.
______________________________________________________*/

enableSentences FALSE;															
enableSaving [FALSE,FALSE];
player enableFatigue FALSE;

//------------------------------------------------ Handle parameters

for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do {
	call compile format
	[
		"PARAMS_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};

//------------------- client executions

_null = [] execvm "scripts\vehicle\crew\crew.sqf"; 								// vehicle HUD
_null = [] execVM "scripts\restrictions.sqf"; 									// gear restrictions and safezone
_null = [] execVM "scripts\pilotCheck.sqf"; 									// pilots only
_null = [] execVM "scripts\crewCheck.sqf"; 										// tank crew only
_null = [] execVM "scripts\jump.sqf";											// jump action
_null = [] execVM "scripts\misc\diary.sqf";										// diary tabs	
_null = [] execVM "scripts\icons.sqf";											// blufor map tracker Quicksilver
_null = [] execVM "scripts\VAclient.sqf";										// Virtual Arsenal
_null = [] execVM "scripts\misc\Intro.sqf";										// AW intro screen
_null = [] execVM "scripts\voice_control\voiceControl.sqf";						// Voice Control
if (PARAMS_HeliRope != 0) then {call compile preprocessFileLineNumbers "scripts\vehicle\fastrope\zlt_fastrope.sqf";};

[] call QS_fnc_respawnPilot;
[] call QS_fnc_respawnCrew;


//-------------------- PVEHs

"addToScore" addPublicVariableEventHandler
{
	((_this select 1) select 0) addScore ((_this select 1) select 1);
};

tawvd_disablenone = false;

//--------------------- Arty Computer and Squad Manager

enableEngineArtillery false;
if (player isKindOf "B_crew_F") then {
	enableEngineArtillery true;
};
if (player isKindOf "B_support_Mort_F") then {
	enableEngineArtillery true;
};
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

//--------------------- Billboard Image Randomiser
	Bill_1 setObjectTexture [0,"media\images\billboard2.paa"];
	
	_imageList2 = [1,3,4,5,6,7,8,9,10];
	_bill2 = _imageList2 call BIS_fnc_selectRandom;
	if (_bill2 == 1) then {Bill_2 setObjectTexture [0,"media\images\billboard1.paa"]};
	if (_bill2 == 3) then {Bill_2 setObjectTexture [0,"media\images\billboard3.paa"]};
	if (_bill2 == 4) then {Bill_2 setObjectTexture [0,"media\images\billboard4.paa"]};
	if (_bill2 == 5) then {Bill_2 setObjectTexture [0,"media\images\billboard5.paa"]};
	if (_bill2 == 6) then {Bill_2 setObjectTexture [0,"media\images\billboard6.paa"]};
	if (_bill2 == 7) then {Bill_2 setObjectTexture [0,"media\images\billboard7.paa"]};
	if (_bill2 == 8) then {Bill_2 setObjectTexture [0,"media\images\billboard8.paa"]};
	if (_bill2 == 9) then {Bill_2 setObjectTexture [0,"media\images\billboard9.paa"]};
	if (_bill2 == 10) then {Bill_2 setObjectTexture [0,"media\images\billboard10.paa"]};
	
//--------------------- Squad Url Hint

_infoArray = squadParams player;    
_infoSquad = _infoArray select 0;
_squad = _infoSquad select 1;
_infoName = _infoArray select 1;
_name = _infoName select 1; 
_email = _infoSquad select 2;


// replace line below with your Squad xml's email
if (_email == "rainman@taskforceunicorn.com") then {

_GlobalHint = format["<t align='center' size='2.2' color='#FAAF3A'>%1<br/></t><t size='1.4' color='#33CCFF'>%2</t><br/>has joined the server, To become a TFU member, apply to taskforceunicorn.com</t><br/>",_squad,_name];

[_GlobalHint] remoteExec ["AW_fnc_globalHint",0,false];
} else {};






