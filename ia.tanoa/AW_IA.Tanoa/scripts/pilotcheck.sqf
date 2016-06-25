// Original pilotcheck by Kamaradski [AW]. 
// Since then been tweaked by many hands!
// Notable contributors: chucky [allFPS], Quiksilver.

private ["_cfg", "_trts", "_trt"];

_helipilots = ["B_Helipilot_F","B_helicrew_F","O_Helipilot_F","O_helicrew_F","I_Helipilot_F","I_helicrew_F"];
_jetpilots = ["B_Pilot_F","O_Pilot_F","I_Pilot_F"];

_heli_nocopilot = ["B_Heli_Transport_01_camo_F",
					   "B_CTRG_Heli_Transport_01_tropic_F",
					   "B_Heli_Transport_01_F",
					   "I_Heli_Transport_02_F",
					   "O_Heli_Light_02_F",
					   "O_Heli_Light_02_unarmed_F",
					   "B_Heli_Light_01_armed_F",
					   "B_Heli_Transport_03_F"];
_jet_nocopilot = ["B_T_VTOL_01_armed_F",
				  "B_T_VTOL_01_infantry_F",
				  "B_T_VTOL_01_vehicle_F"];

waitUntil {player == player};

_iamhelipilot = ({typeOf player == _x} count _helipilots) > 0;
_iamjetpilot = ({typeOf player == _x} count _jetpilots) > 0;

_uid = getPlayerUID player;
_whitelist = [
				//"76561198030235789" //ben
			 ];
if (_uid in _whitelist) exitWith {};

while { true } do {

	if(vehicle player != player) then {
		_veh = vehicle player;
		//------------------------------ only helipilot
		if((_veh isKindOf "Helicopter") && !(_veh isKindOf "ParachuteBase")) then {
			if(({typeOf _veh == _x} count _heli_nocopilot) > 0) then {
				_forbidden = [_veh turretUnit [0]];
				if(player in _forbidden) then {
					if (!_iamhelipilot) then {
						systemChat "Co-pilot is disabled on this choppah";
						player action ["getOut",_veh];
					};
				};
			};
			if(!_iamhelipilot) then {
				_forbidden = [driver _veh];
				if (player in _forbidden) then {
					systemChat "You must be a helicopter pilot to fly this choppah";
					player action ["getOut", _veh];
				};
			};
		};
		//------------------------------ only jetpilot
		if((_veh isKindOf "Plane") && !(_veh isKindOf "ParachuteBase")) then {
			if(!_iamjetpilot) then {
				if(({typeOf _veh == _x} count _jet_nocopilot) > 0) then {
					/*
					_cfg = configFile >> "CfgVehicles" >> typeOf(_veh);
					_trts = _cfg >> "turrets";
					for "_i" from 0 to (count _trts - 1) do {
						_trt = _trts select _i;
						if( (getNumber(_trt >> "iscopilot") == 1) && (_veh turretUnit [_i] == player) )then {
							systemChat "Co-pilot is disabled on this aircraft";
							player action ["getOut", _veh];
						};
					};
					*/
					_forbidden = [_veh turretUnit [0]];
					if(player in _forbidden) then {
						if (!_iamjetpilot) then {
							systemChat "Co-pilot is disabled on this aircraft";
							player action ["getOut",_veh];
					};
				};
				};
				_forbidden = [driver _veh];
				if (player in _forbidden) then {
					systemChat "You must be a jet pilot to fly this aircraft";
					player action ["getOut", _veh];
				};
			};
		};
		sleep 2;
	};	
};

