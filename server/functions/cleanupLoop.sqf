
_run = true;
while{_run} do
{
	sleep 1200;
	//sleep 1;
	{if (_x isKindOf "Man") then {deleteVehicle _x}} forEach allDead
};

