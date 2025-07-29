/* Returns the position of a random city in the map */
_towns = nearestLocations [getPosATL (allPlayers select 0), ["NameCity"], worldSize];
_townsCount = count _towns;
//Choose random town
_locationPosition = position ((_towns select (random _townsCount)));
_locationPosition;
