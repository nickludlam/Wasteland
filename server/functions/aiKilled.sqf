_player = (_this select 0);
_killer = (_this select 1);

_aiSide = (str(side _player));
_killerSide = (str(side _killer));
if((_player != _killer) AND (_aiSide in ["CIV", "RESISTANCE", "GUER"]))then{
	_killer addScore 1;
};