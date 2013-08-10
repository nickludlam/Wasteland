//	@file Version: 1.0
//	@file Name: ObjSaving.sqf
//	@file Author: Reaper
//	@file Created: 2013-08-08
//	@file Description: When an object is locked, save it to the server
//	@file Args:

Private["_NewObject","_ObjType","_ObjPos","_ObjDirect"];

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
["ObjectDatabase","ObjectDatabase","ObjectArray",ObjectArray] Call IniDB_Write;
