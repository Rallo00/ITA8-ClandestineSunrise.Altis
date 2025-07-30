_unit = param[0];
_haloAltitude = 1000;

_haloLocation = [] call FWK_fnc_getMapClickPos;
_unitLoadout = getUnitLoadout _unit;
cutText ["H.A.L.O. in progress...", "BLACK OUT", 1];
sleep 1;
openMap false;
_unit setPos _haloLocation;
_unit addBackpack "B_Parachute";
//Halo
[_unit, _haloAltitude] call bis_fnc_halo;
sleep 2;
cutText ["", "BLACK IN", 1];
waitUntil {(getpos _unit select 2) < 2};
//Giving loadout back
sleep 1;
_unit setUnitLoadout _unitLoadout;
