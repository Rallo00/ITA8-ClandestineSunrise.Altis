//--- HANDLING SERVER SIDE ---//
if (isServer || isDedicated) then 
{ 
	//Configurable
	private _debug = false;
	FWK_EnemySide = east;
	FWK_EnemyFaction = "OPF_F";
	FWK_PlayerFaction = "BLU_F";
	FWK_PlayerSide = west;
	publicVariable "FWK_EnemySide";
	publicVariable "FWK_EnemyFaction";
	publicVariable "FWK_PlayerFaction";
	publicVariable "FWK_PlayerSide";
	//Scenario Parameters
	FWK_WeatherRandom = paramsArray select 0;
	FWK_StaminaEnabled = paramsArray select 1;
	FWK_DateTime = paramsArray select 2;
	FWK_ReviveType = paramsArray select 3;
	if(FWK_StaminaEnabled == 0) then { {_x enableFatigue false} forEach allPlayers; };
	if(!_debug && FWK_DateTime != 2) then { [FWK_DateTime] spawn FWK_fnc_ambientSetDateTime; };	//No need client-side
	if(FWK_WeatherRandom == 0) then { [] spawn FWK_fnc_ambientRandomWeather; };
	publicVariable "FWK_WeatherRandom";
	publicVariable "FWK_StaminaEnabled";
	publicVariable "FWK_DateTime";
	publicVariable "FWK_ReviveType";
	//Ready-to-use arrays
	FWK_EnemyInfantryArray = [FWK_EnemyFaction] call FWK_fnc_getFactionInfantry;
	FWK_EnemyStaticArray = [FWK_EnemyFaction] call FWK_fnc_getFactionStatic;
	FWK_EnemyLightArray = [FWK_EnemyFaction] call FWK_fnc_getFactionLV;
	FWK_EnemyArtilleryArray = [FWK_EnemyFaction] call FWK_fnc_getFactionArtillery;
	FWK_EnemyBoatArray = [FWK_EnemyFaction] call FWK_fnc_getFactionBoat;
	FWK_EnemyHeavyArray = [FWK_EnemyFaction] call FWK_fnc_getFactionHV;
	FWK_EnemySupportArray = [FWK_EnemyFaction] call FWK_fnc_getFactionSupport;
	FWK_EnemyGunshipArray = [FWK_EnemyFaction] call FWK_fnc_getFactionGunship;
	FWK_EnemyHeloArray = [FWK_EnemyFaction] call FWK_fnc_getFactionHelo;
	FWK_EnemyAirArray = [FWK_EnemyFaction] call FWK_fnc_getFactionAir;
	FWK_EnemyAntiAirArray = [FWK_EnemyFaction] call FWK_fnc_getFactionAntiAir;
	FWK_EnemyTransportArray = [FWK_EnemyFaction] call FWK_fnc_getFactionTransport;
	publicVariable "FWK_EnemyInfantryArray";
	publicVariable "FWK_EnemyStaticArray";
	publicVariable "FWK_EnemyLightArray";
	publicVariable "FWK_EnemyArtilleryArray";
	publicVariable "FWK_EnemyBoatArray";
	publicVariable "FWK_EnemyHeavyArray";
	publicVariable "FWK_EnemySupportArray";
	publicVariable "FWK_EnemyGunshipArray";
	publicVariable "FWK_EnemyHeloArray";
	publicVariable "FWK_EnemyAirArray";
	publicVariable "FWK_EnemyAntiairArray";
	publicVariable "FWK_EnemyTransportArray";
	FWK_FriendlyInfantryArray = [FWK_PlayerFaction] call FWK_fnc_getFactionInfantry;
	FWK_FriendlyStaticArray = [FWK_PlayerFaction] call FWK_fnc_getFactionStatic;
	FWK_FriendlyLightArray = [FWK_PlayerFaction] call FWK_fnc_getFactionLV;
	FWK_FriendlyArtilleryArray = [FWK_PlayerFaction] call FWK_fnc_getFactionArtillery;
	FWK_FriendlyBoatArray = [FWK_PlayerFaction] call FWK_fnc_getFactionBoat;
	FWK_FriendlyHeavyArray = [FWK_PlayerFaction] call FWK_fnc_getFactionHV;
	FWK_FriendlySupportArray = [FWK_PlayerFaction] call FWK_fnc_getFactionSupport;
	FWK_FriendlyGunshipArray = [FWK_PlayerFaction] call FWK_fnc_getFactionGunship;
	FWK_FriendlyHeloArray = [FWK_PlayerFaction] call FWK_fnc_getFactionHelo;
	FWK_FriendlyAirArray = [FWK_PlayerFaction] call FWK_fnc_getFactionAir;
	FWK_FriendlyAntiAirArray = [FWK_PlayerFaction] call FWK_fnc_getFactionAntiAir;
	FWK_FriendlyTransportArray = [FWK_PlayerFaction] call FWK_fnc_getFactionTransport;
	publicVariable "FWK_FriendlyInfantryArray";
	publicVariable "FWK_FriendlyStaticArray";
	publicVariable "FWK_FriendlyLightArray";
	publicVariable "FWK_FriendlyArtilleryArray";
	publicVariable "FWK_FriendlyBoatArray";
	publicVariable "FWK_FriendlyHeavyArray";
	publicVariable "FWK_FriendlySupportArray";
	publicVariable "FWK_FriendlyGunshipArray";
	publicVariable "FWK_FriendlyHeloArray";
	publicVariable "FWK_FriendlyAirArray";
	publicVariable "FWK_FriendlyAntiAirArray";
	publicVariable "FWK_FriendlyTransportArray";
};

//--- HANDLING BOTH SERVER AND CLIENT SIDE ---//
{ [_x] spawn FWK_fnc_vehicleUnflip; }forEach vehicles;
enableSaving [false,false];
//Revive (needs also client-side)
if(FWK_ReviveType != 3) then { call compileFinal preprocessFileLineNumbers 'RalloFramework\FAR_revive\FAR_revive_init.sqf'; };

["Initialize", [true]] call BIS_fnc_dynamicGroups;

//Messaggio caricamento framework a buon fine
systemChat localize "STR_misc_frameworkloaded";