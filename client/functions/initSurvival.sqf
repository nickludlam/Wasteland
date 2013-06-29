
//	@file Version: 1.0
//	@file Name: initSurvival.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, TAW_Tonic (original)
//	@file Created: 20/11/2012 05:19
//	@file Args:

#include "defines.hpp" // Global definitions file

#ifdef __RUNNING_FATIGUE__

// FATIGUE SYSTEM
#define FATIGUE_EXHAUSTED -3
#define FATIGUE_TIRED -2
#define FATIGUE_RESTING -1

private["_cumulativePlayerFatigue", "_maxEntries", "_sleepInterval", "_fatigueRecoveryLevel", "_fatigueWarningLevel", "_fatigueThreshold", "_extraThirstDecrement", "_tiredEffectApplied", "_exhaustedEffectApplied"];

player setFatigue 0.9;

[] spawn {
	//diag_log format ["DEBUG: Starting fatigue checks"];
	
	_cumulativePlayerFatigue = [];
	_maxEntries = 8;               // Number of entries in our averaging array
	_sleepInterval = 10;           // Sleep between sampling fatigue
	_fatigueRecoveryLevel = 0.50;  // Value above which we give the player recovery message 
	_fatigueWarningLevel = 0.96;   // Value above which we warn the player
	_fatigueThreshold = 1;         // Value above which the avg fatigue will cause thirst
	_extraThirstDecrement = 4;     // Value to decrement each period from the player's water level
	_extraHungerDecrement = 1;     // Value to decrement each period from the player's food level
	_triggeredFatigueMessage = 0;

	_hndl = ppEffectCreate ["colorCorrections", 1999];

	_tiredEffectApplied = 0;
	_exhaustedEffectApplied = 0;

	// if fatigue > _fatigueRecoveryLevel and fatigue < _fatigueThreshold
	// IF !WARNING_MODE_ENABLED
	// 	ISSUE WARNING DIALOG
	// 	SET WARNING EFFECT
	// 	WARNING_MODE_ENABLED=1

	// if fatigue == _fatigueThreshold
	// IF !WARNING_MODE_ENABLED


	while {true} do
	{
		// 3 mins of running unemcumbered gets you to 1.0 fagigue
		// 2 minutes of running with a full loadout + ghillie gets the same

		waitUntil {!respawnDialogActive};

		if (fatigueLevel == 0) then
		{
			// reset our array
			_cumulativePlayerFatigue = [];
		};

		curFatigueLevel = getFatigue player;

		// Allow faster recovery if you're below 50% fatigue
		if (_triggeredFatigueMessage == 1 && curFatigueLevel < _fatigueRecoveryLevel) then
		{
			curFatigueLevel = 0;
			_triggeredFatigueMessage = 0;
			_cumulativePlayerFatigue = [];
		};

		_cumulativePlayerFatigue = [curFatigueLevel] + _cumulativePlayerFatigue;
		_cumulativePlayerFatigue resize _maxEntries;

		// Average the samples we have of fatigue
		_total = 0;
		{
			// Prevent adding nil values
			if (_x > 0) then
			{
				_total = _total + _x;
			};
		} forEach _cumulativePlayerFatigue;

		fatigueLevel = _total / _maxEntries;

		// How high is the level currently?
		if (fatigueLevel > _fatigueWarningLevel) then
		{

			if (fatigueLevel >= _fatigueThreshold) then
			{
				if (_exhaustedEffectApplied == 0) then {
					_hndl ppEffectEnable true;
					_hndl ppEffectAdjust [0.7, 1.1, 0, [0, 0, 0, 0], [1, 1, 1, 0.4], [0.5, 0.5, 0.5, 0.5]];    
					_hndl ppEffectCommit 3;
					_exhaustedEffectApplied = 1;
					//player globalChat "_exhaustedEffectApplied=1";
				};

				fatigueLevel = FATIGUE_EXHAUSTED;

				_daytime = daytime;
				if (_daytime > 11 and _daytime < 18) then {
					// Day time = overheating
					hint "You're sweating profusely. Stop and cool down!";
				} else 
				{
					// Night time = tiredness / fatigue
					hint "You feel exhausted. Stop an rest now!";
				};

				thirstLevel = thirstLevel - _extraThirstDecrement;
				hungerLevel = hungerLevel - _extraHungerDecrement;
			} 
			else
			{
				// Fire once
				if (_triggeredFatigueMessage == 0) then 
				{
					if (_tiredEffectApplied == 0) then {
						_hndl ppEffectEnable true;
						_hndl ppEffectAdjust [1, 1, 0.0, [0, 0, 0, 0], [1, 1, 1, 0.7], [0.5, 0.5, 0.5, 0.5]];  
						_hndl ppEffectCommit 3;
						_tiredEffectApplied = 1;
						//player globalChat "_tiredEffectApplied=1";
					};

					fatigueLevel = FATIGUE_TIRED;

					_daytime = daytime;
					if (_daytime > 11 and _daytime < 18) then {
						// Day time = overheating
						hint "You're feeling hot and tired. Slow down";
					} else 
					{
						// Night time = tiredness / fatigue
						hint "You're getting tired from the relentless pace";
					};
				};
			};
	
			_triggeredFatigueMessage = 1;
		}
		else
		{
			if (_tiredEffectApplied == 1 or _exhaustedEffectApplied == 1) then {
				_hndl ppEffectEnable true;
				_hndl ppEffectAdjust [1, 1, 0.0, [0, 0, 0, 0], [1, 1, 1, 1], [0.5, 0.5, 0.5, 0.5]];  
				_hndl ppEffectCommit 3;
				_tiredEffectApplied = 0;
				_exhaustedEffectApplied = 0;
				//player globalChat "reset applied effects";
			} else
			{
				_hndl ppEffectEnable false;
			};

			// If we're in recovery mode, wait until we're below our threshold
			if (_triggeredFatigueMessage == 1) then {
				if (curFatigueLevel > _fatigueRecoveryLevel && curFatigueLevel < _fatigueWarningLevel) then {
					// if we're still above, fatigueLevel = -1, AKA recovery mode (RESTING)
					_unit = player;
					_speed = sqrt ( (velocity _unit select 0)^2 + (velocity _unit select 1)^2 + (velocity _unit select 2)^2 );
					//player globalChat format ["_speed is %1", _speed];
					if (_speed == 0) then {
						fatigueLevel = FATIGUE_RESTING;
					} else
					{
						fatigueLevel = FATIGUE_TIRED;
					};
				};
			};
		};

		//player globalChat format ["curFatigue: %1. Array: %2. fatigueLevel: %3 thirst: %4", curFatigueLevel, _cumulativePlayerFatigue, fatigueLevel, thirstLevel];
		sleep _sleepInterval;
	};

	ppEffectDestroy _hndl;
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
	sleep 400;
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


