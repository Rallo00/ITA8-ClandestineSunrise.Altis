/* Cleans up all object in a given position and range */
params["_position","_distance"];
{deleteVehicle _x} forEach nearestObjects [_position, ["all"], _distance] + allUnits;
