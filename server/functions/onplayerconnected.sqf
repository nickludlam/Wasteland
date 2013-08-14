//	@file Version: 1.0
//	@file Name: omPlayerConnected.sqf
//	@file Author: [Kos]Bewilderbeest
//	@file Created: 13/8/2013 11:08
//	@file Description: Triggers to run when a player connected.
//	@file Args:

// This is basically here to fix anything which isn't taken care of by the engine's JIP functionality

if(!isServer) exitWith {};

private ['_id', '_name'];

_id = _this select 0;
_name = _this select 1;

if (_name == '__SERVER__') exitWith { };


diag_log format['Running omPlayerConnected.sqf'];

// duplicated from capturePointMonitor.sqf
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

// MAIN

{
	private ['_markerName', '_markerOwnerSide', '_color'];
	diag_log format["OPC marker setup loop %1", _x];
    _markerName = _x select 0;
    _markerOwnerSide = _x select 3;
    if (_markerOwnerSide != "") then {
	    _color = [_markerOwnerSide] call _markerColorForSide;
   	 	_markerName setMarkerColor _color;
    	diag_log format ["OPC setting %1 to %2", _markerName, _color];
    };
} forEach lastCapturePointDetails;
