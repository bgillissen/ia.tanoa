/*
Author: Quiksilver
Last modified: 23/10/2014 ArmA 1.32 by Quiksilver
Description:

    Restricts certain weapon systems to different roles
Tweak by ben:

    same but with rhs player classes and added rhs weapons
_________________________________________________*/

private ["_opticsAllowed","_specialisedOptics","_optics","_basePos","_firstRun","_insideSafezone","_outsideSafezone"];

#define AT_MSG "Only AT/AA Soldiers may use this weapon system. Launcher removed."
#define SNIPER_MSG "Only Snipers may use this weapon system. Sniper rifle removed."
#define AUTOTUR_MSG "You are not allowed to use this weapon system, Backpack removed."
#define UAV_MSG "Only UAV operator may use this Item, UAV terminal removed."
#define OPTICS_MSG "Thermal optics are restricted to Squad Leaders. Optic removed."
#define MG_MSG "Only Autoriflemen may use this weapon system. LMG removed."
#define SOPT_MSG "SOS and LRPS are designated for Snipers and Spotters only. Optic removed."
#define MRK_MSG "Only Marksman and Spotters may use this weapon system. Rifle removed."

//===== UAV TERMINAL
_uavOperator = ["rhsusf_army_ocp_uav"];
_uavRestricted = ["B_UavTerminal", 
                  "O_UavTerminal", 
                  "I_UavTerminal"];
//===== AT-AA / MISSILE LAUNCHERS (excl RPG)
_missileSoldiers = ["rhsusf_army_ocp_javelin", 
                    "rhsusf_army_ocp_aa"
                    ];
_missileSpecialised = ["launch_NLAW_F",
                       "launch_B_Titan_F",
                       "launch_O_Titan_F",
                       "launch_I_Titan_F",
                       "launch_B_Titan_short_F",
                       "launch_O_Titan_short_F",
                       "launch_I_Titan_short_F",
                       "rhs_weap_fim92",
                       "rhs_weap_fgm148",
                       "rhs_weap_smaw",
                       "rhs_weap_smaw_green"
                       ];
//===== SNIPER RIFLES
_snipers = ["rhsusf_army_ocp_sniper"];
_sniperSpecialised = ["srifle_GM6_F",
                      "srifle_GM6_LRPS_F",
                      "srifle_GM6_SOS_F",
                      "srifle_LRR_F",
                      "srifle_LRR_LRPS_F",
                      "srifle_LRR_SOS_F",
                      "srifle_GM6_camo_F",
                      "srifle_GM6_camo_LRPS_F",
                      "srifle_GM6_camo_SOS_F",
                      "srifle_LRR_camo_F",
                      "srifle_LRR_camo_LRPS_F",
                      "srifle_LRR_camo_SOS_F",
                      //"rhs_weap_svdp",        no restriction, only available by looting
                      //"rhs_weap_svdp_npz",
                      //"rhs_weap_svdp_wd",
                      //"rhs_weap_svdp_wd_npz",
                      //"rhs_weap_svds",
                      //"rhs_weap_svds_npz",
                      "rhs_weap_XM2010",
                      "rhs_weap_XM2010_d",
                      "rhs_weap_XM2010_sa",
                      "rhs_weap_XM2010_wd",
                      "rhs_weap_M107",
                      "rhs_weap_M107_d",
        			  "rhs_weap_M107_w"
                      ];
//===== SNIPER OPTICS
_sniperTeam = ["rhsusf_army_ocp_sniper", 
			   "rhsusf_army_ocp_jfo"
			   ];
_sniperOpt = ["optic_SOS",
              "optic_LRPS",
              "rhsusf_acc_LEUPOLDMK4",
              "rhsusf_acc_LEUPOLDMK4_2"
              ];
//===== THERMAL OPTICS
_opticsAllowed = ["rhsusf_usmc_lar_marpat_wd_squadleader",
                  "rhsusf_army_marpat_d_squadleader",
                  "rhsusf_army_ocp_squadleader"
                  ];
_specialisedOptics = ["optic_Nightstalker",
                      "optic_tws",
                      "optic_tws_mg"
                      ];
//===== BACKPACKS
_backpackRestricted = ["O_Mortar_01_support_F",
                       "I_Mortar_01_support_F",
                       "O_Mortar_01_weapon_F",
                       "I_Mortar_01_weapon_F",
                       "O_UAV_01_backpack_F",
                       "I_UAV_01_backpack_F",
                       "O_HMG_01_support_F",
                       "I_HMG_01_support_F",
                       "O_HMG_01_support_high_F",
                       "I_HMG_01_support_high_F",
                       "O_HMG_01_weapon_F",
                       "I_HMG_01_weapon_F",
                       "O_HMG_01_A_weapon_F",
                       "I_HMG_01_A_weapon_F",
                       "O_GMG_01_weapon_F",
                       "I_GMG_01_weapon_F",
                       "O_GMG_01_A_weapon_F",
                       "I_GMG_01_A_weapon_F",
                       "O_HMG_01_high_weapon_F",
                       "I_HMG_01_high_weapon_F",
                       "O_HMG_01_A_high_weapon_F",
                       "I_HMG_01_A_high_weapon_F",
                       "O_GMG_01_high_weapon_F",
                       "I_GMG_01_high_weapon_F",
                       "O_GMG_01_A_high_weapon_F",
                       "I_GMG_01_A_high_weapon_F",
                       "I_AT_01_weapon_F",
                       "O_AT_01_weapon_F",
                       "I_AA_01_weapon_F",
                       //"RHS_Podnos_Bipod_Bag",       // lootable by killing enemys (these are statics)
                       //"RHS_Podnos_Gun_Bag",
                       //"RHS_Metis_Gun_Bag",
                       //"RHS_AGS30_Tripod_Bag",
                       //"RHS_AGS30_Gun_Bag",
                       //"RHS_DShkM_Gun_Bag",
                       //"RHS_DShkM_TripodHigh_Bag",
                       //"RHS_DShkM_TripodLow_Bag",
                       //"RHS_Kord_Gun_Bag",
                       //"RHS_Kord_Tripod_Bag",
                       //"RHS_NSV_Tripod_Bag",
                       //"RHS_NSV_Gun_Bag",
                       //"RHS_SPG9_Gun_Bag",
                       //"RHS_SPG9_Tripod_Bag",
                       "O_AA_01_weapon_F"];
//===== LMG
_autoRiflemen = ["rhsusf_army_ocp_machinegunner","rhsusf_army_ocp_autorifleman"];
_autoSpecialised = ["MMG_02_black_F",
                    "MMG_02_camo_F",
                    "MMG_02_sand_F",
                    "MMG_02_black_RCO_BI_F",
                    "MMG_02_sand_RCO_LP_F",
                    "MMG_01_base_F",
                    "MMG_01_hex_F",
                    "MMG_01_hex_ARCO_LP_F",
                    "MMG_01_tan_F",
                    "rhs_weap_m240B",
                    "rhs_weap_m240B_CAP",
                    "rhs_weap_m240G",
                    "rhs_weap_m249_pip_L",
                    "rhs_weap_m249_pip_L_para",
                    "rhs_weap_m249_pip_L_vfg",
                    "rhs_weap_m249_pip_S",
                    "rhs_weap_m249_pip_S_para",
                    "rhs_weap_m249_pip_S_vfg"
                    //"rhs_weap_pkm",    //only accessible by looting enemies ;)
                    //"rhs_weap_pkp"
                   ];

//===== MARKSMAN
_marksman = ["rhsusf_army_ocp_marksman",            //marksman
             "rhsusf_usmc_lar_marpat_wd_marksman",  //recon marksman
             "rhsusf_army_ocp_jfo"                  //spotter
             ];
_marksmanGun = ["srifle_DMR_02_ACO_F",
                "srifle_DMR_02_ARCO_F",
                "srifle_DMR_02_camo_AMS_LP_F",
                "srifle_DMR_02_DMS_F",
                "srifle_DMR_02_MRCO_F",
                "srifle_DMR_02_sniper_AMS_LP_S_F",
                "srifle_DMR_02_F",
                "srifle_DMR_02_camo_F",
                "srifle_DMR_02_sniper_F",
                "srifle_DMR_02_SOS_F",
                "srifle_DMR_03_ACO_F",
                "srifle_DMR_03_AMS_F",
                "srifle_DMR_03_ARCO_F",
                "srifle_DMR_03_DMS_F",
                "srifle_DMR_03_DMS_snds_F",
                "srifle_DMR_03_MRCO_F",
                "srifle_DMR_03_SOS_F",
                "srifle_DMR_03_tan_AMS_LP_F",
                "srifle_DMR_03_F",
                "srifle_DMR_03_khaki_F",
                "srifle_DMR_03_multicam_F",
                "srifle_DMR_03_tan_F",
                "srifle_DMR_03_woodland_F",
                "srifle_DMR_04_ACO_F",
                "srifle_DMR_04_ARCO_F",
                "srifle_DMR_04_DMS_F",
                "srifle_DMR_05_ACO_F",
                "srifle_DMR_05_ARCO_F",
                "srifle_DMR_05_DMS_F",
                "srifle_DMR_05_DMS_snds_F",
                "srifle_DMR_05_KHS_LP_F",
                "srifle_DMR_05_MRCO_F",
                "srifle_DMR_05_SOS_F",
                "srifle_DMR_05_blk_F",
                "srifle_DMR_05_hex_F",
                "srifle_DMR_05_tan_f",
                "srifle_DMR_06_camo_F",
                "srifle_DMR_06_camo_khs_F",
                "srifle_DMR_06_olive_F",
                "rhs_weap_sr25",
                "rhs_weap_sr25_ec"
                ];


_basePos = getMarkerPos "respawn_west";
_szmkr = getMarkerPos "safezone_marker";
#define SZ_RADIUS 300

_EHFIRED = {
    deleteVehicle (_this select 6);
    hintC "You are discharging your weapon at base without approval.  Cease your actions Immediately!";
    hintC_EH = findDisplay 57 displayAddEventHandler ["unload", {
        0 = _this spawn {
            _this select 0 displayRemoveEventHandler ["unload", hintC_EH];
            hintSilent "";
        };
    }];
};

_firstRun = TRUE;
if (_firstRun) then {
    _firstRun = FALSE;
    if ((player distance _szmkr) <= SZ_RADIUS) then {
        _insideSafezone = TRUE;
        _outsideSafezone = FALSE;
        EHFIRED = player addEventHandler ["Fired",_EHFIRED];
    } else {
        _outsideSafezone = TRUE;
        _insideSafezone = FALSE;
    };
};

restrict_Thermal = false;
restrict_LMG = false;
restrict_sOptics = false;
restrict_Marksman = false;
if (PARAMS_rThermal != 0) then {restrict_Thermal = true;};
if (PARAMS_rLMG != 0) then {restrict_LMG = true;};
if (PARAMS_rSOptics != 0) then {restrict_sOptics = true;};
if (PARAMS_rMarksman != 0) then {restrict_Marksman = true;};

while {true} do {

    //------------------------------------- Launchers

    if (({player hasWeapon _x} count _missileSpecialised) > 0) then {
        if (({player isKindOf _x} count _missileSoldiers) < 1) then {
            player removeWeapon (secondaryWeapon player);
            titleText [AT_MSG,"PLAIN",3];
        };
    };
    
    sleep 1;
    //------------------------------------- Sniper Rifles

    if (({player hasWeapon _x} count _sniperSpecialised) > 0) then {
        if (({player isKindOf _x} count _snipers) < 1) then {
            player removeWeapon (primaryWeapon player);
            titleText [SNIPER_MSG,"PLAIN",3];
        };
    };

    sleep 1;
    //------------------------------------- UAV

    _assignedItems = assignedItems player;

    if (({"B_UavTerminal" == _x} count _assignedItems) > 0) then {
        if (({player isKindOf _x} count _uavOperator) < 1) then {
            player unassignItem "B_UavTerminal";
            player removeItem "B_UavTerminal";
            titleText [UAV_MSG,"PLAIN",3];
        };
    };
    
    sleep 1;
    //------------------------------------- Thermal optics

    if (restrict_Thermal) then {
            _optics = primaryWeaponItems player;    
            if (({_x in _optics} count _specialisedOptics) > 0) then {
                if (({player isKindOf _x} count _opticsAllowed) < 1) then {
                    {player removePrimaryWeaponItem  _x;} count _specialisedOptics;
                    titleText [OPTICS_MSG,"PLAIN",3];
                };
            };
            sleep 1;
    };
    
    //------------------------------------- sniper optics

    if (restrict_sOptics) then {
        _optics = primaryWeaponItems player;    
        if (({_x in _optics} count _sniperOpt) > 0) then {
            if (({player isKindOf _x} count _sniperTeam) < 1) then {
                {player removePrimaryWeaponItem  _x;} count _sniperOpt;
                titleText [SOPT_MSG,"PLAIN",3];
            };
        };
        sleep 1;
    };

    //------------------------------------- LMG
        
    if (restrict_LMG) then {
        if (({player hasWeapon _x} count _autoSpecialised) > 0) then {
            if (({player isKindOf _x} count _autoRiflemen) < 1) then {
                player removeWeapon (primaryWeapon player);
                titleText [MG_MSG,"PLAIN",3];
            };
        };
        sleep 1;
    };
    
    //------------------------------------- Marksman
        
    if (restrict_Marksman) then {
        if (({player hasWeapon _x} count _marksmanGun) > 0) then {
            if (({player isKindOf _x} count _marksman) < 1) then {
                player removeWeapon (primaryWeapon player);
                titleText [MRK_MSG,"PLAIN",3];
            };
        };
        sleep 1;
    };
    
    //------------------------------------- Opfor turret backpacks

    if ((backpack player) in _backpackRestricted) then {
        removeBackpack player;
        titleText [AUTOTUR_MSG, "PLAIN", 3];
    };
    
    //===================================== SAFE ZONE MANAGER
    
    _szmkr = getMarkerPos "safezone_marker";
    if (_insideSafezone) then {
        if ((player distance _szmkr) > SZ_RADIUS) then {
            _insideSafezone = FALSE;
            _outsideSafezone = TRUE;
            player removeEventHandler ["Fired",EHFIRED];
        };
    };
    sleep 2;
    if (_outsideSafezone) then {
        if ((player distance _szmkr) < SZ_RADIUS) then { 
            _outsideSafezone = FALSE;
            _insideSafezone = TRUE;
            EHFIRED = player addEventHandler ["Fired",_EHFIRED];
        };
    };
    
    //----- Sleep 
    
    _basePos = getMarkerPos "respawn_west";
    if ((player distance _basePos) <= 500) then {
        sleep 1;
    } else {
        sleep 20;
    };
};