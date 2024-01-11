/* 

Ambient Firefight function: 

  Author: 29/P4TCH3R 
  
  Modified by: Doggifast

  Description:
   A ambient firefight function to be used for ambient purposes that will get hidden when player gets too close or removed
   if for example SOA_AmbientFirefight_%1 = false; has been said. 

  Examples: 

   [_logicName, "_weaponBlue", "_magazineBlue", "_weaponRed", "_magazineRed", _distance, _firefightIndex] spawn TAG_fnc_ambientFirefight;

   ["ambientBattle01", "arifle_MX_F", "30Rnd_65x39_caseless_mag_Tracer", 
   "arifle_Katiba_F", "30Rnd_65x39_caseless_green_mag_Tracer", 400, 1] spawn TAG_fnc_ambientFirefight;
*/





// Functions that creates two units firing at each other, similar to what you can see in TacOps
// systemCHAT "executes"; 
params ["_logicName", "_weaponBlue", "_magazineBlue", "_weaponRed", "_magazineRed", "_distance", "_firefightIndex"];


private _declareGlobalVariableTrue = compile format ["SOA_AmbientFirefight_%1 = true;", _firefightIndex];
private _declareGlobalVariableFalse = compile format ["SOA_AmbientFirefight_%1 = false;", _firefightIndex];
private _declareGlobalVariableEnd = compile format ["SOA_AmbientFirefight_%1 = nil;", _firefightIndex];
call _declareGlobalVariableTrue;

private _getVarFunc = compile format ["SOA_AmbientFirefight_%1", _firefightIndex];


// SOA_AmbientFirefight_1 = false;
// Create soldiers
private _blueGroup = createGroup west;
private _redGroup = createGroup east;
private _blue = _blueGroup createUnit ["B_Soldier_F", getMarkerPos _logicName vectorAdd [2,0,0], [], 0, "NONE"];
private _red = _redGroup createUnit ["O_Soldier_F", getMarkerPos _logicName vectorAdd [-2,0,0], [], 0, "NONE"];


// Set their weapons
removeAllWeapons _blue;
removeAllWeapons _red;

_blue addWeapon _weaponBlue;
_red addWeapon _weaponRed;

_blue addMagazine _magazineBlue;
_red addMagazine _magazineRed;

_blue loadMagazine [_weaponBlue, _magazineBlue];
_red loadMagazine [_weaponRed, _magazineRed];

// Disable Damage and make them visible
_blue hideObject false; 
_red hideObject false; 
_blue allowDamage false; 
_red allowDamage false; 

// disable Pathing
_red disableAI "PATH"; 
_blue disableAI "PATH"; 

// set stance 
_red setUnitPos "UP";
_blue setUnitPos "UP";

// Dynamic Simulation 
_red enableDynamicSimulation true;
_blue enableDynamicSimulation true;
_redGroup enableDynamicSimulation true;
_blueGroup enableDynamicSimulation true;

// Infinite ammo
_blue addEventHandler ["Fired", {(_this select 0) setVehicleAmmo 1}];
_red addEventHandler ["Fired", {(_this select 0) setVehicleAmmo 1}];

// Start the firefight
_blue doTarget _red;
_red doTarget _blue;
_blue forceWeaponFire [_weaponBlue, "Burst"];
_red forceWeaponFire [_weaponRed, "Burst"];

// Monitor player distance

	testvar = _getVarFunc; 
    while {alive _blue && alive _red && (call _getVarFunc)} do {
        waitUntil {sleep 5; true}; // Check every 5 seconds
        private _playerPos = getPos player;
        private _fireFightPos = getPos _blue;
        private _distanceToFireFight = _playerPos distance _fireFightPos;
        
        // If player is too close, stop the firefight
		// systemchat "While Loop"; 
        if (_distanceToFireFight < _distance) then
        {
			// systemchat "Exit One"; 
            break;
            _blue enableSimulation false;
            _red enableSimulation false;
            _blue hideObject true; 
            _red hideObject true; 
        };
        // Randomly stop shooting for a few seconds
        if (random 1 < 0.5) then {
            _blue enableSimulation false;
            waitUntil {sleep random [2, 5, 7]; true}; // Random time between 2 and 10 seconds
            _blue enableSimulation true;
        };
        _blue addMagazine _magazineBlue;

        if (random 1 < 0.5) then {
            _red enableSimulation false;
            waitUntil {sleep random [3, 6, 12]; true}; // Random time between 2 and 10 seconds
            _red enableSimulation true;
        };
        _red addMagazine _magazineRed;
    };

    // Clean up
    _blue removeAllEventHandlers "Fired";
    _red removeAllEventHandlers "Fired";
    deleteVehicle _blue;
    deleteVehicle _red;


if !(call _getVarFunc) exitWith {call _declareGlobalVariableEnd; true};

call _declareGlobalVariableFalse;

// systemChat "Declared False"; 

sleep (random [120, 150, 180]);
[_logicName, _weaponBlue, _magazineBlue, _weaponRed, _magazineRed, _distance, _firefightIndex] spawn TAG_fnc_ambientFirefight;
