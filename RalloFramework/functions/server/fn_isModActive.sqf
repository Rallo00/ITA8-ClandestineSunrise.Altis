//Use it with the following requests:
//  tfar or TFAR		For Task Force Arrowhead Radio
//	afrf or AFRF		For RHS AFRF
//	usaf or USAF		For RHS USAF
//	gref or GREF		For RHS GREF
//	saf or SAF			For RHS SAF
//	tal or TAL			For EricJ Taliban Units
_modToCheck = param[0];
_result = false;
switch (_modToCheck) do
{
	case "tfar": { _result = isClass(configFile >> "cfgPatches" >> "task_force_radio"); };
	case "TFAR": { _result = isClass(configFile >> "cfgPatches" >> "task_force_radio"); };
	case "afrf": { _result = isClass(configFile >> "cfgPatches" >> "rhs_main"); };
	case "AFRF": { _result = isClass(configFile >> "cfgPatches" >> "rhs_main"); };
	case "usaf": { _result = isClass(configFile >> "cfgPatches" >> "rhsusf_main"); };
	case "USAF": { _result = isClass(configFile >> "cfgPatches" >> "rhsusf_main"); };
	case "gref": { _result = isClass(configFile >> "cfgPatches" >> "rhsgref_main"); };
	case "GREF": { _result = isClass(configFile >> "cfgPatches" >> "rhsgref_main"); };
	case "saf":  { _result = isClass(configFile >> "cfgPatches" >> "rhsg_main"); };
	case "SAF":  { _result = isClass(configFile >> "cfgPatches" >> "rhssaf_main"); };
	case "tal":  { _result = isClass(configFile >> "cfgPatches" >> "Taliban_Fighters"); };
	case "TAL":  { _result = isClass(configFile >> "cfgPatches" >> "Taliban_Fighters"); };
};
_result;
