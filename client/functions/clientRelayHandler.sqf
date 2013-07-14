//	@file Version: 1.0
//	@file Name: serverPaintApply.sqf
//	@file Author: His_Shadow
//	@file Created: 07/12/2013 20:55
//	@file Args: [vehicle, texture path, [r,g,b]] for now just texture path is supported

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
	player globalChat format["Missile apply: %1", _car];
	_car addEventHandler ["IncomingMissile", "[_this] execVM 'incomingAlarm.sqf'"];
};

switch(_function) do
{
	//apply paint [_car, _paint]
	case 0:
	{
		_car = serverRelaySystem select 1;
		_paint = serverRelaySystem select 2;
		[_car, _paint] call _applyPaint;
		[_car] call _applyMissile;
	};
};
