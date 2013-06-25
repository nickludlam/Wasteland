private ["_missionMarkerName","_missionType","_picture","_vehicleName","_hint","_players","_vehicles","_marker","_failed","_startTime","_numWaypoints","_ammobox","_createVehicle","_leader", "_foundPlayer"];

#include "mainMissionDefines.sqf"

_missionMarkerName = "Bounty_Marker";
_missionType = "Bounty Hunt";
_startTime = floor(time);

diag_log format["WASTELAND SERVER - Main Mission Started: %1", _missionType];

diag_log format["WASTELAND SERVER - Main Mission Waiting to run: %1", _missionType];
[mainMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Main Mission Resumed: %1", _missionType];

//select a random player
_players = playableUnits;
_count = count _players;
_random = floor(random _count);
_foundPlayer = nil;
_foundPlayer = _players select _random;
if(isNil "_foundPlayer") then
{
	_hint = parseText format ["<t align='center' color='%3' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>Trouble Finding Bounty!</t><br/><br/><t align='center' color='%3'>Maybe we'll play next time!</t>", failMissionColor, subTextColor];
	    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
	exit
};

_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Bounty Hunt</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>%1 has a bounty on his head. You have 30 minutes to kill him! Killer gets $10,000 and his side gets $1000 per person. If he's protected he gets the $10,000 and his side gets $1,000 per person.</t>", name _foundPlayer, mainMissionColor, subTextColor];
messageSystem = _hint;
if (!isDedicated) then { call serverMessage };
publicVariable "messageSystem";

_marker = createMarker [_missionMarkerName, position _foundPlayer];
_marker setMarkerType "mil_destroy";
_marker setMarkerSize [1.25, 1.25];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Bounty Target";

//add the MP died event
_foundPlayer addMPEventHandler ["mpkilled", {[_this] call server_BountyDied;}];

//get the variables so that if _foundPlayer instance changes we aren't fucked
_playerName = name _foundPlayer;
_playerSide = side _foundPlayer;
_iterations = 0;
_failed = 0;
//failed conditions 0 - null, 1-pass, 2-timeout, 3-tk, 4-suic
waitUntil
{
	//only run the check every 10 seconds
    sleep 10; 
	
	//only update the marker every 60 seconds
    _iterations = _iterations + 1;
	if(_iterations == 6) then
	{
		_iterations = 0;
		_marker setMarkerPos (position _foundPlayer);
	};
	
	//check to see if we've timed out
    _failed = 0;
	_currTime = floor(time);
    if (_currTime - _startTime >= mainBountyTimeout) then { _failed = 2 };
    
	//check to see if this player has been killed by someone
	if(!isNil "bKiller") then
	{ 
		_failed = 1;
		if(bKillerName == _playerName) then { _failed = 4;};
		if(bKillerSide == _playerSide) then { _failed = 3;};
	};
   
    _failed > 0
};

//if this is a fail case
if(_failed > 1) then
{
	diag_log "Bounty Hunt Failed";
	
	//remove the event
	 _foundPlayer removeAllMPEventHandlers "mpkilled"; 
	 
    //if this was a timeout then the bounty team gets the reward
	if(_failed == 2) then
	{
		_playerMoney = _foundPlayer getVariable "cmoney";
		_playerMoney = _playerMoney + 10000;
		_foundPlayer setVariable["cmoney", _playerMoney, true];
		_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%2' size='1.25'>%1 lives!</t><br/><br/><t align='center' color='%3'>%1 gets $10,000 and every member of his side get $1,000!</t>", _playerName, failMissionColor, subTextColor];
		{
			if(side _x == _playerSide)then
			{
				if(_playerName != name _x) then
				{
					_playerMoney = _x getVariable "cmoney";
					_playerMoney = _playerMoney + 1000;
					_x setVariable["cmoney",_playerMoney,true];
				};
			};
		}foreach playableUnits
	};
	
	//if this is a teamkill the bounty team gets punished
	if(_failed == 3) then
	{
		{
			if(side _x == bKillerSide)then
			{
				_x setVariable["cmoney", 0, true];
				removeAllWeapons _x;
			};
		}foreach playableUnits;
		_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1 was teamkilled!</t><br/><br/><t align='center' color='%3'>Naughty naughty team players. As a penalty you have all lost your weapons and money!</t>", _playerName, failMissionColor, subTextColor];
	};
	
	//if this is a suicide then nothing happens
	if(_failed == 4) then
	{
		_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1 Suicided!</t><br/><br/><t align='center' color='%3'>Be more careful next time!</t>", _playerName, failMissionColor, subTextColor];
	};
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
	
	//reset the bountykiller variables
	bKiller = nil;
	bKillerName = nil;
	bKillerSide = nil;
    diag_log format["WASTELAND SERVER - Main Mission Failed: %1",_missionType];
};
if(_failed == 1)then
{

	diag_log "Mission Completed";
	
	//remove the event handlers
	_foundPlayer removeAllMPEventHandlers "mpkilled"; 
    
	//the player and his team reap the rewards
	_playerMoney = bKiller getVariable "cmoney";
	_playerMoney = _playerMoney + 10000;
	bKiller setVariable["cmoney", _playerMoney, true];
	{
		if(side _x == bKillerSide) then
		{
			if(bKillerName != name _x) then
			{
				_playerMoney = _x getVariable "cmoney";
				_playerMoney = _playerMoney + 1000;
				_x setVariable["cmoney",_playerMoney,true];
			};
		};
	}foreach playableUnits;
   
   //properlyl get the side name to display to the clients
   _sideName = "Blufor";
	if(bKillerSide == east) then{ _sideName = "Opfor";}
	else{ _sideName = "Independent";};
	_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%6' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%3'>%1 has been killed by %4! %5 has earned $1000 for each member and %4 has earned $10000!</t>", _playerName, successMissionColor, subTextColor, bKillerName, _sideName, failMissionColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
	
	//reset the bounty killer variables
	bKiller = nil;
	bKillerName = nil;
	bKillerSide = nil;
    diag_log format["WASTELAND SERVER - Main Mission Success: %1",_missionType];
};
MissionSpawnMarkers select _randomIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;
deleteMarker _marker;