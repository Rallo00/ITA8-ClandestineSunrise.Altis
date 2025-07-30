/* Deletes vehicle and crew inside */
_currentVehicle = param[0];
{deleteVehicle _x} forEach (crew _currentVehicle) + [_currentVehicle];
