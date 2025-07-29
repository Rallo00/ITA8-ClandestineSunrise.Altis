/* Make some (random) units of a side surrender in given area and range */
params["_position","_distance","_side"];
_unitsToSurrender = [_position nearEntities ["Man", _distance], {side _x == _side}] call BIS_fnc_conditionalSelect;
{
	if ((random 1) > 0.4) then {
		_x setCaptive true; _x action ["surrender", _x]; 
		//Depose arms
		private _box = "Box_NATO_Wps_F" createVehicle (getPos _x);
		_box allowDamage false;
		clearItemCargoGlobal _box;
		clearMagazineCargoGlobal _box;
		clearWeaponCargoGlobal _box;
		clearBackpackCargoGlobal _box;
		// Move unit loadout (no uniform) within the crate
		private _loadout = getUnitLoadout _x;
		for "_i" from 0 to 2 do {
			if !(_loadout select _i isEqualTo []) then {
				_box addWeaponWithAttachmentsCargoGlobal [_loadout select _i, 1];
			};
		};
		{_box addMagazineCargoGlobal [_x,1]} forEach (magazines _x);
		{_box addItemCargoGlobal [_x,1]} forEach (assignedItems _x);
		{_box addItemCargoGlobal [_x,1]} forEach (items _x);
		{_box addItemCargoGlobal [_x,1]} forEach [vest _x, headgear _x, goggles _x];
		private _backpack = backpack _x;
		if (_backpack != "") then {
			// because backpacks are often subclasses containing items
			_backpack = _backpack call A3A_fnc_basicBackpack;
			_box addBackpackCargoGlobal [_backpack, 1];
		};
		//Leave only uniform
		_x setUnitLoadout [ [], [], [], [uniform _unit, []], [], [], "", "", [], ["","","","","",""] ];
	};
} forEach _unitsToSurrender;