/* Gives the vehicle a random status in damage, ammo and fuel */
params["_vehicle","_forceFuel","_forceAmmo"];
_fuel = random 1;
_ammo = random 1;
_damage = random 1;
//Making sure there is >= 0.2 units of fuel
if(_forceFuel) then { while { _fuel < 0.2 } do { _fuel = random[0, 0.5, 1]; }; };
//Making sure there is >= 0.2 units of ammo
if(_forceAmmo) then { while { _ammo < 0.2 } do { _ammo = random[0, 0.5, 1]; }; };
_vehicle setDammage _damage;
_vehicle setFuel _fuel;
_vehicle setVehicleAmmoDef _ammo;
_vehicle setHit ["kola", random[0, 0.5, 1]];		//Wheels
_vehicle setHit ["korba", random[0, 0.5, 1]];		//Hull
