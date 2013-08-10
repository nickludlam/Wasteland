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

//diag_log format["clientRelayHandler called with _this = %1", _this];
//diag_log format["clientRelayHandler called with args = %1", _args];

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
	private ["_type", "_target", "_msg", "_curUID"];
	_type = _this select 0;
	_target = _this select 1;
	_msg = _this select 2;
	_curUID = getPlayerUID player;

	//diag_log format["_msgToPlayer:"];
	//diag_log format["  _type: %1", _type];
	//diag_log format["  _target: %1", _target];
	//diag_log format["  _msg: %1", _msg];
	//diag_log format["  _curUID: %1", _curUID];

	if (isNil "_curUID") exitWith { };

	if (typeName _target == "ARRAY") then {
		if (_curUID in _target) then {
			if(_type == MESSAGE_BROADCAST_MSG_TYPE_TITLE) then{	titleText [_msg, "plain"]; titleFadeOut 10; };
			if(_type == MESSAGE_BROADCAST_MSG_TYPE_GCHAT) then { player globalChat _msg; };
		};
	} else {
		//diag_log format["_msgToPlayer checking %1 == %2", _target, _curUID];
		if (_target != _curUID) exitWith {};
		if(_type == MESSAGE_BROADCAST_MSG_TYPE_TITLE) then{	titleText [_msg, "plain"]; titleFadeOut 10;};
		if(_type == MESSAGE_BROADCAST_MSG_TYPE_GCHAT) then { player globalChat _msg; };
	};
};

_msgToSide = 
{
	private ['_type', '_side', '_msg', '_money'];
	_type = _this select 0;
	_side = _this select 1;
	_msg = _this select 2;
	_money = _this select 3;

	//diag_log format['_msgToSide comparing %1 with %2',str(playerSide),_side];
	if (str(playerSide) == _side) then {
		if(_type == MESSAGE_BROADCAST_MSG_TYPE_TITLE) then{	titleText [_msg, "plain"]; titleFadeOut 10;};
		if(_type == MESSAGE_BROADCAST_MSG_TYPE_GCHAT) then { player globalChat _msg; };

		if (_money > 0) then {
			player setVariable[__MONEY_VAR_NAME__, (player getVariable __MONEY_VAR_NAME__)+_money,true];
			player say 'FD_Finish_F';
		};
	};
};

_msgToAllPlayers =
{
	private ["_type", "_msg"];
	_msg = _this select 0;
	//diag_log format["_msgToAllPlayers %1", _msg];
	hint _msg;
};

switch(_function) do
{
	private ["_car", "_paint", "_type", "_msg","_target", "_money"];
	//apply paint [_car, _paint]
	case MESSAGE_VEHICLE_PROPERTIES_APPLY:
	{
		_car = _args select 1;
		_paint = _args select 2;
		[_car, _paint] call _applyPaint;
		[_car] call _applyMissile;
	};

	// _playerUID can also be an ARRAY of UIDs to match with
	case MESSAGE_BROADCAST_MSG_TO_PLAYER:
	{
		_type = _args select 1;
		_target = _args select 2;
		_msg = _args select 3;
		[_type, _target, _msg] call _msgToPlayer;
	};
	
	case MESSAGE_BROADCAST_MSG_TO_SIDE:
	{
		_type = _args select 1;
		_side = _args select 2;
		_msg = _args select 3;

		// Pass through money if we've been given that value
		_money = 0;
		if (count _args == 5) then {
			_money = _args select 4;
		};

		[_type, _side, _msg, _money] call _msgToSide;
	};

	case MESSAGE_BROADCAST_MSG_TO_ALL:
	{
		_msg = _args select 1;
		[_msg] call _msgToAllPlayers;
	};

};
