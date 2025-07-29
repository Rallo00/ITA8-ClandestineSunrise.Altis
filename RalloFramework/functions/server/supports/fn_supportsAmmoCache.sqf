params["_cache"];
if (isNil "_cache") exitWith { systemChat "fn_supportsAmmoCache: _cache not defined"; };
_isRhsLoaded = ["usaf"] call FWK_fnc_isModActive;
private _debug = true;

//Debug
if(_debug) then { hint format["RHS Loaded: %1\nCache: %2\nSide: %3", _isRhsLoaded, _cache, FWK_PlayerSide]; };

//Cleaning up cache
_cache allowDamage false;
clearWeaponCargoGlobal _cache;
clearMagazineCargoGlobal _cache;
clearItemCargoGlobal _cache;
clearBackpackCargoGlobal _cache;

//West
if(FWK_PlayerSide == west) then 
{
	//RHS
	if(_isRhsLoaded) then {
	} else {
	//Vanilla
		_cache addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 50];
		_cache addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Sand_Tracer_Green", 50];
		_cache addMagazineCargoGlobal ["130Rnd_338_Mag", 50];
		_cache addMagazineCargoGlobal ["200Rnd_556x45_Box_F", 50];
		_cache addMagazineCargoGlobal ["5Rnd_127x108_APDS_Mag", 50];
		_cache addMagazineCargoGlobal ["20Rnd_762x51_Mag", 50];
		_cache addMagazineCargoGlobal ["10Rnd_338_Mag", 50];
		_cache addMagazineCargoGlobal ["16Rnd_9x21_Mag", 50];
		_cache addMagazineCargoGlobal ["HandGrenade", 30];
		_cache addMagazineCargoGlobal ["SmokeShell", 30];
		_cache addMagazineCargoGlobal ["SmokeShellRed", 30];
		_cache addMagazineCargoGlobal ["SmokeShellGreen", 30];
		_cache addMagazineCargoGlobal ["Chemlight_green", 10];
		_cache addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 30];
		_cache addMagazineCargoGlobal ["Titan_AA", 5];
		_cache addMagazineCargoGlobal ["Titan_AT", 5];
		_cache addMagazineCargoGlobal ["B_IR_Grenade", 5];
		_cache addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
	};
};
//East
if(FWK_PlayerSide == east) then 
{
	//RHS
	if(_isRhsLoaded) then {
		
	} else {
	//Vanilla
		_cache addMagazineCargoGlobal ["30Rnd_65x39_caseless_green_mag_Tracer", 50];
		_cache addMagazineCargoGlobal ["150Rnd_93x64_Mag", 50];
		_cache addMagazineCargoGlobal ["150Rnd_762x51_Box", 50];
		_cache addMagazineCargoGlobal ["5Rnd_127x108_APDS_Mag", 50];
		_cache addMagazineCargoGlobal ["30Rnd_762x39_AK12_Mag_F", 50];
		_cache addMagazineCargoGlobal ["30Rnd_762x39_AK12_Mag_Tracer_F", 50];
		_cache addMagazineCargoGlobal ["30rnd_762x39_AK12_Arid_Mag_F", 50];
		_cache addMagazineCargoGlobal ["30rnd_762x39_AK12_Arid_Mag_Tracer_F", 50];
		_cache addMagazineCargoGlobal ["30rnd_762x39_AK12_Lush_Mag_F", 50];
		_cache addMagazineCargoGlobal ["30rnd_762x39_AK12_Lush_Mag_Tracer_F", 50];
		_cache addMagazineCargoGlobal ["HandGrenade", 30];
		_cache addMagazineCargoGlobal ["SmokeShell", 30];
		_cache addMagazineCargoGlobal ["SmokeShellRed", 30];
		_cache addMagazineCargoGlobal ["SmokeShellGreen", 30];
		_cache addMagazineCargoGlobal ["Chemlight_red", 10];
		_cache addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 30];
		_cache addMagazineCargoGlobal ["Titan_AA", 5];
		_cache addMagazineCargoGlobal ["Titan_AT", 5];
		_cache addMagazineCargoGlobal ["O_IR_Grenade", 5];
		_cache addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
	};
};
//Indipendent
if(FWK_PlayerSide == independent) then 
{
	//RHS
	if(_isRhsLoaded) then {
		
	} else {
	//Vanilla
		_cache addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 50];
		_cache addMagazineCargoGlobal ["200Rnd_65x39_Belt_Tracer_Green", 50];
		_cache addMagazineCargoGlobal ["200Rnd_556x45_Box_F", 50];
		_cache addMagazineCargoGlobal ["5Rnd_127x108_APDS_Mag", 50];
		_cache addMagazineCargoGlobal ["30Rnd_762x39_Mag_F", 50];
		_cache addMagazineCargoGlobal ["HandGrenade", 30];
		_cache addMagazineCargoGlobal ["SmokeShell", 30];
		_cache addMagazineCargoGlobal ["SmokeShellRed", 30];
		_cache addMagazineCargoGlobal ["SmokeShellGreen", 30];
		_cache addMagazineCargoGlobal ["Chemlight_red", 10];
		_cache addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 30];
		_cache addMagazineCargoGlobal ["Titan_AA", 5];
		_cache addMagazineCargoGlobal ["Titan_AT", 5];
		_cache addMagazineCargoGlobal ["i_IR_Grenade", 5];
		_cache addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
	};
};
waitUntil { (getPosATL _cache) select 2 < 10 };
Signal = "SmokeShellPurple" createVehicle position _cache;