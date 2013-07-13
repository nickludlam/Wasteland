//	@file Version: 1.0
//	@file Name: initBoughtVehicles.sqf
//	@file Author: His_Shadow
//	@file Created: 07/12/2013 20:55
//	@file Args: [vehicle]

{
	_textureName = _x getVariable "textureName";
	if(isNil '_textureName') exitWith {};
	_x setObjectTexture [0, str(_textureName)];
	_x addAction ["Unlock / Lock","server\functions\unlocklock.sqf",[],7,true,true,"","(_target distance _this) < 7"];
	_x addEventHandler ["IncomingMissile", "[_this] execVM 'incomingAlarm.sqf'"];
}foreach vehicles;