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
if (_faction == "BLU_F") then { _resultArray = ["B_APC_Tracked_01_AA_F"]; };
//CSAT (standard)
if (_faction == "OPF_F") then { _resultArray = ["O_APC_Tracked_02_AA_F"]; };
//AAF
if (_faction == "IND_F") then { _resultArray = ["I_LT_01_AA_F"]; };
//Chinese CSAT (Apex)
if (_faction == "OPF_T_F") then { _resultArray = ["O_T_APC_Tracked_02_AA_ghex_F"]; };
//NATO Pacific (Apex)
if (_faction == "BLU_T_F") then { _resultArray = ["B_T_APC_Tracked_01_AA_F"]; };
//NATO (Contact)
if (_faction == "BLU_W_F") then { _resultArray = ["B_T_APC_Tracked_01_AA_F"]; };
//Specnaz (Contact)
if (_faction == "OPF_R_F") then { _resultArray = ["O_T_APC_Tracked_02_AA_ghex_F"]; };
//LDF (Contact)
if (_faction == "IND_F_E_F") then { _resultArray = ["I_LT_01_AA_F"]; };

//--- MOD ---
//RHS USAF  (USA Army D OCP)
if (_faction == "rhs_faction_usarmy_d") then { _resultArray = ["RHS_M6"] };
//RHS USAF (USA Army W UCP)
if (_faction == "rhs_faction_usarmy_wd") then { _resultArray = ["RHS_M6_wd"] };
//RHS USAF (USMC D)
if (_faction == "rhs_faction_usmc_d") then { _resultArray = ["RHS_M6"] };
//RHS USAF (USMC WD MARPAT)
if (_faction == "rhs_faction_usmc_wd") then { _resultArray = ["RHS_M6_wd"] };
//RHS AFRF (Russia MSV)
if (_faction == "rhs_faction_msv") then { _resultArray = ["rhs_zsu234_aa","RHS_Ural_Zu23_MSV_01","rhs_gaz66_zu23_msv"] };
//RHS AFRF (Russia VDV)
if (_faction == "rhs_faction_vdv") then { _resultArray = ["rhs_btr60_vdv","RHS_Ural_Zu23_VDV_01","rhs_gaz66_zu23_vdv"] };
//Eric J Taliban Units
//RHS SAF (ChDHZ)
if (_faction == "rhssaf_faction_army") then { _resultArray = ["rhsgref_ins_g_btr60","rhsgref_ins_g_btr70","rhsgref_ins_g_ural_Zu23"] };

_resultArray;