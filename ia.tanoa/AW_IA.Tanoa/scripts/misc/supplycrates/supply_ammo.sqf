private ["_heli", "_reloadtime"];

if (!(BACO_ammoSuppAvail)) exitWith {
	hint "Supply Crate is not currently available"
};

BACO_ammoSuppAvail = FALSE; publicVariable "BACO_ammoSuppAvail";

//------------------------------------------------------- CONFIG

_heli = _this select 0;
_crateType =  "B_supplyCrate_F";		//ammocrate class for blufor, feel free to change to whichever box you desire
_reloadtime = 960;  						// time before next ammo drop is available to use, default 600 or 480

//--------------------------------------------------------- MEAT AND POTATOES

Supply_Ammo = _crateType createVehicle (getMarkerPos "Ammo_Supply_drop");
publicVariable "Supply_Ammo"; 

//---------------------------------------------------- CLEAR CRATE

clearWeaponCargoGlobal Supply_Ammo;
clearMagazineCargoGlobal Supply_Ammo;
clearBackpackCargoGlobal Supply_Ammo;

//---------------------------------------------------- CRATE CONTENTS

Supply_Ammo addWeaponCargoGlobal ["launch_RPG32_F", 3];

Supply_Ammo addItemCargoGlobal ["Laserdesignator", 5];
Supply_Ammo addItemCargoGlobal ["Laserbatteries", 5];
Supply_Ammo addItemCargoGlobal ["MineDetector", 5];
Supply_Ammo addItemCargoGlobal ["NVGoggles", 5];
Supply_Ammo addItemCargoGlobal ["FirstAidKit", 40];
Supply_Ammo addItemCargoGlobal ["Medikit", 3];
Supply_Ammo addItemCargoGlobal ["ToolKit", 3];

Supply_Ammo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];
Supply_Ammo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 10];
Supply_Ammo addMagazineCargoGlobal ["SmokeShell", 40];
Supply_Ammo addMagazineCargoGlobal ["HandGrenade", 15];
Supply_Ammo addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 40];
Supply_Ammo addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 40];
Supply_Ammo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 40];
Supply_Ammo addMagazineCargoGlobal ["20Rnd_762x51_Mag", 30];
Supply_Ammo addMagazineCargoGlobal ["130Rnd_338_Mag", 10];
Supply_Ammo addMagazineCargoGlobal ["5Rnd_127x108_Mag", 10];
Supply_Ammo addMagazineCargoGlobal ["7Rnd_408_Mag", 15];
Supply_Ammo addMagazineCargoGlobal ["RPG32_F", 5];
Supply_Ammo addMagazineCargoGlobal ["Titan_AT", 5];

sleep _reloadtime; BACO_ammoSuppAvail = TRUE; publicVariable "BACO_ammoSuppAvail";