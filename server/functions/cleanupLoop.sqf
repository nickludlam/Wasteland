_run = true;
while{_run} do
{
	sleep 1200;
	{if (_x isKindOf "Man") then {deleteVehicle _x}} forEach allDead;
	{if (damage _x >= 1 and (_x isKindOf "Car" || _x isKindOf "Helicopter" || _x isKindOf "Wheeled_APC" || _x isKindOf "Tank")) then {deleteVehicle _x}} foreach vehicles;
};
