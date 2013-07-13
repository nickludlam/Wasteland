private ["_missionMarkerName","_missionType","_hint","_players","_marker","_count", "_foundPlayer", "_mission_state", "_playerName", "_playerSide", "_startTime", "_currTime", "_foundPlayer"];

#include "bountyMissionDefines.sqf"

#define BOUNTY_MISSION_ACTIVE 0
#define BOUNTY_MISSION_END_KILLED 1
#define BOUNTY_MISSION_END_SURVIVED 2
#define BOUNTY_MISSION_END_TEAMKILLED 3
#define BOUNTY_MISSION_END_SUICIDE 4

_missionMarkerName = "Bounty_Marker";
_missionType = "Bounty Hunt";
_missionEndStateNames = ["was killed", "survived", "was teamkilled", "suicided"];

diag_log format["WASTELAND SERVER - Bounty Mission '%1' started", _missionType];

diag_log format["WASTELAND SERVER - Bounty Mission '%1' waiting to run", _missionType];
[bountyMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Bounty Mission '%1' resumed", _missionType];

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

_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Bounty Hunt</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>%1 has a bounty on his head. You have 30 minutes to kill him! Killer gets $10,000 and his side gets $1,000 per person. If he's protected he gets the $10,000 and his side gets $1,000 per person.</t>", name _foundPlayer, bountyMissionColor, subTextColor];
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
_startTime = floor(time);
_mission_state = BOUNTY_MISSION_ACTIVE;
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
	_currTime = (floor time);
    if (_currTime - _startTime >= bountyMissionTimeout) then { _mission_state = BOUNTY_MISSION_END_SURVIVED; };

	//check to see if this player has been killed by someone
	if(!isNil "bKiller") then
	{ 
		_mission_state = BOUNTY_MISSION_END_KILLED;
		if(bKillerName == _playerName) then { _mission_state = BOUNTY_MISSION_END_SUICIDE;};
		if(bKillerSide == _playerSide) then { _mission_state = BOUNTY_MISSION_END_TEAMKILLED;};
	};
    _mission_state != BOUNTY_MISSION_ACTIVE
};

// We're here, so now we're no longer active

 
//properly get the killer and target side names for use below
_killerSideName =
switch (bKillerSide) do 
{
	case west: {"Blufor"}; 
	case east: {"Opfor"};
	default {"Gfor"};
};

_playerSideName = 
switch (_playerSide) do 
{
	case west: {"Blufor"}; 
	case east: {"Opfor"};
	default {"Gfor"};
};


if (_mission_state == BOUNTY_MISSION_END_KILLED) then {

	// Mission success: The bounty was killed, so issue awards

	diag_log "Mission Completed";

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

	_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%6' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%3'>%1 has been killed by %4! %5 has earned $1,000 for each member and %4 has earned $10,000!</t>", _playerName, successMissionColor, subTextColor, bKillerName, _killerSideName, failMissionColor];

} else {
	// Mission failed: Survived/Teamkilled/Suicided

	diag_log "Bounty Hunt Failed";

	// Phew, bounty target survived
	if (_mission_state == BOUNTY_MISSION_END_SURVIVED) then {

		// Money for survivor + extra money for team
		_playerMoney = _foundPlayer getVariable "cmoney";
		_playerMoney = _playerMoney + 10000;
		_foundPlayer setVariable["cmoney", _playerMoney, true];
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
		}foreach playableUnits;

		_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%2' size='1.25'>%1 lives!</t><br/><br/><t align='center' color='%3'>%1 gets $10,000 and every member of %4 get $1,000!</t>", _playerName, failMissionColor, subTextColor, _playerSideName];
	};

	// Unlucky
	if (_mission_state == BOUNTY_MISSION_END_TEAMKILLED) then {

		// Loop over each player on that side and remove their money and guns
		{
			if(side _x == bKillerSide)then
			{
				_x setVariable["cmoney", 0, true];
				removeAllWeapons _x;
			};
		}foreach playableUnits;

		_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1 was teamkilled!</t><br/><br/><t align='center' color='%3'>Naughty naughty team players. As a penalty you have all lost your weapons and money!</t>", _playerName, failMissionColor, subTextColor];
	};

	// Dumbass
	if (_mission_state == BOUNTY_MISSION_END_SUICIDE) then {
		_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>Chicken!!</t><br/><br/><t align='center' color='%3'>%1 took the coward's way out and committed suicide!</t>", _playerName, failMissionColor, subTextColor];
	};
	
};

// Broadcast the chosen message
messageSystem = _hint;
if (!isDedicated) then { call serverMessage };
publicVariable "messageSystem";

// COMMON CLEAN UP ///////////////////////////////////////////////

//remove the event
_foundPlayer removeAllMPEventHandlers "mpkilled"; 

//reset the bountykiller variables
bKiller = nil;
bKillerName = nil;
bKillerSide = nil;

// Clean up marker
MissionSpawnMarkers select _randomIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;
deleteMarker _marker;

diag_log format["WASTELAND SERVER - Bounty Mission '%1' ended: Target %2",_missionType, _missionEndStateNames select (_mission_state - 1)];