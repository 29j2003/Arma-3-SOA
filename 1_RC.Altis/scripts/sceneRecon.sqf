// Add to each showSubtitles a 3dSay or something alike for VA! 
// Stotska = RC_NPC; Costa = player 

0 fadeSound 0;
[0, 1, false, true] call BIS_fnc_cinemaBorder;

player setDir ([player, target1] call BIS_fnc_dirTo);
player switchMove "HubSpectator_stand";
player switchMove "AwopPpneMstpSoptWbinDnon_non"; 
player setDir ([player, target1] call BIS_fnc_dirTo);

titleCut ["", "BLACK FADED", 999];

sleep 3; 

RC_NPC setDir ([player, target1] call BIS_fnc_dirTo);
RC_NPC disableAI "all";

playMusic "Wasteland"; // Mby. changeout to something else later? 

sleep 3;

player enableSimulation false; 

2 fadeSound 0.3;

titleText ["<t align='center' font='PuristaBold' color='#FFFFFF' size='3' >Team Valkyrie<br/>Presents</t>", "PLAIN", 0.9, true, true];  
// 0.9 is the time that it shows up (x10) 


sleep 3;

line1 = ["Stotska", "How bad?", RC_NPC];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

// Lightning bolt triggers 
RC_lightningBolt = true;
sleep 4; 
RC_lightningBolt = false;

line1 = ["Costa", "More than we anticipated.", player];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

sleep 6;

line1 = ["Stotska", "Then they may be aware of the invasion.", RC_NPC];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

sleep 5; 

// Status Report of Costa: 
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

line1 = ["Costa", "Could be.", player];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

RC_NPC setDir ([RC_NPC, target2] call BIS_fnc_dirTo);
rec = [] spawn PATH_Heli;

player setDir ([player, target1] call BIS_fnc_dirTo);
sleep 7;
disableUserInput false; 

player enableSimulation true;
player setDir ([player, target1] call BIS_fnc_dirTo);

titleCut ["", "BLACK IN", 4];
sleep 1;

line1 = ["Stotska", "Stay low - AAF helo inbound.", RC_NPC];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

5 fadeSound 1;
sleep 6.4;
RC_lightningBolt = true;
titleText ["<t valign='middle' font='PuristaBold' color='#FFFFFF' size='4'>Siege of Altis</t>", "PLAIN", 0.7, true, true];
sleep 3;
RC_lightningBolt = false;


// hier noch say3d/say hinzufügen

line1 = ["Costa", "Did it get visual on us?", player];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

sleep 4; 

line1 = ["Stotska", "Unlikely – though waiting a bit more shouldn’t hurt.", RC_NPC];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

sleep 10; 

line1 = ["Costa", "I have never seen that much AAF presence in Kavala - at least not since the Civil War.", player];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

sleep 7; 

line1 = ["Stotska", "Me neither.", RC_NPC];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

sleep 12; 

line1 = ["Stotska", "Okay, we should be good to go.", RC_NPC];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

sleep 4; 

line1 = ["Stotska", "Let's get out of here.", RC_NPC];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

sleep 2; 

player playMove ""; 
RC_NPC enableAI "all";
[1, 3, false, true] call BIS_fnc_cinemaBorder;

RC_wp01 = true; // to activate the Waypoint of RC_NPC, where he moves to the car.
Task01 = true; // to activate the first Task 

sleep 2;
saveGame; 
