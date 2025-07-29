/*	Returns a list of infantry or vehicles or air vehicles per desired faction
*
*	VEHICLES TYPES
*	infantry
*	static					AA/AT/Brownings
*	light					IFV/APC/Armed cars
*	artillery
*	boat					
*	heavy					Tanks
*	support					Trucks (support)
*	gunship					Helicopters (attack)
*	helo					Helicopters (transport)
*	air						Aeroplanes
*	aa						Anti-Air
*	
*	SUPPORTED VANILLA FACTIONS:
*	BLU_F					NATO (standard)
*	OPF_F					CSAT (standard)
*	IND_F					AAF (standard)
*	BLU_T_F					NATO (Apex, pacific)
*	OPF_T_F					CSAT (Apex, pacific)
*	BLU_W_F					NATO Woodland (Contact)
*	OPF_R_F					Specnaz (Contact
*	IND_E_F					LDF (Contact)
*	
*	SUPPORTED MODS FACTIONS:
*	rhs_faction_usarmy_d		RHS USAF (USA Army D OCP)
*	rhs_faction_usarmy_wd		RHS USAF (USA Army D UCP)
*	rhs_faction_usmc_d			RHS USAF (USA Army D MARPAT)
*	rhs_faction_usmc_wd			RHS USAF (USA Army WD MARPAT)
*	rhs_faction_msv				RHS AFRF (Russia MSV EMR)
*	rhs_faction_vdv				RHS AFRF (Russia VDV DES)
*	rhssaf_faction_army			RHS SAF (KOV Digital)
*	Tban						EricJ Taliban Units
*/
params["_faction"];
_resultArray = [];

//--- VANILLA ---
//NATO (standard)
if (_faction == "BLU_F") then { _resultArray = ["B_static_AA_F","B_static_AT_F","B_GMG_01_F","B_HMG_01_F","B_HMG_01_high_F","B_GMG_01_high_F"]; };
//CSAT (standard)
if (_faction == "OPF_F") then { _resultArray = ["O_static_AA_F","O_static_AT_F","O_GMG_01_F","O_HMG_01_F","O_HMG_01_high_F","O_GMG_01_high_F"]; };
//AAF
if (_faction == "IND_F") then { _resultArray = ["I_static_AA_F","I_static_AT_F","I_GMG_01_F","I_HMG_01_F","I_HMG_01_high_F","I_GMG_01_high_F"]; };
//Chinese CSAT (Apex)
if (_faction == "OPF_T_F") then { _resultArray = ["I_static_AA_F","I_static_AT_F","I_GMG_01_F","I_HMG_01_F","I_HMG_01_high_F","I_GMG_01_high_F"]; };
//NATO Pacific (Apex)
if (_faction == "BLU_T_F") then { _resultArray = ["B_T_static_AA_F","B_T_static_AT_F","B_GMG_01_F","B_HMG_01_F","B_HMG_01_high_F","B_GMG_01_high_F"]; };
//NATO (Contact)
if (_faction == "BLU_W_F") then { _resultArray = ["B_T_static_AA_F","B_T_static_AT_F","B_GMG_01_F","B_HMG_01_F","B_HMG_01_high_F","B_GMG_01_high_F"]; };
//Specnaz (Contact)
if (_faction == "OPF_R_F") then { _resultArray = ["I_static_AA_F","I_static_AT_F","I_GMG_01_F","I_HMG_01_F","I_HMG_01_high_F","I_GMG_01_high_F"]; };
//LDF (Contact)
if (_faction == "IND_F_E_F") then { _resultArray = ["I_E_static_AA_F","I_E_static_AT_F","I_E_GMG_01_F","I_E_HMG_01_F","I_E_HMG_01_high_F","I_E_GMG_01_high_F"]; };

//--- MOD ---
//RHS USAF  (USA Army D OCP)
if (_faction == "rhs_faction_usarmy_d") then { _resultArray = ["RHS_M2StaticMG_MiniTripod_D","RHS_MK19_TriPod_D","RHS_TOW_TriPod_D","RHS_M2StaticMG_D","RHS_Stinger_AA_pod_D"]; };
//RHS USAF (USA Army W UCP)
if (_faction == "rhs_faction_usarmy_wd") then { _resultArray = ["RHS_M2StaticMG_MiniTripod_WD","RHS_MK19_TriPod_WD","RHS_TOW_TriPod_WD","RHS_M2StaticMG_WD","RHS_Stinger_AA_pod_WD"]; };
//RHS USAF (USMC D)
if (_faction == "rhs_faction_usmc_d") then { _resultArray = ["RHS_M2StaticMG_MiniTripod_USMC_D","RHS_MK19_TriPod_USMC_D","RHS_TOW_TriPod_USMC_D","RHS_M2StaticMG_USMC_D","RHS_Stinger_AA_pod_USMC_D"]; };
//RHS USAF (USMC WD MARPAT)
if (_faction == "rhs_faction_usmc_wd") then { _resultArray = ["RHS_M2StaticMG_MiniTripod_USMC_WD","RHS_MK19_TriPod_USMC_WD","RHS_TOW_TriPod_USMC_WD","RHS_M2StaticMG_USMC_WD","RHS_Stinger_AA_pod_USMC_WD"]; };
//RHS AFRF (Russia MSV)
if (_faction == "rhs_faction_msv") then { _resultArray = ["RHS_AGS30_TriPod_MSV","rhs_KORD_MSV","rhs_KORD_high_MSV","RHS_ZU23_MSV"]; };
//RHS AFRF (Russia VDV)
if (_faction == "rhs_faction_vdv") then { _resultArray = ["RHS_AGS30_TriPod_VDV","rhs_KORD_VDV","rhs_KORD_high_VDV","RHS_ZU23_VDV"]; };
//Eric J Taliban Units
//RHS SAF (ChDHZ)
if (_faction == "rhssaf_faction_army") then { _resultArray = ["rhsgref_ins_g_AGS30_TriPod","rhsgref_ins_g_DSHKM","rhsgref_ins_g_DSHKM_Mini_TriPod","rhsgref_ins_g_NSV_TriPod","rhsgref_ins_g_ZU23"]; };

_resultArray;