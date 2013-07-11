
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
	["MX 6.5 mm","arifle_MX_F",150,75],
	["MX 3GL 6.5 mm","arifle_MX_GL_F",250,125],
	["MXC 6.5 mm","arifle_MXC_F",150,75],
	["MXM 6.5 mm","arifle_MXM_F",700,350],

	//Light Machine Gun
	["MX SW 6.5 mm","arifle_MX_SW_F",200,100],
	["Mk200 6.5 mm","LMG_Mk200_F",300,150],
	["Zafir 7.62 mm","LMG_Zafir_F",400,200],
	//Assault Rifle
	["Mk20C 5.56 mm","arifle_Mk20C_F",150,75],
	["Mk20 5.56 mm","arifle_Mk20_F",150,75],	
	["Mk20 EGLM 5.56 mm","arifle_Mk20_GL_F",150,75],

	["TRG-20 5.56 mm","arifle_TRG20_F",150,75],	
	["TRG-21 5.56 mm","arifle_TRG21_F",150,75],
	["TRG-21 EGLM 5.56 mm","arifle_TRG21_GL_F",250,125],

	["Katiba 6.5 mm","arifle_Katiba_F",150,75],
	["Katiba Carabine 6.5 mm","arifle_Katiba_C_F",150,75],
	["Katiba GL 6.5 mm","arifle_Katiba_GL_F",250,125],
	//Sniper
	["Mk18 ABR 7.62 mm","srifle_EBR_F",1000,500],
	["M320 LRR .408","srifle_LRR_F",3000,1500],
	["GM6 Lynx 12.7 mm","srifle_GM6_F",3000,1500]
]; 

smgArray =
[
	["Vermin SBR 9mm", "SMG_01_F", 60, 30],
	["Scorpion EVO-4 9mm", "SMG_02_F", 60, 30]
];

shotgunArray =
[
]; 

launcherArray =
[
    //Rocket
	["PCML","launch_NLAW_F",800,400],
	["RPG-42 Alamut","launch_RPG32_F",800,400],
	["Titan MPRL","launch_Titan_F",1000,500],
	["Titan MPRL Compact","launch_Titan_short_F",900,500]
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

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray =
[
	["9mm 16Rnd Mag","16Rnd_9x21_Mag",15],
	["9mm 30Rnd Mag","30Rnd_9x21_Mag",30],
	["9mm 9Rnd ACP-C2 Mag","9Rnd_45ACP_Mag",30],
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
	["Titan AT Missile","Titan_AT",800],
	["Titan AP Missile","Titan_AP",550]
];

//Gun Store item List
//Text name, classname, buy cost, item class
accessoriesArray =
[
	["Suppressor 9mm","muzzle_snds_L", 120, "item"],
	["Suppressor ACP", "muzzle_snds_acp", 120, "item"],
	["Suppressor 5.56mm", "muzzle_snds_M", 250, "item"],
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
	["MRCO Sight","optic_MRCO", 500,"item"],
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

	["Small Medic Drk Brn","B_AssaultPack_rgr_Medic",750,"backpack"],
	["Small Repair Drk Brn","B_AssaultPack_rgr_Repair",1200,"backpack"],
	["Medium Brn","B_FieldPack_Base",700,"backpack"],
	["Medium Blk","B_FieldPack_blk",700,"backpack"],
	["Medium Camo","B_FieldPack_ocamo",700,"backpack"],
	["Medium Camo Blu","B_FieldPack_oucamo",700,"backpack"],
	["Medium Diver Blk","B_FieldPack_blk_DiverExp",4300,"backpack"],
	//["Medium Diver TL Blk","B_FieldPack_blk_DiverTL",1200,"backpack"],
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
	["Steerable parachute","B_Parachute",1000,"backpack"]
	//["TestB_Carryall_oucamo_Exp","B_Carryall_oucamo_Exp",0,"backpack"],
	//["TestBag_Base","Bag_Base",0,"backpack"]
];

//Gun Store Apparel List
//Text name, classname, buy cost, item class
apparelArray =
[	
];

headArray=
[
	//["Bandanna (Coyote)", "H_Bandanna_cbr", 10, "hat"],
	//["Bandanna (Camo)", "H_Bandanna_camo", 10, "hat"],
	//["Bandanna (Gray)", "H_Bandanna_gry", 10, "hat"],
	//["Bandanna (Khaki)", "H_Bandanna_khk", 10, "hat"],
	//["Bandanna (MTP)", "H_Bandanna_mcamo", 10, "hat"],
	//["Bandanna (Sage)", "H_Bandanna_sgg", 10, "hat"],
	//["Bandanna (Surfer)", "H_Bandanna_surfer", 15, "hat"],
	//["Bandanna Mask (Black)", "H_BandMask_blk", 15, "hat"],
	//["Bandanna Mask (Demon)", "H_BandMask_demon", 15, "hat"],
	//["Bandanna Mask (Khaki)", "H_BandMask_khk", 15, "hat"],
	//["Bandanna Mask (Reaper)", "H_BandMask_reaper", 15, "hat"],
	["Beanie", "H_Watchcap_blk", 10, "hat"],
	//["Beanie (Camo)", "H_Watchcap_camo", 10, "hat"],
	//["Beanie (Khaki)", "H_Watchcap_khk", 10, "hat"],
	//["Beanie (Sage)", "H_Watchcap_sgg", 10, "hat"],
	//["Beret (Black)", "H_Beret_blk", 25, "hat"],
	//["Beret (Green)", "H_Beret_grn", 25, "hat"],
	//["Beret (Police)", "H_Beret_blk_POLICE", 25, "hat"],
	//["Beret (Red)", "H_Beret_red", 25, "hat"],
	//["Beret (SAS)", "H_Beret_brn_SF", 25, "hat"],
	//["Beret (SF)", "H_Beret_grn_SF", 25, "hat"],
	//["Beret (RED)", "H_Beret_ocamo", 25, "hat"],
	//["Black Turban", "H_TurbanO_blk", 30, "hat"],
	//["Booniehat (Dirty)","H_Booniehat_dirty", 25,"hat"],
	["Booniehat (Green)","H_Booniehat_grn", 25,"hat"],
	["Booniehat (Hex)","H_Booniehat_ocamo", 25,"hat"],
	//["Booniehat (Khaki)","H_Booniehat_khk", 25,"hat"],
	//["Booniehat (MTP)","H_Booniehat_mcamo", 25,"hat"],
	["Booniehat (Tan)","H_Booniehat_tan", 25,"hat"],
	//["Booniehat (GREEN)","H_Booniehat_dgtl", 25,"hat"],
	["Blue Cap", "H_MilCap_blue", 20, "hat"],
	["Cap (BI)","H_Cap_grn_BI", 20,"hat"],
	["Cap (Black)","H_Cap_blk", 20,"hat"],
	["Cap (Blue)","H_Cap_blu", 20,"hat"],
	["Cap (CMMG)","H_Cap_blk_CMMG", 20,"hat"],
	["Cap (Green)","H_Cap_grn", 20,"hat"],
	["Cap (ION)","H_Cap_blk_ION", 20,"hat"],
	["Cap (POLICE)","H_Cap_blu_POLICE", 20,"hat"],
	["Cap (Raven Security)","H_Cap_blk_Raven", 20,"hat"],
	["Cap (Red)","H_Cap_red", 20,"hat"],
	["Cap (SAS)","H_Cap_khaki_specops_UK", 20,"hat"],
	["Cap (SERO)","H_Cap_brn_SERO", 20,"hat"],
	["Cap (SF)","H_Cap_tan_specops_US", 20,"hat"],
	["Cap (SPECOPS)","H_Cap_brn_SPECOPS", 20,"hat"],
	["Cap (Surfer)","H_Cap_surfer", 20,"hat"],
	["Cap (Tan)","H_Cap_tan", 20,"hat"],
	//["Shemag (Khaki)","H_ShemagOpen_khk", 20,"hat"],
	//["Shemag (Tan)","H_ShemagOpen_tan", 20,"hat"],
	//["Shemag mask(Khaki)","H_Shemag_khk", 20,"hat"],
	//["Shemag mask (Tan)","H_Shemag_tan", 20,"hat"],
	//["Straw Hat","H_StrawHat", 20,"hat"],
	//["Straw Hat (Dark)","H_StrawHat_dark", 20,"hat"],
	["Checked Cap 1","H_MilCap_chck1", 20,"hat"],
	["Checked Cap 2","H_MilCap_chck2", 20,"hat"],
	["Checked Cap 3","H_MilCap_chck3", 20,"hat"],
	["Military Cap (Gray)","H_MilCap_gry", 20,"hat"],
	["Military Cap (Hex)","H_MilCap_ocamo", 20,"hat"],
	["Military Cap (MTP)","H_MilCap_mcamo", 20,"hat"],
	["Military Cap (Russia)","H_MilCap_rucamo", 20,"hat"],
	["Military Cap (Urban)","H_MilCap_oucamo", 20,"hat"],
	["Military Cap (Green)","H_MilCap_dgtl", 20,"hat"],
	["Rangemaster Cap", "H_Cap_headphones", 20, "hat"],
	["Assassin Helmet (Black)", "H_HelmetSpecO_blk", 250, "hat"],
	//["Assassin Helmet (Hex)", "H_HelmetSpecO_ocamo", 250, "hat"],
	["Crew Helmet","H_HelmetCrew_B", 120,"hat"],
	["Crew Helmet (Green)","H_HelmetCrew_I", 120,"hat"],
	["Crew Helmet (Red)","H_HelmetCrew_O", 120,"hat"],
	["MICH","H_HelmetIA", 120,"hat"],
	["MICH (Camo)","H_HelmetIA_net", 120,"hat"],
	["MICH 2 (Camo)","H_HelmetIA_camo", 120,"hat"],
	["ECH","H_HelmetB", 120,"hat"],
	["ECH (Light)","H_HelmetB_light", 120,"hat"],
	["ECH (Spraypaint)","H_HelmetB_paint", 120,"hat"],
	["SF Helmet","H_HelmetSpecB", 120,"hat"],
	["SF Helmet (Black)","H_HelmetSpecB_blk", 120,"hat"],
	["SF Helmet (Dark Paint)","H_HelmetSpecB_paint2", 120,"hat"],
	["SF Helmet (Light Paint)","H_HelmetSpecB_paint1", 120,"hat"],
	["Protector Helmet (Hex)","H_HelmetO_ocamo", 100,"hat"],
	["Protector Helmet (Urban)","H_HelmetO_oucamo", 100,"hat"],
	["Heli Crew Helmet (Blue)","H_CrewHelmetHeli_B", 120,"hat"],
	["Heli Crew Helmet (Red)","H_CrewHelmetHeli_O", 120,"hat"],
	["Heli Crew Helmet (Green)","H_CrewHelmetHeli_I", 120,"hat"],
	["Heli Pilot Helmet (Blue)","H_PilotHelmetHeli_B", 120,"hat"],
	["Heli Pilot Helmet (Red)","H_PilotHelmetHeli_O", 120,"hat"],
	["Heli Pilot Helmet (Green)","H_PilotHelmetHeli_I", 120,"hat"],	
	["Pilot Helmet (Blue)","H_PilotHelmetFighter_B", 130,"hat"],
	["Pilot Helmet (Red)","H_PilotHelmetFighter_O", 130,"hat"]
	//["Pilot Helmet (Green)","H_PilotHelmetFighter_I", 130,"hat"],
];

uniformArray=
[
	["Fatigues (Hex)","U_O_CombatUniform_ocamo", 100,"uni"],
	//["Fatigues (Urban)","U_O_CombatUniform_oucamo", 100,"uni"],
	//["Recon Fatigues (Black)","U_O_SpecopsUniform_blk", 100,"uni"],
	//["Recon Fatigues (Hex)","U_O_SpecopsUniform_ocamo", 100,"uni"],
	//["Recon Fatigues (MTP)","U_B_CombatUniform_wdl_vest", 100,"uni"],
	//["Recon Fatigues (MTP)","U_B_CombatUniform_sgg_vest", 100,"uni"],
	//["Recon Fatigues (MTP)","U_B_CombatUniform_mcam_vest", 100,"uni"],
	//["Combat Fatigues (MTP)","U_B_CombatUniform_wdl", 100,"uni"],
	//["Combat Fatigues (MTP)","U_B_CombatUniform_sgg", 100,"uni"],
	//["Combat Fatigues (MTP)", "U_B_CombatUniform_mcam", 100, "uni"],
	//["Combat Fatigues (MTP)(TEE)", "U_B_CombatUniform_mcam_tshirt", 100, "uni"],
	//["Combat Fatigues (MTP)(TEE)", "U_B_CombatUniform_wdl_tshirt", 100, "uni"],
	//["Combat Fatigues (MTP)(TEE)", "U_B_CombatUniform_sgg_tshirt", 100, "uni"],
	["Combat Fatigues (Green)", "U_I_CombatUniform", 100, "uni"],
	//["Combat Fatigues (Green)", "U_I_CombatUniform_shortsleeve", 100, "uni"],
	//["Combat Fatigues (Green)", "U_I_CombatUniform_tshirt", 100, "uni"],
	//["Officer Fatigues (Hex)", "U_O_OfficerUniform_ocamo", 100, "uni"],
	["Officer Fatigues (Hex)", "U_I_OfficerUniform", 100, "uni"],
	["Worn Combat Fatigues (MTP)", "U_B_CombatUniform_mcam_worn", 100, "uni"],
	["Rangemaster Suit", "U_Rangemaster", 100, "uni"],
	["Wetsuit Blue","U_B_Wetsuit", 200,"uni"],
	["Wetsuit Red","U_O_Wetsuit", 200,"uni"],
	["Wetsuit Green","U_I_Wetsuit", 200,"uni"],
	["Ghillie (Blue)","U_B_GhillieSuit", 450,"uni"],
	["Ghillie (Red)", "U_O_GhillieSuit", 450, "uni"],
	["Ghillie (Green)", "U_I_GhillieSuit", 450, "uni"],
	["Heli Pilot Coveralls Blue", "U_B_HeliPilotCoveralls", 100, "uni"],
	["Heli Pilot Coveralls Green", "U_I_HeliPilotCoveralls", 100, "uni"],
	["Pilot Coveralls Blue", "U_B_HeliPilotCoveralls", 100, "uni"],
	["Pilot Coveralls Red", "U_O_PilotCoveralls", 100, "uni"],
	//["Pilot Coveralls Green", "U_I_pilotCoveralls", 100, "uni"],
	["Competitor Suit","U_Competitor", 50,"uni"],
	//["Jacket and Shorts","U_OrestesBody", 50,"uni"],
	//["Kabeiroi Leader's Outfit","U_IG_Menelaos", 50,"uni"],
	//["Novak's Leisure Suit","U_C_Novak", 50,"uni"],
	//["Scientist Suit","U_OI_Scientist", 50,"uni"],
	["Common Clothes 1","U_C_Commoner1_1", 50,"uni"],
	//["Common Clothes 2","U_C_Commoner1_2", 50,"uni"],
	//["Common Clothes 3","U_C_Commoner1_2", 50,"uni"],
	["Polo Red/White","U_C_Poloshirt_redwhite", 50,"uni"],
	["Polo Salmon","U_C_Poloshirt_salmon", 50,"uni"],
	["Polo tri-color","U_C_Poloshirt_tricolour", 50,"uni"],
	["Polo Blue","U_C_Poloshirt_blue", 50,"uni"],
	["Polo Burgundy","U_C_Poloshirt_burgundy", 50,"uni"],
	["Polo Stripped","U_C_Poloshirt_stripped", 50,"uni"],
	["Underwear","U_BasicBody", 20,"uni"]
	//["Underwear 1","U_NikosBody", 20,"uni"],
	//["Underwear 2","U_MillerBody", 20,"uni"],
	//["Underwear 3","U_KerryBody", 20,"uni"],
	//["Underwear 4","U_AttisBody", 20,"uni"],
	//["Underwear 5","U_AntigonaBody", 20,"uni"]
];

vestArray=
[
	["Carrier GL Rig (Black)","V_PlateCarrierGL_blk", 250,"vest"],
	//["Carrier GL Rig (Coyote)","V_PlateCarrierGL_cbr", 250,"vest"],
	//["Carrier GL Rig (Green)","V_PlateCarrierGL_rgr", 250,"vest"],
	["Carrier Lite (Black)","V_PlateCarrier1_blk", 250,"vest"],
	//["Carrier Lite (Coyote)","V_PlateCarrier1_cbr", 250,"vest"],
	//["Carrier Lite (Green)","V_PlateCarrier1_rgr", 250,"vest"],
	["Carrier Rig (Black)","V_PlateCarrier2_blk", 250,"vest"],
	//["Carrier Rig (Coyote)","V_PlateCarrier2_cbr", 250,"vest"],
	//["Carrier Rig (Green)","V_PlateCarrier2_rgr", 250,"vest"],
	["Carrier Special Rig (Coyote)","V_PlateCarrierSpec_cbr", 275,"vest"],
	//["Carrier Special Rig (Green)","V_PlateCarrierSpec_rgr", 275,"vest"],
	//["Fighter Chestrig (Olive)","V_ChestrigF_oli", 275,"vest"],
	["GA Carrier GL Rig","V_PlateCarrierIAGL_dgtl", 275,"vest"],
	//["GA Carrier Lite (Digi)","V_PlateCarrierIA1_dgtl", 275,"vest"],
	//["GA Carrier Rig (Digi)","V_PlateCarrierIA2_dgtl", 275,"vest"],
	["LBV Harness", "V_HarnessO_brn", 250, "vest"],
	//["LBV Harness (Gray)", "V_HarnessO_gry", 250, "vest"],
	["LBV Gren Harness", "V_HarnessOGL_brn", 250, "vest"],
	//["LBV Gren Harness (Gray)", "V_HarnessOGL_gry", 250, "vest"],
	["Chest Rig (Khaki)","V_Chestrig_khk", 300,"vest"],
	["Slash Bandolier (Coyote)","V_BandollierB_cbr", 100,"vest"],
	["Slash Bandolier (Green)","V_BandollierB_rgr", 100,"vest"],
	["Slash Bandolier (Khaki)","V_BandollierB_khk", 100,"vest"],
	["Slash Bandolier (Olive)","V_BandollierB_oli", 100,"vest"],
	["Tactical Vest (Black)","V_TacVest_blk", 100,"vest"],
	["Tactical Vest (Brown)","V_TacVest_brn", 100,"vest"],
	["Tactical Vest (Camo)","V_TacVest_camo", 100,"vest"],
	["Tactical Vest (Olive)","V_TacVest_oli", 100,"vest"],
	["Tactical Vest (Khaki)","V_TacVest_khk", 100,"vest"],
	["Tactical Vest (Police)","V_TacVest_blk_POLICE", 100,"vest"],
	["Rangemaster Belt", "V_Rangemaster_belt", 100, "vest"],
	["Rebreather Blue","V_RebreatherB", 250,"vest"],
	["Rebreather Red","V_RebreatherIR", 250,"vest"],
	["Rebreather Green","V_RebreatherIA", 250,"vest"]
	//["Camouflaged Vest","V_TacVestCamo_khk", 100,"vest"],
	//["Raven Vest","V_TacVestIR_blk", 100,"vest"],
];

genItemArray=
[
	["GPS","ItemGPS", 100,"item"],
	["Binoculars","Binocular",100,"binoc"],
	["NV Goggles","NVGoggles",100,"binoc"],
	["Diving Goggles","G_Diving",100,"gogg"],
	["Rangefinder","Rangefinder",300,"binoc"],   
	["Laser Designator","Laserdesignator",3000,"binoc"],
	//["Laser Batteries","Laserbatteries",20,"item"],
	["Mine Detector","MineDetector",200,"item"],
	["First Aid","FirstAidKit", 100,"item"],
	["Medkit","Medikit", 550,"item"],
	["Toolkit","ToolKit", 550,"item"]
];

//Text name, classname, buy cost, spawn type, color
landArray =
[
	["Quadbike Blue","B_Quadbike_01_F",250,"vehicle",125],
	["Quadbike Red","O_Quadbike_01_F",250,"vehicle",125],
	["Quadbike Green","I_Quadbike_01_F",250,"vehicle",125],
	["Quadbike Civilian","C_Quadbike_01_F",250,"vehicle",125],
	["Offroad","C_Offroad_01_F",500,"vehicle",250],
	["HEMTT Open","B_Truck_01_transport_F",700,"vehicle",400],
	["HEMTT Covered","B_Truck_01_covered_F",900,"vehicle",400],
	["Zamak Open","O_Truck_02_transport_F",700,"vehicle",400],
	["Zamak Covered","O_Truck_02_covered_F",900,"vehicle",400]
]; 

armoredArray =
[
	["Hunter","B_MRAP_01_F",2000,"vehicle",1000],
	["Hunter HMG","B_MRAP_01_hmg_F",7000,"vehicle",3500],
	["Hunter GMG","B_MRAP_01_gmg_F",8000,"vehicle",4000],
	["Ifrit","O_MRAP_02_F",3000,"vehicle",1500],
	["Ifrit HMG","O_MRAP_02_hmg_F",8000,"vehicle",4000],
	["Ifrit GMG","O_MRAP_02_gmg_F",9000,"vehicle",4500],
	["Strider","I_MRAP_03_F",3000,"vehicle",1500],
	["Strider HMG","I_MRAP_03_hmg_F",8000,"vehicle",4000],
	["Strider GMG","I_MRAP_03_gmg_F",9000,"vehicle",4500],
	["AMV-7 Marshall","B_APC_Wheeled_01_cannon_F",13000,"vehicle",""],
	["MSE-3 Marid","O_APC_Wheeled_02_rcws_F",13000,"vehicle",""]
];

tanksArray =
[

];

helicoptersArray =
[
	["MH-9 Hummingbird","B_Heli_Light_01_F",5000,"vehicle",""],//little bird
	["PO-30 Orca (Black)", "O_Heli_Light_02_unarmed_F", 6000, "vehicle", ""], //ka-60
	["CH-49 Mohawk", "I_Heli_Transport_02_F", 8000, "vehicle", ""],//big transport chopper
	
	["UH-80 Ghosthawk","B_Heli_Transport_01_F",10000,"vehicle",""],//stealth chopper 2 gunners
	["AH-9 Pawnee","B_Heli_Light_01_armed_F",12000,"vehicle",""],//little bird with guns
	["PO-30 Orca", "O_Heli_Light_02_F", 13000, "vehicle", ""],//armed ka-60
	["AH-99 Blackfoot","B_Heli_Attack_01_F",20000,"vehicle",""],//attack chopper
	["Mi-48 Kajman", "O_Heli_Attack_02_F", 25000, "vehicle", ""], //attack chopper with gunner
	["Mi-48 Kajman (Black)", "O_Heli_Attack_02_black_F", 25000, "vehicle", ""] //attack chopper with gunner
];

jetsArray =
[
];

boatsArray =
[
	["Assault Boat Blue","B_Boat_Transport_01_F",750,"boat",500],
	["Assault Boat Red","O_Boat_Transport_01_F",750,"boat",500],
	["Assault Boat Green","I_Boat_Transport_01_F",750,"boat",500],
	["Rescue Blue","B_Lifeboat",500,"boat",500],
	["Rescue Red","O_Lifeboat",500,"boat",500],
	["Rescue Civilian", "C_Rubberboat", 500,"boat",500],
	["Speedboat Minigun Blue","B_Boat_Armed_01_minigun_F",6000,"boat",3000],
	["Speedboat HMG","O_Boat_Armed_01_hmg_F",7000,"boat",3500],
	["Speedboat Minigun Green","I_Boat_Armed_01_minigun_F",5000,"boat",500]
];

submarinesArray = 
[
	["SDV Submarine Blue", "B_SDV_01_F", 1500, "submarine", 750],
	["SDV Submarine Red", "O_SDV_01_F", 1500, "submarine", 750],
	["SDV Submarine Green", "I_SDV_01_F", 1500, "submarine", 750]
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
