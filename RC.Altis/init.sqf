PATH_Heli = compile preprocessfile "unitPlay\RC_Heli.sqf";
PATH_CAR = compile preprocessfile "unitPlay\RC_Car.sqf";
PATH_CARHAUPT01 = compile preprocessfile "unitPlay\RC_CarHaupt01.sqf";

//execVM "scripts\sceneRecon.sqf";
//rec = [] spawn PATH_Heli;
// Trigger Area for the player, so he doesn't go away to far; trgAreaRC01 = true is the needed condition to actiavte or deactivate it
// = true; // Variable um AI-Spotting anzumachen, damit Player ggf. Aufgabe failen kann
// trgAreaRC01 = true; // aktiviert trigger, bzw. macht den scharf falls spieler versucht abzuhauen, wird deaktiviert wenn spieler beim HUB ist!
trgAreaRC01 = true; 
areaFAILED attachTo [RC_NPC, [0, 0, 1]];
areaWARNING attachTo [RC_NPC, [0, 0, 1]];

[player,"PersianHead_A3_04_l","male02GRE", 0.96] call BIS_fnc_setIdentity;
player setName ["Savro Kosta","Savro","Kosta"];





