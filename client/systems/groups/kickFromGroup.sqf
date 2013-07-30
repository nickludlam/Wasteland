//	@file Version: 1.0
//	@file Name: kickFromGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
#include "defines.hpp"
#define groupManagementDialog 55510
#define groupManagementGroupList 55512

disableSerialization;

private["_dialog","_groupListBox","_target","_index","_playerData","_check","_msg","_destPlayerUID"];

_dialog = findDisplay groupManagementDialog;
_groupListBox = _dialog displayCtrl groupManagementGroupList;

_index = lbCurSel _groupListBox;
_playerData = _groupListBox lbData _index;
_check = 0;
_target = nil;

//Check selected data is valid            			
{if (str(_x) == _playerData) then {_target = _x;_check = 1;};}forEach playableUnits;

if (_check == 0) exitWith {player globalChat "You must select someone to kick first.";};

if (!isNil "_target") then {
	//Checks
	if(_target == player) exitWith {player globalChat "You can't kick yourself.";};

	[_target] join grpNull;

	player globalChat format["You have kicked %1 from the group.",name _target];

	_msg = format["You have been kicked from %1's group", name player];
	_destPlayerUID = getPlayerUID _target;
	//if(X_Server) then {call serverRelayHandler};
	serverRelaySystem = [MESSAGE_BROADCAST_MSG_TO_PLAYER, MESSAGE_BROADCAST_MSG_TYPE_GCHAT, _destPlayerUID, _msg];
	publicVariable "serverRelaySystem";
};

