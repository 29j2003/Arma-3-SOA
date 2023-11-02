
0 fadeSound 0;
[0, 1, false, true] call BIS_fnc_cinemaBorder;
player setDir ([player, target1] call BIS_fnc_dirTo);
player switchMove "HubSpectator_stand";
player switchMove "AwopPpneMstpSoptWbinDnon_non"; 
titleCut ["", "BLACK FADED", 999];
player setDir ([player, target1] call BIS_fnc_dirTo);
sleep 3; 
RC_NPC setDir ([player, target1] call BIS_fnc_dirTo);
RC_NPC disableAI "all";
playMusic "Wasteland";
sleep 3;
player enableSimulation false; 
2 fadeSound 0.3;

titleText ["<t align='center' font='PuristaBold' color='#FFFFFF' size='3' >29/P4TCH3R<br/>Presents</t>", "PLAIN", 0.9, true, true];  // 0.6 ist die Zeit wie lange es braucht bis weg, wird mal 10 multipliziert cause why not

// hier noch say3d/say hinzufügen
sleep 3;
["Stoka", "And?"] spawn BIS_fnc_showSubtitle;

sleep 3; 

["Kosta", "They are making a fortress out of it."] spawn BIS_fnc_showSubtitle;

sleep 5;

["Stoka", "Then they may know about the invasion?"] spawn BIS_fnc_showSubtitle;

sleep 3; 


[
	[
		["Savro Kosta", "align = 'left' shadow = '1' size = '0.7' font='PuristaBold'"],
		["", "<br/>"],
		["FIA - Special Forces", "align = 'left' shadow = '1' size = '0.7' font='PuristaBold'"],
		["", "<br/>"],
		["Assigment: Recon", "align = 'left' shadow = '1' size = '0.7' font='PuristaBold'"],
		["", "<br/>"], // line break
		["South-East of Kavala", "align = 'left' shadow = '1' size = '1.0'"]
	],
	-0.4, 2 / 2,
	true,
	"<t font='PuristaBold'>%1</t>",
	[],
	{ false },
	true
] spawn BIS_fnc_typeText2;

["Kosta", "Could be."] spawn BIS_fnc_showSubtitle;
RC_NPC setDir ([RC_NPC, target2] call BIS_fnc_dirTo);
rec = [] spawn PATH_Heli;
player setDir ([player, target1] call BIS_fnc_dirTo);
sleep 7;
disableUserInput false; 
player enableSimulation true;
player setDir ([player, target1] call BIS_fnc_dirTo);
titleCut ["", "BLACK IN", 4];
sleep 1;
["Stoka", "Don't move - AAF bird inbound!"] spawn BIS_fnc_showSubtitle;

5 fadeSound 1;
sleep 6.3;
titleText ["<t valign='middle' font='PuristaBold' color='#FFFFFF' size='4'>Siege of Kavala</t>", "PLAIN", 0.7, true, true];
sleep 3;
// hier noch say3d/say hinzufügen
["Kosta", "Did it saw us?"] spawn BIS_fnc_showSubtitle;
sleep 4; 
["Stoka", "Not sure - best to wait right now. Scout a bit more in the mean time."] spawn BIS_fnc_showSubtitle;
sleep 10; 
["Kosta", "I have never seen that much AAF presence in Kavala - at least not since the Civil War."] spawn BIS_fnc_showSubtitle;
sleep 7; 
["Stoka", "Me neither."] spawn BIS_fnc_showSubtitle;
sleep 13; 
["Stoka", "Okay, we should be good to go."] spawn BIS_fnc_showSubtitle;
sleep 4; 
["Stoka", "Let's get out of here."] spawn BIS_fnc_showSubtitle;
sleep 3; 
player playMove ""; 
RC_NPC enableAI "all";
[1, 3, false, true] call BIS_fnc_cinemaBorder;
RCwp01 = true; 
saveGame; 
