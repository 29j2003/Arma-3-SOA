PATH_Heli = compile preprocessfile "scripts\RC_Heli.sqf";
PATH_CAR = compile preprocessfile "scripts\RC_Car.sqf";
PATH_CARHAUPT01 = compile preprocessfile "scripts\RC_CarHaupt01.sqf";

//execVM "Scripts\scenes\sceneRecon.sqf";
// areaFAILED attachTo [RC_NPC, [0, 0, 1]];
// areaWARNING attachTo [RC_NPC, [0, 0, 1]];

// [player,"PersianHead_A3_04_l","male02GRE", 0.96] call BIS_fnc_setIdentity;
// player setName ["Savro Kosta","Savro","Kosta"];



// = true; // Variable um AI-Spotting anzumachen, damit Player ggf. Aufgabe failen kann
// trgAreaRC01 = true; // aktiviert trigger, bzw. macht den scharf falls spieler versucht abzuhauen, wird deaktiviert wenn spieler beim HUB ist!



// welche Layers angezeigt werden sollen, bzw. nicht angezeigt werden sollen am Start der Mission
{ 
        _x hideobject false; 
    } foreach (getmissionlayerentities "OptionalMissions" select 0);
{ 
        _x hideobject false; 
    } foreach (getmissionlayerentities "HUB" select 0);
	
// muss sicher stellen, das wenn ich simulation anmache, nur die anmache die von den gebäuden ist, AI in einen Sepraten Layer oder so machen
// Damit einfach alle Missionen erstmal deaktiviert sind bzw. nicht angezeigt werden
{ 
        _x enableSimulation false;
        _x hideObject true;
    } foreach (getmissionlayerentities "Hauptmissonen" select 0);

{ 
        _x enableSimulation false;
        _x hideObject true;
    } foreach (getmissionlayerentities "Krankenhaus" select 0);




