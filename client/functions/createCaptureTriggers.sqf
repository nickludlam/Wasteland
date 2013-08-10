private ['_triggers'];

_triggers = [];

{
    _markerName = _x select 0;
    _humanName = _x select 1;

    _markerPos = getMarkerPos _markerName;
    _markerDir = markerDir _markerName;
    _markerSize = markerSize _markerName;
    _markerType = markerType _markerName;
    _markerColor = getMarkerColor _markerName;
    _markerBrush = markerBrush _markerName;

    diag_log format["---- Creating trigger for %1 ----", _markerName];
    //diag_log format["_markerPos: %1", _markerPos];
    //diag_log format["_markerDir: %1", _markerDir];
    //diag_log format["_markerSize: %1", _markerSize];
    //diag_log format["_markerType: %1", _markerType];
    //diag_log format["_markerColor: %1", _markerColor];
    //diag_log format["_markerBrush: %1", _markerBrush];

    _trg = createTrigger["EmptyDetector", _markerPos];
    _trg setTriggerArea [_markerSize select 0, _markerSize select 1, _markerDir, true];
    _trg setTriggerActivation["ANY", "PRESENT", true];
    _trg setTriggerStatements["player in thislist", format["player setVariable ['CAP_POINT', '%1', true];", _markerName], format["player setVariable ['CAP_POINT', '', true];"]]; 

    _triggers = _triggers + [_trg];

} forEach captureAreaMarkers;
