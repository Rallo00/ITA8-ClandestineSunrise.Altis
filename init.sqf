enableSaving [false,false];
call compileFinal preprocessFileLineNumbers "FAR_revive\FAR_revive_init.sqf";

//Gestione JIP per gioco
private ["_isJipPlayer"];
_isJipPlayer = false;
if (!isServer && isNull player) then
{
    _isJipPlayer = true;
};
a3e_arr_JipSpawnPos = [];