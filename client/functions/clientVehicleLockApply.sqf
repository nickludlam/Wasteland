//	@file Version: 1.0
//	@file Name: clientVehicleLockApply.sqf
//	@file Author: His_Shadow
//	@file Created: 07/12/2013 20:55
//	@file Args: [vehicle]

_car = vehicleLockApplySystem;
_car addAction ["Unlock / Lock","server\functions\unlocklock.sqf",[],7,true,true,"","(_target distance _this) < 7"];