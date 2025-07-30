/* Big building collapse effect (debries and earthquake) */
params ["_building"];

//Event Handler
_building addEventHandler ["Hit", {
    params ["_building", "_damage"];
    if (damage _building > 0.2) then {
        // Rimuovi l'event handler per evitare ripetizioni
        _building removeAllEventHandlers "Hit";
        
        private _bomb = "IEDUrbanSmall_Remote_Ammo" createVehicle (getPos _building);
        _bomb setDamage 1;
        [2] spawn BIS_fnc_earthquake;

        private _debrisCount = random [20, 30, 40];
        private _debrisArray = [
            "Land_ShellCrater_02_debris_F",
            "Land_Fortress_01_bricks_v2_F",
            "Land_Fortress_01_bricks_v2_F",
            "Land_DomeDebris_01_hex_damaged_green_F"
        ];

        // Spawning debris
        for "_i" from 1 to _debrisCount do {
            private _distance = random [2, 7, 12];
            private _direction = random [0, 180, 359];
            private _randomPos = [_building, _distance, _direction] call BIS_fnc_relPos;
            private _debris = selectRandom _debrisArray;
            _debris createVehicle _randomPos;
        };
    };
}];
