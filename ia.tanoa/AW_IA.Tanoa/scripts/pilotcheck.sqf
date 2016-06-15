// Original pilotcheck by Kamaradski [AW]. 
// Since then been tweaked by many hands!
// Notable contributors: chucky [allFPS], Quiksilver.

_helipilots = ["rhsusf_army_ocp_helipilot"];
_jetpilots = ["rhsusf_airforce_jetpilot"];

_aircraft_nocopilot = ["RHS_UH60M_d", 
					   "RHS_UH60M_MEV2_d",
					   "RHS_CH_47F_10", 
					   "rhsusf_CH53E_USMC_D", 
					   "RHS_MELB_AH6M_M"];

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
			if(({typeOf _veh == _x} count _aircraft_nocopilot) > 0) then {
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

