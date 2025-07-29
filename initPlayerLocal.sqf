["InitializePlayer", [player]] call BIS_FNC_DYNAMICGROUPS;

//Respawn su caposquadra se e' JIP
if([] call BIS_fnc_didJIP) then { player setPos (getPos p1); };

//Intro Screen________________________________
[] spawn
{
//Fade Black In_______________________________
		cutText ["", "BLACK FADED", 999];
		0.1 fadeSound 0;
			sleep 1;
//Blur Effect__________________________________
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [6];
			"dynamicBlur" ppEffectCommit 0;
			"dynamicBlur" ppEffectAdjust [0.0];
			"dynamicBlur" ppEffectCommit 3;

			0=[[["ARMA ITA CLAN PRESENTA, ","align = 'center' size = '0.7' font='PuristaBold'"],["","<br/>"],["Clandestine Sunrise","align = 'center' size = '0.7'","#aaaaaa"]]] spawn BIS_fnc_typeText2;
			sleep 10;
			
//Fade Black Out______________________________
		cutText ["", "BLACK IN", 18];
			20 fadeSound 1;

sleep 5;
any= ["Pekfas Bay",
"24/06/2035",
"North-East Altis"
] spawn BIS_fnc_infoText;
};