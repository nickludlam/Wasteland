//	@file Version: 1.1
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap
//	@file Created: 20/11/2012 05:19
//	@file Description: The server init.
//	@file Args:

if(!X_Server) exitWith {};

sideMissions = 1;
serverSpawning = 1;
buildingsloot = 1;

private ["_serverCompiledScripts","_lootspawnz","_vehSpawn","_objSpawn","_objSpawn2","_boxSpawn","_boatSpawn","_buildrep","_initOwners","_cleanupLoop","_id"];
// New Code
ObjectArray = [];
ObjectSaveRelay = [];
ObjectRemoveRelay = [];
ActiveObjects = [];
AcctCheck = [];

"ObjectSaveRelay" addPublicVariableEventHandler {[] ExecVM "server\itemSave\ObjSaving.sqf";};
"ObjectRemoveRelay" addPublicVariableEventHandler {[] ExecVM "server\itemSave\ObjRemoval.sqf";};
[] execVM "server\itemSave\LoadItemDatabase.sqf";
// New Code

//Execute Server Side Scripts.
_serverCompiledScripts = [] execVM "server\functions\serverCompile.sqf";

// Load this early as other scripts might depend on what it defines
[] execVM "server\functions\timeDilationMonitor.sqf";

[] execVM "server\admins.sqf";
[] execVM "server\functions\serverVars.sqf";
[] execVM "server\functions\broadcaster.sqf";
[] execVM "server\functions\relations.sqf";
[] execVM "server\functions\serverTimeSync.sqf";
[] execVM "server\functions\capturePointMonitoring.sqf";

serverRelaySystem = '';
"serverRelaySystem" addPublicVariableEventHandler {[] call serverRelayHandler};

serverVehicleHeliDrop = [];
"serverVehicleHeliDrop" addPublicVariableEventHandler { serverVehicleHeliDrop spawn airdropVehicle };

onPlayerConnected "[_id, _name] execVM ""server\functions\onplayerconnected.sqf""";

waitUntil{scriptDone _serverCompiledScripts};

execVM "server\statSave\serverGather.sqf";

diag_log format["WASTELAND SERVER - Server Compile Finished"];

//Execute Server Spawning.
_initOwners = [] ExecVM "server\functions\initStoreOwners.sqf";
sleep 0.1;

if (buildingsloot == 1) then {
	diag_log format["GOT WASTELAND - Placing loot in buildings"];
	_lootspawnz = [] execVM "server\spawning\lootCreation.sqf";
	sleep 0.1;
	diag_log format["GOT WASTELAND - Done placing loot in buildings"];
};

if (serverSpawning == 1) then {
    diag_log format["WASTELAND SERVER - Initilizing Server Spawning"];
	_vehSpawn = [] ExecVM "server\functions\vehicleSpawning.sqf";
	waitUntil{sleep 0.1; scriptDone _vehSpawn};
    _objSpawn = [] ExecVM "server\functions\objectsSpawning.sqf";
	waitUntil{sleep 0.1; scriptDone _objSpawn};
    _objSpawn2 = [] ExecVM "server\functions\objectsSpawning2.sqf";
	waitUntil{sleep 0.1; scriptDone _objSpawn2};
    _boxSpawn = [] ExecVM "server\functions\boxSpawning.sqf";
	waitUntil{sleep 0.1; scriptDone _boxSpawn};
    _boatSpawn = [] ExecVM "server\functions\boatSpawning.sqf";
    waitUntil{sleep 0.1; scriptDone _boatSpawn};
    //_heliSpawn = [] ExecVM "server\functions\staticHeliSpawning.sqf";
    //waitUntil{sleep 0.1; scriptDone _heliSpawn};
	_buildrep = [] ExecVM "server\functions\rebuild.sqf";
	sleep 0.1;
	//_recurOwners = [] ExecVM "server\functions\recurInitStoreOwners.sqf";
	_disableSim = [] ExecVM "server\functions\disableObjectsSimulation.sqf";
	_cleanupLoop = [] ExecVM "server\functions\cleanupLoop.sqf";
	sleep 0.1;
};

//Execute Server Missions.
if (sideMissions == 1) then {
	diag_log format["WASTELAND SERVER - Initilizing Missions"];
    [] execVM "server\missions\sideMissionController.sqf";
    sleep 5;
    [] execVM "server\missions\mainMissionController.sqf";
	sleep 5;
	[] execVM "server\missions\moneyMissionController.sqf";
	sleep 5;
	[] execVM "server\missions\bountyMissionController.sqf";
};

if (isDedicated) then {
	_id = [] execFSM "server\WastelandServClean.fsm";
};
