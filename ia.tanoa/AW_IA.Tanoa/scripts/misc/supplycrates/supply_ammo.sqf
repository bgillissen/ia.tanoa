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

Supply_Ammo = _crateType createVehicle (getMarkerPos "Ammo_Supply_drop");; publicVariable "Supply_Ammo"; 

//---------------------------------------------------- CLEAR CRATE

clearWeaponCargoGlobal Supply_Ammo;
clearMagazineCargoGlobal Supply_Ammo;

//---------------------------------------------------- CRATE CONTENTS

Supply_Ammo addWeaponCargoGlobal ["rhs_weap_M136", 5];
Supply_Ammo addWeaponCargoGlobal ["rhs_weap_M136_hedp", 5];
Supply_Ammo addWeaponCargoGlobal ["rhs_weap_M136_hp", 5];
Supply_Ammo addWeaponCargoGlobal ["rhs_weap_m4a1_blockII", 3];

Supply_Ammo addItemCargoGlobal ["Laserdesignator", 5];
Supply_Ammo addItemCargoGlobal ["Laserbatteries", 5];
Supply_Ammo addItemCargoGlobal ["MineDetector", 5];
Supply_Ammo addItemCargoGlobal ["NVGoggles", 5];
Supply_Ammo addItemCargoGlobal ["FirstAidKit", 40];
Supply_Ammo addItemCargoGlobal ["Medikit", 3];
Supply_Ammo addItemCargoGlobal ["ToolKit", 3];

Supply_Ammo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];
Supply_Ammo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 10];
Supply_Ammo addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 40];
Supply_Ammo addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m62_tracer", 15];
Supply_Ammo addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_M200_soft_pouch", 15];
Supply_Ammo addMagazineCargoGlobal ["rhs_fim92_mag", 3];
Supply_Ammo addMagazineCargoGlobal ["rhs_fgm148_magazine_AT", 3];
Supply_Ammo addMagazineCargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_M33", 40];
Supply_Ammo addMagazineCargoGlobal ["rhs_mag_M441_HE", 20];
Supply_Ammo addMagazineCargoGlobal ["rhs_mag_an_m8hc", 40];

sleep _reloadtime; BACO_ammoSuppAvail = TRUE; publicVariable "BACO_ammoSuppAvail";