_debug = false;
_cooldown = 120;	//Timer of which updates the markers

while {true} do {

	//Debug
	if(_debug) then { systemChat "fn_enemyPosIntel in debug"; };

    [] call fnc_broadcastPositions;
    if(_debug) then { sleep 10; } else { sleep _cooldown; };
};

fnc_broadcastPositions = {
	private _markerPrefix = "posIntel_";

	//Delete old markers
	{
		if (str _x find _markerPrefix != -1) then {
			deleteMarker _x;
		};
	} forEach allMapMarkers;

	//Get enemy pos
	private _enemyPosList = [];
	{
		if ((captive _x == false) && alive _x && { _x isKindOf "Man"} && (side _x == FWK_EnemySide)) then {
			_enemyPosList pushBack (getPos _x);
		};
	} forEach allUnits;

	//Debug
	if(_debug) then { systemChat format["Enemy units count: %1", count _enemyPosList]; };

	//Create markers
	{
		private _pos = _x;
		private _markerName = format ["%1%2", _markerPrefix, random 10000];
		private _m = createMarker [_markerName, _pos];
		_m setMarkerType "mil_warning";
		_m setMarkerSize [0.5, 0.5];
		_m setMarkerColor "ColorOPFOR";
		_m setMarkerAlpha 0.8;
	} forEach _enemyPosList;
};