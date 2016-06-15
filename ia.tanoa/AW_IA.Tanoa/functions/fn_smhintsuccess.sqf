	private ["_veh","_vehName","_vehVarname","_completeText","_reward","_GAU","_rabbit","_mortar"];

smRewards =
[
	["an UH-1Y Unarmed", "RHS_UH1Y_UNARMED_d"],
	["an UH-1Y FFAR", "RHS_UH1Y_FFAR_d"],
	["an AH1Z Ground Support", "RHS_AH1Z_GS"],
	["an UH64D Ground Support", "RHS_UH64D_GS"],
	["a RG33 M2", "rhsusf_rg33_m2uusmc_d"],
	["an Offraod (Repair)", "C_Offroad_01_repair_F"],
	["a Mobile Mortar Truck", "B_G_Offroad_01_repair_F"],
	["a M113 M2", "rhsusf_m113d_usarmy"],
	["a M109 Artillery Tank", "rhsusf_m109d_usarmy"],
	["a BM-21 Atillery Truck", "rhsgref_cdf_b_reg_BM21"],
	["a T-90", "rhst90_tv"]
];
smMarkerList =
["smReward1","smReward2","smReward3","smReward4","smReward5","smReward6","smReward7","smReward8","smReward9","smReward10","smReward11","smReward12","smReward13","smReward14","smReward15","smReward16","smReward17","smReward18","smReward19","smReward20","smReward21","smReward22","smReward23","smReward24","smReward25","smReward26","smReward27"];

_veh = smRewards call BIS_fnc_selectRandom;

_vehName = _veh select 0;
_vehVarname = _veh select 1;

_completeText = format[
"<t align='center'><t size='2.2'>Side Mission</t><br/><t size='1.5' color='#08b000'>COMPLETE</t><br/>____________________<br/>Fantastic job, lads! The OPFOR stationed on the island won't last long if you keep that up!<br/><br/>We've given you %1 to help with the fight. You'll find it at base.<br/><br/>Focus on the main objective for now; we'll relay this success to the intel team and see if there's anything else you can do for us. We'll get back to you in 10-15 minutes.</t>",_vehName];

_reward = createVehicle [_vehVarname, getMarkerPos "smReward1", smMarkerList,0, "CAN_COLLIDE"];
waitUntil {!isNull _reward};

_reward setDir 284;

[_completeText] remoteExec ["AW_fnc_globalHint",0,false];
["CompletedSideMission", sideMarkerText] remoteExec ["AW_fnc_globalNotification",0,false];
_rewardtext = format["Your team received %1!", _vehName];
["Reward",_rewardtext] remoteExec ["AW_fnc_globalNotification",0,false];

/*
if (_reward isKindOf "O_Plane_CAS_02_F") exitWith { 
	_reward removeMagazine "120Rnd_CMFlare_Chaff_Magazine";
	_reward addMagazine "60Rnd_CMFlare_Chaff_Magazine";
};
if (_reward isKindOf "B_Plane_CAS_01_F") exitWith { 
	_reward removeMagazine "120Rnd_CMFlare_Chaff_Magazine";
	_reward addMagazine "60Rnd_CMFlare_Chaff_Magazine";
};
if (_reward isKindOf "B_Heli_Light_01_armed_F") exitWith { 
	_reward setObjectTexture[0, 'A3\Air_F\Heli_Light_01\Data\skins\heli_light_01_ext_digital_co.paa'];
};
if (_reward isKindOf "Rabbit_F") exitWith {
	_GAU = createVehicle ["B_Heli_Light_01_armed_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_GAU setDir 284;
	deleteVehicle _reward;
	_GAU removeMagazine ("5000Rnd_762x51_Belt");
	_GAU removeWeapon ("M134_minigun");
	_GAU addWeapon ("HMG_127_APC");
	_GAU addMagazine ("500Rnd_127x99_mag_Tracer_Red");
	{_x addCuratorEditableObjects [[_GAU], false];} foreach adminCurators;
};
if (_reward isKindOf "B_G_Offroad_01_repair_F") exitWith {
	_mortar = createVehicle ["B_Mortar_01_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_mortar attachTo [_reward,[0,-2.5,.3]];
};
if (_reward isKindOf "Land_InfoStand_V1_F") exitWith {
	deleteVehicle _reward;
	_truck = createVehicle ["B_G_Offroad_01_repair_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_GMG = createVehicle ["B_GMG_01_high_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_GMG attachTo [_truck,[0,-2.5,.8]];
};
if (_reward isKindOf "Land_GarbageBags_F") exitWith {
	_GMG = createVehicle ["B_Heli_Light_01_armed_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_GMG setDir 284;
	deleteVehicle _reward;
	_GMG removeMagazine ("5000Rnd_762x51_Belt");
	_GMG removeWeapon ("M134_minigun");
	_GMG addWeapon ("GMG_20mm");
	_GMG addMagazine ("40Rnd_20mm_G_belt");
	_GMG addMagazine ("40Rnd_20mm_G_belt");
	{_x addCuratorEditableObjects [[_GMG], false];} foreach adminCurators;
};
*/
{
	_x addCuratorEditableObjects [[_reward], false];
} foreach adminCurators;