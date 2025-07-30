params ["_pos", "_isFriendly"];
_debug = false;
_vehicleArray = [];
_unitsArray = [];
_side = 0;
_safePos = position ([_pos, 10] call BIS_fnc_nearestRoad);
if(_safePos select 0 == 0) then { _safePos = _pos; }; //Check if not found

//Check whether is friendly or not
if(_isFriendly) then { _unitsArray = FWK_FriendlyInfantryArray; _vehicleArray = FWK_FriendlyLightArray; _side = FWK_PlayerSide; }
else { _unitsArray = FWK_EnemyInfantryArray; _vehicleArray = FWK_EnemyLightArray; _side = FWK_EnemySide; };
//Spawn vehicle
_randomTypeLV = selectRandom _vehicleArray;
_veh = [_safePos, random 360, _randomTypeLV, _side] call BIS_fnc_spawnVehicle;
//Waypoint to hold position
_grp = group (_veh select 0);
_holdWp = _grp addWaypoint [_grp, 0];
_holdWp setWaypointType "HOLD";
_holdWp setWaypointBehaviour "AWARE";
_grp setCurrentWaypoint [_grp, 0];
//Spawn units
_groupUnitsCount = 6;
_groupUnitsArray = + _unitsArray;
_groupUnitsArray resize _groupUnitsCount;
_grpUnits = [_pos, _side, _groupUnitsArray] call BIS_fnc_spawnGroup;
_grpUnits enableDynamicSimulation true;
//Waypoint to hold position
_holdWpUnits = _grpUnits addWaypoint [_grpUnits, 0];
_holdWpUnits setWaypointType "HOLD";
_holdWpUnits setWaypointBehaviour "AWARE";
//Enabling dynamic simulation
_grpUnits setCurrentWaypoint [_grpUnits, 0];
//Debug
if(_debug) then {
    _marker = createMarker [format ["%1",_pos], _pos];
    _marker setMarkerText format ["Roadblock: %1", _randomTypeLV];
    _marker setMarkerSize [1,1];
    _marker setMarkerType "hd_dot";
    hint format["Position: %1\nSafe pos: %2\nSide: %3\nFriendly: %4\nVehicleArray: %5", _pos, _safePos, _side, _isFriendly, _vehicleArray];
    systemChat "fn_roadblock is in debug mode.";
};