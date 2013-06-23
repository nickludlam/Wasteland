//	@file Version: 1.0
//	@file Name: serverPlayerDied.sqf
//	@file Author: [404] Pulse
//	@file Created: 20/11/2012 05:19

#include "defines.hpp"

if(!X_Server) exitWith {};

private["_newObject"];
_newObject = _this select 0;

#ifndef __DISABLE_INIDB__
getPlayerUID _newObject call iniDB_delete;
#endif

_newObject setVariable["processedDeath",time];
