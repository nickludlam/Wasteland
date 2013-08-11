// monitor the _Player, and update his save status. He cannot save if he's in combat.
//_aVariable = _myTruck getVariable "myVariable";
Private ["_CombatTimeout","_CombatTimeDelta","_SaveCheck","_LastCombatTime"];

_Player = Player;
_Time = Time;
_CombatTimeout = 30;
_CombatTimeDelta = 0;
_Player SetVariable ["SaveOK", 0, True];
_Player SetVariable ["CombatTime", 0, True];

Sleep 5;

 While {True} Do {
	_SaveCheck = _Player GetVariable ["SaveOK", 0];
	_Time = Time;
	_LastCombatTime = _Player GetVariable ["CombatTime", 0];	
	
	// Determine how long (in seconds it has been since the last combat flag
	_CombatTimeDelta = _Time - _LastCombatTime;
	
	If (_CombatTimeDelta > _CombatTimeout) then 
    {
		_Player SetVariable ["SaveOK", 1, True];	
	} Else {
		If (_SaveCheck == 1) then {
			PlayerCDeath = [_Player];
			publicVariable "PlayerCDeath";
		};
		_Player SetVariable ["SaveOK", 0, True];
	};
	Sleep 1;
	
};
