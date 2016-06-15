/*
Author:

	Jester [AW]
	
Edited by:
 
	Quiksilver 
 
Note:
 
	Should be fixedd now.
 
______________________________________________________________*/

private ["_heli", "_reloadtime"];

if (!(AW_ammoDropAvail)) exitWith {
	hint "Ammo drop is not currently available"
};
AW_ammoDropAvail = FALSE; publicVariable "AW_ammoDropAvail";

//------------------------------------------------------- CONFIG

_heli = _this select 0;
_chuteType = "B_Parachute_02_F";			//parachute for blufor, for opfor and greenfor replace the 'B' with 'O' or 'G' respectively
_crateType =  "rhsusf_mags_crate";			//ammocrate class for blufor, feel free to change to whichever box you desire
_smokeType =  "SmokeShellPurple";  			//smoke shell color you want to use
_lightType =  "Chemlight_blue";  			//chemlightcolor you want used
_reloadtime = 600;  							// time before next ammo drop is available to use, default 600 or 480
_minheight = 39;  							// the height you have to be before you can actually drop the crate

//--------------------------------------------------------- MEAT AND POTATOES

_chute = createVehicle [_chuteType, [100, 100, 200], [], 0, 'FLY'];
_chute setPos [getPosASL _heli select 0, getPosASL _heli select 1, (getPosASL _heli select 2) - 50];
ammoDropCrate = createVehicle [_crateType, position _chute, [], 0, 'NONE']; publicVariable "ammoDropCrate"; 
ammoDropCrate attachTo [_chute, [0, 0, -1.3]];
ammoDropCrate allowdamage false;
_light = createVehicle [_lightType, position _chute, [], 0, 'NONE'];
_light attachTo [_chute, [0, 0, 0]];

//---------------------------------------------------- CLEAR CRATE

clearWeaponCargoGlobal ammoDropCrate;
clearMagazineCargoGlobal ammoDropCrate;

//---------------------------------------------------- CRATE CONTENTS


ammoDropCrate addWeaponCargoGlobal ["rhs_weap_M136", 5];
ammoDropCrate addWeaponCargoGlobal ["rhs_weap_M136_hedp", 5];
ammoDropCrate addWeaponCargoGlobal ["rhs_weap_M136_hp", 5];
ammoDropCrate addWeaponCargoGlobal ["rhs_weap_m4a1_blockII", 3];

ammoDropCrate addItemCargoGlobal ["Laserdesignator", 5];
ammoDropCrate addItemCargoGlobal ["Laserbatteries", 5];
ammoDropCrate addItemCargoGlobal ["MineDetector", 5];
ammoDropCrate addItemCargoGlobal ["NVGoggles", 5];
ammoDropCrate addItemCargoGlobal ["FirstAidKit", 40];
ammoDropCrate addItemCargoGlobal ["Medikit", 3];
ammoDropCrate addItemCargoGlobal ["ToolKit", 3];

ammoDropCrate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];
ammoDropCrate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 10];
ammoDropCrate addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 40];
ammoDropCrate addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m62_tracer", 15];
ammoDropCrate addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_M200_soft_pouch", 15];
ammoDropCrate addMagazineCargoGlobal ["rhs_fim92_mag", 3];
ammoDropCrate addMagazineCargoGlobal ["rhs_fgm148_magazine_AT", 3];
ammoDropCrate addMagazineCargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_M33", 40];
ammoDropCrate addMagazineCargoGlobal ["rhs_mag_M441_HE", 20];
ammoDropCrate addMagazineCargoGlobal ["rhs_mag_an_m8hc", 40];


//--------------------------------------------------- BRIEF

pvBroadcast = [WEST,"AirBase"] sideChat "Supply Drop has been deployed!"; publicVariable "pvBroadcast";

//--------------------------------------------------- CRATE LANDING

waitUntil {
	position ammoDropCrate select 2 < 2 || isNull _chute
};

detach ammoDropCrate;
ammoDropCrate setPos [position ammoDropCrate select 0, position ammoDropCrate select 1, 0];
ammoDropCrate setVectorUp [0,0,1];
ammoDropCrate enableSimulationGlobal TRUE;
_smoke = _smokeType createVehicle [getPos ammoDropCrate select 0, getPos ammoDropCrate select 1,5];
