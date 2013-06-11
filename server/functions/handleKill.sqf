_player = (_this select 0);
_killer = (_this select 1);
_sidePlayer = (str(side _player));
_sideKiller = (str(side _killer));
if((_player != _killer) AND (_sidePlayer in ["RESISTANCE","CIV","GUER"]) AND (_sideKiller in ["RESISTANCE","CIV","GUER"])) then
{
	hint format["Killer %1",name _killer];
	_killer addScore 2;
};