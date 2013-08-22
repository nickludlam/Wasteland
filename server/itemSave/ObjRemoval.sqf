//	@file Version: 1.0
//	@file Name: ObjRemoval.sqf
//	@file Author: Reaper, His_Shadow
//	@file Created: 2013-08-08
//	@file Description: Remove an item from the DB when it's unlocked
//	@file Args:

#include "defines.hpp"

Private ["_ObjType","_ObjPos","_ObjDirect","_RemObj","_SaveLocation"];

#ifdef __DISABLE_INIDB__

diag_log "Skipping ObjRemoval"

#else

#include "serverDefines.hpp"

_RemObj = ObjectRemoveRelay;
Diag_Log Format ["Object %1 passed for removal",_RemObj];

//If the vehicle is in the active array
If (_RemObj In ActiveObjects) Then 
{	Diag_Log Format ["Object Array currently is %1",ObjectArray];
	ObjectArray = [];
	Diag_Log Format ["ActiveObjects Array currently is %1",ActiveObjects];
	ActiveObjects = ActiveObjects - [_RemObj];
	Diag_Log Format ["ActiveObjects Array Trimmed to %1",ActiveObjects];
	
	{_ObjType = TypeOf _x;
	_ObjPos = Position _x;
	_ObjDirect = Direction _x;
	ObjectArray = ObjectArray + [_ObjType,_ObjPos,_ObjDirect];
	} ForEach ActiveObjects;
	
	_SaveLocation = __SERVER_OBJECT_DATABASE__;
	[_SaveLocation,_SaveLocation,"ObjectArray",ObjectArray] Call IniDB_Write;	
} Else {
	Diag_Log Format ["Object %1 is not in the array", _RemObj];
};

#else
