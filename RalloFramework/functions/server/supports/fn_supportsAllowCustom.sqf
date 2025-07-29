//Authorized TeamLeaders/SquadLeaders array
_vanillaUnitTypesAllowedArray = [ "B_G_Soldier_SL_F","B_Soldier_SL_F","B_W_Soldier_SL_F","B_T_Soldier_SL_F","O_Soldier_SL_F","O_soldierU_TL_F","O_SoldierU_SL_F","O_V_Soldier_TL_hex_F","I_Soldier_SL_F","I_E_Soldier_SL_F","I_G_Soldier_SL_F"];
//RHS USAF
_usafUnitTypesAllowedArray = ["rhsusf_army_ocp_squadleader","rhsusf_army_ocp_arb_squadleader","rhsusf_army_ucp_squadleader","rhsusf_army_ucp_arb_squadleader","rhsusf_usmc_marpat_d_squadleader","rhsusf_usmc_lar_marpad_d_squadleader","rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_lar_marpat_wd_squadleader","rhsusf_army_ocp_teamleader","rhsusf_socom_marsoc_teamleader","rhsusf_army_ocp_arb_teamleader","rhsusf_army_ucp_teamleader","rhsusf_army_ucp_arb_teamleader","rhsusf_socom_marsoc_teamchief","rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_lar_marpat_d_teamleader","rhsusf_usmc_recon_marpat_d_teamleader","rhsusf_usmc_recon_marpat_d_teamleader_fast","rhsusf_usmc_recon_marpat_d_teamleader_lite","rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_lar_marpat_wd_teamleader","rhsusf_usmc_recon_marpat_wd_teamleader","rhsusf_usmc_recon_marpat_wd_teamleader_fast","rhsusf_usmc_recon_marpat_wd_teamleader_lite"];
//RHS AFRF
_afrfUnitTypesAllowedArray = ["rhs_msv_emr_efreitor","rhs_msv_efreitor","rhs_vdv_efreitor","rhs_vdv_des_efreitor","rhs_vdv_flora_efreitor","rhs_vdv_mflora_efreitor","rhs_vdv_recon_efreitor","rhs_vmf_emr_efreitor","rhs_vmf_flora_efreitor","rhs_vmf_recon_efreitor","rhs_mvd_izlom_efreitor","rhs_msv_emr_sergeant","rhs_msv_sergeant","rhs_vdv_sergeant","rhs_vdv_des_sergeant","rhs_vdv_flora_sergeant","rhs_vdv_mflora_sergeant","rhs_vdv_recon_sergeant","rhs_vmf_emr_sergeant","rhs_vmf_flora_sergeant","rhs_vmf_recon_sergeant","rhs_mvd_izlom_sergeant"];
_unitTypesAllowedArray = _vanillaUnitTypesAllowedArray + _usafUnitTypesAllowedArray + _afrfUnitTypesAllowedArray;
//Custom support module to all teamleaders/squadleaders
{
  if(alive _x) then
  {
    if(typeOf _x in _unitTypesAllowedArray) then
    {
      [_x, "SupportGroundQRF"] call BIS_fnc_addCommMenuItem;
      [_x, "SupportVehicleAirdrop"] call BIS_fnc_addCommMenuItem;
    };
  };
} forEach allPlayers;
