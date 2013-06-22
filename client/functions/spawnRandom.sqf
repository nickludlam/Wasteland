// @file Version: 1.2
// @file Name: spawnRandom.sqf
// @file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, [KoS] Bewilderbeest
// @file Created: 28/11/2012 05:19
// @file Args:

waituntil {!isnil "bis_fnc_init"};

private ["_townName","_randomLoc","_pos"];

_playerSide = str(playerSide);
_playerGroup = group player;

_viableRespawnLocations = [];

//diag_log format["RespawnSelector: Player side is %1", _playerSide];

{
    _curSpawnLoc = _x;
    _curSpawnPos = getMarkerPos (_curSpawnLoc select 0);

    //diag_log format["RespawnSelector: Evaluating spawn location %1 (%2)", _curSpawnLoc, _curSpawnPos];

    {
        _curPlayerSide = side _x;
        _curPlayerGroup = group _x;
        _spawnAvailable = true;

        if ((isPlayer _x) AND (str(_curPlayerSide) != _playerSide) AND _x distance _curSpawnPos < 350) then {
            //diag_log format["RespawnSelector: enemy near %1", _curSpawnLoc select 0];
            _spawnAvailable = false;
        };

        if (_spawnAvailable) then {
            //diag_log format["RespawnSelector: Adding viable spawn loc %1 (%2)", _curSpawnLoc, _curSpawnPos];
            _viableRespawnLocations = _viableRespawnLocations + [_curSpawnLoc];
        };

    } forEach playableUnits;

} forEach cityList;

// If we have any viable spawn locations from above, use them, otherwise go true random

if (count _viableRespawnLocations > 0) then {
    // Pick from our candidate list of locations
    //diag_log format["RespawnSelector: Respawning from _viableRespawnLocations"];
    _randomLoc = _viableRespawnLocations select (floor random (count _viableRespawnLocations));
} else {
    // True random spot
    //diag_log format["RespawnSelector: Respawning from a true randomised cityList location"];
    _randomLoc = cityList select (floor random (count cityList));
};

//diag_log format["RespawnSelector: Spawning player at %1", _randomLoc select 0];

_pos = getMarkerPos (_randomLoc select 0);
_pos = [_pos,1,(_randomLoc select 1),1,0,0,0] call BIS_fnc_findSafePos;
_pos = [_pos select 0, _pos select 1, (_pos select 2) + 10];
player setPos _pos;

// Clean up

respawnDialogActive = false;
closeDialog 0;

_mins = floor(60 * (daytime - floor(daytime)));
_townName = _randomLoc select 2;
[
"KoS Wasteland",_townName,format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]
] spawn BIS_fnc_infoText;
