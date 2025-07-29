/* Arma ITA ending script */
//Final music
5 fadeSound 0.3;
playMusic "BackgroundTrack02_F";
private _nomiGiocatoriArray = [];
private _contatorePosArray = 0;
private _contatoreSelezione = 0;
private _testo = "";
//Array with players name
{
  _nomiGiocatoriArray set [_contatorePosArray,name _x];
  _contatorePosArray = _contatorePosArray + 1;
} forEach allPlayers;
//From array to one string pipeing
_testo = _nomiGiocatoriArray joinString " | ";
//End mission message
sleep 15;
["<t color='#C48214' size = '.8'>Siete stati grandi.</t><t size = '.8'> Avete portato a termine</t>",-1,0.05,3,1,0,789] spawn BIS_fnc_dynamicText;
sleep 6;
[[[localize "STR_INF_scenario_title", "<t shadow = '1' size = '2' font='PuristaBold'>%1</t>"]]] spawn BIS_fnc_typeText;
sleep 16;
17 fadeMusic 0;
17 fadeSound 1;
//Printin players
[format["<t color='#C48214'>I nostri uomini: </t>%1",_testo],-1,0,3,1,0,789] spawn BIS_fnc_dynamicText;
sleep 15;
endMission "winner";
