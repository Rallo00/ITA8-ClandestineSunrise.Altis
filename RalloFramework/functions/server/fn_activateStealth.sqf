/* Allows stealth mode for units, by changing the camouflage coefficient as unit trait */ 
_camouflageAmount = param[0];
{ _x setUnitTrait ["camouflageCoef", _camouflageAmount, true]; } forEach allUnits;
