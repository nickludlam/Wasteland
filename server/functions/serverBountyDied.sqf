
_player = (_this select 0) select 0;
_killer = (_this select 0) select 1;
bKiller = _killer;
bKillerName = name bKiller;
bKillerSide = side bKiller;
diag_log format["Killer: %1", bKiller];
if(isnil "bKiller") then { bKiller = _player;};