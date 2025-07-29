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
if (_faction == "BLU_F") then { _resultArray = ["B_Truck_01_covered_F"]; };
//CSAT (standard)
if (_faction == "OPF_F") then { _resultArray = ["O_Truck_02_covered_F"]; };
//AAF
if (_faction == "IND_F") then { _resultArray = ["I_T_Truck_02_F"]; };
//Chinese CSAT (Apex)
if (_faction == "OPF_T_F") then { _resultArray = ["O_T_Truck_02_F"]; };
//NATO Pacific (Apex)
if (_faction == "BLU_T_F") then { _resultArray = ["B_T_Truck_01_covered_F"]; };
//NATO (Contact)
if (_faction == "BLU_W_F") then { _resultArray = ["B_T_Truck_01_covered_F"]; };
//Specnaz (Contact)
if (_faction == "OPF_R_F") then { _resultArray = ["O_T_Truck_02_F"]; };
//LDF (Contact)
if (_faction == "IND_F_E_F") then { _resultArray = ["I_E_Truck_02_F"]; };

//--- MOD ---
//RHS USAF  (USA Army D OCP)
if (_faction == "rhs_faction_usarmy_d") then { _resultArray = [""] };
//RHS USAF (USA Army W UCP)
if (_faction == "rhs_faction_usarmy_wd") then { _resultArray = [""] };
//RHS USAF (USMC D)
if (_faction == "rhs_faction_usmc_d") then { _resultArray = [""] };
//RHS USAF (USMC WD MARPAT)
if (_faction == "rhs_faction_usmc_wd") then { _resultArray = [""] };
//RHS AFRF (Russia MSV)
if (_faction == "rhs_faction_msv") then { _resultArray = [""]; };
//RHS AFRF (Russia VDV)
if (_faction == "rhs_faction_vdv") then { _resultArray = [""]; };
//Eric J Taliban Units
if (_faction == "TBan") then { _resultArray = [""]; };
//RHS SAF (ChDHZ)	
if (_faction == "rhssaf_faction_army") then { _resultArray = [""]; };

_resultArray;