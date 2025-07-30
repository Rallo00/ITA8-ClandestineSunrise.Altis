params["_marker","_cratersCount", "_range"];
if(isNil "_marker") exitWith { systemChat "fn_craterArea: _marker not defined"; };
if(isNil "_cratersCount") exitWith { systemChat "fn_craterArea: _cratersCount not defined"; };
if(isNil "_range") exitWith { systemChat "fn_craterArea: _range not defined"; };


_soilArray = ["Land_ShellCrater_02_extralarge_F","Land_ShellCrater_02_large_F","Land_ShellCrater_02_small_F","Land_ShellCrater_01_F"];
_debrisClass = "Land_ShellCrater_02_debris_F";
_craterClass = "Crater";
_location = getMarkerPos _marker;

//Creating random position and spawning craters
for "_i" from 0 to _cratersCount - 1 do {
  //Defualt range
  if (_range == 0) then { _range = 600; };
  //Randomized location
  _distance = [0, _range] call BIS_fnc_randomInt;
  _direction = [0,359] call BIS_fnc_randomInt;
  _randomLocationAGL = [_location, _distance, _direction] call BIS_fnc_relPos;
  _randomLocationAGL set [2, 0];
  _craterClass createVehicle _randomLocationAGL;
  _soil = _soilArray call BIS_fnc_selectRandom;
  //Positioning height
  _posHeightAGL = 0;
  switch (_soil) do
  {
	  case "Land_ShellCrater_02_extralarge_F": { _posHeightAGL = random[-1.068, -0.534, 0]; };
	  case "Land_ShellCrater_02_large_F": { _posHeightAGL = random[-0.717, -0.359, 0]; };
	  case "Land_ShellCrater_02_small_F": { _posHeightAGL = random[-0.321, -0.161, 0]; };
  };
  _soilPos = _randomLocationAGL;
  _soilPos set [2, _posHeightAGL];
  _soil createVehicle _soilPos;
}