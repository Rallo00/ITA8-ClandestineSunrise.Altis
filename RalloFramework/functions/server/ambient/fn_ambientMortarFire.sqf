params["_pos", "_shellSel"];
private _debug = false;
private _shellType = 0;
switch (_shellSel) do
{
	case 1: { _shellType = "Sh_82mm_AMOS"; };
	case 2: { _shellType = "Sh_155mm_AMOS"; };
	case 3: { _shellType = "Cluster_155mm_AMOS"; };
	default { _shellType = "Sh_82mm_AMOS"; };
};
_shellCount = [1, 8] call BIS_fnc_randomInt;
_radius = 100;
_delay = 5;
[_pos, _shellType, _radius, _shellCount, _delay] spawn BIS_fnc_fireSupportVirtual;

//Debug
if (_debug) then {
	hint format["Shell count: %1\nRadius: %2\nDelay: %3\nShell type: %4\nPosition: %5", _shellCount, _radius, _delay, _shellType, _pos];
	systemChat "fn_mortarFire.sqf in debug mode.";
};
