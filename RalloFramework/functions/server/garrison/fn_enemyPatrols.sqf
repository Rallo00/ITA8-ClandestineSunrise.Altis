/* Make some (random) units of a side spawn in area */
params["_pos", "_patrolledAreaSize", "_patrolCount", "_hasVehicle"];
private _debug = false;

//Debug
if(_debug) then { 
	hint format["", _patrolledAreaSize, count allPlayers, _unitsCount, _sv, _lv, _hv]; 
	systemChat "fn_enemyPatrols is in debug mode.";
};

//Spawning infantry
for "_i" from 1 to _patrolCount do
{
	private _randomSpawnPos = [_pos, 1, _patrolledAreaSize, 5, 0, 360, 0] call BIS_fnc_findSafePos;
	private _groupUnitsCount = random [4,6,8];
	_groupUnitsArray = + FWK_EnemyInfantryArray;
	_groupUnitsArray resize _groupUnitsCount;
	private _grp = [_randomSpawnPos, FWK_EnemySide, _groupUnitsArray] call BIS_fnc_spawnGroup;
	sleep 5;
	//Patrol area
	[_grp, _pos, _patrolledAreaSize] call BIS_fnc_taskPatrol;
};

//Spawning vehicle
if(_hasVehicle) then 
{
	private _randomTypeLV = selectRandom ([FWK_EnemyFaction] call FWK_fnc_getFactionLV);
	private _randomSpawnPos = [_pos, 1, _patrolledAreaSize, 10, 0, 360, 0] call BIS_fnc_findSafePos;
	_veh = [_randomSpawnPos, random 360, _randomTypeLV, FWK_EnemySide] call BIS_fnc_spawnVehicle;
	[group (_veh select 0), _randomSpawnPos, _patrolledAreaSize] call BIS_fnc_taskPatrol;
	sleep 3;
};