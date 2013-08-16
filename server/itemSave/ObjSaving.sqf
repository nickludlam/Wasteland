//	@file Version: 1.0
//	@file Name: ObjSaving.sqf
//	@file Author: Reaper, His_Shadow
//	@file Created: 2013-08-08
//	@file Description: When an object is locked, save it to the server
//	@file Args:

#include "defines.hpp"
#include "serverDefines.hpp"

Private["_NewObject","_ObjType","_ObjPos","_ObjDirect","_SaveLocation"];

#ifdef __DISABLE_INIDB__

diag_log "Skipping ObjSaving"

#else

// ObjectSaveRelay has been updated, so store it to a private variable.
_NewObject = ObjectSaveRelay;
ActiveObjects = ActiveObjects + [_NewObject];

_ObjType = TypeOf _NewObject;
//_ObjPos = Position _NewObject;
_ObjPos = Position _NewObject;
_ObjDirect = Direction _NewObject;

diag_log Format ["Object %1 has been flagged for storage", _NewObject];
ObjectArray = ObjectArray + [_ObjType,_ObjPos,_ObjDirect];

// Push the object array to the database
_SaveLocation = __SERVER_OBJECT_DATABASE__;
[__SERVER_OBJECT_DATABASE__,__SERVER_OBJECT_DATABASE__,"ObjectArray",ObjectArray] Call IniDB_Write;

#endif