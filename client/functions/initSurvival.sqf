
//	@file Version: 1.0
//	@file Name: initSurvival.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, TAW_Tonic (original), [KoS]Bewilderbeest (fatigue mechanic)
//	@file Created: 20/11/2012 05:19
//	@file Args:

#include "defines.hpp" // Global definitions file


#ifdef __RUNNING_EXHAUSTION__

FNC_avgArray = {
	private ["_array", "_total", "_avg"];
	_array = _this select 0;
	_total = 0;
	{
		// Prevent adding nil values
		if (_x > 0) then
		{
			_total = _total + _x;
		}
	} forEach _array;
	_avg = _total / count _array;
	_avg
};

[] spawn {
	private["_cumulativePlayerFatigue",
	        "_defaultMaxEntries",
	        "_sleepInterval",
	        "_fatigueRecoveryLevel",
	        "_fatigueTiredThreshold",
	        "_fatigueWarningThreshold",
	        "_fatigueExhaustionThreshold",
	        "_extraThirstDecrement",
	        "_extraHungerDecrement",
	        "_primaryWeaponModifier",
	        "_secondaryWeaponModifier",
	        "_triggeredTiredMessage",
	        "_triggeredExhaustionMode",
	        "_tiredEffectApplied",
	        "_exhaustedEffectApplied",
	        "_speed",
	        "_hndl",
			"_satedHealthUnitIncrement",
			"_decimalPlaces",
			"_total",
			"_thirstDecrementInterval",
			"_hungerDecrementInterval",
			"_maxEntries",
			"_hasPrimary",
			"_hasSecondary",
			"_avgFatigueLevel"
			];

	//diag_log format ["DEBUG: Starting fatigue checks"];
	
	// We sample every _sleepInterval, and keep _maxEntries samples in total. An average is calculated, 
	// and then we determine if its over _fatigueWarningLevel or _fatigueExhaustionThreshold

	// MATHS!
	_cumulativePlayerFatigue = [];
	_defaultMaxEntries = 16;		   // Number of entries in our averaging array
	_sleepInterval = 10;               // Sleep between sampling fatigue
	_fatigueRecoveryLevel = 0.50;      // Value above which we give the player recovery message 
	_fatigueTiredThreshold = 0.94;     // UI transition warning
	_fatigueWarningThreshold = 0.98;   // Value above which we warn the player
	_fatigueExhaustionThreshold = 1;   // Value above which the avg fatigue will cause thirst
	_extraThirstDecrement = 8;         // Value to decrement each period from the player's water level
	_extraHungerDecrement = 3;         // Value to decrement each period from the player'spawn food level

	// Modifiers
	_primaryWeaponModifier = 2;
	_secondaryWeaponModifier = 10;

	// State
	_triggeredTiredMessage = 0;
	_triggeredExhaustionMode = 0;

	// PP Effects for tired / exhausted
	_hndl = ppEffectCreate ["colorCorrections", 1999];
	_tiredEffectApplied = 0;
	_exhaustedEffectApplied = 0;

	// Replenishment system
	_satedHealthUnitIncrement = 0.01;

	while {true} do
	{
		// New system to bump health up by an amount if the player is at 100 food and water
		if (thirstLevel == 100 and hungerLevel == 100) then {
			_decimalPlaces = 2;
    		_playerDamage = damage player;
    		_playerDamagePercent = round (_playerDamage * (10 ^ _decimalPlaces)) / (10 ^ _decimalPlaces);
    		_health = 100 - (_playerDamagePercent * 100);

			if (_health >= 75 and damage player < 100) then {
				player setDamage (_playerDamage - _satedHealthUnitIncrement);
			};
		};


		// 3 mins of running unemcumbered gets you to 1.0 fagigue
		// 2 minutes of running with a full loadout + ghillie gets the same

		waitUntil {!respawnDialogActive};

		// If the player is a fresh spawn
		if (fatigueLevel == 0) then
		{
			// reset our array
			_cumulativePlayerFatigue = [];
			_triggeredExhaustionMode = 0;
			_triggeredTiredMessage = 0;
		};

		curFatigueLevel = getFatigue player;
		//diag_log format ["curFatigueLevel %1", curFatigueLevel];

		// Used later
		_unit = player;
		_speed = sqrt ( (velocity _unit select 0)^2 + (velocity _unit select 1)^2 + (velocity _unit select 2)^2 );
		//diag_log format ["_speed %1", _speed];

		// Weapon count
		_hasPrimary = primaryWeapon player;
		_hasSecondary = secondaryWeapon player;

		_maxEntries = _defaultMaxEntries;
		if (_hasPrimary != "" or _hasSecondary != "") then {
			if (_hasSecondary != "") then {
				//diag_log "Player has secondary";
				_maxEntries = _maxEntries - _secondaryWeaponModifier;
			} else {
				//diag_log "Player has primary";
				_maxEntries = _maxEntries - _primaryWeaponModifier;
			};
		};

		//diag_log format ["_maxEntries is now %1", _maxEntries];

		// Different mechanics once we're exhausted.
		// We only come out of exhaustion mode when curFatigueLevel < _fatigueRecoveryLevel 
		if (_triggeredExhaustionMode == 1) then {
			//diag_log "In exhaustion mode";

			if (curFatigueLevel < _fatigueRecoveryLevel) then
			{
				// Allow full recovery if you're below 50% fatigue
				//diag_log "Player recovered";

				//player globalChat "Fast recovery!";
				_tiredEffectApplied = 0;
				_exhaustedEffectApplied = 0;
				_hndl ppEffectEnable true;
				_hndl ppEffectAdjust [1, 1, 0.0, [0, 0, 0, 0], [1, 1, 1, 1], [0.5, 0.5, 0.5, 0.5]];  
				_hndl ppEffectCommit 3;

				// reset
				fatigueLevel = 0;
			} else {
				// Not recovered yet
	
				if (_speed == 0) then {
					// Player still. Do not deduct water/food penalty
					//diag_log "Player still. Resting";
					fatigueLevel = FATIGUE_RESTING;
				} else {
					// If they're still moving, deduct the penalty

					//diag_log "Still exhausted";

					fatigueLevel = FATIGUE_EXHAUSTED;

					// Player is exhausted, decrement food and water
					thirstLevel = thirstLevel - _extraThirstDecrement;
					hungerLevel = hungerLevel - _extraHungerDecrement;

					// Have they died yet?
					if (hungerLevel < 2 or thirstLevel < 2) then {
						if(hungerLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have starved to death.";};
						if(thirstLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have died from dehydration.";};
					} else {
						// If they're not dead, issue the warning
						_daytime = daytime;
						if (_daytime > 11 and _daytime < 18) then {
							// Day time = overheating
							_msg = "You're sweating profusely! You need to stop and cool down, otherwise your food and water levels will drop rapidly";
							_hint = parseText format ["<t align='center' color='#FF0000'><img size='3' color='#ff0000' image='images\running_icon_128.paa'/></t><br/><t align='center' color='#FF0000' size='1.75'>FATIGUE WARNING!</t><br/><t align='center' color='#ffffff'>%1</t>", _msg];
							hint _hint;
						} else {
							// Night time = tiredness / fatigue
							_msg = "You feel exhausted! You need to stop an rest now, otherwise your food and water levels will drop rapidly";
							_hint = parseText format ["<t align='center' color='#FF0000'><img size='3' color='#ff0000' image='images\running_icon_128.paa'/></t><br/><t align='center' color='#FF0000' size='1.75'>FATIGUE WARNING!</t><br/><t align='center' color='#ffffff'>%1</t>", _msg];
							hint _hint;
						};
					};
				};
			};

		} else {
			//diag_log "Not in exhaustion mode";

			//diag_log format ["_cumulativePlayerFatigue resized by %1", _maxEntries];

			_cumulativePlayerFatigue = [curFatigueLevel] + _cumulativePlayerFatigue;
			if (count _cumulativePlayerFatigue > _maxEntries) then {
				_cumulativePlayerFatigue resize _maxEntries;
			};

			//diag_log format ["_cumulativePlayerFatigue = %1", _cumulativePlayerFatigue];

			// Average the samples we have of fatigue
			// calc mean avg
			_avgFatigueLevel = [_cumulativePlayerFatigue] call FNC_avgArray;
			
			//diag_log format ["avgFatigueLevel = %1", _avgFatigueLevel];

			// How high is the level currently?
			if (_avgFatigueLevel > _fatigueTiredThreshold) then
			{
				if (_avgFatigueLevel >= _fatigueExhaustionThreshold) then
				{
					// Exhaustion mode engage!
					//diag_log "Triggering exhaustion mode now!";

					_triggeredExhaustionMode = 1;
					_triggeredTiredMessage = 1;

					if (_exhaustedEffectApplied == 0) then {
						_hndl ppEffectEnable true;
						_hndl ppEffectAdjust [0.7, 1.1, 0, [0, 0, 0, 0], [1, 1, 1, 0.4], [0.5, 0.5, 0.5, 0.5]];    
						_hndl ppEffectCommit 3;
						_exhaustedEffectApplied = 1;
						//player globalChat "_exhaustedEffectApplied=1";
					};
				} 
				else
				{
					if (_avgFatigueLevel > _fatigueWarningThreshold) then {
						// Fire once
						if (_triggeredTiredMessage == 0) then 
						{
							//diag_log "Triggering tired message";

							_triggeredTiredMessage = 1;

							if (_tiredEffectApplied == 0) then {
								_hndl ppEffectEnable true;
								_hndl ppEffectAdjust [1, 1, 0.0, [0, 0, 0, 0], [1, 1, 1, 0.6], [0.5, 0.5, 0.5, 0.5]];  
								_hndl ppEffectCommit 3;
								_tiredEffectApplied = 1;
								//player globalChat "_tiredEffectApplied=1";
							};

							// Special value
							fatigueLevel = FATIGUE_TIRED;

							_daytime = daytime;
							if (_daytime > 11 and _daytime < 18) then {
								// Day time = overheating
								hint "You're starting to feel hot and tired. Slow down";
							} else {
								// Night time = tiredness / fatigue
								hint "You're getting tired from the relentless pace. Slow down";
							};
						} else {
							//diag_log "Tired or resting";

							// If we're here, we've triggered the tired message
							// but we're not exhausted, so you're either tired or resting
							if (_speed < 1.6) then {
								// 1.55 = walking pace
								fatigueLevel = FATIGUE_RESTING;
							} else {
								fatigueLevel = FATIGUE_TIRED;
							};
						};

					} else {
						//diag_log "Silent tired warning";
						// If we're here, we've triggered the tired message
						// but we're not exhausted, so you're either tired or resting
						if (_speed < 1.6) then {
							// 1.55 = walking pace
							fatigueLevel = FATIGUE_RESTING;
						} else {
							fatigueLevel = FATIGUE_TIRED;
						};
					};
				};
			}
			else
			{
				//diag_log format ["Average fatigue %1", _avgFatigueLevel];

				if (_tiredEffectApplied == 1 or _exhaustedEffectApplied == 1) then {
					_tiredEffectApplied = 0;
					_exhaustedEffectApplied = 0;
					_triggeredTiredMessage = 1;
					_hndl ppEffectEnable true;
					_hndl ppEffectAdjust [1, 1, 0.0, [0, 0, 0, 0], [1, 1, 1, 1], [0.5, 0.5, 0.5, 0.5]];  
					_hndl ppEffectCommit 3;
					//player globalChat "reset applied effects";
				} else {
					// If we're in our normal state, disable the ppeffect
					_hndl ppEffectEnable false;
				};

				// Regular value
				fatigueLevel = _avgFatigueLevel;
			};
		};

		//player globalChat format ["curFatigueLevel: %1. fatigueLevel: %2. Array: %3", curFatigueLevel, fatigueLevel, _cumulativePlayerFatigue];
		sleep _sleepInterval;
	};

	ppEffectDestroy _hndl;
};
#endif

[] spawn  {
	_hungerDecrementInterval = HUNGER_DECREMENT_INTERVAL;

	while{true} do
	{
		private ["_sleepCounter", "_initialPlayerSpawnTime"];

		// Same as sleep(HUNGER_DECREMENT_INTERVAL) but its interruptible by player death
		_sleepCounter = _hungerDecrementInterval;
		_initialPlayerSpawnTime = playerSpawnTime;
		while {(_sleepCounter > 0)} do {
			// Decrement our counter every 60 seconds until we hit zero. Allows for player respawns since we check playerSpawnTime
			sleep 60;

			//diag_log format ["checking initialPlayerSpawnTime != playerSpawnTime (%1, %2)", _initialPlayerSpawnTime, playerSpawnTime];

			if (_initialPlayerSpawnTime != playerSpawnTime) then {
				// Player has since spawned, so reset our counter
				//diag_log format ["player spawned. resetting sleepy loop"];
				_initialPlayerSpawnTime = playerSpawnTime;
				_sleepCounter = _hungerDecrementInterval;
			};

			_sleepCounter = _sleepCounter - 60;
			//diag_log format ["_sleepCounter is now %1", _sleepCounter];			
		};
		waitUntil {!respawnDialogActive};
		if(hungerLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have starved to death.";}
		else
		{
			hungerLevel = hungerLevel - 20;
			if(hungerLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have starved to death.";};
			switch(true) do {
				case (hungerLevel <= 20 && hungerLevel > 0): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>Find something to eat soon or you'll starve to death!"];};
				case (hungerLevel <= 50 && hungerLevel > 20): {hint format["You haven't eaten anything in a while, your hunger level is currently: %1\n\n You should find something to eat soon!", hungerLevel];};
			};
		};
	};
};

[] spawn  {
	_thirstDecrementInterval = THIRST_DECREMENT_INTERVAL;

	while{true} do
	{
		private ["_sleepCounter", "_initialPlayerSpawnTime"];

		// Same as sleep(THIRST_DECREMENT_INTERVAL) but its interruptible by player death
		_sleepCounter = _thirstDecrementInterval;
		_initialPlayerSpawnTime = playerSpawnTime;

		while {(_sleepCounter > 0)} do {
			// Decrement our counter every 60 seconds until we hit zero. Allows for player respawns since we check playerSpawnTime
			sleep 60;

			//diag_log format ["checking initialPlayerSpawnTime != playerSpawnTime (%1, %2)", _initialPlayerSpawnTime, playerSpawnTime];

			if (_initialPlayerSpawnTime != playerSpawnTime) then {
				// Player has since spawned, so reset our counter
				//diag_log format ["player spawned. resetting sleepy loop"];
				_initialPlayerSpawnTime = playerSpawnTime;
				_sleepCounter = _thirstDecrementInterval;
			};

			_sleepCounter = _sleepCounter - 60;
			//diag_log format ["_sleepCounter is now %1", _sleepCounter];			
		};

		waitUntil {!respawnDialogActive};
		if(thirstLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have died from dehydration.";}
		else
		{
			thirstLevel = thirstLevel - 20;
			if(thirstLevel < 2) then {player setDamage 1.31337; hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You have died from dehydration.";};
			switch(true) do {
				case (thirstLevel <= 20 && thirstLevel > 0): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are now suffering from severe dehydration find something to drink quickly!"];};
				case (thirstLevel <= 50 && thirstLevel > 20): {hint format["You haven't had anything to drink in a while, your thirst level is currently: %1\n\n You should find some water soon!", thirstLevel];};
			};
		};
	};
};


