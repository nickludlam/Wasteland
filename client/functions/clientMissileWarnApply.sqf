//	@file Version: 1.0
//	@file Name: serverPaintApply.sqf
//	@file Author: His_Shadow
//	@file Created: 07/12/2013 20:55
//	@file Args: [vehicle]

_car = vehicleMissileWarnSystem;
diag_log format["car %1",_car];
_car addEventHandler ["IncomingMissile", "[_this] execVM 'incomingAlarm.sqf'"];
