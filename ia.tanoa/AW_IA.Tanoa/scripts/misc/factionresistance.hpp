/*
@filename: enemyInd.hpp
Author:

	Quiksilver
	
Description:
	INDEPENDENT
	Units, vehicles and groups, for use elsewhere in the mission.
	Doing this alleviates the need to dig through configFile, which eats more server CPU.
	Also allows greater control over what is being spawned, and where, yet allows for random composition groups.
	
	Sentry = 2-man
	Team = 4-man
	Squad = 8-man
__________________________________________________*/

class ind {
	units[] = {
		"rhsgref_ins_g_specialist_aa",
		"rhsgref_ins_g_specialist_rpg",
		"rhsgref_ins_g_commander",
		"rhsgref_ins_g_machinegunner",
		"rhsgref_ins_g_medic",
		"rhsgref_ins_g_militian_mosin",
		"rhsgref_ins_g_squadleader",
		"rhsgref_ins_g_rifleman",
		"rhsgref_ins_g_rifleman_RPG26",
		"rhsgref_ins_g_grenadier",
		"rhsgref_ins_g_saboteur",
		"rhsgref_ins_g_sniper",
		"rhsgref_ins_g_spotter",
		"rhsgref_ins_g_engineer"
	};
};
