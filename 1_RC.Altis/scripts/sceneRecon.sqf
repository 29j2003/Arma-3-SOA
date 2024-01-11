// Add to each showSubtitles a 3dSay or something alike for VA! 
// Stotska = RC_NPC; You = player 

  
0 fadeSound 0;
[0, 1, false, true] call BIS_fnc_cinemaBorder;

player setDir ([player, target1] call BIS_fnc_dirTo);
player switchMove "HubSpectator_stand";
player switchMove "AwopPpneMstpSoptWbinDnon_non"; 
player setDir ([player, target1] call BIS_fnc_dirTo);

titleCut ["", "BLACK FADED", 999];

sleep 1; 

RC_NPC setDir ([RC_NPC, target1] call BIS_fnc_dirTo);
RC_NPC switchMove "AmovPpneMstpSnonWnonDnon"; 
RC_NPC disableAI "all";

//playMusic "Wasteland"; // Mby. changeout to something else later? 
playMusic "LeadTrack01_F_Curator"; 

sleep 1;
playMusic "LeadTrack01_F_Curator";
player enableSimulation false; 

sleep 1; 
2 fadeSound 0.3;

titleText ["<t align='center' valign='top' font='PuristaBold' color='#FFFFFF' size='2' >Team Valkyrie<br/>Presents</t>", "PLAIN", 0.9, true, true];  
// 0.9 is the time that it shows up (x10) 


sleep 5;

line1 = ["Stotska", "How bad?", RC_NPC, 3, 1, "3D"];
[[line1], "BLUFOR", false, true] call RC_fnc_Conv;

// Lightning bolt triggers 
RC_lightningBolt = true;
sleep 3; 
RC_lightningBolt = false;

line1 = ["You", "More than we anticipated.", player, 4, 1, "3D"];
[[line1], "BLUFOR", false, true] call RC_fnc_Conv;

sleep 4;

line1 = ["Stotska", "They know about it then.", RC_NPC, 4, 1, "3D"];
[[line1], "BLUFOR", false, true] call RC_fnc_Conv;

sleep 4; 

line1 = ["You", "Could be.", player, 4, 1, "3D"];
[[line1], "BLUFOR", false, true] call RC_fnc_Conv;

sleep 3; 

titleText ["<t align='center' font='PuristaBold' color='#FFFFFF' size='4'>Siege of Altis</t>", "PLAIN", 0.7, true, true];


RC_NPC setDir ([RC_NPC, target2] call BIS_fnc_dirTo);
rec = [] spawn PATH_Heli;

player setDir ([player, target1] call BIS_fnc_dirTo);
sleep 7;
disableUserInput false; 

player enableSimulation true;
player setDir ([player, target1] call BIS_fnc_dirTo);

titleCut ["", "BLACK IN", 5];
sleep 1;

line1 = ["Stotska", "Stay low - bird inbound.", RC_NPC, 4, 1, "3D"];
[[line1], "BLUFOR", false, true] call RC_fnc_Conv;

5 fadeSound 1;
sleep 1.5;
RC_lightningBolt = true;

// Status Report of player: 
[
	[
		["Savro Costa", "align = 'left' shadow = '0' size = '0.8' font='PuristaBold'"],
		["", "<br/>"],
		["FIA - Special Forces", "align = 'left' shadow = '0' size = '0.8' font='PuristaBold'"],
		["", "<br/>"],
		["Assigment: Recon", "align = 'left' shadow = '0' size = '0.8' font='PuristaBold'"],
		["", "<br/>"], // line break
		["South-East of Kavala", "align = 'left' shadow = '0' size = '1.1'"]
	],
	-0.4, 2 / 2,
	true,
	"<t font='PuristaBold'>%1</t>",
	[],
	{ false },
	true
] spawn BIS_fnc_typeText2;

sleep 5;
RC_lightningBolt = false;

[] spawn {25 fadeMusic 0; sleep 18; playMusic ""; 2 fadeMusic 1; playMusic ""}; // change out to something else later


// hier noch say3d/say hinzufügen
line1 = ["You", "Did it get any visual on us?", player, 3, 1, "3D"];
[[line1], "BLUFOR", false, true] call RC_fnc_Conv;

sleep 4; 

line1 = ["Stotska", "Doesn't appear so, though let's wait a bit.", RC_NPC, 6, 1, "3D"];
[[line1], "BLUFOR", false, true] call RC_fnc_Conv;

sleep 10; 

line1 = ["You", "I've never seen that much AAF presence here - at least not since the Civil War.", player, 5, 1, "3D"];
[[line1], "BLUFOR", false, true] call RC_fnc_Conv;

sleep 6; 

line1 = ["Stotska", "Yeah, something is up with that.", RC_NPC, 6, 1, "3D"];
[[line1], "BLUFOR", false, true] call RC_fnc_Conv;

sleep 12; 

line1 = ["Stotska", "Okay, I think we waited long enough.", RC_NPC, 3, 1, "3D"];
[[line1], "BLUFOR", false, true] call RC_fnc_Conv;

sleep 4; 

line1 = ["Stotska", "Let's get out of here.", RC_NPC, 3, 1, "3D"];
[[line1], "BLUFOR", false, true] call RC_fnc_Conv;

sleep 2; 

player playMove ""; 
RC_NPC enableAI "all";
[1, 3, false, true] call BIS_fnc_cinemaBorder;

RC_wp01 = true; // to activate the Waypoint of RC_NPC, where he moves to the car.
Task01 = true; // to activate the first Task 

sleep 2;
saveGame; 
