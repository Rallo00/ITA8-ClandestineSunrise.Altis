/* Auto-teleport to leader position or vehicle (written for JIP, can be used elsewhere) */
_unitToTeleport = param[0];
_teamLeader = leader _unitToTeleport;
//Check if subordinate (not leader)
if (_teamLeader != _unitToTeleport) then
{
	//Check if leader is not in vehicle
	if ((vehicle _teamLeader) == _teamLeader) then { _unitToTeleport setPos (getPos _teamLeader); }
	else
	{
		_vehTL = vehicle _teamLeader;
		if ((_vehTL emptyPositions "gunner") > 0) then { _unitToTeleport moveInGunner _vehTL; }
		else
		{
			if ((_vehTL emptyPositions "commander") > 0) then { _unitToTeleport moveInCommander _vehTL; }
			else
			{
				if ((_vehTL emptyPositions "driver") > 0) then { _unitToTeleport moveInDriver _vehTL; }
				else
				{
					if((_vehTL emptyPositions "cargo") > 0) then { _unitToTeleport moveInCargo _vehTL; }
					else { _unitToTeleport setPos (getPos _teamLeader); };
				};
			};
		};
	};
}
