PlayerKDeath = [_killer];
publicVariable "PlayerKDeath";

private ["_sidePlayer", "_sideKiller", "_player", "_killer", "_id"];
_sidePlayer = (str(side _player));
_sideKiller = (str(side _killer));
if((_player != _killer) AND (str(_sidePlayer) in ["RESISTANCE","CIV","GUER"]) AND (str(_sideKiller) in ["RESISTANCE","CIV","GUER"])) then
{
	_id = PlayerKDeath spawn server_playerKilled;
};