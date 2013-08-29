/*********************************************************#
# @@ScriptName: timeDilationMonitor.sqf
# @@Author: Nick 'Bewilderbeest' Ludlam <bewilder@recoil.org>
# @@Create Date: 2013-08-29 21:49:20
# @@Modify Date: 2013-08-29 23:16:00
# @@Function: Measures the server lag and presents an API to
#             attempt to compensate for late timekeeping
#*********************************************************/

#define MEASURED_SLEEP_DURATION 1
#define MAX_BUFFER_COUNT 5

// This will be anywhere from 1 downwards. If the server is
// running where a sleep(1) takes 2 seconds, it will be 0.5 etc.
//
// To use this, simply multiply the value you'd like to sleep with
// by this number. ie/
//
// sleep 10 * server_sleepModifier;
//
server_sleepModifier = 1;

// Average over a few measurements to remove any high frequency noise
// in our sampling
_sleepDurationsBuffer = [];

// Simply calculates the arithmetic mean of an array of numbers
_fnc_avgArray = {
	private ["_array", "_total", "_avg"];
	_array = _this select 0;
	//diag_log format["_fnc_avgArray looping over %1", _array];
	_total = 0;
	{
		// Prevent adding weird values
		if (_x > 0) then
		{
			_total = _total + _x;
		}
	} forEach _array;
	_avg = _total / count _array;
	_avg
};

// Loops forever measuring how long a sleep() call actually takes via
// diag_tickTime, and creates a rolling average
while {true} do {
	private ["_startTime", "_endTime", "_realSleepDuration", "_dilationFactor"];
	_startTime = diag_tickTime;
	sleep MEASURED_SLEEP_DURATION;
	_endTime = diag_tickTime;
	_realSleepDuration = _endTime - _startTime;

	_dilationFactor = MEASURED_SLEEP_DURATION / _realSleepDuration;

	//diag_log format["_realSleepDuration: %1, _dilationFactor: %2", _realSleepDuration, _dilationFactor];

	_sleepDurationsBuffer = [_dilationFactor] + _sleepDurationsBuffer;
	if (count _sleepDurationsBuffer > MAX_BUFFER_COUNT) then {
		_sleepDurationsBuffer resize MAX_BUFFER_COUNT;
	};

	server_sleepModifier = [_sleepDurationsBuffer] call _fnc_avgArray;
	//diag_log format["server_sleepModifier: %1", server_sleepModifier];
};
