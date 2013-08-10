// Capture point monitoring

#include "defines.hpp"

#define SLEEP_INTERVAL 10
#define CAPTURE_PERIOD 250

if(!X_Server) exitWith {};

//diag_log "Starting capture point monitoring";
 
 // We exit here as we only want the triggers to be client side

// Prep the lastCapturePointDetails array with our areas to check later on
//
// The idea here is that lastCapturePointDetails holds our structured data checked
// every loop.
//
// 1 = Name of capture marker
// 2 = List of players in that area
// 3 = Length of time the area has been occupied
lastCapturePointDetails = [];

{
    _markerName = _x select 0;
    //diag_log format ["Adding %1 to lastCapturePointDetails", _markerName];
    lastCapturePointDetails = lastCapturePointDetails + [[_markerName, [], 0]];
} forEach captureAreaMarkers;

//diag_log format["lastCapturePointDetails = %1", lastCapturePointDetails];

//////////////////////////////////////////////////////////////////////////////////////////////////

_onCapture = {
    private['_captureTeam', '_captureValue', '_captureDescription', '_msg'];

    //diag_log format['_onCapture called with %1', _this];

    _captureTeam = _this select 0;
    _captureValue = _this select 1;
    _captureDescription = _this select 2;

    _msg = format["Your team has successfully captured %1 and earned you $%2", _captureDescription, _captureValue];
    clientRelaySystem = [MESSAGE_BROADCAST_MSG_TO_SIDE, MESSAGE_BROADCAST_MSG_TYPE_TITLE, _captureTeam, _msg, _captureValue];
    publicVariable "clientRelaySystem";
};

_markerColorForSide = {
    private['_side', '_markerColor'];
    _side = _this select 0;
    //diag_log format["_markerColorForSide called with %1", _this];

    _markerColor = "";
    switch (_side) do {
        case "WEST": { _markerColor = "colorblue"; };
        case "EAST": { _markerColor = "colorred"; };
        case "GUER": { _markerColor = "colorgreen"; };
        default { _markerColor = "coloryellow"; };
    };

    //diag_log format["_markerColorForSide returning %1", _markerColor];

    _markerColor
};

_getSideForCaptureArea = {
    //diag_log format["_getSideForCaptureArea called with %1", _this];

    private ['_markerName', '_markerColor', '_side'];
    _markerName = _this select 0;
    _markerColor = getMarkerColor _markerName;
    
    _side = nil;

    switch (_markerColor) do {
        case "colorblue": { _side = "WEST"; };
        case "colorred": { _side = "EAST"; };
        case "colorgreen": { _side = "GUER"; };
        default { _side = "unknown"; };
    };

    //diag_log format["_getSideForCaptureArea returning %1", _side];

    _side
};

// Count players in a particular area for each side, and calculate if its
// uncontested or contested, and whether there's a dominant side
_sideCountsForPlayerArray = { 
    //diag_log format["_sideCountsForPlayerArray called with %1", _this];

    private['_players', '_blueCount', '_redCount', '_greenCount', '_contested'];
    _players = _this select 0;

    _blueCount = 0;
    _redCount = 0;
    _greenCount = 0;

    _contested = false; // true if there are more than one team present
    _dominantSide = "";

    if (count _players > 0) then {
        {
            switch(str(side _x)) do {
                case "WEST": { _blueCount = _blueCount + 1; };
                case "EAST": { _redCount = _redCount + 1; };
                case "GUER": { _greenCount = _greenCount + 1; };
            };
        } forEach _players;

        if ((_blueCount > 0 && (_redCount > 0 || _greenCount > 0)) ||
            (_redCount > 0 && (_blueCount > 0 || _greenCount > 0)) ||
            (_greenCount > 0 && (_blueCount > 0 || _redCount > 0))) then {
            _contested = true;
        };

        if (_blueCount > 0 && !_contested) then {   
            _dominantSide = "WEST";
        };
        if (_redCount > 0 && !_contested) then {   
            _dominantSide = "EAST";
        };
        if (_greenCount > 0 && !_contested) then {   
            _dominantSide = "GUER";
        };
    };

    [_blueCount, _redCount, _greenCount, _contested, _dominantSide];
};

// Figure out if an area is contested or uncontested in terms of players within proximity,
// and then whether there has been a change since last tick.
//
// This results in an action to take, either 'RESET', 'CONTINUE' or 'BLOCK'
_handleSideCounts = {
    //diag_log format["_handleSideCounts called with %1", _this];

    // We could do something more crazy here like use the player counts to scale cap times
    // but for now we really only look at the contested status, and the dominant side

    _lastSideCounts = _this select 0;
    _curSideCounts = _this select 1;

    _lastBlueCount = _lastSideCounts select 0;
    _lastRedCount = _lastSideCounts select 1;
    _lastGreenCount = _lastSideCounts select 2;
    _lastAreaContested = _lastSideCounts select 3;
    _lastDominantSide = _lastSideCounts select 4;

    _currentBlueCount = _curSideCounts select 0;
    _currentRedCount = _curSideCounts select 1;
    _currentGreenCount = _curSideCounts select 2;
    _currentAreaContested = _curSideCounts select 3;
    _currentDominantSide = _curSideCounts select 4;

    _action = "";  // CONTINUE CAPPING, BLOCK/CONTESTED, RESET CAPPING

    if (!_currentAreaContested) then {
        // Ok so currently uncontested. Was the previous state uncontested and the same side?
        if (_lastAreaContested) then {
            // If it was last contested, reset our cap counter (or we could carry on?)
            _action = "RESET";
        } else {
            // Was previously uncontested too

            // Was it the same side?
            if (_lastDominantSide != _currentDominantSide || _lastDominantSide == "") then {
                // It's changed sides during our interval
                _action = "RESET";
            } else {
                // Hasn't changed
                _action = "CONTINUE";
            };
        };
    } else {
        // Ok so it's contested
        _action = "BLOCK";
    };

    //diag_log format["_handleSideCounts returning %1", _action];

    _action
};


_handleCapPointTick = {
    //diag_log format["_handleCapPointTick called with %1", _this];

    // Into this method comes two arrays. One is the master array called _previousEntries, containing all the 
    // cap points, known players within that area, and the timer count for that area.

    // The second array is the current list of cap points and players at that location

    // These are reconciled by calls to _sideCountsForPlayerArray and _handleSideCounts

    _currentEntries = _this select 0;
    _previousEntries = _this select 1;

    // The data structure is as follows:
    // [
    //  [NAME_OF_CAP_POINT, [PLAYERS, AT, POINT], uncontestedOccupiedTime]
    // ]
    // 

    if (count _currentEntries == 0) exitWith { _previousEntries };

    // Known to be the same as _previousEntries
    _count = count _previousEntries;

    for "_i" from 0 to (_count-1) do {

        _previousCapPointDetails = _previousEntries select _i;

        _previousCapPointName = _previousCapPointDetails select 0;
        _previousCapPointPlayers = _previousCapPointDetails select 1;
        _previousCapPointTimer = _previousCapPointDetails select 2;

        // Use BIS_fnc_conditionalSelect since we can't sort arrays using strings FFS.
        // This is slower than my plan to have both _currentEntries and _previousEntries sorted in the same way to allow
        // single index lookups into both for equiv data

        //diag_log format["Searching _currentEntries for %1", _previousCapPointName];

        _currentCapPointDetailsArr = [_currentEntries, { _x select 0 == _previousCapPointName }] call BIS_fnc_conditionalSelect;

        //diag_log format["BIS_fnc_conditionalSelect set _currentCapPointDetailsArr to %1", _currentCapPointDetailsArr];

        if (count _currentCapPointDetailsArr > 0) then {

            _curCapPointDetails = _currentCapPointDetailsArr select 0;

            _curCapPointName = _curCapPointDetails select 0;
            _curCapPointPlayers = _curCapPointDetails select 1;

            //diag_log format ["_handleCapPointTick comparing: "];        
            //diag_log format ["  _curCapPointDetails: %1", _curCapPointDetails];        
            //diag_log format ["  _previousCapPointDetails: %1", _previousCapPointDetails];        

            // Ok players have hanged. Contested or not?
            _previousSideCounts = [_previousCapPointPlayers] call _sideCountsForPlayerArray; 
            _curSideCounts = [_curCapPointPlayers] call _sideCountsForPlayerArray;

            _currentDominantSide = _curSideCounts select 4;
            _previousDominantSide = _previousSideCounts select 4;

            //diag_log format["  _previousSideCounts: %1", _previousSideCounts];
            //diag_log format["  _curSideCounts: %1", _curSideCounts];

            _action = [_previousSideCounts, _curSideCounts] call _handleSideCounts;

            _curCapPointTimer = _previousCapPointTimer;

            ////////////////////////////////////////////////////////////////////////

            _currentPointOwner = [_curCapPointName] call _getSideForCaptureArea;

            if (_currentPointOwner != _currentDominantSide) then {

                if (_action == "CONTINUE") then {
                    _curCapPointTimer = _curCapPointTimer + SLEEP_INTERVAL;
                };

                if (_action == "RESET") then {
                    _curCapPointTimer = 0;
                    //_curCapPointName setMarkerColor "coloryellow";
                };

                if (_action == "BLOCK") then {
                    _curCapPointTimer = 0;

                    _newMarkerColor = "colorpink";
                    if (getMarkerColor _curCapPointName != _newMarkerColor) then {
                        //_curCapPointName setMarkerColor _newMarkerColor;

                        // We want all of the present players who were previously dominant
                        _playerUIDs = [];
                        {
                            if (str(side _x) == _previousDominantSide) then {
                                _playerUIDs = _playerUIDs + [getPlayerUID _x];
                            };
                        } forEach _curCapPointPlayers;

                        _msg = format["You are now being blocked from capturing this area by the enemy. Watch out!"];
                        clientRelaySystem = [MESSAGE_BROADCAST_MSG_TO_PLAYER, MESSAGE_BROADCAST_MSG_TYPE_TITLE, _playerUIDs, _msg];
                        publicVariable "clientRelaySystem";
                    };
                };

                //diag_log format["---> %1 action is %2 with the timer at %3", _curCapPointName, _action, _curCapPointTimer];

                if (_curCapPointTimer >= CAPTURE_PERIOD) then {
                    // Find the current marker color which denotes capture status
                     _newMarkerColor = [_currentDominantSide] call _markerColorForSide;
                    if (getMarkerColor _curCapPointName != _newMarkerColor) then {
                        // If the timer is above what we consider a successful capture and its not already theirs...
                        _configEntry = [captureAreaMarkers, { _x select 0 == _curCapPointName }] call BIS_fnc_conditionalSelect;
                        _capturePointHumanName = (_configEntry select 0) select 1;
                        _value = (_configEntry select 0) select 2;

                        _curCapPointName setMarkerColor _newMarkerColor;
                        //diag_log format["%1 captured point %2 (%3)", _currentDominantSide, _curCapPointName, _capturePointHumanName];

                        [_currentDominantSide, _value, _capturePointHumanName] call _onCapture;
                    };
                };
            };

            // Now ensure we're creating a mirror of _previousCapPointDetails with all the new info so we can assign it
            // at the end of this iteration
            _previousEntries set [_i, [_previousCapPointName, _curCapPointPlayers, _curCapPointTimer] ];
        } else {
            // Nobody there
            _previousEntries set [_i, [_previousCapPointName, [], 0] ];
        };
    };

    _previousEntries
};


//////////////////////////////////////////////////////////////////////////////
// MAIN CAPTURE MONITOR LOOP                                                //
//////////////////////////////////////////////////////////////////////////////

while{true} do
{	
    private['_capPointPlayerMapSingle', '_capPointPlayerMapConsolidated', '_lastCapPointName', '_lastCapPointPlayers', '_curCapturePointDetails'];

    // Iterate through each player, and because the client-side trigger has added the var
    // 'CAP_POINT' onto the player object and set it global, we the server should know
    // where each player is, in terms of capture areas
    _capPointPlayerMapSingle = [];

    {
        private ['_curCapPoint'];

        if (alive _x) then {
            // We don't see dead people. Hahaha...ha!
            _curCapPoint = _x getVariable ['CAP_POINT', ""];
            //diag_log format["%1 has CAP_POINT %2", name _x, _curCapPoint];
            if (_curCapPoint != "") then {
                // Make the entry
                //diag_log format["CAP PLAYER LOOP: Adding %1 to _capPointPlayerMapSingle at %2", _x, _curCapPoint];
                _capPointPlayerMapSingle = _capPointPlayerMapSingle + [[_curCapPoint, _x]];
            };
        };

    } forEach playableUnits;

    // Now capPointPlayerMapSingle has [[ "CAP_POINT", "PLAYER"] .. ];

    //diag_log format["_capPointPlayerMapSingle is %1", _capPointPlayerMapSingle];
    // Consolidate into one entry per cap point

    _capPointPlayerMapConsolidated = [];

    _lastCapPointName = "";
    _lastCapPointPlayers = [];

    if (count _capPointPlayerMapSingle > 0) then {
        //diag_log format["Converting %1 _capPointPlayerMapSingle entries into _capPointPlayerMapConsolidated", count _capPointPlayerMapSingle];

        {
            _capPointName = _x select 0;
            _player = _x select 1;


            if (_lastCapPointName != _capPointName) then {
                //diag_log "change in cap point name!";
                // NEW CAP POINT IN THE ARRAY! Flush the previous ones out to _capPointPlayerMapConsolidated
                if (_lastCapPointName != "") then {
                    // Make sure we dont make a dummy first entry
                    //_lastCapPointPlayers = [_lastCapPointPlayers, [], {getPlayerUID  _x}, "ASCEND"] call BIS_fnc_SortBy;
                    //diag_log format["CONSOLIDATION: Adding _capPointPlayerMapConsolidated entry for %1 containing %2", _lastCapPointName, _lastCapPointPlayers];
                    _capPointPlayerMapConsolidated = _capPointPlayerMapConsolidated + [ [_lastCapPointName, _lastCapPointPlayers] ];
                };

                _lastCapPointName = _capPointName;
                _lastCapPointPlayers = [_player];
            } else {
                //diag_log format["CONSOLIDATION: Accumulating %2 at %1", _lastCapPointName, _lastCapPointPlayers];
                _lastCapPointPlayers = _lastCapPointPlayers + [_player];
            };

        } forEach _capPointPlayerMapSingle;

        //diag_log format["LAST ENTRY: Adding _capPointPlayerMapConsolidated entry for %1 containing %2", _lastCapPointName, _lastCapPointPlayers];
        _capPointPlayerMapConsolidated = _capPointPlayerMapConsolidated + [ [_lastCapPointName, _lastCapPointPlayers] ];

    };

    _curCapturePointDetails = [_capPointPlayerMapConsolidated, lastCapturePointDetails] call _handleCapPointTick;
    // _the above _handleCapPointTick returns our new set of last iteration info
    lastCapturePointDetails = _curCapturePointDetails;

	sleep SLEEP_INTERVAL;
};
    