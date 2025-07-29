params["_unit", "_destinationGrid"];
//Calculating new position
_gridPos = (_destinationGrid call BIS_fnc_gridToPos) select 0;
_gridPos pushBack 0;
//Checking if player has vehicle
if (vehicle _unit == _unit) then { _unit setPos _gridPos; }
else 
{ 
	_veh = vehicle _unit;
	_veh setPos _gridPos;
	_unit moveInCargo _veh;
};