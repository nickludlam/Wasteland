//	@file Version: 1.0
//	@file Name: moneyMissionController.sqf
//	@file Author: His_Shadow
//	@file Created: 07/09/2013 15:19

if (!isServer) exitWith {};

#include "bountyMissions\bountyMissionDefines.sqf";

private ["_BountyMissions","_mission","_missionType","_notPlayedBountyMissions","_nextMissionIndex","_missionRunning","_hint"];

diag_log format["WASTELAND SERVER - Started Bounty Mission State"];

_BountyMissions = [[mission_Bounty, "mission_Bounty"]];
//_BountyMissions = [];
_notPlayedBountyMissions = +_BountyMissions;

while {true} do
{
    //Select Mission
    _nextMissionIndex = floor random count _notPlayedBountyMissions;
    _mission = _notPlayedBountyMissions select _nextMissionIndex select 0;
    _missionType = _notPlayedBountyMissions select _nextMissionIndex select 1;
    
    if (count _notPlayedBountyMissions > 1) then {
        _notPlayedBountyMissions set [_nextMissionIndex, -1];
        _notPlayedBountyMissions = _notPlayedBountyMissions - [-1];
    } else {
        _notPlayedBountyMissions = +_BountyMissions;
    };
    
	_missionRunning = [] spawn _mission;
    diag_log format["WASTELAND SERVER - Execute New Bounty Mission: %1",_missionType];
    if (bountyMissionDelayTime < 60) then {
        _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Bounty Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 seconds</t>", bountyMissionDelayTime, bountyMissionColor, subTextColor];
    } else {
        _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Bounty Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 minutes</t>", bountyMissionDelayTime / 60, bountyMissionColor, subTextColor];
    };
	messageSystem = _hint;
if (!isDedicated) then { call serverMessage };
	publicVariable "messageSystem";
	waitUntil{sleep 0.1; scriptDone _missionRunning};
    sleep 5; 
};
