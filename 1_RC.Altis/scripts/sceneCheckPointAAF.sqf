RC_Officer disableAI "all";  
RC_Checker disableAI "all";

// Subtitles for RC_Officer; still needs say3d (or alike) 
[] spawn
{

	line1 = ["Officer", "Stop!", RC_Officer];
	[[line1], "GUER", 0.15, false] execVM "fn_simpleConv.sqf";

		sleep 03.132;
		
		sleep 24.5;
	
	line1 = ["Officer", "Okay move alo- wait.", RC_Officer];
	[[line1], "GUER", 0.15, false] execVM "fn_simpleConv.sqf";

		sleep 2;
		
	playMusic "LeadTrack02_F_EPB";
	
		sleep 2;

	line1 = ["Officer", "Copy.", RC_Officer];
	[[line1], "GUER", 0.15, false] execVM "fn_simpleConv.sqf";

		sleep 4; 

	line1 = ["Officer", "You two, step out of the vehicle.", RC_Officer];
	[[line1], "GUER", 0.15, false] execVM "fn_simpleConv.sqf";

};

// Animation set for RC_Officer at the checkpoint
RC_Officer switchMove "Acts_PercMstpSlowWrflDnon_handup2b";
[] spawn
{
	sleep 03.132;
	RC_Officer playMove "Acts_SignalToCheck";
	sleep 24.5;
	RC_Officer playMove "Acts_listeningToRadio_In";
	RC_Officer playMove "Acts_listeningToRadio_Loop";
	RC_Officer playMove "Acts_listeningToRadio_Out";
	RC_Officer playMove "Acts_Pointing_Front"; 
};

// Animation set for RC_Checker at the checkpoint
sleep 5.5;
RC_Checker setPosATL getPosATL RC_Checker;
RC_Checker switchMove "Acts_WalkingChecking";  
sleep 36;

line1 = ["Officer", "Right now!", RC_Officer];
[[line1], "GUER", 0.15, false] execVM "fn_simpleConv.sqf";

// enabelsAI and targets the player (both AI units) 
RC_Officer enableAI "all"; 
RC_Officer setBehaviourStrong "AWARE"; 
RC_Officer doWatch player;
RC_Officer doTarget player;

RC_Checker enableAI "all"; 
RC_Checker setBehaviourStrong "AWARE"; 
RC_Checker doWatch player;
RC_Checker doTarget player;

// RC_Task4 = true to enable next scene via trigger and task! 
RC_Task4 = true,

// This adds weapons and gear to the player when Task 4 begins
sleep 1; 
player addWeapon "arifle_Mk20_F";
player addPrimaryWeaponItem "acc_flashlight";
player addPrimaryWeaponItem "optic_ACO_grn_smg";
player addPrimaryWeaponItem "30Rnd_556x45_Stanag";
player addWeapon "hgun_Rook40_F";
player addHandgunItem "muzzle_snds_L";
player addHandgunItem "16Rnd_9x21_Mag";
player addItemToUniform "30Rnd_556x45_Stanag";
player addItemToUniform "30Rnd_556x45_Stanag";



// Check how long the player has time to engage and shoot the officer and the barrels, adjust time if too short! 

sleep 7; 

line1 = ["Officer", "Open Fire!", RC_Officer];
[[line1], "GUER", 0.15, false] execVM "fn_simpleConv.sqf";

if (alive RC_Officer) then {
    west setFriend [resistance, 0];
    resistance setFriend [west, 0];

    // Introduce a short delay (adjust as needed)
    sleep 1;

    RC_Officer doWatch player;
    RC_Officer setBehaviour "COMBAT";

    // Force the AI to move slightly (also the vehicle) 
    RC_Officer forceSpeed 0.01;
	RC_Car setVelocityModelSpace [0, 0.01, 0];
    // Introduce another short delay (adjust as needed)
    sleep 1;
    RC_Officer doTarget player;
    RC_Officer fireAtTarget [player, currentWeapon RC_Officer];
	RC_Checker enableAI "All"; 
	RC_Car setVelocityModelSpace [0, 0.01, 0];
	// Add End here or let player die; 
};
