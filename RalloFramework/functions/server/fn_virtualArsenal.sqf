/* Adds virtual arsenal to the given object */
_object = param[0];
if(isNil "_object") exitWith { systemChat "fn_addVA: _object not defined"; };

clearMagazineCargo _object;
clearItemCargo _object;
clearWeaponCargo _object;
_object allowDamage false;
//_object addAction ["<t color='#C48214' size='2'>" + localize "STR_misc_arsenal" + "</t>","['Open',true] spawn BIS_fnc_arsenal;"];
_icon = "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa";
[_object,localize 'STR_misc_arsenal', _icon, _icon, "_this distance _target < 8", "(_caller distance _target < 8)", {}, {}, {['Open',true] spawn BIS_fnc_arsenal}, {}, [], 0.5, 10, false, false, true] call BIS_fnc_holdActionAdd;
