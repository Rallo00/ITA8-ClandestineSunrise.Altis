/* Returns a random position around a given position */
params["_location", "_minDistance", "_maxDistance"];
if(isNil "_location") exitWith { systemChat "fn_getRandomAOLocation: _location not defined"; };
if(isNil "_minDistance") exitWith { systemChat "fn_getRandomAOLocation: _minDistance not defined"; };
if(isNil "_maxDistance") exitWith { systemChat "fn_getRandomAOLocation: _maxDistance not defined"; };

//Randomized location
_distance = [_minDistance, _maxDistance] call BIS_fnc_randomInt;
_direction = [0,359] call BIS_fnc_randomInt;
_randomLocation = [_location, _distance, _direction] call BIS_fnc_relPos;
_randomLocation;
