//Mission Time Choice
// 0: Random
// 1: Real-time
// 2: Standard scenario date and time

_timeChoice = param[0];
_debug = false;
//Declaring variables
_Day = 0; _Month = 0; _Year = 0; _Hours = 0; _Minutes = 0;

//Sets a random mission time
if (_timeChoice == 0) then 
{
	_Month = [1, 12] call BIS_fnc_randomInt;
	_Day = [1, 28] call BIS_fnc_randomInt;
	_Year = [1985, 2050] call BIS_fnc_randomInt;
	_Hours = [1, 23] call BIS_fnc_randomInt;
	_Minutes = [0, 59] call BIS_fnc_randomInt;
	setDate[_Year, _Month, _Day, _Hours, _Minutes];
};
//Sets real-time mission
if (_timeChoice == 1) then 
{ 
	_missionTime = systemTime;
	_Day = _missionTime select 2;
	_Month = _missionTime select 1;
	_Year = _missionTime select 0;
	_Hours = _missionTime select 3;
	_Minutes = _missionTime select 4;
	setDate[_Year, _Month, _Day, _Hours, _Minutes];
};
//Debug
if(_debug) then { 
	hint format["Date: %1\nTime: %2", date, time]; 
	systemChat "fn_setDateTime is in debug mode.";
};