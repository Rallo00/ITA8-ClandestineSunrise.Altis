/* Returns a boolean checking if player is vanilla unit */
_currentFaction = faction (allPlayers select 0);
_resultIsVanilla = false;
switch (_currentFaction) do
{
	case "BLU_F": { _resultIsVanilla = true; };
	case "BLU_G_F": { _resultIsVanilla = true; };
	case "BLU_T_F": { _resultIsVanilla = true; };
	case "BLU_CTRG_F": { _resultIsVanilla = true; };
	case "BLU_GEN_F": { _resultIsVanilla = true; };
	case "BLU_W_F": { _resultIsVanilla = true; };
	case "OPF_F": { _resultIsVanilla = true; };
	case "OPF_G_F": { _resultIsVanilla = true; };
	case "OPF_T_F": { _resultIsVanilla = true; };
	case "OPF_R_F": { _resultIsVanilla = true; };
	case "IND_F": { _resultIsVanilla = true; };
	case "IND_G_F": { _resultIsVanilla = true; };
	case "IND_C_F": { _resultIsVanilla = true; };
	case "IND_E_F": { _resultIsVanilla = true; };
	case "IND_L_F": { _resultIsVanilla = true; };
	default { _resultIsVanilla = false; }
};
_resultIsVanilla;
