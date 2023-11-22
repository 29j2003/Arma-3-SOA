// Scene with the player and RC_NPC from getting into the car till the checkpoint
// still needs Say3D; and Costa lines! 

[0, 9999999, true, true] call BIS_fnc_cinemaBorder;
sleep 1; 

line1 = ["Stotska", "And back to base we go.", RC_NPC];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

sleep 6; 
line1 = ["Costa", "Thats unconvienient.", player];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

sleep 3; 

line1 = ["Stotska", "Of course somebody crashed.", RC_NPC];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

sleep 15; 
line1 = ["Stotska", "And they've closed down the other route.", RC_NPC];

[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

sleep 5; 

line1 = ["Costa", "We are going through the checkpoint, aren't we?", player];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";

sleep 4;

line1 = ["Stotska", "Yeah - be ready for anything...", RC_NPC];
[[line1], "BLUFOR", 0.15, false] execVM "fn_simpleConv.sqf";