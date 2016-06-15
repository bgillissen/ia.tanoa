if (playerSide == west) then {

	_handle=createdialog "AW_INTRO";

	sleep 1800;
	_Ts_Hint = "<t align='center'><t size='2'><t color='#FAAF3A'>Join us on TeamSpeak</t><br/><br/>_____________<br/><br/><t size='1.5'><t color='#FAAF3A'>ts.taskforceunicorn.com<br/></t>";
	[_Ts_Hint] remoteExec ["AW_fnc_globalHint",0,false];
	sleep 1800;
	_Ts_Hint = "<t align='center'><t size='1.5'><t color='#FAAF3A'>VON is disabled</t><br/>  <t size='1.5'><br/>So instead join us on Teamspeak<br/>  <br/><t color='#FAAF3A'>ts.taskforceunicorn.com<br/></t>";
	[_Ts_Hint] remoteExec ["AW_fnc_globalHint",0,false];
	sleep 1800;
	_Ts_Hint = "<t align='center'><t size='2'><t color='#FAAF3A'>Join us on TeamSpeak</t><br/><br/>_____________<br/><br/><t size='1.5'><t color='#FAAF3A'>ts.taskforceunicorn.com<br/></t>";
	[_Ts_Hint] remoteExec ["AW_fnc_globalHint",0,false];
	sleep 1800;
	_Ts_Hint = "<t align='center'><t size='1.5'><t color='#FAAF3A'>VON is disabled</t><br/>  <t size='1.5'><br/>So instead join us on Teamspeak<br/><br/><t color='#FAAF3A'>ts.taskforceunicorn.com<br/></t>";
	[_Ts_Hint] remoteExec ["AW_fnc_globalHint",0,false];
};