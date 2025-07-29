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
if (_faction == "BLU_F") then { _resultArray = ["B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_LSV_01_armed_F","B_APC_Wheeled_01_cannon_F","B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_up_cannon_F"]; };
//CSAT (standard)
if (_faction == "OPF_F") then { _resultArray = ["O_MRAP_01_gmg_F","O_MRAP_02_hmg_F","O_LSV_02_armed_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_v2_F"]; };
//AAF
if (_faction == "IND_F") then { _resultArray = ["I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_APC_Wheeled_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_APC_tracked_03_cannon_F"]; };
//Chinese CSAT (Apex)
if (_faction == "OPF_T_F") then { _resultArray = ["O_T_MRAP_02_gmg_ghex_F","O_T_MRAP_02_hmg_ghex_F","O_T_LSV_02_armed_F","O_T_APC_Tracked_02_cannon_ghex_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F"]; };
//NATO Pacific (Apex)
if (_faction == "BLU_T_F") then { _resultArray = ["B_T_MRAP_01_gmg_F","B_T_MRAP_01_hmg_F","B_T_LSV_01_armed_F","B_T_APC_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F"]; };
//NATO (Contact)
if (_faction == "BLU_W_F") then { _resultArray = ["B_T_MRAP_01_gmg_F","B_T_MRAP_01_hmg_F","B_T_LSV_01_armed_F","B_T_APC_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F"]; };
//Specnaz (Contact)
if (_faction == "OPF_R_F") then { _resultArray = ["O_T_MRAP_02_gmg_ghex_F","O_T_MRAP_02_hmg_ghex_F","O_T_LSV_02_armed_F","O_T_APC_Tracked_02_cannon_ghex_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F"]; };
//LDF (Contact)
if (_faction == "IND_F_E_F") then { _resultArray = ["I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_APC_Wheeled_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_APC_tracked_03_cannon_F","I_E_APC_tracked_03_cannon_F"]; };

//--- MOD ---
//RHS USAF  (USA Army D OCP)
if (_faction == "rhs_faction_usarmy_d") then { _resultArray = ["rhsusf_stryker_m1126_m2_d","rhsusf_stryker_m1126_mk19_d","rhsusf_m113d_usarmy","rhsusf_m113d_usarmy_MK19","rhsusf_m1025_d_m2","rhsusf_m1025_d_Mk19","rhsusf_m966_d","rhsusf_m1151_mk19_v1_usarmy_d","rhsusf_m1151_m2_v2_usarmy_d","RHS_M2A3"] }; 
//RHS USAF (USA Army W UCP)
if (_faction == "rhs_faction_usarmy_wd") then { _resultArray = ["rhsusf_stryker_m1126_m2_d","rhsusf_stryker_m1126_mk19_d","rhsusf_m113d_usarmy","rhsusf_m113d_usarmy_MK19","rhsusf_m1025_d_m2","rhsusf_m1025_d_Mk19","rhsusf_m966_d","rhsusf_m1151_mk19_v1_usarmy_d","rhsusf_m1151_m2_v2_usarmy_d","RHS_M2A3_wd"] }; 
//RHS USAF (USMC D)
if (_faction == "rhs_faction_usmc_d") then { _resultArray = ["rhsusf_M1232_MC_M2_usmc_d","rhsusf_M1232_MC_MK19_usmc_d","rhsusf_m1240a1_mk19_usmc_d","rhsusf_m1240a1_m2_usmc_d","rhsusf_m1025_d_s_m2","rhsusf_m1025_d_s_Mk19","rhsusf_m1151_m2_v3_usmc_d","rhsusf_m1151_mk19crows_usmc_d"] }; 
//RHS USAF (USMC WD MARPAT)
if (_faction == "rhs_faction_usmc_wd") then { _resultArray = ["rhsusf_M1232_MC_M2_usmc_wd","rhsusf_M1232_MC_MK19_usmc_wd","rhsusf_m1240a1_mk19_usmc_wd","rhsusf_m1240a1_m2_usmc_wd","rhsusf_m1025_w_s_m2","rhsusf_m1025_w_s_Mk19","rhsusf_m1151_m2crows_usmc_wd","rhsusf_m1151_mk19crows_usmc_wd"] }; 
//RHS AFRF (Russia MSV)
if (_faction == "rhs_faction_msv") then { _resultArray = ["rhs_tigr_sts_msv","rhs_tigr_sts_3camo_msv"] }; 
//RHS AFRF (Russia VDV)
if (_faction == "rhs_faction_vdv") then { _resultArray = ["rhs_tigr_sts_vdv","rhs_tigr_sts_3camo_vdv"] }; 
//Eric J Taliban Units
//RHS SAF (ChDHZ)
if (_faction == "rhssaf_faction_army") then { _resultArray = ["rhssaf_army_o_m1025_olive_m2","rhssaf_army_o_m1151_olive_pkm"] };

_resultArray;