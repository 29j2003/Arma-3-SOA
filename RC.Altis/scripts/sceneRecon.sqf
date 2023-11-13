// Add to each showSubtitles a 3dSay or something alike for VA! 
// Stoka = RC_NPC; Costa = player 


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
playMusic "Wasteland"; // Mby. changeout to something else later? 
sleep 3;
player enableSimulation false; 
2 fadeSound 0.3;

titleText ["<t align='center' font='PuristaBold' color='#FFFFFF' size='3' >29/P4TCH3R<br/>Presents</t>", "PLAIN", 0.9, true, true];  // 0.6 ist die Zeit wie lange es braucht bis weg, wird mal 10 multipliziert cause why not


sleep 3;
["Stoka", "How bad?"] spawn BIS_fnc_showSubtitle;

RC_lightningBolt = true;

sleep 4; 
RC_lightningBolt = false;;
["Costa", "More than we anticipated."] spawn BIS_fnc_showSubtitle;

sleep 6;

["Stoka", "Then they may be aware of the invasion."] spawn BIS_fnc_showSubtitle;

sleep 5; 


[
	[
		["Savro Costa", "align = 'left' shadow = '1' size = '0.7' font='PuristaBold'"],
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
sleep 1;

["Costa", "Could be."] spawn BIS_fnc_showSubtitle;
RC_NPC setDir ([RC_NPC, target2] call BIS_fnc_dirTo);

rec = [] spawn PATH_Heli;

player setDir ([player, target1] call BIS_fnc_dirTo);
sleep 7;
disableUserInput false; 
player enableSimulation true;
player setDir ([player, target1] call BIS_fnc_dirTo);
titleCut ["", "BLACK IN", 4];
sleep 1;
["Stoka", "Stay low - AAF helo inbound."] spawn BIS_fnc_showSubtitle;

5 fadeSound 1;
sleep 5.8;
RC_lightningBolt = true;
titleText ["<t valign='middle' font='PuristaBold' color='#FFFFFF' size='4'>Siege of Altis</t>", "PLAIN", 0.7, true, true];
sleep 3;
RC_lightningBolt = false;
// hier noch say3d/say hinzufügen
["Costa", "Did it get visual on us?"] spawn BIS_fnc_showSubtitle;
sleep 4; 
["Stoka", "Unlikely – though waiting a bit more shouldn’t hurt."] spawn BIS_fnc_showSubtitle;
sleep 10; 
["Costa", "I have never seen that much AAF presence in Kavala - at least not since the Civil War."] spawn BIS_fnc_showSubtitle;
sleep 7; 
["Stoka", "Me neither."] spawn BIS_fnc_showSubtitle;
sleep 12; 
["Stoka", "Okay, we should be good to go."] spawn BIS_fnc_showSubtitle;
sleep 4; 
["Stoka", "Let's get out of here."] spawn BIS_fnc_showSubtitle;
sleep 2; 
player playMove ""; 
RC_NPC enableAI "all";
[1, 3, false, true] call BIS_fnc_cinemaBorder;

RC_wp01 = true; // to activate the Waypoint of RC_NPC, where he moves to the car.
Task01 = true; // to activate the first Task 

sleep 2;
saveGame; 
