waitUntil {!isNull findDisplay 46};
{
    (
        (findDisplay 46) displayCtrl _x
    ) ctrlShow false;
} forEach [1000, 1001, 1002, 1200, 1202];