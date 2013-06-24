
//	@file Version: 1.0
//	@file Name: initSurvival.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, TAW_Tonic (original)
//	@file Created: 20/11/2012 05:19
//	@file Args:

#include "defines.hpp" // Global definitions file

#ifdef __RUNNING_THIRST__

private["_cumulativePlayerFatigue", "_maxEntries", "_sleepInterval"];

[] spawn {
	//diag_log format ["DEBUG: Starting fatigue checks"];
	
	_cumulativePlayerFatigue = [];
	_maxEntries = 8;              // Number of entries in our averaging array
	_sleepInterval = 30;           // Sleep between sampling fatigue
	_fatigueRecoveryLevel = 0.50;  // Value above which we give the player recovery message 
	_fatigueWarningLevel = 0.95;   // Value above which we warn the player
	_fatigueThreshold = 1;         // Value above which the avg fatigue will cause thirst
	_extraThirstDecrement = 4;     // Value to decrement each period from the player's water level

	_triggeredFatigueMessage = 0;

	while {true} do
	{
		// 3 mins of running unemcumbered gets you to 1.0 fagigue
		// 2 minutes of running with a full loadout + ghillie gets the same

		waitUntil {!respawnDialogActive};

		if (fatigueLevel == 0) then
		{
			diag_log format ["did the player die?"];
			// reset our array
			_cumulativePlayerFatigue = [];
		};

		curFatigueLevel = getFatigue player;

		// Allow faster recovery if you're below 50% fatigue
		if (_triggeredFatigueMessage == 1 && curFatigueLevel < 0.5) then
		{
			curFatigueLevel = 0;
		};

		_cumulativePlayerFatigue = [curFatigueLevel] + _cumulativePlayerFatigue;
		_cumulativePlayerFatigue resize _maxEntries;

		// Average the samples we have of fatigue
		_total = 0;
		{
			if (_x > 0) then
			{
				_total = _total + _x;
			};
		} forEach _cumulativePlayerFatigue;

		fatigueLevel = _total / _maxEntries;

		//player globalChat format ["DEBUG: curFatigue %1. Array is %2. fatigueLevel is %3", curFatigueLevel, _cumulativePlayerFatigue, fatigueLevel];

		// If we're in recovery mode, wait until we're below our threshold
		if (_triggeredFatigueMessage == 1 && fatigueLevel < _fatigueRecoveryLevel) then {
			player globalChat "You feel rested and ready to go";
			_triggeredFatigueMessage = 0;
		};

		// How high is the level currently?
		if (fatigueLevel > _fatigueWarningLevel) then
		{
			if (fatigueLevel > _fatigueThreshold) then
			{
				hint "You're sweating profusely. Stop and rest to cool off!";
				_triggeredFatigueMessage = 1;
				thirstLevel = thirstLevel - _extraThirstDecrement;
			} else {
				hint "You're starting to overheat from the pace";
			};
		};

		sleep _sleepInterval;
	};
};
#endif

[] spawn  {
	while{true} do
	{
		sleep 600;
		waitUntil {!respawnDialogActive};
		if(hungerLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have starved to death.";}
		else
		{
		hungerLevel = hungerLevel - 5;
		if(hungerLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have starved to death.";};
		switch(true) do {
			case (hungerLevel <= 10 && hungerLevel >= 5): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are now starving to death, you will slowly lose health, find something to eat quickly!", hungerLevel];};
			case (hungerLevel <= 20 && hungerLevel >= 15): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are starting to starve, you need to find something to eat otherwise you will start to lose health!", hungerLevel];};
			case (hungerLevel <= 30 && hungerLevel >= 25): {hint format["You haven't eaten anything in awhile, your hunger level is currently: %1\n\n You should find something to eat soon!", hungerLevel];};
			case (hungerLevel <= 50 && hungerLevel >= 45): {hint format["You haven't eaten anything in awhile, your hunger level is currently: %1\n\n You should find something to eat soon!", hungerLevel];};
			};
		};
	};
};

[] spawn  {
	while{true} do
	{
	sleep 300;
	waitUntil {!respawnDialogActive};
	if(thirstLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have died from dehydration.";}
	else
	{
		thirstLevel = thirstLevel - 5;
		if(thirstLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have died from dehydration.";};
		switch(true) do {
			case (thirstLevel <= 10 && thirstLevel >= 5): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are now suffering from severe dehydration find something to drink quickly!", thirstLevel];};
			case (thirstLevel <= 20 && thirstLevel >= 15): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You haven't drank anything in along time, you should find someting to drink soon or you'll start to die from dehydration!", thirstLevel];};
			case (thirstLevel <= 30 && thirstLevel >= 25): {hint format["You haven't drank anything in awhile, your thirst level is %1\n\nYou should find something to drink soon.", thirstLevel];};
			case (thirstLevel <= 50 && thirstLevel >= 45): {hint format["You haven't drank anything in awhile, your thirst level is %1", thirstLevel];};
			};
		};
	};
};


