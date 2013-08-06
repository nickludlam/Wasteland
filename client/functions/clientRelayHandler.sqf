//	@file Version: 1.0
//	@file Name: clientRelayHandler.sqf
//	@file Author: His_Shadow
//	@file Created: 07/12/2013 20:55
//	@file Desc: Converts server method calls to local client methods

#include "defines.hpp"

if(isServer) exitWith {};

private ["_function","_applyPaint","_applyMissile","_msgToPlayer", "_msgToAllPlayers"];

_outer = _this select 0;
_args = _outer select 1;
_function = _args select 0;

diag_log format["clientRelayHandler called with _this = %1", _this];
diag_log format["clientRelayHandler called with args = %1", _args];

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

	if (!isNil "_curUID") then {
		diag_log format["_msgToPlayer checking %1 == %2", _playerUID, _curUID];
		if (_playerUID != _curUID) exitWith {};
		if(_type == MESSAGE_BROADCAST_MSG_TYPE_TITLE) then{	titleText [_msg, "plain"]; titleFadeOut 10;};
		if(_type == MESSAGE_BROADCAST_MSG_TYPE_GCHAT) then { player globalChat _msg; };
	};
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
	private ["_car", "_paint", "_type", "_msg","_playerUID"];
	//apply paint [_car, _paint]
	case MESSAGE_VEHICLE_PROPERTIES_APPLY:
	{
		_car = _args select 1;
		_paint = _args select 2;
		[_car, _paint] call _applyPaint;
		[_car] call _applyMissile;
	};

	case MESSAGE_BROADCAST_MSG_TO_PLAYER:
	{
		_type = _args select 1;
		_playerUID = _args select 2;
		_msg = _args select 3;
		[_type, _playerUID, _msg] call _msgToPlayer;
	};

	// NB: NOT YET FUNCTIONAL
	case MESSAGE_BROADCAST_MSG_TO_ALL:
	{
		_msg = _args select 1;
		[_msg] call _msgToAllPlayers;
	};
};
