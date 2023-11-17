// A check script to see if the player as changed his uniform 

waitUntil {sleep 1; uniform player isEqualTo "U_BG_Guerilla2_3" };
closeDialog 602;
RC_CAR lockInventory true;
sleep 1; 
RC_Task2End = true; 