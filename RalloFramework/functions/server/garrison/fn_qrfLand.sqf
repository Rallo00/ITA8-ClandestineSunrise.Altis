//Infantry QRF of _side from random far start position to _destination
params["_pos", "_isFriendly"];
if(isNil "_pos") exitWith { systemChat "fn_qrfLand: _pos not defined"; };
if(isNil "_isFriendly") exitWith { systemChat "fn_qrfLand: _isFriendly not defined"; };

_debug = false;
_side = 0;
_unitsArray = [];

//Handling friendly or enemy
if(_isFriendly) then { _side = FWK_PlayerSide; _unitsArray = + FWK_FriendlyInfantryArray; } 
else { _side = FWK_EnemySide; _unitsArray = + FWK_EnemyInfantryArray; };

//Spawning group
_groupSize = [4,10] call BIS_fnc_randomInt;
_unitsArray resize _groupSize;
//Random position around given position
_randomSpawnPosition = [_pos, 800, 1000] call BIS_fnc_findSafePos;
_spawnedGroup = [_randomSpawnPosition, _side, _unitsArray] call BIS_fnc_spawnGroup;

//Setting waypoint towards first player
_waypoint = _spawnedGroup addWaypoint [position (allPlayers select 0), 0];
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointType "MOVE";
_waypoint setWaypointStatements ["true",""];
_spawnedGroup setCurrentWaypoint [_spawnedGroup, 0];
if(_debug) then {
	_marker = createMarker [format ["%1",_randomSpawnPosition], _randomSpawnPosition];
    _marker setMarkerText format ["QRF LAND: %1 units", _groupSize];
    _marker setMarkerSize [1,1];
    _marker setMarkerType "hd_dot";
	hint format["Has vehicle: %1\nFriendly: %2\nGroup size: %3\nSide: %4\nPosition: %5\nUnits Array: %6", _addVehicle, _isFriendly, _groupSize, _side, _randomSpawnPosition, _unitsArray];
};