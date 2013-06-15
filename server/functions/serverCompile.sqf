//	@file Version: 1.1
//	@file Name: serverCompile.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

diag_log format["WASTELAND SERVER - Initilizing Server Compile"];

//Main Mission Compiles

//spMissionVehicle = compile preprocessFileLineNumbers "server\functions\missionVehicle.sqf";
mission_ArmedHeli = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_ArmedHeli.sqf";
mission_LightArmVeh = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_LightArmVeh.sqf";
mission_CivHeli = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_CivHeli.sqf";
mission_HostileHeliFormation = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_HostileHeliFormation.sqf";
mission_Convoy = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_Convoy.sqf";
mission_MoneyShipment = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_MoneyShipment.sqf";
mission_SeaConvoy = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_SeaConvoy.sqf";
//mission_APC = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_APC.sqf";
//mission_Insurgence = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_Insurgence.sqf";
//mission_Bounty = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_BountyHunt.sqf";

/*
mission_APC = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_APC.sqf";
mission_LightTank = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_LightTank.sqf";
mission_MBT = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_MBT.sqf";
mission_Outpost = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_Outpost.sqf";
mission_RadarTruck = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_RadarTruck.sqf";
mission_SupplyDrop = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_SupplyDrop.sqf";
*/

//Side Mission Compiles
mission_AirWreck = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_AirWreck.sqf";
mission_WepCache = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_WepCache.sqf";
mission_MiniConvoy = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_MiniConvoy.sqf";
mission_HostileHelicopter = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_HostileHelicopter.sqf";
mission_SerialKiller = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_SerialKiller.sqf";
mission_MobMoney = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_MobMoney.sqf";
mission_SunkenTreasure = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_SunkenTreasure.sqf";
mission_SniperTeam = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_SniperTeam.sqf";
mission_SunkenSupplys = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_SunkenSupplys.sqf";
//mission_Truck = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_Truck.sqf";
//mission_ReconVeh = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_ReconVeh.sqf";

/*
mission_Truck = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_Truck.sqf";
mission_ReconVeh = compile preprocessFileLineNumbers "server\missions\sideMissions\mission_ReconVeh.sqf";
*/

//Factory Compiles
createMissionLocation = compile preprocessFileLineNumbers "server\missions\factoryMethods\createMissionLocation.sqf";
createClientMarker = compile preprocessFileLineNumbers "server\missions\factoryMethods\createClientMarker.sqf";
createWaitCondition = compile preprocessFileLineNumbers "server\missions\factoryMethods\createWaitCondition.sqf";
deleteClientMarker = compile preprocessFileLineNumbers "server\missions\factoryMethods\deleteClientMarker.sqf";
createRandomSoldier = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\createRandomSoldier.sqf";
createRandomAquaticSoldier = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\createRandomAquaticSoldier.sqf";
createSmallGroup = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\smallGroup.sqf";
createSniperTeam = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\sniperTeam.sqf";
createMidGroup = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\midGroup.sqf";
createSmallDivers = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\smallDivers.sqf";
createLargeDivers = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\largeDivers.sqf";
createLargeGroup = compile preprocessFileLineNumbers "server\missions\factoryMethods\createUnits\largeGroup.sqf";
createMissionVehicle = compile preprocessFileLineNumbers "server\missions\factoryMethods\createMissionVehicle.sqf";
createMissionVehicle2 = compile preprocessFileLineNumbers "server\missions\factoryMethods\createMissionVehicle2.sqf";
createSupplyDrop = compile preprocessFileLineNumbers "server\missions\factoryMethods\createSupplyDrop.sqf";
createCargoItem = compile preprocessFileLineNumbers "server\missions\factoryMethods\createCargoItem.sqf";
defendArea = compile preprocessFileLineNumbers "server\functions\defendArea.sqf";
defendArea2 = compile preprocessFileLineNumbers "server\functions\defendArea2.sqf";
defendArea3 = compile preprocessFileLineNumbers "server\functions\defendArea3.sqf";

//Spawning Compiles
fn_vehicleInit = compile preprocessFileLineNumbers "server\functions\fn_vehicleInit.sqf";
randomWeapons = compile preprocessFileLineNumbers "server\spawning\randomWeapon.sqf";
vehicleCreation = compile preprocessFileLineNumbers "server\spawning\vehicleCreation.sqf";
objectCreation = compile preprocessFileLineNumbers "server\spawning\objectCreation.sqf";
// staticGunCreation = compile preprocessFileLineNumbers "server\spawning\staticGunCreation.sqf";
staticHeliCreation = compile preprocessFileLineNumbers "server\spawning\staticHeliCreation.sqf";
boatCreation = compile preprocessFileLineNumbers "server\spawning\boatCreation.sqf";
fn_refillbox = compile preprocessFileLineNumbers "server\functions\fn_refillbox.sqf";
cleanupLoop = compile preprocessFileLineNumbers "server\functions\cleanupLoop.sqf";
initGunStores = compile preprocessFileLineNumbers "server\functions\initStoreOwners.sqf";
immRebuild = compile preprocessFileLineNumbers "server\functions\immrebuild.sqf";

//Player Management
server_playerDied = compile preprocessFileLineNumbers "server\functions\serverPlayerDied.sqf";
//server_playerKilled = compile preprocessFileLineNumbers "server\functions\serverKilled.sqf";
server_BountyDied = compile preprocessFileLineNumbers "server\functions\serverBountyDied.sqf";
