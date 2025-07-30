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
if (_faction == "BLU_F") then { _resultArray = ["B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_F"]; };
//CSAT (standard)
if (_faction == "OPF_F") then { _resultArray = ["O_Heli_Light_02_unarmed_F","O_Heli_Light_02_dynamicLoadout_F","O_Heli_Transport_04_covered_F"]; };
//AAF
if (_faction == "IND_F") then { _resultArray = ["I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F"]; };
//Chinese CSAT (Apex)
if (_faction == "OPF_T_F") then { _resultArray = ["O_Heli_Light_02_unarmed_F","O_Heli_Light_02_dynamicLoadout_F","O_Heli_Transport_04_covered_F"]; };
//NATO Pacific (Apex)
if (_faction == "BLU_T_F") then { _resultArray = ["B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_F"]; };
//NATO (Contact)
if (_faction == "BLU_W_F") then { _resultArray = ["B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_F"]; };
//Specnaz (Contact)
if (_faction == "OPF_R_F") then { _resultArray = ["O_Heli_Light_02_unarmed_F","O_Heli_Light_02_dynamicLoadout_F","O_Heli_Transport_04_covered_F"]; };
//LDF (Contact)
if (_faction == "IND_F_E_F") then { _resultArray = ["I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F"]; };

//--- MOD ---
//RHS USAF  (USA Army D OCP)
if (_faction == "rhs_faction_usarmy_d") then { _resultArray = ["RHS_UH60M_d","RHS_CH_47F_light","RHS_CH_47F_10","RHS_UH60M2_d"] };
//RHS USAF (USA Army W UCP)
if (_faction == "rhs_faction_usarmy_wd") then { _resultArray = ["RHS_UH60M_d","RHS_CH_47F_10","RHS_UH60M2_d"] };
//RHS USAF (USMC D)
if (_faction == "rhs_faction_usmc_d") then { _resultArray = ["rhsusf_CH53E_USMC_D","rhsusf_CH53E_USMC_GAU21_D","RHS_UH1Y_FFAR_d","RHS_UH1Y_UNARMED_d"] };
//RHS USAF (USMC WD MARPAT)
if (_faction == "rhs_faction_usmc_wd") then { _resultArray = ["rhsusf_CH53E_USMC_D","rhsusf_CH53E_USMC_GAU21_D","RHS_UH1Y_FFAR_d","RHS_UH1Y_UNARMED_d"] };
//RHS AFRF (Russia MSV)
if (_faction == "rhs_faction_msv") then { _resultArray = ["RHS_Mi8mt_vdv","RHS_Mi8AMT_vdv","RHS_Mi8T_vdv"] };
//RHS AFRF (Russia VDV)
if (_faction == "rhs_faction_vdv") then { _resultArray = ["RHS_Mi8mt_vdv","RHS_Mi8AMT_vdv","RHS_Mi8T_vdv"] };
//Eric J Taliban Units
//RHS SAF (ChDHZ)
if (_faction == "rhssaf_faction_army") then { _resultArray = ["rhssaf_airforce_o_ht40","rhssaf_airforce_o_ht48"] };
_resultArray;