//	@file Version: 1.0
//	@file Name: serverPaintApply.sqf
//	@file Author: His_Shadow
//	@file Created: 07/12/2013 20:55
//	@file Args: [vehicle, texture path, [r,g,b]] for now just texture path is supported

_car = vehiclePaintSystem select 0;
_paint = vehiclePaintSystem select 1;
_car setObjectTexture [0, _paint];
