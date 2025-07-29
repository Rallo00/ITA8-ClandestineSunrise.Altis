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
if (_faction == "BLU_F") then { _resultArray = ["B_Truck_01_fuel_F","B_Truck_01_ammo_F","B_Truck_01_Repair_F","B_Truck_01_medical_F"]; };
//CSAT (standard)
if (_faction == "OPF_F") then { _resultArray = ["O_Truck_03_fuel_F","O_Truck_03_ammo_F","O_Truck_03_Repair_F","O_Truck_03_medical_F"]; };
//AAF
if (_faction == "IND_F") then { _resultArray = ["I_Truck_02_fuel_F","I_Truck_02_ammo_F","I_Truck_02_Repair_F","I_Truck_02_medical_F"]; };
//Chinese CSAT (Apex)
if (_faction == "OPF_T_F") then { _resultArray = ["O_T_Truck_03_fuel_ghex_F","O_T_Truck_03_ammo_ghex_F","O_T_Truck_03_Repair_ghex_F","O_T_Truck_03_medical_ghex_F"]; };
//NATO Pacific (Apex)
if (_faction == "BLU_T_F") then { _resultArray = ["B_T_Truck_01_fuel_F","B_T_Truck_01_ammo_F","B_T_Truck_01_Repair_F","B_T_Truck_01_medical_F"]; };
//NATO (Contact)
if (_faction == "BLU_W_F") then { _resultArray = ["B_T_Truck_01_fuel_F","B_T_Truck_01_ammo_F","B_T_Truck_01_Repair_F","B_T_Truck_01_medical_F"]; };
//Specnaz (Contact)
if (_faction == "OPF_R_F") then { _resultArray = ["O_T_Truck_03_fuel_ghex_F","O_T_Truck_03_ammo_ghex_F","O_T_Truck_03_Repair_ghex_F","O_T_Truck_03_medical_ghex_F"]; };
//LDF (Contact)
if (_faction == "IND_F_E_F") then { _resultArray = ["I_E_Truck_02_fuel_F","I_E_Truck_02_Ammo_F","I_E_Truck_02_Box_F","I_E_Truck_02_Medical_F"]; };

//--- MOD ---
//RHS USAF  (USA Army D OCP)
if (_faction == "rhs_faction_usarmy_d") then { _resultArray = ["rhsusf_M997A4_REPAIR_BKIT_usarmy_d","rhsusf_M997A4_AMMO_BKIT_usarmy_d","rhsusf_M978A4_BKIT_usarmy_d"] };
//RHS USAF (USA Army W UCP)
if (_faction == "rhs_faction_usarmy_wd") then { _resultArray = ["rhsusf_M997A4_REPAIR_BKIT_usarmy_wd","rhsusf_M997A4_AMMO_BKIT_usarmy_wd","rhsusf_M978A4_BKIT_usarmy_wd"] };
//RHS USAF (USMC D)
if (_faction == "rhs_faction_usmc_d") then { _resultArray = ["rhsusf_M997A4_REPAIR_BKIT_usarmy_d","rhsusf_M997A4_AMMO_BKIT_usarmy_d","rhsusf_M978A4_BKIT_usarmy_d"] };
//RHS USAF (USMC WD MARPAT)
if (_faction == "rhs_faction_usmc_wd") then { _resultArray = ["rhsusf_M997A4_REPAIR_BKIT_usarmy_wd","rhsusf_M997A4_AMMO_BKIT_usarmy_wd","rhsusf_M978A4_BKIT_usarmy_wd"] };
//RHS AFRF (Russia MSV)
if (_faction == "rhs_faction_msv") then { _resultArray = ["rhs_gaz66_ammo_msv","RHS_Ural_Repair_MSV_01","RHS_Ural_MSV_01","RHS_Ural_Ammo_MSV_01","rhs_kraz_255b1_fuel_msv"]; };
//RHS AFRF (Russia VDV)
if (_faction == "rhs_faction_vdv") then { _resultArray = ["rhs_gaz66_ammo_vdv","RHS_Ural_Repair_VDV_01","RHS_Ural_VDV_01","RHS_Ural_Ammo_VDV_01","rhs_kraz_255b1_fuel_vdv"]; };
//Eric J Taliban Units
//RHS SAF (ChDHZ)	
if (_faction == "rhssaf_faction_army") then { _resultArray = ["rhsgref_ins_g_ural_repair","rhsgref_ins_g_gaz66_ammo","rhsgref_ins_g_kraz255b1_fuel"]; };

_resultArray;