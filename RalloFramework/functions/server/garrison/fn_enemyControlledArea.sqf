/* Make some (random) units of a side spawn in area */
params["_pos", "_patrolledAreaSize", "_criticalLevel"];

private _debug = false;
private _playersCount = count allPlayers;
private _unitsCount = 0;
private _minimumCoveragePerUnit = 20;

// Adjusted to be proportional to the total area
if(_patrolledAreaSize <= 100) then { _minimumCoveragePerUnit = 20; _unitsCount = _minimumCoveragePerUnit + (_patrolledAreaSize / _minimumCoveragePerUnit * 0.3); };
if(_patrolledAreaSize <= 200 && _patrolledAreaSize > 100) then { _minimumCoveragePerUnit = 30; _unitsCount = _minimumCoveragePerUnit + (_patrolledAreaSize / _minimumCoveragePerUnit * 0.3); };
if(_patrolledAreaSize <= 500 && _patrolledAreaSize > 200) then { _minimumCoveragePerUnit = 35; _unitsCount = _minimumCoveragePerUnit + (_patrolledAreaSize / _minimumCoveragePerUnit * 0.3); };
if(_patrolledAreaSize > 500) then { _minimumCoveragePerUnit = 40; _unitsCount = _minimumCoveragePerUnit + (_patrolledAreaSize / _minimumCoveragePerUnit * 0.3); };

//Handle vehicles with critical level
private _lv = 0;	//Light vehicle
private _hv = 0;	//Heavy vehicle
private _sv = 0;	//Static vehicle
if (_criticalLevel == 1) then { _sv = 2; _lv = 1; };
if (_criticalLevel == 2) then { _sv = 4; _lv = 2; };
if (_criticalLevel == 3 || _criticalLevel > 3) then { _sv = 6; _lv = 2; _hv = 2; };

//Debug
if(_debug) then { hint format["Area: %1\nPlayers count: %2\nEnemy count: %3\nStatic count: %4\nLV count: %5\nHV count: %6", _patrolledAreaSize, _playersCount, _unitsCount, _sv, _lv, _hv]; };

//Spawning infantry
for "_i" from 1 to (_unitsCount / 8) do
{
	private _randomSpawnPos = [_pos, 1, _patrolledAreaSize, 5, 0, 360, 0] call BIS_fnc_findSafePos;
	private _groupUnitsCount = 8;
	_groupUnitsArray = + FWK_EnemyInfantryArray;
	_groupUnitsArray resize _groupUnitsCount;
	private _grp = [_randomSpawnPos, FWK_EnemySide, _groupUnitsArray] call BIS_fnc_spawnGroup;
	sleep 5;
	//Patrol area
	[_grp, _pos, _patrolledAreaSize] call BIS_fnc_taskPatrol;
	//Enabling dynamic simulation
	_grp enableDynamicSimulation true;
};
//Spawning statics
for "_j" from 1 to _sv do 
{
	private _randomTypeStatic = selectRandom ([FWK_EnemyFaction] call FWK_fnc_getFactionStatic);
	private _randomSpawnPos = [_pos, 1, _patrolledAreaSize, 5, 0, 360, 0] call BIS_fnc_findSafePos;
	[_randomSpawnPos, random 360, _randomTypeStatic, FWK_EnemySide] call BIS_fnc_spawnVehicle;
	sleep 3;
};
//Spawning LV
for "_z" from 1 to _lv do 
{
	private _randomTypeLV = selectRandom ([FWK_EnemyFaction] call FWK_fnc_getFactionLV);
	private _randomSpawnPos = [_pos, 1, _patrolledAreaSize, 10, 0, 360, 0] call BIS_fnc_findSafePos;
	_veh = [_randomSpawnPos, random 360, _randomTypeLV, FWK_EnemySide] call BIS_fnc_spawnVehicle;
	[group (_veh select 0), _randomSpawnPos, _patrolledAreaSize] call BIS_fnc_taskPatrol;
	//Enabling dynamic simulation
	group (_veh select 0) enableDynamicSimulation true;
	sleep 3;
};
//Spawning HV
for "_y" from 1 to _hv do 
{
	private _randomTypeHV = selectRandom ([FWK_EnemyFaction] call FWK_fnc_getFactionHV);
	private _randomSpawnPos = [_pos, 1, _patrolledAreaSize, 10, 0, 360, 0] call BIS_fnc_findSafePos;
	_veh = [_randomSpawnPos, random 360, _randomTypeHV, FWK_EnemySide] call BIS_fnc_spawnVehicle;
	[group (_veh select 0), _randomSpawnPos, _patrolledAreaSize] call BIS_fnc_taskPatrol;
	//Enabling dynamic simulation
	group (_veh select 0) enableDynamicSimulation true;
	sleep 3;
};
