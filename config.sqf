
currentOwnerName = "";
pistolArray =
[
	//Handgun
    ["P07 9 mm","hgun_P07_F",40,20],
	["Rook-40 9 mm","hgun_Rook40_F",40,20],
	["ACP-C2 9 mm","hgun_ACPC2_F",40,20]
]; 

rifleArray =
[
    //Underwater Gun
	["SDAR 5.56 mm","arifle_SDAR_F",50,25],
	//Assault Rifle
	["MX 6.5 mm","arifle_MX_F",100,50],
	["MX 3GL 6.5 mm","arifle_MX_GL_F",250,125],
	["MXC 6.5 mm","arifle_MXC_F",100,50],
	["MXM 6.5 mm","arifle_MXM_F",700,350],

	//Light Machine Gun
	["MX SW 6.5 mm","arifle_MX_SW_F",200,100],
	["Mk200 6.5 mm","LMG_Mk200_F",300,150],
	["Zafir 7.62 mm","LMG_Zafir_F",400,200],
	//Assault Rifle
	["Mk20C 5.56 mm","arifle_Mk20C_F",100,50],
	["Mk20 5.56 mm","arifle_Mk20C_F",100,50],	
	["Mk20 EGLM 5.56 mm","arifle_Mk20_GL_F",100,50],

	["TRG-20 5.56 mm","arifle_TRG20_F",100,50],	
	["TRG-21 5.56 mm","arifle_TRG21_F",100,50],
	["TRG-21 EGLM 5.56 mm","arifle_TRG21_GL_F",250,125],

	["Katiba 6.5 mm","arifle_Katiba_F",100,50],
	["Katiba Carabine 6.5 mm","arifle_Katiba_C_F",100,50],
	["Katiba GL 6.5 mm","arifle_Katiba_GL_F",250,125],
	//Sniper
	["Mk18 ABR 7.62 mm","srifle_EBR_F",1000,500],
	["M320 LRR .408","srifle_LRR_F",3000,1500],
	["GM6 Lynx 12.7 mm","srifle_GM6_F",3000,1500]
]; 

smgArray =
[
	["Vermin SBR 9mm", "SMG_01_F", 90, 45],
	["Scorpion EVO-4 9mm", "SMG_02_F", 90, 45]
];

shotgunArray =
[
]; 

launcherArray =
[
    //Rocket
	["PCML","launch_NLAW_F",800,400],
	["RPG-42 Alamut","launch_RPG32_F",800,400],
	["Titan MPRL","launch_Titan_F",1200,600],
	["Titan MPRL Compact","launch_Titan_short_F",1000,500]
]; 

throwputArray =
[
	["RGO Frag Grenade","HandGrenade",50,0],
	["Stone","HandGrenade_Stone",30,0],
	["Mini Grenade","MiniGrenade",25,0],
	["Smoke Grenade (White)", "SmokeShell", 50,0],
	["Smoke Grenade (Yellow)", "SmokeShellYellow", 50,0],
	["Smoke Grenade (Green)", "SmokeShellGreen", 50,0],
	["Smoke Grenade (Red)", "SmokeShellRed", 50,0],
	["Smoke Grenade (Purple)", "SmokeShellPurple", 50,0],
	["Smoke Grenade (Orange)", "SmokeShellPurple", 50,0],
	["Smoke Grenade (Blue)", "SmokeShellBlue", 50,0],
	["Chemlight (Green)", "Chemlight_green", 10,0],
	["Chemlight (Red)", "Chemlight_red", 10,0],
	["Chemlight (Yellow)", "Chemlight_yellow", 10,0],
	["Chemlight (Blue)", "Chemlight_blue", 10,0],
	["Explosive Charge","DemoCharge_Remote_Mag",500,0],
	["Explosive Satchel","SatchelCharge_Remote_Mag",600,0],
	["AT Mine","ATMine_Range_Mag",500,0],
	["M6 SLAM Mine","SLAMDirectionalMine_Wire_Mag",500,0],
	["Claymore Charge","ClaymoreDirectionalMine_Remote_Mag",300,0],
	["APERS Mine","APERSMine_Range_Mag",500,0],
	["APERS Bounding Mine","APERSBoundingMine_Range_Mag",500,0],
	["APERS Tripwire Mine","APERSTripMine_Wire_Mag",500,0]
];

"Does _itemText  == _x ["3Rnd 3GL Smoke Rounds (Blue)","3Rnd_SmokeBlue_Grenade_shell",75]"
//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray =
[
	["9mm 16Rnd Mag","16Rnd_9x21_Mag",15],
	["9mm 30Rnd Mag","30Rnd_9x21_Mag",30],
	["9mm 30Rnd Vermin Mag","30Rnd_45ACP_MAG_SMG_01",30],
	["9mm 30Rnd VerminTracers (Green) Mag","30Rnd_45ACP_Mag_SMG_01_tracer_green",30],
	["5.56mm 20Rnd Dual Purpose Mag","20Rnd_556x45_UW_mag",15],
	["5.56mm 30Rnd STANAG Mag","30Rnd_556x45_Stanag",20],
	["5.56mm 30Rnd Tracer (Red) Mag","30Rnd_556x45_Stanag_Tracer_Red",20],
	["5.56mm 30Rnd Tracer (Yellow) Mag","30Rnd_556x45_Stanag_Tracer_Yellow",20],
	["5.56mm 30Rnd Tracer (Green) Mag","30Rnd_556x45_Stanag_Tracer_Green",20],
	["6.5mm 30Rnd STANAG Mag","30Rnd_65x39_caseless_mag",30],
	["6.5mm 30Rnd Tracer (Red) Mag","30Rnd_65x39_caseless_mag_Tracer",30],
	["6.5mm 30Rnd Caseless Mag","30Rnd_65x39_caseless_green",25],
	["6.5mm 30Rnd Tracer (Green) Mag","30Rnd_65x39_caseless_green_mag_Tracer",25],
	["6.5mm 100Rnd Belt Case","100Rnd_65x39_caseless_mag",50],
	["6.5mm 100Rnd Tracer (Red) Belt Case","100Rnd_65x39_caseless_mag_Tracer",50],
	["6.5mm 200Rnd Belt Case","200Rnd_65x39_cased_Box",100],
	["6.5mm 200Rnd Tracer (Green) Belt Case","200Rnd_65x39_cased_Box_Tracer",100],
	["7.62mm 20Rnd Mag","20Rnd_762x51_Mag",30],
	["7.62mm 150Rnd Box","150Rnd_762x51_Box",110],
	["7.62mm 150Rnd Tracer (Green) Box","150Rnd_762x51_Box_Tracer",110],
	[".408 7Rnd Cheetah Mag","7Rnd_408_Mag",300],
	["12.7mm 5Rnd Mag","5Rnd_127x108_Mag",325],
	["40mm HE Grenade Round","1Rnd_HE_Grenade_shell",50],
	["Flare Round (White)","UGL_FlareWhite_F",50],
	["Flare Round (Green)","UGL_FlareGreen_F",50],
	["Flare Round (Red)","UGL_FlareRed_F",50],
	["Flare Round (Yellow)","UGL_FlareYellow_F",50],
	["Flare Round (IR)","UGL_FlareCIR_F",50],
	["Smoke Round (White)","1Rnd_Smoke_Grenade_shell",25],
	["Smoke Round (Red)","1Rnd_SmokeRed_Grenade_shell",25],
	["Smoke Round (Green)","1Rnd_SmokeGreen_Grenade_shell",25],
	["Smoke Round (Yellow)","1Rnd_SmokeYellow_Grenade_shell",25],
	["Smoke Round (Purple)","1Rnd_SmokePurple_Grenade_shell",25],
	["Smoke Round (Blue)","1Rnd_SmokeBlue_Grenade_shell",25],
	["Smoke Round (Orange)","1Rnd_SmokeOrange_Grenade_shell",25],
	["40mm 3Rnd HE Grenade","3Rnd_HE_Grenade_shell",150],
	["3Rnd 3GL Flares (White)","3Rnd_UGL_FlareWhite_F",150],
	["3Rnd 3GL Flares (Green)","3Rnd_UGL_FlareGreen_F",150],
	["3Rnd 3GL Flares (Red)","3Rnd_UGL_FlareRed_F",150],
	["3Rnd 3GL Flares (Yellow)","3Rnd_UGL_FlareYellow_F",150],
	["3Rnd 3GL Flares (IR)","3Rnd_UGL_FlareCIR_F",150],
	["3Rnd 3GL Smoke Rounds (White)","3Rnd_Smoke_Grenade_shell",75],
	["3Rnd 3GL Smoke Rounds (Red)","3Rnd_SmokeRed_Grenade_shell",75],
	["3Rnd 3GL Smoke Rounds (Green)","3Rnd_SmokeGreen_Grenade_shell",75],
	["3Rnd 3GL Smoke Rounds (Yellow)","3Rnd_SmokeYellow_Grenade_shell",75],
	["3Rnd 3GL Smoke Rounds (Purple)","3Rnd_SmokePurple_Grenade_shell",75],
	["3Rnd 3GL Smoke Rounds (Blue)","3Rnd_SmokeBlue_Grenade_shell",75],
	["3Rnd 3GL Smoke Rounds (Orange)","3Rnd_SmokeOrange_Grenade_shell",75],
	["PCML Missile","NLAW_F",800],
	["RPG-42 Missile","RPG32_F",550],
	["RPG-42 AA Missile","RPG32_AA_F",1000],
	["Titan AA Missile","Titan_AA",1000],
	["Titan AT Missile","Titan_AT",550],
	["Titan AP Missile","Titan_AP",550]
];

//Gun Store item List
//Text name, classname, buy cost, item class
accessoriesArray =
[
	["GPS","ItemGPS", 100,"item"],
	["Binoculars","Binocular",100,"binoc"],
	["NV Goggles","NVGoggles",100,"binoc"],
	["Diving Goggles","G_Diving",100,"gogg"],
	["Rangefinder","Rangefinder",350,"binoc"],   
	["Mine Detector","MineDetector",200,"item"],
	["First Aid","FirstAidKit", 100,"item"],
	["Medkit","Medikit", 550,"item"],
	["Toolkit","ToolKit", 550,"item"],
	["Suppressor 9mm","muzzle_snds_L", 250,"item"],
	["Suppressor 6.5mm","muzzle_snds_H", 250,"item"],
	["LMG Suppressor 6.5mm","muzzle_snds_H_MG", 250,"item"],
	["Suppressor 7.62mm","muzzle_snds_B", 250,"item"],
	["Flash Light","acc_flashlight", 100,"item"],
	["IR Light","acc_pointer_IR", 100,"item"],
	["Holosight","optic_Holosight", 100,"item"],
	["ACO Sight","optic_Aco", 100,"item"],
	["ACO Sight Green","optic_Aco_grn", 100,"item"],
	["RCO Sight","optic_Hamr", 500,"item"],
	["ARCO Sight","optic_Arco", 500,"item"],
	["SOS Sight","optic_SOS", 2000,"item"]	
]; 

backpackArray =
[
	["Small Grn","B_AssaultPack_Base",350,"backpack"],
	["Small Blk","B_AssaultPack_blk",350,"backpack"],
	["Small Brn","B_AssaultPack_cbr",350,"backpack"],
	["Small Digi","B_AssaultPack_dgtl",350,"backpack"],
	["Small Grn","B_AssaultPack_khk",350,"backpack"],
	//["TestB_AssaultPack_khk_holder","B_AssaultPack_khk_holder",0,"backpack"],
	["Small Camo","B_AssaultPack_mcamo",350,"backpack"],
	//["Small Green","B_AssaultPack_ocamo",0,"backpack"],
	["Small Dark Brn","B_AssaultPack_rgr",350,"backpack"],
	["Small White","B_AssaultPack_sgg",350,"backpack"],
	["Small Diver Blk","B_AssaultPack_blk_DiverExp",2400,"backpack"],
	["Small Diver TL Blk","B_AssaultPack_blk_DiverTL",400,"backpack"],
	["Small Medic Drk Brn","B_AssaultPack_rgr_Medic",750,"backpack"],
	["Small Repair Drk Brn","B_AssaultPack_rgr_Repair",1200,"backpack"],
	["Medium Brn","B_FieldPack_Base",700,"backpack"],
	["Medium Blk","B_FieldPack_blk",700,"backpack"],
	["Medium Camo","B_FieldPack_ocamo",700,"backpack"],
	["Medium Camo Blu","B_FieldPack_oucamo",700,"backpack"],
	["Medium Diver Blk","B_FieldPack_blk_DiverExp",4300,"backpack"],
	["Medium Diver TL Blk","B_FieldPack_blk_DiverTL",1200,"backpack"],
	//["TestB_FieldPack_cbr","B_FieldPack_cbr",0,"backpack"],
	//["TestB_FieldPack_cbr_AT","B_FieldPack_cbr_AT",0,"backpack"],
	["Medium Medic Camo","B_FieldPack_ocamo_Medic",1300,"backpack"],
	["Medium Repair Brn","B_FieldPack_cbr_Repair",2000,"backpack"],
	["Large Brn","B_Bergen_Base",2000,"backpack"],
	["Large Brn 2","B_Kitbag_Base",2000,"backpack"],
	["Large Lght Brn","B_Kitbag_cbr",2000,"backpack"],
	["Large Drk Camo","B_Kitbag_mcamo",2000,"backpack"],
	["Large Green","B_Kitbag_sgg",2000,"backpack"],
	//["TestB_Bergen_sgg","B_Bergen_sgg",0,"backpack"],
	["Large Explosives","B_Bergen_sgg_Exp",5500,"backpack"],
	["Ex Large Brn","B_Carryall_Base",4000,"backpack"],
	["Ex Large Camo","B_Carryall_ocamo",4000,"backpack"],
	["Ex Large Camo Blu","B_Carryall_oucamo",4000,"backpack"],
	["Steerable parachute","B_Parachute",5000,"backpack"]
	//["TestB_Carryall_oucamo_Exp","B_Carryall_oucamo_Exp",0,"backpack"],
	//["TestBag_Base","Bag_Base",0,"backpack"]
];

//Gun Store Apparel List
//Text name, classname, buy cost, item class
apparelArray =
[
	["LBV Harness", "V_HarnessO_brn", 250, "vest"],
	["LBV Gren Harness", "V_HarnessOGL_brn", 250, "vest"],
	["Carrier GL Rig (Green)","V_PlateCarrierGL_rgr", 250,"vest"],
	["Carrier Lite (Coyote)","V_PlateCarrier1_cbr", 250,"vest"],
	["Carrier Lite (Green)","V_PlateCarrier1_rgr", 250,"vest"],
	["Carrier Rig (Green)","V_PlateCarrier2_rgr", 250,"vest"],
	["Chest Rig (Khaki)","V_Chestrig_khk", 300,"vest"],
	["Slash Bandolier (Coyote)","V_BandollierB_cbr", 100,"vest"],
	["Slash Bandolier (Khaki)","V_BandollierB_khk", 100,"vest"],
	["Tactical Vest (Brown)","V_TacVest_brn", 100,"vest"],
	["Tactical Vest (Khaki)","V_TacVest_khk", 100,"vest"],
	["Tactical Vest (Olive)","V_TacVest_oli", 100,"vest"],
	["Combat Fatigues (MTP)","U_B_CombatUniform_mcam_vest", 100,"uni"],
	["Combat Fatigues (Tee)","U_B_CombatUniform_mcam_tshirt", 100,"uni"],
	["Combat Fatigues (Red)", "U_O_CombatUniform_ocamo", 100, "uni"],
	["Ghillie (Blue)","U_B_GhillieSuit", 450,"uni"],
	["Ghillie (Red)", "U_O_GhillieSuit", 450, "uni"],
	["Rebreather 1","V_RebreatherB", 250,"vest"],
	["Rebreather 2","V_RebreatherIR", 250,"vest"],
	["Wetsuit Blue","U_B_Wetsuit", 200,"uni"],
	["Wetsuit Red","U_O_Wetsuit", 200,"uni"],
	["ECH","H_HelmetB", 120,"hat"],
	["ECH (Light)","H_HelmetB_light", 120,"hat"],
	["ECH (Custom)","H_HelmetB_paint", 120,"hat"],
	["Booniehat (Hex)","H_Booniehat_ocamo", 25,"hat"],
	["Booniehat (Khaki)","H_Booniehat_khk", 25,"hat"],
	["Booniehat (MTP)","H_Booniehat_mcamo", 25,"hat"],
	["Cap (Blue)","H_Cap_blu", 20,"hat"],
	["Cap (Red)","H_Cap_red", 20,"hat"],
	["Cap (SERO)","H_Cap_brn_SERO", 20,"hat"],
	["Military Cap", "H_MilCap_mcamo", 20, "hat"],
	["Military Cap (Hex)", "H_MilCap_ocamo", 20, "hat"],
	["Cap Military (Hex)","H_MilCap_ocamo", 20,"hat"],
	["Cap Military (MTP)","H_MilCap_mcamo", 20,"hat"],
	["Cap Rangemaster","H_Cap_headphones", 20,"hat"],
	["Rangemaster Suit", "U_Rangemaster", 100, "uni"],
	["Rangemaster Belt", "V_Rangemaster_belt", 100, "vest"],
	["Pilot Helmet Blue","H_PilotHelmetHeli_B", 130,"hat"],
	["Pilot Helmet Red","H_PilotHelmetHeli_O", 130,"hat"],
	["Pilot Coveralls Blue", "U_B_HeliPilotCoveralls", 100, "uni"],
	["Pilot Coveralls Red", "U_O_PilotCoveralls", 100, "uni"],
	["Protector Helmet (Hex)","H_HelmetO_ocamo", 100,"hat"],
	["Common Clothes 1","U_C_Commoner1_1", 30,"uni"],
	["Polo Red/White","U_C_Poloshirt_redwhite", 30,"uni"],
	["Polo Salmon","U_C_Poloshirt_salmon", 30,"uni"],
	["Polo tri-color","U_C_Poloshirt_tricolour", 30,"uni"],
	["Polo Blue","U_C_Poloshirt_blue", 30,"uni"],
	["Polo Burgundy","U_C_Poloshirt_burgundy", 30,"uni"]
];

//Text name, classname, buy cost, spawn type, color
landArray =
[
	["Quadbike","C_Quadbike_01_F",250,"vehicle",125],
	["Offroad","C_Offroad_01_F",500,"vehicle",350],
	["HEMTT Open","B_Truck_01_transport_F",750,"vehicle",400],
	["HEMTT Covered","B_Truck_01_covered_F",750,"vehicle",400],
	["Zamak Open","O_Truck_02_transport_F",750,"vehicle",400],
	["Zamak Covered","O_Truck_02_covered_F",750,"vehicle",400]
]; 

armoredArray =
[
	["Hunter","B_MRAP_01_F",1,"vehicle",1000],
	["Hunter HMG","B_MRAP_01_hmg_F",1,"vehicle",3500],
	["Hunter GMG","B_MRAP_01_gmg_F",1,"vehicle",4000],
	["Ifrit","O_MRAP_02_F",1,"vehicle",1500],
	["Ifrit HMG","O_MRAP_02_hmg_F",1,"vehicle",4000],
	["Ifrit GMG","O_MRAP_02_gmg_F",1,"vehicle",4500],
	["Strider","I_MRAP_03_F",1,"vehicle",1500],
	["Strider HMG","I_MRAP_03_hmg_F",1,"vehicle",4000],
	["Strider GMG","I_MRAP_03_gmg_F",1,"vehicle",4500]
];

tanksArray =
[
	["AMV-7 Marshall","B_APC_Wheeled_01_cannon_F",1,"vehicle",""],
	["MSE-3 Marid","O_APC_Wheeled_02_rcws_F",1,"vehicle",""]
];

helicoptersArray =
[
	["MH-9 Hummingbird","B_Heli_Light_01_F",1,"vehicle",""],
	["AH-9 Pawnee","B_Heli_Light_01_armed_F",1,"vehicle",""],
	["AH-99 Blackfoot","B_Heli_Attack_01_F",1,"vehicle",""],
	["UH-80 Ghosthawk","B_Heli_Transport_01_F",1,"vehicle",""],
	["Mi-48 Kajman", "O_Heli_Attack_02_F", 1, "vehicle", ""],
	["Mi-48 Kajman (Black)", "O_Heli_Attack_02_black_F", 1, "vehicle", ""],
	["PO-30 Orca", "O_Heli_Light_02_F", 1, "vehicle", ""],
	["PO-30 Orca (Black)", "O_Heli_Light_02_unarmed_F", 1, "vehicle", ""],
	["CH-49 Mohawk", "I_Heli_Transport_02_F", 1, "vehicle", ""]
];

jetsArray =
[
];

boatsArray =
[
	["Assault Boat Blue","B_Boat_Transport_01_F",1000,"boat",500],
	["Assault Boat Red","O_Boat_Transport_01_F",1000,"boat",500],
	["Assault Boat Green","I_Boat_Transport_01_F",1000,"boat",500],
	["Rescue Blue","B_Lifeboat",1000,"boat",500],
	["Rescue Red","O_Lifeboat",1000,"boat",500],
	["Speedboat Minigun Blue","B_Boat_Armed_01_minigun_F",6000,"boat",3000],
	["Speedboat HMG","O_Boat_Armed_01_hmg_F",7000,"boat",3500],
	["Speedboat Minigun Green","I_Boat_Armed_01_minigun_F",5000,"boat",500]
];

submarinesArray = 
[
	["SDV Submarine", "B_SDV_01_F", 1, "submarine", 1000]
];

colorsArray =
[
	["Orange Camo", false],
	["Red Camo", false],
	["Yellow Camo", false],
	["Pink Camo", false]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
generalStore =
[
	["Water","water",localize "STR_WL_ShopDescriptions_Water","client\icons\water.paa",50,25],
	["Canned Food","canfood",localize "STR_WL_ShopDescriptions_CanFood","client\icons\cannedfood.paa",50,25],
	["Repair Kit","repairkits",localize "STR_WL_ShopDescriptions_RepairKit","client\icons\briefcase.paa",300,150],
	["Medical Kit","medkits",localize "STR_WL_ShopDescriptions_MedKit","client\icons\medkit.paa",400,200],
	["Jerry Can (Full)","fuelFull",localize "STR_WL_ShopDescriptions_fuelFull","client\icons\jerrycan.paa",150,75],
	["Jerry Can (Empty)","fuelEmpty",localize "STR_WL_ShopDescriptions_fuelEmpty","client\icons\jerrycan.paa",50,25]
];

// Chernarus town and city array
//Marker Name, Radius, City Name
cityList = [
		["Town_1",100,"South of Air Station Mike-26"],
		["Town_2",100,"West of Camp Baldy"],
		["Town_3",100,"East of Camp Maxwell"],
		["Town_4",100,"Strogos Bay"],			
		["Town_5",100,"East of Camp Tempest"],
		["Town_6",100,"Old Outpost"],
		["Town_7",100,"East of Airfield"],
		["Town_8",100,"OTS"],
		["Town_9",100,"Kill Farm"],
		["Town_10",100,"Agia Marina"],
		["Town_11",100,"Kamino Firing Range"],
		["Town_12",100,"Airfield"],
		["Town_13",100,"Medical Supplies"],
		["Town_14",100,"East of Girna"],
		["Town_15",100,"Kevin DD's Medical Supplies"]
];
cityLocations = [];

gunStoreForMarkers = ["West_GS", "West_GSA", "East_GS", "East_GSE"];
