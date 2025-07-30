/* Scenario introduction for every player. Call it from initPLayerLocal.sqf */
["InitializePlayer", [player]] call BIS_FNC_DYNAMICGROUPS;
if(FWK_ReviveType != 3) then { call compileFinal preprocessFileLineNumbers 'RalloFramework\FAR_revive\FAR_revive_init.sqf'; };
//Handle JIP
if([] call BIS_fnc_didJIP) then { [player] spawn FWK_fnc_teleportToLeader; };
//Intro
[] spawn
{
	//Fade Black In
	cutText ["", "BLACK FADED", 999];
	0.1 fadeSound 0;
	sleep 1;
	//Blur Effect
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [6];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0.0];
	"dynamicBlur" ppEffectCommit 3;
	//Date handling
	_nowDate = date;
	_day = (if (_nowDate select 2 < 10) then { "0" } else { "" }) + str (_nowDate select 2);
	_month = (if (_nowDate select 1 < 10) then { "0" } else { "" }) + str (_nowDate select 1);
	_year = _nowDate select 0;
	_hour = (if (_nowDate select 3 < 10) then { "0" } else { "" }) + str (_nowDate select 3);
	_minutes = (if (_nowDate select 4 < 10) then { "0" } else { "" }) + str (_nowDate select 4);
	_dateToShow = format["%1\%2\%3 %4:%5", _day, _month, _year, _hour, _minutes];

	_introText=
	[
		[_dateToShow,"<t size='0.9' font='puristaLight'>%1</t><br/>",2],
		[localize "STR_INF_scenario_town","<t size='0.9' font='PuristaMedium'>%1</t>",2],
		[localize "STR_INF_scenario_country","<t size='0.9' font='puristaLight'>%1</t><br/>",2],
		[localize "STR_INF_scenario_title","<t size='0.9' font='puristaLight'>%1</t>",40]
	];
	[ _introText, (-safezoneX - 0.05), 0.95, "<t color='#FFFFFFFF' shadow = '1' size = '0.9' align = 'right'>%1</t>"] spawn BIS_fnc_typeText;
	sleep 12;
	[parseText format ["<t font='PuristaBold' size='1.6'>%1</t><br />%2", name player, localize "STR_INF_squad_army"], true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
	sleep 2;
	//Fade Black Out
	cutText ["", "BLACK IN", 5];
	5 fadeSound 1;
};
