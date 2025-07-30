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
if (_faction == "BLU_F") then { _resultArray = ["B_Soldier_SL_F","B_Medic_F","B_Soldier_GL_F","B_Soldier_F","B_HeavyGunner_F","B_Soldier_LAT_F","B_Soldier_M_F","B_Soldier_AR_F","B_Soldier_LAT2_F","B_Soldier_UAV_F"]; };
//CSAT (standard)
if (_faction == "OPF_F") then { _resultArray = ["O_Soldier_SL_F","O_Medic_F","O_Soldier_HAT_F","O_Soldier_GL_F","O_Soldier_F","O_HeavyGunner_F","O_Soldier_F","O_Soldier_M_F","O_Soldier_AR_F","O_Soldier_UAV_F"]; };
//AAF
if (_faction == "IND_F") then { _resultArray = ["I_Soldier_SL_F","I_Medic_F","I_Soldier_GL_F","I_Soldier_F","I_Soldier_AR_F","I_Soldier_F","I_Soldier_AT_F","I_Soldier_AA_F","I_Soldier_M_F","I_Soldier_UAV_F"]; };
//Chinese CSAT (Apex)
if (_faction == "OPF_T_F") then { _resultArray = ["O_T_Soldier_SL_F","O_T_Medic_F","O_T_Soldier_HAT_F","O_T_Soldier_GL_F","O_T_Soldier_F","O_T_HeavyGunner_F","O_T_Soldier_F","O_T_Soldier_M_F","O_T_Soldier_AR_F","O_T_Soldier_UAV_F"]; };
//NATO Pacific (Apex)
if (_faction == "BLU_T_F") then { _resultArray = ["B_T_Soldier_SL_F","B_T_Medic_F","B_T_Soldier_GL_F","B_T_Soldier_F","B_T_HeavyGunner_F","B_T_Soldier_LAT_F","B_T_Soldier_M_F","B_T_Soldier_AR_F","B_T_Soldier_LAT2_F","B_T_Soldier_UAV_F"]; };
//NATO (Contact)
if (_faction == "BLU_W_F") then { _resultArray = ["B_W_Soldier_SL_F","B_W_Medic_F","B_W_Soldier_GL_F","B_W_Soldier_F","B_W_HeavyGunner_F","B_W_Soldier_LAT_F","B_W_Soldier_M_F","B_W_Soldier_AR_F","B_W_Soldier_LAT2_F","B_W_Soldier_UAV_F"]; };
//Specnaz (Contact)
if (_faction == "OPF_R_F") then { _resultArray = ["O_R_Soldier_SL_F","O_R_Medic_F","O_R_Soldier_LAT_F","O_R_Soldier_GL_F","O_R_JTAC_F","O_R_JTAC_F","O_R_JTAC_F","O_R_Soldier_M_F","O_R_Soldier_AR_F","O_R_JTAC_F"]; };
//LDF (Contact)
if (_faction == "IND_F_E_F") then { _resultArray = ["I_E_Soldier_TL_F","I_E_Medic_F","I_E_Soldier_GL_F","I_E_Soldier_F","I_E_Soldier_AR_F","I_E_Soldier_F","I_E_Soldier_AT_F","I_E_Soldier_AA_F","I_E_Soldier_M_F","I_E_Soldier_UAV_F"]; };

//--- MOD ---
//RHS USAF  (USA Army D OCP)
if (_faction == "rhs_faction_usarmy_d") then { _resultArray = ["rhsusf_army_ocp_squadleader","rhsusf_army_ocp_medic","rhsusf_army_ocp_grenadier","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_autorifleman","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_javelin","rhsusf_army_ocp_marksman","rhsusf_army_ocp_aa","rhsusf_army_ocp_uav"]; };
//RHS USAF (USA Army W UCP)
if (_faction == "rhs_faction_usarmy_wd") then { _resultArray = ["rhsusf_army_ucp_squadleader","rhsusf_army_ucp_medic","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_autorifleman","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_javelin","rhsusf_army_ucp_marksman","rhsusf_army_ucp_aa","rhsusf_army_ucp_uav"]; };
//RHS USAF (USMC D)
if (_faction == "rhs_faction_usmc_d") then { _resultArray = ["rhsusf_usmc_marpat_d_squadleader","rhsusf_navy_sarc_d_fast","rhsusf_usmc_marpat_d_grenadier","rhsusf_usmc_marpat_d_rifleman","rhsusf_usmc_marpat_d_autorifleman","rhsusf_usmc_marpat_d_rifleman","rhsusf_usmc_marpat_d_javelin","rhsusf_usmc_marpat_d_marksman","rhsusf_usmc_marpat_d_stinger","rhsusf_usmc_marpat_d_uav"]; };
//RHS USAF (USMC WD MARPAT)
if (_faction == "rhs_faction_usmc_wd") then { _resultArray = ["rhsusf_usmc_marpat_wd_squadleader","rhsusf_navy_sarc_wd_fast","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_autorifleman","rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_javelin","rhsusf_usmc_marpat_wd_marksman","rhsusf_usmc_marpat_wd_stinger","rhsusf_usmc_marpat_wd_uav"]; };
//RHS AFRF (Russia MSV)
if (_faction == "rhs_faction_msv") then { _resultArray = ["rhs_msv_emr_sergeant","rhs_msv_emr_medic","rhs_msv_emr_grenadier_rpg","rhs_msv_emr_rifleman","rhs_msv_emr_arifleman_rpk","rhs_msv_emr_rifleman","rhs_msv_emr_rifleman","rhs_msv_emr_aa","rhs_msv_emr_LAT","rhs_msv_emr_marksman"]; };
//RHS AFRF (Russia VDV)
if (_faction == "rhs_faction_vdv") then { _resultArray = ["rhs_vdv_des_sergeant","rhs_vdv_des_medic","rhs_vdv_des_grenadier_rpg","rhs_vdv_des_rifleman","rhs_vdv_des_arifleman_rpk","rhs_vdv_des_rifleman","rhs_vdv_des_rifleman","rhs_vdv_des_LAT","rhs_vdv_des_aa","rhs_vdv_des_marksman"]; };
//Eric J Taliban Units
if (_faction == "Tban") then { _resultArray = ["TBan_Fighter6","TBan_Fighter5","TBan_Fighter4","TBan_Fighter3NH","TBan_Fighter2NH","TBan_Fighter1NH","TBan_Fighter3","TBan_Fighter2","TBan_Fighter1"]; };
//RHS SAF (ChDHZ)
if (_faction == "rhssaf_faction_army") then { _resultArray = ["rhssaf_army_m10_digital_sq_Lead","rhssaf_army_m10_digital_medic","rhssaf_army_m10_digital_gl","rhssaf_army_m10_digital_rifleman_m70","rhssaf_army_m10_digital_mgun_m84","rhssaf_army_m10_digital_rifleman_m70","rhssaf_army_m10_digital_rifleman_m70","rhssaf_army_m10_digital_spec_aa","rhssaf_army_m10_digital_spec_at","rhssaf_army_m10_digital_sniper_m76"]; };

_resultArray;