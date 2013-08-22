//	@file Version: 1.0
//	@file Name: LoadItemDatabase.sqf
//	@file Author: Reaper, His_Shadow
//	@file Created: 2013-08-08
//	@file Description: When the server starts, load items from the ObjectDatabase.ini
//	@file Args:

#include "defines.hpp"

Private ["_DBObjects","_ObjType","_ObjPos","_ObjDirect","_ArrayCount","_i","_NewVeh","_SaveLocation"];

#ifdef __DISABLE_INIDB__

diag_log "Skipping LoadItemDatabase"

#else

#include "serverDefines.hpp"

//Read the database and push it to an object array
_SaveLocation = __SERVER_OBJECT_DATABASE__;
_DBObjects = [__SERVER_OBJECT_DATABASE__,__SERVER_OBJECT_DATABASE__,"ObjectArray","ARRAY"] call iniDB_Read;
Sleep 1;

Diag_Log Format ["Saved Item Array is %1", _DBObjects];
_ArrayCount = Count _DBObjects;
Diag_Log Format ["Count is %1", _ArrayCount];
_ArrayCount = _ArrayCount - 1;

For "_i" From 0 to _ArrayCount Step 3 Do 
{
	// The array is a string of ...,Object, [Position], Direction,...
	// Move along the array in steps of three, creating the vehicle and setting the direction
	
	//obj = createVehicle [_objType,_objPos,[],50,"None"];
	If !(_i > _ArrayCount) Then {
		_ObjType = _DBObjects Select _i;
		_ObjPos = _DBObjects Select (_i + 1);
		_ObjDirect = _DBObjects Select (_i + 2);
		
		Diag_Log Format ["ArrayType: %1 ArrayPos: %2 ArrayDir: %3", _ObjType,_ObjPos,_ObjDirect];	
		Diag_Log Format ["Executing CreateVehicle [%1,%2,0,[],None]",_ObjType,_ObjPos];
		_NewVeh = createVehicle [_ObjType,_ObjPos,[],0,"None"];
		_NewVeh addeventhandler ["hit", {(_this select 0) setdamage 0;}];
		_NewVeh addeventhandler ["dammaged", {(_this select 0) setdamage 0;}];
		_NewVeh SetDir _ObjDirect;
		_NewVeh setVectorUP (surfaceNormal [(getPosATL _NewVeh) select 0,(getPosATL _NewVeh) select 1]); 
		_NewVeh setVariable ["objectLocked", true, true];		
		ObjectArray = ObjectArray + [_ObjType,_ObjPos,_ObjDirect];
		
		ActiveObjects = ActiveObjects + [_NewVeh];
	};
};

Sleep 1;

[_SaveLocation,_SaveLocation,"ObjectArray",ObjectArray] Call IniDB_Write;

#endif
