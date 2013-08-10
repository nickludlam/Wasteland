//	@file Version: 1.0
//	@file Name: OnCombat.sqf
//	@file Author: Reaper
//	@file Created: 20130805
//	@file Args:

// monitor the player, and update his save status. He cannot save if he's in combat.
//_myTruck setVariable ["myVariable", 123, true];
Private ["_Player","_Time"];

//_Player = _this Select 0;
_Player = Player;
_time = Time;

Diag_Log Format ["Player %1 has been flagged in combat at time %2",_Player, _time];
//_player groupChat format ["Player %1 has been flagged in combat at time %2",_Player, _time];

_Player SetVariable ["CombatTime", _Time, True];
//_Player SetVariable ["SaveOK", 0, True];