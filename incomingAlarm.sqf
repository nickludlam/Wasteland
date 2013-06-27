private ["_incomingMissile"];
_attacker = _this select 0;
hint format["Incoming Missile Launched By: %1", _attacker]; 
titleText [format["Incoming Missile Launched By: %1", _attacker],"PLAIN", 2];
titleFadeOut 2;

_count = 0;
while{_count < 2} do
{
	playsound "alarm1";
	_count = _count + 1;
};