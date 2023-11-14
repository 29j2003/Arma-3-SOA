RC_Officer disableAI "all";  
RC_Checker disableAI "all";
// say3d + subs 
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

sleep 5.5;
RC_Checker setPosATL getPosATL RC_Checker;
RC_Checker switchMove "Acts_WalkingChecking";  

sleep 35;

RC_Officer enableAI "all"; 
RC_Officer setBehaviourStrong "AWARE"; 
RC_Officer doWatch RC_debugTarget01;
RC_Officer doTarget RC_debugTarget01;

// RC_Task4 = true to enable next scene via trigger and task! 
RC_Task4 = true,

// Check how long the player has time to engage and shoot the officer and the barrels, adjust time if too short! 

sleep 10; 

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
    RC_Officer fireAtTarget [player, currentWeapon RC_Officer]
	RC_Checker enableAI "All"; 
	
	// end here! 
};
//Palce here one end, that triggers after the sleep 8 seconds if the player hasen't reacted fast enough! 
