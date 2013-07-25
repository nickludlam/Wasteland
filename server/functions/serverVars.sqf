//	@file Version: 1.1
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse, [GoT] JoSchaap
//	@file Created: 20/11/2012 05:19
//	@file Args:
// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\
if(!X_Server) exitWith {};

diag_log format["WASTELAND SERVER - Initilizing Server Vars"];

//CVG_weapons = [];
//CVG_weapons = CVG_rifles;
//CVG_weapons = CVG_weapons + CVG_Scoped;
//CVG_weapons = CVG_weapons + CVG_Heavy;
//CVG_weapons = CVG_weapons + CVG_pistols;
//CVG_weapons = CVG_weapons + CVG_Launchers;

sideMissionPos = "";
mainMissionPos = "";
bountyMissionPos = "";
moneyMissionPos = "";

currentVehicles = [];
publicVariable "currentVehicles";
pvar_teamSwitchList = [];
publicVariable "pvar_teamSwitchList";
pvar_teamKillList = [];
publicVariable "pvar_teamKillList";
pvar_beaconListBlu = []; 
publicVariable "pvar_beaconListBlu";
pvar_beaconListRed = []; 
publicVariable "pvar_beaconListRed";
clientMissionMarkers = [];
publicVariable "clientMissionMarkers";
clientRadarMarkers = [];
publicVariable "clientRadarMarkers";
currentDate = [];
publicVariable "currentDate";
currentInvites = [];
publicVariable "currentInvites";
                  
"PlayerCDeath" addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerDied};
"PlayerKDeath" addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerKilled};

currentStaticHelis = []; // Storage for the heli marker numbers so that we don't spawn wrecks on top of live helis

//Civilian Vehicle List - Random Spawns
civilianVehicles = ["C_Offroad_01_F","C_Quadbike_01_F"];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles = ["B_Quadbike_01_F","O_Quadbike_01_F","I_Quadbike_01_F"];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles = ["B_MRAP_01_F"];//,"O_MRAP_02_F"];

//boat - Random Boats.
BoatList = ["O_Boat_Transport_01_F","B_Boat_Transport_01_F","O_Lifeboat","B_Lifeboat","C_Rubberboat"];
                            
//Object List - Random Spawns.
objectList = ["Land_Sacks_goods_F",
			"Land_HBarrierBig_F",
			"Land_HBarrier_5_F",
			//"Land_LampShabby_F",
			"Land_HBarrierBig_F",
			"Land_HBarrier_1_F",
			//"Land_LampDecor_F",
			//"Land_Ytong_F",				seems broken
			"Land_CanisterPlastic_F",
			"Land_MetalBarrel_F",
			"Land_HBarrierBig_F",
			"Land_Stone_8m_F",
			"Land_HBarrier_5_F",
			"Land_Mil_WallBig_4m_F",
			"Land_ToiletBox_F",
			"Land_HBarrier_3_F",
			"Land_Stone_8m_F",
			"Land_Mil_WallBig_4m_F",
			"Land_HBarrier_5_F",
			"Land_Coil_F",
			"Land_cargo_addon02_V2_F",  // camonet dont put in r3f!
			"Land_HBarrierBig_F",
			"Land_Pipes_Large_F",
			"Land_CargoBox_V1_F"];

comestibleList = ["Land_Sacks_goods_F", "Land_CanisterPlastic_F"];
                                         
//Object List - Random Spawns.
staticWeaponsList = ["B_MK6"];

//Object List - Random Helis.
staticHeliList = ["O_Heli_Light_02_F",
				"B_Heli_Light_01_F"];

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons = ["arifle_SDAR_F",
				"arifle_MXM_F",
				"arifle_TRG21_F",
				"arifle_TRG20_F",
				"arifle_MXC_F",
                "arifle_MX_SW_F",
                "arifle_MX_GL_F",
                "arifle_TRG21_GL_F",
                "arifle_MX_F",
                "arifle_Katiba_F",
                "arifle_Katiba_C_F",  
                "arifle_Katiba_GL_F",
                "srifle_EBR_F",
                "arifle_Mk20C_F",
                "arifle_Mk20_F",
                "arifle_Mk20_GL_F",
                "LMG_Mk200_F",
                "LMG_Zafir_F",
                "hgun_P07_F",
                "hgun_Rook40_F",
                "hgun_ACPC2_F",
                "SMG_01_F",
                "SMG_02_F"];

vehicleAddition = [
			"Zasleh2",
			"muzzle_snds_acp",
			"muzzle_snds_H",
			"muzzle_snds_L",
			"muzzle_snds_M",
			"muzzle_snds_B",
			"muzzle_snds_H_MG",
			"optic_Arco",
			"optic_MRCO",
			"optic_Hamr", 
			"optic_Aco", 
			"optic_ACO_grn", 
			"optic_Holosight", 
			"acc_flashlight", 
			"acc_pointer_IR",
			"Medikit",
            "FirstAidKit",
            "ToolKit"
];

vehicleAddition2 = [
	"Chemlight_blue",
	"Chemlight_red",
	"Chemlight_green",
	"Chemlight_yellow"
];

storeOwners = 
[
	["West_GR",[2166.83,1888.78,3.13669],"West GR"],
	["West_GS", [2194.73,3830.4,97.9379],"West GS"],
	["West_GSA", [2441.46,5696.97,74.071],"West GSA"],
	["East_GR", [5386.08,3185.82,4.81283],"East GR"],
	["East_GS", [5538.2,4710.21,77.3378],"East GS"],
	["East_Gen", [5538.2,4710.21,77.3378],"East Gen"],
	["North_Gen", [5538.2,4710.21,77.3378],"North Gen"],
	["West_Gen", [5538.2,4710.21,77.3378],"West Gen"],
	["East_GenS", [5538.2,4710.21,77.3378],"East GenS"],
	["East_GSE", [5538.2,4710.21,77.3378],"East GSE"],
	["North_GenS", [5538.2,4710.21,77.3378],"North GenS"],
	["North_VS", [5538.2,4710.21,77.3378],"North VS"],
	["East_VS", [5538.2,4710.21,77.3378],"East VS"],
	["South_VS", [5538.2,4710.21,77.3378],"South VS"],
	["West_VS", [5538.2,4710.21,77.3378],"West VS"]
]; 
                
MissionSpawnMarkers = [
            ["Mission_1",false],
            ["Mission_2",false],
            ["Mission_3",false],
            ["Mission_4",false],
            ["Mission_5",false],
            ["Mission_6",false],
            ["Mission_7",false],
            ["Mission_8",false],
            ["Mission_9",false],
            ["Mission_10",false],
            ["Mission_11",false],
            ["Mission_12",false],
            ["Mission_13",false],
            ["Mission_14",false],
            ["Mission_15",false],
            ["Mission_16",false],
            ["Mission_17",false],
            ["Mission_18",false],
            ["Mission_19",false]
            ];