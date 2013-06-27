private ["_incomingMissile"];
_attacker = _this select 0;
hint format["Incoming Missile Launched By: %1", _attacker]; 

_count = 0;
while{_count < 2} do
{
	playsound "alarm1";
	_count = _count + 1;
};