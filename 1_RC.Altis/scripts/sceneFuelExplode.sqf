
// 
myFuelTank = RC_fuelTankRust;
myAPC = RC_apc;

// Event handler to check if the fuel tank is destroyed and trigger a larger explosion with smoke and APC explosion
myFuelTank addEventHandler ["killed", {
    private ["_fuelTank", "_explosionPosition", "_explosion", "_apc"];

    _fuelTank = _this select 0;
    _explosionPosition = getPos _fuelTank;

    // creates and detonates a explosion
    _explosion = "Bo_GBU12_LGB" createVehicle _explosionPosition;
    _explosion setDamage 1;
	
	// creates smoke effect via trigger
	RC_Smoke = true;
	
	RC_hb01 hideObject true; 
	RC_hb02 hideObject true; 
	RC_hb03 hideObject true; 
	RC_hb04 hideObject true; 
	RC_hb05 hideObject false; 
	RC_hb06 hideObject false; 
	RC_hb07 hideObject true; 
	RC_hb08 hideObject true; 
	RC_hb09 hideObject false; 
	RC_hb010 hideObject false; 
	RC_scaff01 hideObject true; 
	RC_crater01 hideObject false;
	RC_crater02 hideObject false;
	RC_NPC allowDamage false;
	player allowDamage false; 
	
	// Condition to finish Task 04
	RC_shotTanks = true;
    // 
    _apc = RC_apc;

    // Check if the APC is alive, then trigger its explosion
    if (alive _apc) then {
		_apc setDamage 1; 
    }

    // If needed, more scripts/smokes/explosions here: 
}];

