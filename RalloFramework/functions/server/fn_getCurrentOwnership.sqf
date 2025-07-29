/* Returns the faction that owns the given area/sector */
params["_position","_range"];
_westCount = [_position, _range, west] call FWK_fnc_getUnitsCount;
_eastCount = [_position, _range, east] call FWK_fnc_getUnitsCount;
_indeCount = [_position, _range, independent] call FWK_fnc_getUnitsCount;
_result = "civilian";
if (_westCount > _eastCount && _westCount > _indeCount) then { _result = "west"; };
if (_westCount > _eastCount && _westCount < _indeCount) then { _result = "independent"; };
if (_eastCount > _westCount && _eastCount > _indeCount) then { _result = "east"; };
if (_eastCount > _westCount && _eastCount < _indeCount) then { _result = "independent"; };
if (_indeCount > _westCount && _indeCount > _eastCount) then { _result = "independent"; };
if (_indeCount > _westCount && _indeCount < _eastCount) then { _result = "east"; };
_result;