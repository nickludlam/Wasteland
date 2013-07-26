//	@file Version: 1.0
//	@file Name: clientRelayHandler.sqf
//	@file Author: His_Shadow
//	@file Created: 07/12/2013 20:55
//	@file Desc: Converts server method calls to local client methods

#include "defines.hpp"
private ["_function","_applyPaint","_applyMissile","_msgToPlayer", "_msgToAllPlayers"];
_function = serverRelaySystem select 0;

_applyPaint =
{
	private["_car", "_paint"];
	_car = _this select 0;
	_paint = _this select 1;
	_car setObjectTexture [0, _paint];
};

_applyMissile =
{
	private["_car"];
	_car = _this select 0;
	_car addEventHandler ["IncomingMissile", "[_this] execVM 'incomingAlarm.sqf'"];
};

_msgToPlayer =
{
	private ["_type", "_playerUID", "_msg", "_curUID"];
	_type = _this select 0;
	_playerUID = _this select 1;
	_msg = _this select 2;

	_curUID = getPlayerUID player;
	diag_log format["_msgToPlayer checking %1 == %2", _playerUID, _curUID];
	if (_playerUID != _curUID) exitWith {};
	
	if(_type == MESSAGE_BROADCAST_MSG_TYPE_TITLE) then{	titleText [_msg, "plain"]; titleFadeOut 10;};
	if(_type == MESSAGE_BROADCAST_MSG_TYPE_GCHAT) then { player globalChat _msg; };
};

_msgToAllPlayers =
{
	private ["_type", "_msg"];
	_msg = _this select 0;

	diag_log format["_msgToAllPlayers %1", _msg];
	hint _msg;
};

switch(_function) do
{
	diag_log format ["clientRelayHandler called with %1", _function];
	private ["_car", "_paint", "_type", "_msg","_playerUID"];
	//apply paint [_car, _paint]
	case MESSAGE_VEHICLE_PROPERTIES_APPLY:
	{
		_car = serverRelaySystem select 1;
		_paint = serverRelaySystem select 2;
		[_car, _paint] call _applyPaint;
		[_car] call _applyMissile;
	};

	case MESSAGE_BROADCAST_MSG_TO_PLAYER:
	{
		_type = serverRelaySystem select 1;
		_playerUID = serverRelaySystem select 2;
		_msg = serverRelaySystem select 3;
		[_type, _playerUID, _msg] call _msgToPlayer;
	};

	// NB: NOT YET FUNCTIONAL
	case MESSAGE_BROADCAST_MSG_TO_ALL:
	{
		_msg = serverRelaySystem select 1;
		[_msg] call _msgToAllPlayers;
	};
};
