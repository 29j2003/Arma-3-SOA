// Paths for UnitPlay, likely redudent and not needed as they are being played directly from their file. 

PATH_Heli = compile preprocessfile "unitPlay\RC_Heli.sqf";
PATH_CAR = compile preprocessfile "unitPlay\RC_Car.sqf";
PATH_CARHAUPT01 = compile preprocessfile "unitPlay\RC_CarHaupt01.sqf";
PATH_CARJUMP = compile preprocessfile "unitPlay\RC_CarJump.sqf";


execVM "scripts\sceneRecon.sqf"; // intro 

// Trigger Area for the player, so he doesn't go away to far; trgAreaRC01 = true is the needed condition to actiavte or deactivate it
// areaFAILED and areaWARNING are the triggers that will be attached to the player so he doesn't just leave the AO.
trgAreaRC01 = true; 
areaFAILED attachTo [RC_NPC, [0, 0, 1]];
areaWARNING attachTo [RC_NPC, [0, 0, 1]];
//RC_wp01 = true; // to activate the Waypoint of RC_NPC, where he moves to the car.
//Task01 = true; // to activate the first Task 


// Player ID
[player,"PersianHead_A3_04_l","male02GRE", 0.96] call BIS_fnc_setIdentity;
player setName ["Savro Costa","Savro","Costa"];
