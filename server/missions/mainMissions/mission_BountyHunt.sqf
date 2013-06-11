private ["_missionMarkerName","_missionType","_picture","_vehicleName","_hint","_players","_vehicles","_marker","_failed","_startTime","_numWaypoints","_ammobox","_createVehicle","_leader", "_foundPlayer"];

#include "mainMissionDefines.sqf"

_missionMarkerName = "Bounty_Marker";
_missionType = "Bounty Hunt";

diag_log format["WASTELAND SERVER - Main Mission Started: %1", _missionType];

diag_log format["WASTELAND SERVER - Main Mission Waiting to run: %1", _missionType];
[mainMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Main Mission Resumed: %1", _missionType];

//select a random player
_players = playableUnits;
_count = (count units _players);
_random=floor(random (count units _players) + 1);
for[{_p=0},{_p<_count},{_p = _p + 1}]
{
	if(_p == _random)
	{
		_foundPlayer = _players select _p;
		_p = _count;
	};
};

_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Bounty Hunt</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>%1 has a bounty on his head. You have 5 minutes to kill him and claim the reward for you team!</t>", _foundPlayer, mainMissionColor, subTextColor];
messageSystem = _hint;
if (!isDedicated) then { call serverMessage };
publicVariable "messageSystem";

_marker = createMarker [_missionMarkerName, position _foundPlayer];
_marker setMarkerType "mil_destroy";
_marker setMarkerSize [1.25, 1.25];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Bounty Target";
_foundPlayer addEventHandler ["Killed", {[_this] call server_BountyDied;}];

waitUntil
{
    private ["_playerAlive"];
    
    sleep 10; 
    
    _marker setMarkerPos (position _foundPlayer);
    
    if ((floor time) - _startTime >= mainBountyTimeout) then { _failed = true };
    _playerAlive = alive _foundPlayer;
    
    _playerAlive == 0 || _failed
};

if(_failed) then
{
    // Mission failed

    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>Hostile AirSquad</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The enemy got away, better luck next time!</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Main Mission Failed: %1",_missionType];
} else {
    // Mission complete
    //_ammobox = "Box_NATO_Wps_F" createVehicle getMarkerPos _marker;
    //clearMagazineCargoGlobal _ammobox;
    //clearWeaponCargoGlobal _ammobox; 
    //[_ammobox,"mission_USSpecial2"] call fn_refillbox;
    //_ammobox2 = "Box_NATO_Wps_F" createVehicle getMarkerPos _marker;
    //clearMagazineCargoGlobal _ammobox2;
    //clearWeaponCargoGlobal _ammobox2; 
    //[_ammobox2,"mission_USLaunchers2"] call fn_refillbox;
    //_ammobox3 = "Box_NATO_Wps_F" createVehicle getMarkerPos _marker;
    //clearMagazineCargoGlobal _ammobox3;
    //clearWeaponCargoGlobal _ammobox3; 
    //[_ammobox3,"mission_Side_USSpecial"] call fn_refillbox;
    //_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Bounty Hunt</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>%1 has a bounty on his head. You have 5 minutes to kill him and claim the reward for you team!</t>", _foundPlayer, mainMissionColor, subTextColor];
    //messageSystem = _hint;
    //if (!isDedicated) then { call serverMessage };
    //publicVariable "messageSystem";
    //diag_log format["WASTELAND SERVER - Main Mission Success: %1",_missionType];
};

deleteMarker _marker;