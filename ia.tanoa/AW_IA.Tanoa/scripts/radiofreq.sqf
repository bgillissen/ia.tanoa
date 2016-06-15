[] spawn {

	waitUntil {!isNull player};
	waitUntil {player == player};
	
	//when player enter a vehicle
	player addEventHandler ["GetInMan", {
		_veh = _this select 2;
		_pos = _this select 1;		
		if ( _pos == "cargo" ) exitWith{}; 
		_haveVehRadio =  _veh call TFAR_fnc_hasVehicleRadio;
		if ( _haveVehRadio ) then {
			[(call TFAR_fnc_activeLrRadio), 1, "50"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeLrRadio), 2, "60"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeLrRadio), 3, "70"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeLrRadio), 4, "80"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeLrRadio), 5, "90"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeLrRadio), 6, "100"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeLrRadio), 7, "110"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeLrRadio), 8, "120"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeLrRadio), 9, "130"] call TFAR_fnc_SetChannelFrequency;
			systemChat "Vehicle Frequencies set";
		}; 
	}];
	
	//when a player pickup a radio from container
	player addEventHandler ["Take", {
		_item = _this select 2; 
		if ( _item == "tf_anprc152" ) then {
			[(call TFAR_fnc_activeSwRadio), 1, "300"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeSwRadio), 2, "310"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeSwRadio), 3, "320"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeSwRadio), 4, "330"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeSwRadio), 5, "340"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeSwRadio), 6, "350"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeSwRadio), 7, "360"] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_fnc_activeSwRadio), 8, "370"] call TFAR_fnc_SetChannelFrequency;
			//systemChat "ShortWave Frequencies set";
		};
		if ( _item == "tf_rt1523g" ||
    		 _item == "tf_rt1523g_big" ||
    		 _item == "tf_rt1523g_black" ||
    		 _item == "tf_rt1523g_fabric" ||
    		 _item == "tf_rt1523g_green" ||
    		 _item == "tf_rt1523g_rhs" ||
    		 _item == "tf_rt1523g_sage" ) then {
    		 [(call TFAR_fnc_activeLrRadio), 1, "50"] call TFAR_fnc_SetChannelFrequency;
			 [(call TFAR_fnc_activeLrRadio), 2, "60"] call TFAR_fnc_SetChannelFrequency;
			 [(call TFAR_fnc_activeLrRadio), 3, "70"] call TFAR_fnc_SetChannelFrequency;
			 [(call TFAR_fnc_activeLrRadio), 4, "80"] call TFAR_fnc_SetChannelFrequency;
			 [(call TFAR_fnc_activeLrRadio), 5, "90"] call TFAR_fnc_SetChannelFrequency;
			 [(call TFAR_fnc_activeLrRadio), 6, "100"] call TFAR_fnc_SetChannelFrequency;
			 [(call TFAR_fnc_activeLrRadio), 7, "110"] call TFAR_fnc_SetChannelFrequency;
			 [(call TFAR_fnc_activeLrRadio), 8, "120"] call TFAR_fnc_SetChannelFrequency;
			 [(call TFAR_fnc_activeLrRadio), 9, "130"] call TFAR_fnc_SetChannelFrequency;
			//systemChat "LongRange Frequencies set";
		};
	}];

	//when a player close the arsenal	
	player setVariable [ "VAcatch", [ "VAcatch", "onEachFrame", { 
    	if ( !( isNil { _this getVariable "VAcatch" } ) && { !( isNull ( uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ] ) ) } ) then { 
        	_this setVariable [ "VAcatch", nil ];
        	_thread = _this spawn { 
            	waitUntil { isNull ( uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ] )  };
            	sleep 2;
				_haveLrRadio = call TFAR_fnc_haveLRRadio;
				if ( _haveLrRadio ) then {
					[(call TFAR_fnc_activeLrRadio), 1, "50"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 2, "60"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 3, "70"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 4, "80"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 5, "90"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 6, "100"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 7, "110"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 8, "120"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeLrRadio), 9, "130"] call TFAR_fnc_SetChannelFrequency;
					systemChat "LongRange Frequencies set";
				};
				sleep 2;
				_haveSwRadio = call TFAR_fnc_haveSWRadio;
				if ( _haveSwRadio ) then {
					[(call TFAR_fnc_activeSwRadio), 1, "300"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeSwRadio), 2, "310"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeSwRadio), 3, "320"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeSwRadio), 4, "330"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeSwRadio), 5, "340"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeSwRadio), 6, "350"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeSwRadio), 7, "360"] call TFAR_fnc_SetChannelFrequency;
					[(call TFAR_fnc_activeSwRadio), 8, "370"] call TFAR_fnc_SetChannelFrequency;
					systemChat "ShortWave Frequencies set";
				}; 
				_this setVariable [ "VAcatch", "VAcatch" ];
        	}; 
    	};  
	}, player ] call BIS_fnc_addStackedEventHandler ]; 

};