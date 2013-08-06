//	@file Version: 1.0
//	@file Name: serverTimeSync.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

#include "defines.hpp"

if(!X_Server) exitWith {};

_dateStamp = Date;
currentDate = _dateStamp;
publicVariable "currentDate";
private ["_startTime"];

_startTime = time;

while{true} do
{	
    _dateStamp = Date;

// Experimental
#ifdef __SERVER_SKIP_NIGHT__ 

    if (_dateStamp select 3 > 22) then {
        skipTime 7;
        currentDate = Date;
        publicVariable "currentDate";
    };
#endif

	if(time - _startTime > 900) then  
    {
        _dateStamp set [4, _dateStamp select 4];
        setDate _dateStamp;
        currentDate = _dateStamp;
		publicVariable "currentDate";
		_startTime = time;    
    };
	sleep 10;
};