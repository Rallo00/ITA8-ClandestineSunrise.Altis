_kamikaze = param[0];
if(isNull _kamikaze || !alive _kamikaze) exitWith { hintSilent "Kamikaze unit not valid. Error."; false };
//Adding vest
_kamikaze addVest "V_DeckCrew_brown_F";
//Adding explosives
_expl1 = "DemoCharge_Remote_Ammo" createVehicle position _kamikaze;
_expl1 attachTo [_kamikaze, [-0.1, 0.1, 0.15], "Pelvis"];
_expl1 setVectorDirAndUp [[0.5, 0.5, 0], [-0.5, 0.5, 0]];
_expl2 = "DemoCharge_Remote_Ammo" createVehicle position _kamikaze;
_expl2 attachTo [_kamikaze, [0, 0.15, 0.15], "Pelvis"];
_expl2 setVectorDirAndUp [[1, 0, 0], [0, 1, 0]];
_expl3 = "DemoCharge_Remote_Ammo" createVehicle position _kamikaze;
_expl3 attachTo [_kamikaze, [0.1, 0.1, 0.15], "Pelvis"];
_expl3 setVectorDirAndUp [[0.5, -0.5, 0], [0.5, 0.5, 0]];
waitUntil { {_x distance _kamikaze < 30} count allPlayers > 0 };
//Find nearest unit
_nearestUnit = 0;
_nearestMen = nearestObjects ([_kamikaze,["Man"], 30]);
{ if(faction _x == FWK_PlayerFaction) then { _nearestUnit = _x; break; }; }forEach _nearestMen;
//Run
_kamikaze doMove position _nearestUnit;
//Wait until close
waitUntil { {_x distance _kamikaze < 8} count allPlayers > 0 };
//Boom!
_expl1 setDammage 1;
_expl2 setDammage 1;
_expl3 setDammage 1;
_crater = createSimpleObject ["Land_ShellCrater_01_F", AGLtoASL getpos _kamikaze];
_crater setDir random 359;
deleteVehicle _kamikaze;
