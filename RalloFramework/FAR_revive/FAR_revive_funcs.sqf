////////////////////////////////////////////////
// Player Actions
////////////////////////////////////////////////
FAR_Player_Actions =
{
	if (alive player && player isKindOf "Man") then
	{
		// addAction args: title, filename, (arguments, priority, showWindow, hideOnUse, shortcut, condition, positionInModel, radius, radiusView, showIn3D, available, textDefault, textToolTip)
		player addAction ["<img size='1.5' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa'/> <t color=""#FF0000"">" + localize 'STR_revive_heal' + "</t>", "RalloFramework\FAR_revive\FAR_handleAction.sqf", ["action_revive"], 10, true, true, "", "call FAR_Check_Revive"]; //+ Heal
		player addAction ["<img size='1.5' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa'/> <t color=""#FF0000"">" + localize 'STR_revive_suicide' + "</t>", "RalloFramework\FAR_revive\FAR_handleAction.sqf", ["action_suicide"], 9, false, true, "", "call FAR_Check_Suicide"]; //+ Suicide
		player addAction ["<img size='1.5' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa'/> <t color=""#FF0000"">" + localize 'STR_revive_drag' + "</t>", "RalloFramework\FAR_revive\FAR_handleAction.sqf", ["action_drag"], 9, false, true, "", "call FAR_Check_Dragging"]; //+ Drag
	};
};
////////////////////////////////////////////////
// Handle Death
////////////////////////////////////////////////
FAR_HandleDamage_EH =
{
	private ["_unit", "_killer", "_amountOfDamage", "_isUnconscious"];
	_unit = _this select 0;
	_amountOfDamage = _this select 2;
	_killer = _this select 3;
	_isUnconscious = _unit getVariable "FAR_isUnconscious";
	if (alive _unit && _amountOfDamage >= 1 && _isUnconscious == 0) then
	{
		_unit setDamage 0;
		_unit allowDamage false;
		_amountOfDamage = 0;
		[_unit, _killer] spawn FAR_Player_Unconscious;
	};
	_amountOfDamage
};
////////////////////////////////////////////////
// Make Player Unconscious
////////////////////////////////////////////////
FAR_Player_Unconscious =
{
	private["_unit", "_killer"];
	_unit = _this select 0;
	_killer = _this select 1;
	[3000] call BIS_fnc_bloodEffect;
	// Death message
	if (FAR_EnableDeathMessages && !isNil "_killer" && isPlayer _killer && _killer != _unit) then
	{
		FAR_deathMessage = [_unit, _killer];
		publicVariable "FAR_deathMessage";
		["FAR_deathMessage", [_unit, _killer]] call FAR_public_EH;
	};
	if (isPlayer _unit) then
	{
		
		disableUserInput true;
		[0, "BLACK", 0.5, 1] spawn BIS_fnc_fadeEffect;
	};
	// Eject unit if inside vehicle
	if (vehicle _unit != _unit) then
	{
		unAssignVehicle _unit;
		_unit action ["eject", vehicle _unit];
		sleep 2;
	};
	_unit setDamage 0;
    _unit setVelocity [0,0,0];
    _unit allowDamage false;
	_unit setCaptive true;
    _unit playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
    sleep 2;
	if (isPlayer _unit) then
	{
		titleText ["", "BLACK IN", 1];
		sleep 3;
		disableUserInput false;
		// Mute Radio
		_unit setVariable ["ace_sys_wounds_uncon", true];
	};
	_unit switchMove "AinjPpneMstpSnonWrflDnon";
	_unit enableSimulation false;
	_unit setVariable ["FAR_isUnconscious", 1, true];
	// Call this code only on players
	if (isPlayer _unit) then
	{
		_bleedOut = time + FAR_BleedOut;
		[1, "BLACK", 0.5, 1] spawn BIS_fnc_fadeEffect;
		while { !isNull _unit && alive _unit && _unit getVariable "FAR_isUnconscious" == 1 && (FAR_BleedOut <= 0 || time < _bleedOut) } do
		{
			//You will bleedout in 500 seconds.
			hintSilent format["%1 %2 %3\n\n%4", localize "STR_revive_bleedout", round (_bleedOut - time), localize "STR_revive_seconds", call FAR_CheckFriendlies];
			//Camera
			["Initialize", [player, [], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
			sleep 0.5;
		};
		// Player bled out
		if (FAR_BleedOut > 0 && {time > _bleedOut}) then
		{
			_unit setDamage 1;
			//Camera
			["Terminate"] call BIS_fnc_EGSpectator;
		}
		else
		{
			// Player got revived
			_unit setVariable ["FAR_isStabilized", 0, true];
			sleep 6;
			// Clear the "medic nearby" hint
			hintSilent "";
			// Unmute Radio
			if (isPlayer _unit) then
			{
				_unit setVariable ["ace_sys_wounds_uncon", false];
			};
			//Camera
			["Terminate"] call BIS_fnc_EGSpectator;
			_unit enableSimulation true;
			_unit allowDamage true;
			_unit setDamage 0;
			_unit setCaptive false;
			_unit playMove "amovppnemstpsraswrfldnon";
			_unit playMove "";
		};
	}
	else
	{
		// [Debugging] Bleedout for AI
		_bleedOut = time + FAR_BleedOut;
		while { !isNull _unit && alive _unit && _unit getVariable "FAR_isUnconscious" == 1 && _unit getVariable "FAR_isStabilized" == 0 && (FAR_BleedOut <= 0 || time < _bleedOut) } do
		{
			sleep 0.5;
		};
		if (_unit getVariable "FAR_isStabilized" == 1) then {
			while { !isNull _unit && alive _unit && _unit getVariable "FAR_isUnconscious" == 1 } do
			{
				sleep 0.5;
			};
		};
		// AI bled out
		if (FAR_BleedOut > 0 && {time > _bleedOut} && {_unit getVariable ["FAR_isStabilized",0] == 0}) then
		{
			_unit setDamage 1;
			_unit setVariable ["FAR_isUnconscious", 0, true];
			_unit setVariable ["FAR_isDragged", 0, true];
		}
	};
};
////////////////////////////////////////////////
// Revive Player
////////////////////////////////////////////////
FAR_HandleRevive =
{
	private ["_target"];
	_target = _this select 0;
	if (alive _target) then
	{
		player playMove "AinvPknlMstpSnonWrflDnon_AinvPknlMstpSnonWrflDnon_medic";
		[player, _target] spawn FAR_SpawnMedicalTrash;
		player playMove "AinvPknlMstpSnonWrflDnon_medic1";
		player playMove "AinvPknlMstpSnonWrflDnon_medicEnd";
		_target setVariable ["FAR_isUnconscious", 0, true];
		_target setVariable ["FAR_isDragged", 0, true];
		sleep 6;
		// [Debugging] Code below is only relevant if revive script is enabled for AI
		if (!isPlayer _target) then
		{
			_target enableSimulation true;
			_target allowDamage true;
			_target setDamage 0;
			_target setCaptive false;
			_target playMove "amovppnemstpsraswrfldnon";
		};
	};
};
////////////////////////////////////////////////
// Drag Injured Player
////////////////////////////////////////////////
FAR_Drag =
{
	private ["_target", "_id"];
	FAR_isDragging = true;
	_target = _this select 0;
	_target attachTo [player, [0, 1.1, 0.092]];
	_target setDir 180;
	_target setVariable ["FAR_isDragged", 1, true];
	player setAnimSpeedCoef 1.5;
	player playMoveNow "AcinPknlMstpSrasWrflDnon";
	// Rotation fix
	FAR_isDragging_EH = _target;
	publicVariable "FAR_isDragging_EH";
	// Add release action and save its id so it can be removed
	_id = player addAction ["<img size='1.5' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa'/> <t color=""#FF0000"">" + localize 'STR_revive_release' + "</t>", "RalloFramework\FAR_revive\FAR_handleAction.sqf", ["action_release"], 10, true, true, "", "true"];
	hint format["%1", localize "STR_revive_stuck"]; //Press C if you cannot move
	// Wait until release action is used
	waitUntil
	{
		!alive player || player getVariable "FAR_isUnconscious" == 1 || !alive _target || _target getVariable "FAR_isUnconscious" == 0 || !FAR_isDragging || _target getVariable "FAR_isDragged" == 0
	};
	// Handle release action
	FAR_isDragging = false;
	if (!isNull _target && alive _target) then
	{
		_target switchMove "AinjPpneMstpSnonWrflDnon";
		_target setVariable ["FAR_isDragged", 0, true];
		detach _target;
	};
	player removeAction _id;
};
FAR_Release =
{
	// Switch back to default animation
	player setAnimSpeedCoef 1;
	player switchMove "amovpknlmstpsraswrfldnon";
	FAR_isDragging = false;
};
////////////////////////////////////////////////
// Event handler for public variables
////////////////////////////////////////////////
FAR_public_EH =
{
	if(count _this < 2) exitWith {};
	_EH  = _this select 0;
	_target = _this select 1;
	// FAR_isDragging
	if (_EH == "FAR_isDragging_EH") then
	{
		_target setDir 180;
	};
	// FAR_deathMessage
	if (_EH == "FAR_deathMessage") then
	{
		_killed = _target select 0;
		_killer = _target select 1;
		if (isPlayer _killed && isPlayer _killer) then
		{
			systemChat format["%1 %2 %3", name _killed, localize "STR_revive_killedby", name _killer];
		};
	};
};
////////////////////////////////////////////////
// Revive Action Check
////////////////////////////////////////////////
FAR_Check_Revive =
{
	private ["_target", "_isTargetUnconscious", "_isDragged"];
	_return = false;
	// Unit that will excute the action
	_isPlayerUnconscious = player getVariable "FAR_isUnconscious";
	_isMedic = getNumber (configfile >> "CfgVehicles" >> typeOf player >> "attendant");
	_target = cursorTarget;
	// Make sure player is alive and target is an injured unit
	if( !alive player || _isPlayerUnconscious == 1 || FAR_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !FAR_Debugging) || (_target distance player) > 2 ) exitWith
	{
		_return
	};
	_isTargetUnconscious = _target getVariable "FAR_isUnconscious";
	_isDragged = _target getVariable "FAR_isDragged";
	// Make sure target is unconscious and player is a medic
	if (_isTargetUnconscious == 1 && _isDragged == 0 && (_isMedic == 1 || FAR_ReviveMode > 0) ) then
	{
		_return = true;
		// [ReviveMode] Check if player has a Medikit
		if ( FAR_ReviveMode == 2 && !("Medikit" in (items player)) ) then
		{
			_return = false;
		};
	};
	_return
};
////////////////////////////////////////////////
// Stabilize Action Check
////////////////////////////////////////////////
FAR_Check_Stabilize =
{
	private ["_target", "_isTargetUnconscious", "_isDragged"];
	_return = false;
	// Unit that will excute the action
	_isPlayerUnconscious = player getVariable "FAR_isUnconscious";
	_target = cursorTarget;
	// Make sure player is alive and target is an injured unit
	if( !alive player || _isPlayerUnconscious == 1 || FAR_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !FAR_Debugging) || (_target distance player) > 2 ) exitWith
	{
		_return
	};
	_isTargetUnconscious = _target getVariable "FAR_isUnconscious";
	_isTargetStabilized = _target getVariable "FAR_isStabilized";
	_isDragged = _target getVariable "FAR_isDragged";
	// Make sure target is unconscious and hasn't been stabilized yet, and player has a FAK/Medikit
	if (_isTargetUnconscious == 1 && _isTargetStabilized == 0 && _isDragged == 0 && ( ("FirstAidKit" in (items player)) || ("Medikit" in (items player)) ) ) then
	{
		_return = true;
	};
	_return
};
////////////////////////////////////////////////
// Suicide Action Check
////////////////////////////////////////////////
FAR_Check_Suicide =
{
	_return = false;
	_isPlayerUnconscious = player getVariable ["FAR_isUnconscious",0];
	if (alive player && _isPlayerUnconscious == 1) then
	{
		_return = true;
		//Camera
		["Terminate"] call BIS_fnc_EGSpectator;
	};
	_return
};
////////////////////////////////////////////////
// Dragging Action Check
////////////////////////////////////////////////
FAR_Check_Dragging =
{
	private ["_target", "_isPlayerUnconscious", "_isDragged"];
	_return = false;
	_target = cursorTarget;
	_isPlayerUnconscious = player getVariable "FAR_isUnconscious";
	if( !alive player || _isPlayerUnconscious == 1 || FAR_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !FAR_Debugging) || (_target distance player) > 2 ) exitWith
	{
		_return;
	};
	// Target of the action
	_isTargetUnconscious = _target getVariable "FAR_isUnconscious";
	_isDragged = _target getVariable "FAR_isDragged";
	if(_isTargetUnconscious == 1 && _isDragged == 0) then
	{
		_return = true;
	};
	_return
};
////////////////////////////////////////////////
// Show Nearby Friendly Medics
////////////////////////////////////////////////
FAR_IsFriendlyMedic =
{
	private ["_unit"];
	_return = false;
	_unit = _this;
	_isMedic = getNumber (configfile >> "CfgVehicles" >> typeOf _unit >> "attendant");
	if ( alive _unit && (isPlayer _unit || FAR_Debugging) && side _unit == FAR_PlayerSide && _unit getVariable "FAR_isUnconscious" == 0 && (_isMedic == 1 || FAR_ReviveMode > 0) ) then
	{
		_return = true;
	};
	_return
};
FAR_CheckFriendlies =
{
	private ["_unit", "_units", "_medics", "_hintMsg"];
	_units = nearestObjects [getpos player, ["Man", "Car", "Air", "Ship"], 800];
	_medics = [];
	_dist = 800;
	_hintMsg = "";
	// Find nearby friendly medics
	if (count _units > 1) then
	{
		{
			if (_x isKindOf "Car" || _x isKindOf "Air" || _x isKindOf "Ship") then
			{
				if (alive _x && count (crew _x) > 0) then
				{
					{
						if (_x call FAR_IsFriendlyMedic) then
						{
							_medics = _medics + [_x];
							if (true) exitWith {};
						};
					} forEach crew _x;
				};
			}
			else
			{
				if (_x call FAR_IsFriendlyMedic) then
				{
					_medics = _medics + [_x];
				};
			};
		} forEach _units;
	};
	// Sort medics by distance
	if (count _medics > 0) then
	{
		{
			if (player distance _x < _dist) then
			{
				_unit = _x;
				_dist = player distance _x;
			};
		} forEach _medics;
		if (!isNull _unit) then
		{
			_unitName	= name _unit;
			_distance	= floor (player distance _unit);
			_hintMsg = format["%1\n%2 -- %3m.", localize "STR_revive_medicnearby", _unitName, _distance]; //Medic nearby: unit -- 100m
		};
	}
	else
	{
		_hintMsg = format ["%1", localize "STR_revive_nomedicnearby"]; //No medic nearby
	};
	_hintMsg
};
////////////////////////////////////////////////
// Spawn medical trash
////////////////////////////////////////////////
FAR_SpawnMedicalTrash =
{
	params["_medicSoldier","_woundedSoldier"];
	_generalTrash = ["MedicalGarbage_01_5x5_v1_F",
					 "MedicalGarbage_01_3x3_v1_F",
				 	 "MedicalGarbage_01_3x3_v2_F"	
					] call BIS_fnc_selectRandom;
	_blood = ["BloodPool_01_Large_New_F",
			  "BloodSplatter_01_Large_New_F",
		  	  "BloodPool_01_Medium_New_F",
		  	  "BloodSplatter_01_Medium_New_F"
		 	 ] call BIS_fnc_selectRandom;
	//If big blood, big trash
	if(_blood == "BloodPool_01_Large_New_F" || _blood == "BloodSplatter_01_Large_New_F") then
		{ _generalGarbage = "MedicalGarbage_01_5x5_v1_F"; };
	// field medical bag open
	if (random 1 > 0.5) then { randomPos = _medicSoldier getRelPos [1, 45 + random 90]; } // to the right
	else { randomPos = _medicSoldier getRelPos [1, -(45 + random 90)]; }; // to the left 
	_medBag = createSimpleObject ["Land_FirstAidKit_01_open_F", AGLtoASL randomPos];
	_medBag setDir random 359; 
	sleep 1;
	// blood bag
	_randomPos = _medicSoldier getRelPos [0.5 + random 1, random 360]; 
	_bloodBag = createSimpleObject ["Land_BloodBag_F", AGLtoASL _randomPos];
	_bloodBag setDir random 359;  
	sleep 1;
	// bandage new
	_randomPos = _medicSoldier getRelPos [0.5 + random 1, random 360]; 
	_bandage = createSimpleObject ["Land_Bandage_F", AGLtoASL _randomPos];
	_bandage setDir random 359;  
	// blood 
	_bloodPool = createSimpleObject [_blood, AGLtoASL getpos _woundedSoldier];
	_bloodPool setDir random 359; 
	sleep 1;
	// bandage dirty
	_randomPos = _medicSoldier getRelPos [0.5 + random 1, random 360]; 
	_bandageDirty = createSimpleObject ["MedicalGarbage_01_Bandage_F", AGLtoASL _randomPos];
	_bandageDirty setDir random 359;  
	sleep 1;
	// medical garbage 3x3
	_medGarbage = createSimpleObject [_generalTrash, AGLtoASL getpos _woundedSoldier];
	_medGarbage setDir random 359; 
};