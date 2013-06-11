/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of (ground or air) vehicles which can tow towables objects.
 * Liste des noms de classes des v�hicules terrestres pouvant remorquer des objets remorquables.
 */
R3F_LOG_CFG_remorqueurs = [
	"O_Quadbike_F",
    "B_Quadbike_F",
	"c_offroad",
	"O_Ifrit_MG_F",
    "B_Hunter_F",
    "B_Hunter_RCWS_F",
    "B_Hunter_HMG_F",
    "O_Ifrit_F",
    "O_Ifrit_GMG_F",
	"B_Assaultboat",
	"O_Assaultboat",
	"B_SpeedBoat",
	"B_Lifeboat",	
	"O_Lifeboat",
	"O_SpeedBoat"
];

/**
 * List of class names of towables objects.
 * Liste des noms de classes des objets remorquables.
 */
R3F_LOG_CFG_objets_remorquables = [
	"c_offroad",
	"O_Ifrit_MG_F",
	"B_Hunter_F",
	"B_Hunter_RCWS_F",
	"B_Hunter_HMG_F",
	"O_Ifrit_F",
	"O_Ifrit_GMG_F",
	"Land_Cargo20_Military_F",
	"O_Ka60_Unarmed_F",
	"B_MH9_F",
	"O_Ka60_F",
	"Land_Cargo20_military_F",
	"Land_Cargo_Patrol_V1_F",
	"B_AH9_F",
	"Land_MetalBarrel_F",
	"Land_HBarrierBig_F",
	"Land_Mil_WallBig_4m_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_HBarrier_1_F",
	"B_Assaultboat",
	"O_Assaultboat",
	"B_SpeedBoat",
	"B_Lifeboat",	
	"O_Lifeboat",
	"O_SpeedBoat"
];

/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of air vehicles which can lift liftables objects.
 * Liste des noms de classes des v�hicules a�riens pouvant h�liporter des objets h�liportables.
 */
R3F_LOG_CFG_heliporteurs = [
	"O_Ka60_Unarmed_F",
	"B_MH9_F",
	"O_Ka60_F",
	"B_AH9_F"
];

/**
 * List of class names of liftables objects.
 * Liste des noms de classes des objets h�liportables.
 */
R3F_LOG_CFG_objets_heliportables = [
	"c_offroad",
	"O_Ifrit_MG_F",
    "B_Hunter_F",
    "B_Hunter_RCWS_F",
    "B_Hunter_HMG_F",
    "O_Ifrit_F",
    "O_Ifrit_GMG_F",
	"B_Lifeboat",
	"B_Assaultboat",
	"O_Assaultboat",
	"O_Lifeboat",
	"Land_Cargo20_Military_F",
	"Land_Cargo_Patrol_V1_F",
	"B_AH9_F",
	"B_MH9_F",
	"Land_MetalBarrel_F",
	"Land_HBarrierBig_F",
	"Land_Mil_WallBig_4m_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_HBarrier_1_F"
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/


R3F_LOG_CFG_transporteurs = [
	["c_offroad", 50],
	["O_Ifrit_MG_F", 20],
	["B_Hunter_F", 40],
	["B_Hunter_RCWS_F", 20],
	["B_Hunter_HMG_F", 20],
	["O_Ifrit_F", 40],
	["O_Ifrit_GMG_F", 20],
	["O_Ka60_Unarmed_F", 80],
	["B_MH9_F", 30],
	["O_Ka60_F", 20],
    ["O_Quadbike_F", 5],
    ["B_Quadbike_F", 5],
	["Land_Cargo_Patrol_V1_F", 100],
	["Land_Cargo20_Military_F",100],
	["B_AH9_F", 10],
	["B_SpeedBoat", 5],
	["B_Lifeboat", 5],
	["B_Assaultboat", 10],
	["O_Assaultboat", 10],
	["O_Lifeboat", 5],
	["O_SpeedBoat", 5]
];

 
R3F_LOG_CFG_objets_transportables =  [
	["Box_East_Support_F", 5],
	["Box_East_Wps_F", 5],
	["Box_East_WpsSpecial_F", 5],
	["Box_NATO_Support_F", 5],
	["Box_NATO_Wps_F", 5],
	["Box_NATO_WpsSpecial_F", 5],
	["Land_CanisterPlastic_F", 1],
	["Land_Sacks_goods_F", 2],
	["Land_MetalBarrel_F", 2],
	["Land_HBarrierBig_F", 5],
	["Land_Mil_WallBig_4m_F",5],
	["Land_HBarrier_3_F", 3],
    ["Land_HBarrier_5_F", 5],
    ["Land_HBarrier_1_F", 1],
    ["Land_ToiletBox_F", 6],
	["Land_LampShabby_F",3],
    ["O_Quadbike_F", 10],
    ["B_Quadbike_F", 10],
	["Land_ToiletBox_F", 5],
	["O_Lifeboat", 15],
	["B_Lifeboat", 15],
	["O_Mk6", 15],
	["B_Mk6", 15],
	["Land_Sack_F", 1],
	["Land_Tyres_F", 3],
	["Land_Coil_F", 5],
	["Land_Pipes_Large_F", 5],
	["Land_Cargo_Patrol_V1_F", 30],
	["Land_Cargo20_Military_F", 30],
        ["Land_Stone_8m_F", 5]
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

R3F_LOG_CFG_objets_deplacables = [
	"Box_East_Support_F",
	"Box_East_Wps_F",
	"Box_East_WpsSpecial_F",
	"Box_NATO_Support_F",
	"Box_NATO_Wps_F",
	"Box_NATO_WpsSpecial_F",
	"Land_CanisterPlastic_F",
	"Land_Sacks_goods_F",
	"Land_MetalBarrel_F",
	"Land_HBarrierBig_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
        "Land_HBarrier_5_F",
	"Land_Pipes_Large_F",
	"Land_CargoBox_V1_F",
        "Land_ToiletBox_F",
        "Land_LampDecor_F",
        "Land_Stone_8m_F",
	"Land_LampShabby_F",
	"Land_Mil_WallBig_4m_F",
       "O_Quadbike_F",
       "B_Quadbike_F",
	"Land_ToiletBox_F",
	"B_Assaultboat",
	"B_Lifeboat",	
	"O_Lifeboat",
        "C_Rubberboat",
	"O_Assaultboat",
	"Land_Sack_F",
	"Land_Coil_F",
	"Land_Pipes_Large_F",
	"Land_Cargo_Patrol_V1_F",
	"Land_Cargo20_Military_F"
];
