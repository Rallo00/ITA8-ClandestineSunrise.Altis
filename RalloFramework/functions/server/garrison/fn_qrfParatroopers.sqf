//Paratroopers QRF of _side from random far start position to _destination
params["_destination","_isFriendly"];
if(isNil "_destination") exitWith { systemChat "fn_qrfParatroopers: _destination not defined"; };
if(isNil "_isFriendly") exitWith { systemChat "fn_qrfParatroopers: _isFriendly not defined"; };
private _heloArray = [];
private _side = 0;
private _infantryArray = [];
private _debug = false;

//Handling friendly or enemy
if(_isFriendly) then { 
	_heloArray = + FWK_FriendlyHeloArray; 
	_side = FWK_PlayerSide; 
	_infantryArray = + FWK_FriendlyInfantryArray; 
} else { 
	_heloArray = + FWK_EnemyHeloArray; 
	_side = FWK_EnemySide; 
	_infantryArray = + FWK_EnemyInfantryArray; 
};

//debug
if(_debug) then {
	systemChat format["Destination: %1", _destination];
	systemChat format["IsFriendly: %1", _isFriendly];
	systemChat format["Side: %1", _side];
	hint format["HELO ARRAY:\n%1\n\nINFANTRY ARRAY:\n%2", _heloArray, _infantryArray];
};

_startPos = [_destination, 3000, 5000] call FWK_fnc_getRandomAOLocation;
_landingPos = [_destination, 25, 75] call FWK_fnc_getRandomAOLocation;
_heloType = selectRandom _heloArray;
_spawnHelo = [_startPos, random 360, _heloType, _side] call BIS_fnc_spawnVehicle;
_heloObj = _spawnHelo select 0;
_heloGrp = _spawnHelo select 2;
//Spawning units in transport based on free seats
_cargoSize = _heloObj emptyPositions "cargo";
_groupUnitsArray = + _infantryArray;
_groupUnitsArray resize _cargoSize;
_qrfGrp = [_startPos, _side, _groupUnitsArray] call BIS_fnc_spawnGroup;
{ _x moveInCargo _heloObj } forEach units _qrfGrp;
//Giving parachute
{ removeBackpack _x; _x addBackpack "B_Parachute"; } forEach units _qrfGrp;

while {(count (waypoints _heloGrp)) != 0} do {deleteWaypoint ((waypoints _heloGrp) select 0);};
while {(count (waypoints _qrfGrp)) != 0} do {deleteWaypoint ((waypoints _qrfGrp) select 0);};
sleep 0.2;
{_x doFollow leader _heloGrp} foreach units _heloGrp;
{_x doFollow leader _qrfGrp} foreach units _qrfGrp;
sleep 0.2;

_heloObj flyInHeight 100;

_waypoint = _heloGrp addWaypoint [ _destination, 25];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 100;
_waypoint = _heloGrp addWaypoint [ _destination, 25];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 100;
_waypoint = _heloGrp addWaypoint [ _destination, 700];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 100;
_waypoint = _heloGrp addWaypoint [ _destination, 700];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 100;
_waypoint = _heloGrp addWaypoint [ _destination, 700];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 100;
_heloGrp setCurrentWaypoint [ _heloGrp, 1];

_waypoint = _qrfGrp addWaypoint [ _destination, 100];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointCombatMode "GREEN";
_waypoint setWaypointCompletionRadius 50;
_waypoint = _qrfGrp addWaypoint [ _destination, 100];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;
_heloGrp setCurrentWaypoint [ _qrfGrp, 1];

_heloObj flyInHeight 100;

waitUntil { sleep 1;
	!(alive _heloObj) || (damage _heloObj > 0.2 ) || (_heloObj distance _destination < 400 )
};

_heloObj flyInHeight 100;
{
	unassignVehicle _x;
	moveout _x;
	sleep 0.5;
} foreach (units _qrfGrp);

_heloObj flyInHeight 100;

sleep 0.2;
while {(count (waypoints _heloGrp)) != 0} do {deleteWaypoint ((waypoints _heloGrp) select 0);};
while {(count (waypoints _qrfGrp)) != 0} do {deleteWaypoint ((waypoints _qrfGrp) select 0);};
sleep 0.2;
{_x doFollow leader _heloGrp} foreach units _heloGrp;
{_x doFollow leader _qrfGrp} foreach units _qrfGrp;
sleep 0.2;

_heloObj flyInHeight 100;

_waypoint = _qrfGrp addWaypoint [ _destination, 100];
_waypoint setWaypointType "SAD";
_waypoint = _qrfGrp addWaypoint [ _destination, 100];
_waypoint setWaypointType "SAD";
_waypoint = _qrfGrp addWaypoint [ _destination, 100];
_waypoint setWaypointType "SAD";
_waypoint = _qrfGrp addWaypoint [ _destination, 100];
_waypoint setWaypointType "SAD";
_waypoint = _qrfGrp addWaypoint [ _destination, 100];
_waypoint setWaypointType "SAD";
_heloGrp setCurrentWaypoint [ _qrfGrp, 1];

//After 40 seconds delete helo and crew inside
sleep 40;
_heloPilot = leader _heloGrp;
_heloPilot doMove ([0,0,0]);
{deleteVehicle _x} forEach (crew _heloObj) + [_heloObj]; 