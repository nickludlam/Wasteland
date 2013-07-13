//	@file Version: 1.0
//	@file Name: incomingAlarm.sqf
//	@file Author: His_Shadow
//	@file Created: 07/12/2013 20:55
//	@file Args: [vehicle, missile, attacker] for now just texture path is supported

private ["_incomingMissile"];
_incomingMissile = _this select 0;
_vehicle = _incomingMissile select 0;
_missile = _incomingMissile select 1;
_attacker = _incomingMissile select 2;

_units = units _vehicle;
{
	//ensure we are a player that was in the vehicle
	if(name _x != name player)  exitWith{};
	
	//display text warnings
	hint format["Incoming %1 Launched By: %2", _missile, _attacker]; 
	titleText [format["Incoming %1 Launched By: %2", _missile, name _attacker],"PLAIN", 2];
	titleFadeOut 2;
	
	//play audible warning
	_count = 0;
	while{_count < 2} do
	{
		playsound "alarm1";
		_count = _count + 1;
	};
}foreach _units;