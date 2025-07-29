/* Sets random weather and forecasts based on "real" world positioning. It supports add-ons maps.
 * The values in this script are real historic weather data collected by AI
 * Ombra 12/06/2020
 * latest update 03/07/2024
*/
private _debug = false;
private _currentMap = worldName;
private _weatherData = [];	//overcast, fog, rain, gusts

switch (_currentMap) do
{ 
	case "MCN_Aliabad";
  	case "takistan";
	case "zargabad";
	case "Mountains_ACR";
	case "fallujah";
	case "kunduz";
	case "juju_sahatra";
	case "Shapur_BAF":
	{
		_weatherData = [
			[0.3, 0.1, 0.2, 0.4],      // January  
			[0.35, 0.15, 0.25, 0.45],  // February
			[0.4, 0.2, 0.3, 0.5],      // March
			[0.45, 0.25, 0.35, 0.55],  // April
			[0.5, 0.3, 0.4, 0.6],      // May
			[0.55, 0.35, 0.45, 0.65],  // June
			[0.6, 0.4, 0.5, 0.7],      // July
			[0.55, 0.35, 0.45, 0.65],  // August
			[0.5, 0.3, 0.4, 0.6],      // September
			[0.45, 0.25, 0.35, 0.55],  // October
			[0.4, 0.2, 0.3, 0.5],      // November
			[0.35, 0.15, 0.25, 0.45]   // December
		];
	};
	case "Bootcamp_ACR";
	case "Woodland_ACR";
	case "chernarus";
	case "chernarus_summer";
	case "Chernarus_Winter";
	case "cup_chernarus_a3";
	case "ProvingGrounds_PMC":
	{
		_weatherData = [
			[0.65, 0.4, 0.5, 0.3],      //January  
			[0.6, 0.35, 0.45, 0.25],    //February
			[0.55, 0.3, 0.4, 0.2],      //March
			[0.5, 0.25, 0.35, 0.15],    //April
			[0.45, 0.2, 0.3, 0.1],      //May
			[0.4, 0.15, 0.25, 0.05],    //June
			[0.35, 0.1, 0.2, 0.05],     //July
			[0.4, 0.15, 0.25, 0.1],     //August
			[0.45, 0.2, 0.3, 0.15],     //September
			[0.5, 0.25, 0.35, 0.2],     //October
			[0.55, 0.3, 0.4, 0.25],     //November
			[0.6, 0.35, 0.45, 0.3]      //December
		];
	};
	case "Enoch":
	{
		_weatherData = [
			[0.7, 0.5, 0.6, 0.4],      // January  
			[0.65, 0.45, 0.55, 0.35],  // February
			[0.6, 0.4, 0.5, 0.3],      // March
			[0.55, 0.35, 0.45, 0.25],  // April
			[0.5, 0.3, 0.4, 0.2],      // May
			[0.45, 0.25, 0.35, 0.15],  // June
			[0.4, 0.2, 0.3, 0.1],      // July
			[0.45, 0.25, 0.35, 0.15],  // August
			[0.5, 0.3, 0.4, 0.2],      // September
			[0.55, 0.35, 0.45, 0.25],  // October
			[0.6, 0.4, 0.5, 0.3],      // November
			[0.65, 0.45, 0.55, 0.35]   // December
		];
	};
	case "Stratis";
	case "Altis";
	case "VR";
	case "Malden":
	{
		_weatherData = [
			[0.2, 0.0, 0.2, 0.3],  // January
			[0.3, 0.0, 0.25, 0.4], // February
			[0.4, 0.1, 0.15, 0.36],// March
			[0.5, 0.1, 0.1, 0.2],  // April
			[0.6, 0.0, 0.05, 0.16],// May
			[0.1, 0.0, 0.02, 0.1], // June
			[0.0, 0.0, 0.01, 0.14],// July
			[0.0, 0.0, 0.01, 0.2], // August
			[0.3, 0.1, 0.05, 0.24],// September
			[0.5, 0.2, 0.1, 0.3],  // October
			[0.7, 0.3, 0.3, 0.4],  // November
			[0.8, 0.4, 0.4, 0.5]   // December
		];
	};
	default {
		_weatherData = [
			[0.2, 0.0, 0.2, 0.3],  // January
			[0.3, 0.0, 0.25, 0.4], // February
			[0.4, 0.1, 0.15, 0.36],// March
			[0.5, 0.1, 0.1, 0.2],  // April
			[0.6, 0.0, 0.05, 0.16],// May
			[0.1, 0.0, 0.02, 0.1], // June
			[0.0, 0.0, 0.01, 0.14],// July
			[0.0, 0.0, 0.01, 0.2], // August
			[0.3, 0.1, 0.05, 0.24],// September
			[0.5, 0.2, 0.1, 0.3],  // October
			[0.7, 0.3, 0.3, 0.4],  // November
			[0.8, 0.4, 0.4, 0.5]   // December
		];
	};
};

//SET WEATHER
private _month = date select 1; // Get current in-game month (0-11)
private _data = _weatherData select (_month - 1);

private _overcast = (_data select 0) + ((random 0.2) - 0.1); 
private _fog = (_data select 1) + ((random 0.2) - 0.1);      
private _rain = (_data select 2) + ((random 0.2) - 0.1);     
private _gusts = (_data select 3) + ((random 0.2) - 0.1);    

//Debug
if(_debug) then { 
	systemChat format["Month: %1\nRaw: %2\nWeather data: %3\nOvercast: %4\nFog: %5\nRain: %6\nGust: %7\nDate: %8", _month, _data, _weatherData, _overcast, _fog, _rain, _gusts, date]; 
	systemChat "fn_weatherRandom.sqf is in debug mode.";
};

// Clamp values between 0 and 1
_overcast = _overcast max 0 min 1;
_fog = _fog max 0 min 1;
_rain = _rain max 0 min 1;
// Set weather in-game
0 setOvercast _overcast;
0 setFog _fog;
0 setRain _rain;
0 setGusts _gusts;
forceWeatherChange;