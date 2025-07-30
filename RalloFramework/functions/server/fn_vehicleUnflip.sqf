_veh = param[0];
_icon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa";
[_veh, localize "STR_misc_vehicle_unflip", _icon, _icon, 
    "((vectorUp _target) vectorCos (surfaceNormal getPos _target) < 0.5) && (_this distance _target < 4)", 
    "(vectorUp _target) vectorCos (surfaceNormal getPos _target) < 0.5", 
    {}, {}, 
    { 
		params ["_vehicle", "_caller", "_actionId", "_arguments"];
		_vehicle setpos [(getpos _vehicle) select 0, (getpos _vehicle) select 1, 0.5]; _vehicle setVectorUp surfaceNormal position _vehicle;
	}, 
    {}, [], 0.5, 10, false, false, true
] call BIS_fnc_holdActionAdd;