//	@file Version: 1.1
//	@file Name: clientCompile.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap
//	@file Created: 20/11/2012 05:19
//	@file Args:

// Event handlers
onKilled = compile preprocessfile "client\clientEvents\onKilled.sqf";
onRespawn = compile preprocessfile "client\clientEvents\onRespawn.sqf";
onKeyPress = compile preprocessFile "client\clientEvents\onKeyPress.sqf";
fn_fitsInventory = compile preprocessFileLineNumbers "client\functions\fn_fitsInventory.sqf";

// Player details and actions
loadPlayerMenu = compile preprocessFile "client\systems\playerMenu\init.sqf";
repairVehicle = compile preprocessFile "client\systems\playerMenu\repair.sqf";
playerSpawn = compile preprocessFileLineNumbers "client\functions\playerSpawn.sqf";
playerSetup = compile preprocessFileLineNumbers "client\functions\playerSetup.sqf";
spawnAction = compile preprocessFileLineNumbers "client\functions\spawnAction.sqf";
refuelVehicle = compile preprocessFileLineNumbers "client\systems\playerMenu\refuel.sqf";
placeSpawnBeacon = compile preprocessFileLineNumbers "client\systems\playerMenu\placeSpawnBeacon.sqf";

// Sync client with server
timeSync = compile preprocessFileLineNumbers "client\functions\clientTimeSync.sqf";
serverMessage = compile preprocessFileLineNumbers "client\functions\serverMessage.sqf";
clientPaintApply = compile preprocessFileLineNumbers "client\functions\clientPaintApply.sqf";
clientMissileWarnApply = compile preprocessFileLineNumbers "client\functions\clientMissileWarnApply.sqf";
clientVehicleLockApply = compile preprocessFileLineNumbers "client\functions\clientVehicleLockApply.sqf";


// Update scripts
updateTeamKiller = compile preprocessFileLineNumbers "client\functions\updateTeamKiller.sqf";
updateRadarMarkers = compile preprocessFileLineNumbers "client\functions\updatePlayerRadarMarkers.sqf";
updateMissionsMarkers = compile preprocessFileLineNumbers "client\functions\updatePlayerMissionMarkers.sqf";

// Team-kill system
teamkillAction = compile preprocessFileLineNumbers "client\functions\doTeamKillAction.sqf";
teamkillMessage = compile preprocessFileLineNumbers "client\functions\showTeamKillMessage.sqf";

// Dialog compiles
loadGunStore = compile preprocessFileLineNumbers "client\systems\gunStore\loadGunStore.sqf";
loadVehStore = compile preprocessFileLineNumbers "client\systems\vehStore\loadvehStore.sqf";
client_respawnDialog = compile preprocessFileLineNumbers "client\functions\loadRespawnDialog.sqf";
loadGeneralStore = compile preprocessFileLineNumbers "client\systems\generalStore\loadGenStore.sqf";

player groupChat "Client Compile Complete";
sleep 1;
playerCompiledScripts = true;
