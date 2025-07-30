_configDrone = {
	params["_vehicle","_configDrone","_handleDrone"];
	_vehicle addAction ["<img size='1.5' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa'/> <t color=""#37A9E7"">" + localize 'STR_misc_drone_resupply' + "</t>", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_hasRGO = [_caller, 'HandGrenade'] call BIS_fnc_hasItem;
		_hasRGN = [_caller, 'MiniGrenade'] call BIS_fnc_hasItem;
		if(_hasRGO or _hasRGN) then 
		{
			if(_hasRGO) then { _caller removeItem "HandGrenade"; };
			if(_hasRGN) then { _caller removeItem "MiniGrenade"; };
			_configDrone = (_this select 3) select 0;
			_handleDrone = (_this select 3) select 1;
			_target removeAction _actionId;
			[_target, _configDrone, _handleDrone] spawn _handleDrone;
		} 
		else 
		{
			_id = owner _caller;
			[localize "STR_misc_drone_unable."] remoteExec ["hint", _id];
		};
	}, [_configDrone, _handleDrone], 2, true, true, "", "!(_this in _target)", 5];
};
_handleDrone = {
	params["_vehicle","_configDrone","_handleDrone"];
	_gren = createSimpleObject ["A3\Weapons_f\ammo\Handgrenade", [0,0,0]];
	_gren attachTo [_vehicle, [0,0,-0.15]];
	_vehicle setVariable ["grenade", _gren];
	{
		_x addAction ["<img size='1.5' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa'/> <t color=""#37A9E7"">" + localize 'STR_misc_drone_drop' + "</t>", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_configDrone = (_this select 3) select 0;
			_handleDrone = (_this select 3) select 1;
			_vehicle = vehicle _caller;
			_gren = _vehicle getVariable ["grenade", objNull];
			detach _gren;
			deleteVehicle _gren;
			_droneVelocity = velocity _vehicle;
			_pos = _target modelToWorld [0,0,-0.15];
			_gren = "Grenade" createvehicle _pos;
			_gren setVectorDirandUp [[0,0,-1],[0.1,0.1,1]]; 
			_gren setVelocity [_droneVelocity select 0, _droneVelocity select 1,-1];
			{ _x removeAction _actionId; } forEach [gunner _vehicle, driver _vehicle];
			[_vehicle, _configDrone, _handleDrone] spawn _configDrone;
			_pos = getPosATL _gren;
			//Bigger explosion
			waitUntil { !alive _gren };
			_bombType = "IEDLandBig_Remote_Ammo" createVehicle [_pos select 0, _pos select 1, 0];
			_bombType setDamage 1;
		}, [_configDrone, _handleDrone]];
	}forEach [gunner _vehicle, driver _vehicle];
};
_explosiveDrone = {
	_veh = _this select 0;
	if(isNull _veh) exitWith {};

	waitUntil {(damage _veh) > 0.8};
	bomb = "IEDUrbanBig_Remote_Ammo" createVehicle (_veh modelToWorld [0,0,-0.5]); //Spawn a bomb
	bomb setDamage 1;
	deleteVehicle _veh;
};
_drone = param[0];
[_drone, _configDrone, _handleDrone] spawn _handleDrone;
[_drone] spawn _explosiveDrone;