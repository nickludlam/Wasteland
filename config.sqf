
currentOwnerName = "";
weaponsArray =
[
	//Handgun
    ["P07","hgun_P07_F",40,20],
	["Rook-40","hgun_Rook40_F",40,20],
    //Underwater Gun
	["SDAR","arifle_SDAR_F",50,25],
	//Assault Rifle
	["MX","arifle_MX_F",100,50],
	["MX 3GL","arifle_MX_GL_F",250,125],
	["MXC","arifle_MXC_F",100,50],
	["MXM","arifle_MXM_F",700,350],
	//Light Machine Gun
	["MX SW","arifle_MX_SW_F",200,100],
	["Mk200","LMG_Mk200_F",300,150],
	["TRG-20","arifle_TRG20_F",100,50],	
	["TRG-21","arifle_TRG21_F",100,50],
	//Assault Rifle
	["TRG-21 EGLM","arifle_TRG21_GL_F",250,125],
	["Katiba","arifle_Khaybar_F",100,50],
	["Katiba Carabine","arifle_Khaybar_C_F",100,50],
	["Katiba GL","arifle_Khaybar_GL_F",250,125],
	//Sniper
	["EBR","srifle_EBR_F",1000,500],
	["LRR","srifle_LRR_F",3000,1500],
	["GM6","srifle_GM6_F",3000,1500],
    //Rocket
	["NLAWr","launch_NLAW_F",800,400],
	["RPG-42 Alamut","launch_RPG32_F",1000,500]
]; 

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray =
[
	["9mm 16Rnd","16Rnd_9x21_Mag",15],
	["5.56mm 20Rnd UW","20Rnd_556x45_UW_mag",15],
	["5.56mm 30Rnd STANAG","30Rnd_556x45_Stanag",20],
	["5.56mm 30Rnd STANAG Tracer (Red)","30Rnd_556x45_Stanag_Tracer_Red",20],
	["5.56mm 30Rnd STANAG Tracer (Green)","30Rnd_556x45_Stanag_Tracer_Green",20],
	["5.56mm 30Rnd STANAG Tracer (Yell)","30Rnd_556x45_Stanag_Tracer_Yellow",20],
	["6.5mm 30Rnd C","30Rnd_65x39_case_mag",25],
	["6.5mm 30Rnd CL","30Rnd_65x39_caseless_mag",30],
	["6.5mm 30Rnd CL Tracer","30Rnd_65x39_caseless_mag_Tracer",30],
	["6.5mm 30Rnd Kabita CL","30Rnd_65x39_caseless_green",25],
	["6.5mm 30Rnd Kabita CL Tracer","30Rnd_65x39_caseless_green_mag_Tracer",25],
	["6.5mm 100Rnd","100Rnd_65x39_caseless_mag_Tracer",50],
	["6.5mm 200Rnd","200Rnd_65x39_cased_Box",100],
	["6.5mm 200Rnd Tracer","200Rnd_65x39_cased_Box_Tracer",100],
	["7.62mm 20Rnd","20Rnd_762x51_Mag",30],
	[".408mm 7Rnd","7Rnd_408_Mag",300],
	["12.7mm 5Rnd","5Rnd_127x108_Mag",325],
	["HE Grenade","1Rnd_HE_Grenade_shell",50],
	["GL Flare 40mm (White)","UGL_FlareWhite_F",50],
	["GL Flare 40mm (Green)","UGL_FlareGreen_F",50],
	["GL Flare 40mm (Red)","UGL_FlareRed_F",50],
	["GL Flare 40mm (Yellow)","UGL_FlareYellow_F",50],
	["GL Flare 40mm (Cir)","UGL_FlareCIR_F",50],
	["Hand Grenade","HandGrenade",50],
	["Hand Grenade (Stone)","HandGrenade_Stone",30],
	["Hand Grenade (Mini)","MiniGrenade",25],
	["Explosive Charge","DemoCharge_Remote_Mag",500],
	["Explosive Satchel","SatchelCharge_Remote_Mag",600],
	["AT Mine","ATMine_Range_Mag",500],
	["M6 SLAM Mine","SLAMDirectionalMine_Wire_Mag",500],
	["Claymore Charge","ClaymoreDirectionalMine_Remote_Mag",300],
	["APERS Mine","APERSMine_Range_Mag",500],
	["APERS Bounding Mine","APERSBoundingMine_Range_Mag",500],
	["APERS Tripwire Mine","APERSTripMine_Wire_Mag",500],
	["NLAW Missile","NLAW_F",800],
	["RPG32 Missile","RPG32_F",550],
	["RPG32 AA Missile","RPG32_AA_F",1000]
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
	["Suppressor 7.82mm","muzzle_snds_B", 250,"item"],
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
	["Ex Large Camo Blu","B_Carryall_oucamo",4000,"backpack"]
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
	["Chest Rig (Green)","V_ChestrigB_rgr", 300,"vest"],
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
	["Quadbike","O_Quadbike_F",250,"vehicle",""],
	["Offroad","c_offroad",500,"vehicle",""],
	["Hunter","B_Hunter_F",2000,"vehicle",""],
	["Hunter (O)","B_Hunter_F",2000,"vehicle","orange"],
	["Hunter (R)","B_Hunter_F",2000,"vehicle","red"],
	["Hunter (Y)","B_Hunter_F",2000,"vehicle","yellow"],
	["Hunter (P)","B_Hunter_F",2000,"vehicle","pink"],
	["Hunter HMG","B_Hunter_HMG_F",7000,"vehicle",""],
	["Hunter HMG (O)","B_Hunter_HMG_F",7000,"vehicle","orange"],
	["Hunter HMG (R)","B_Hunter_HMG_F",7000,"vehicle","red"],
	["Hunter HMG (Y)","B_Hunter_HMG_F",7000,"vehicle","yellow"],
	["Hunter HMG (P)","B_Hunter_HMG_F",7000,"vehicle","pink"],
	["Hunter GMG","B_Hunter_RCWS_F",8000,"vehicle",""],
	["Hunter GMG (O)","B_Hunter_HMG_F",8000,"vehicle","orange"],
	["Hunter GMG (R)","B_Hunter_HMG_F",8000,"vehicle","red"],
	["Hunter GMG (Y)","B_Hunter_HMG_F",8000,"vehicle","yellow"],
	["Hunter GMG (P)","B_Hunter_HMG_F",8000,"vehicle","pink"],
	["Ifrit","O_Ifrit_F",3000,"vehicle",""],
	["Ifrit HMG","O_Ifrit_MG_F",8000,"vehicle",""],
	["Ifrit GMG","O_Ifrit_GMG_F",9000,"vehicle",""]
]; 

seaArray =
[
	["Assault Boat Blue","B_Assaultboat",1000,"boat",""],
	["Assault Boat Red","O_Assaultboat",1000,"boat",""],
	["Rescue Blue","B_Lifeboat",1000,"boat",""],
	["Rescue Red","O_Lifeboat",1000,"boat",""],
	["Speedboat Minigun","B_SpeedBoat",6000,"boat",""],
	["Speedboat Minigun (O)","B_SpeedBoat",6000,"boat","orange"],
	["Speedboat Minigun (R)","B_SpeedBoat",6000,"boat","red"],
	["Speedboat Minigun (Y)","B_SpeedBoat",6000,"boat","yellow"],
	["Speedboat Minigun (P)","B_SpeedBoat",6000,"boat","pink"],
	["Speedboat HMG","O_SpeedBoat",7000,"boat",""],
	["Speedboat HMG (O)","O_SpeedBoat",7000,"boat","orange"],
	["Speedboat HMG (R)","O_SpeedBoat",7000,"boat","red"],
	["Speedboat HMG (Y)","O_SpeedBoat",7000,"boat","yellow"],
	["Speedboat HMG (P)","O_SpeedBoat",7000,"boat","pink"]
]; 

airArray =
[
	["MH-9","B_MH9_F",5000,"vehicle",""],
	["MH-9 (O)","B_MH9_F",5000,"vehicle","orange"],
	["MH-9 (R)","B_MH9_F",5000,"vehicle","red"],
	["MH-9 (Y)","B_MH9_F",5000,"vehicle","yellow"],
	["MH-9 (P)","B_MH9_F",5000,"vehicle","pink"],
	["AH-9 (w)","B_AH9_F",12000,"vehicle",""],
	["AH-9 (w)(O)","B_AH9_F",12000,"vehicle","orange"],
	["AH-9 (w)(R)","B_AH9_F",12000,"vehicle","red"],
	["AH-9 (w)(Y)","B_AH9_F",12000,"vehicle","yellow"],
	["AH-9 (w)(P)","B_AH9_F",12000,"vehicle","pink"],
	["Ka-60","O_Ka60_Unarmed_F",6000,"vehicle",""],
	["Ka-60 (O)","O_Ka60_Unarmed_F",6000,"vehicle","orange"],
	["Ka-60 (R)","O_Ka60_Unarmed_F",6000,"vehicle","red"],
	["Ka-60 (Y)","O_Ka60_Unarmed_F",6000,"vehicle","yellow"],
	["Ka-60 (P)","O_Ka60_Unarmed_F",6000,"vehicle","pink"],
	["Ka-60 (w)","O_Ka60_F",13000,"vehicle",""],
	["Ka-60 (w)(O)","O_Ka60_F",13000,"vehicle","orange"],
	["Ka-60 (w)(R)","O_Ka60_F",13000,"vehicle","red"],
	["Ka-60 (w)(Y)","O_Ka60_F",13000,"vehicle","yellow"],
	["Ka-60 (w)(P)","O_Ka60_F",13000,"vehicle","pink"]
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
		["Town_15",100,"KevinDD's Medical Supplies"]
];
cityLocations = [];

gunStoreForMarkers = ["West_GS", "West_GSA", "East_GS", "East_GSE"];
