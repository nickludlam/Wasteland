
//	@file Version: 1.0
//	@file Name: playerHud.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 11/09/2012 04:23
//	@file Args:

disableSerialization;
private["_ui","_fatigue", "_hud","_food","_water"];

while {true} do
{
    1000 cutRsc ["WastelandHud","PLAIN"];
    _ui = uiNameSpace getVariable "WastelandHud";
    _vitals = _ui displayCtrl 3600;
    _hudVehicle = _ui displayCtrl 3601;
    
    //Calculate Health 0 - 100
    _decimalPlaces = 2;
    _health = damage player;
    _health = round (_health * (10 ^ _decimalPlaces)) / (10 ^ _decimalPlaces);
    _health = 100 - (_health * 100);

    // Weird and experimental. percentage stamina. Total is 200%, which is full sprint
    // capability, no running thirst 
    _sprintFatigue = getFatigue player;
    if (_sprintFatigue > 0.5) then {
        _sprintFatigue = 0.5;
    };
    _percentRunningThirst = round (fatigueLevel * 100);    // 0 = fine, 100 = hot n thirsty
    _percentSprintFatigue = round (_sprintFatigue * 200);  // 0 = fine, 100 = no sprint ability

    _stamina = format ["%1/%2", (100 - _percentSprintFatigue), (100 - _percentRunningThirst)];
    
    _vitals ctrlSetStructuredText parseText format ["%1 <img size='0.8' image='client\icons\running.paa'/><br/>%2 <img size='0.8' image='client\icons\1.paa'/><br/>%3 <img size='0.8' image='client\icons\water.paa'/><br/>%4 <img size='0.8' image='client\icons\food.paa'/><br/>%5 <img size='0.8' image='client\icons\money.paa'/>", _stamina, _health, thirstLevel, hungerLevel, (player getVariable "cmoney")];
    _vitals ctrlCommit 0;
        
    if(player != vehicle player) then
    {
        _tempString = "";
        _yOffset = 0.24;
        _vehicle = assignedVehicle player;

        {
            if((driver _vehicle == _x) || (gunner _vehicle == _x)) then
            {
                if(driver _vehicle == _x) then
                {
                    _tempString = format ["%1 %2 <img size='0.8' image='client\icons\driver.paa'/><br/>",_tempString, (name _x)];
                    _yOffset = _yOffset + 0.04;
                }
                else
                {
                    _tempString = format ["%1 %2 <img size='0.8' image='client\icons\gunner.paa'/><br/>",_tempString, (name _x)];
                    _yOffset = _yOffset + 0.04;
                }; 
            }
            else
            {
                _tempString = format ["%1 %2 <img size='0.8' image='client\icons\cargo.paa'/><br/>",_tempString, (name _x)];
                _yOffset = _yOffset + 0.04;
            };    
        } forEach crew _vehicle;

        _hudVehicle ctrlSetStructuredText parseText _tempString;
        _x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
        _y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
        _hudVehicle ctrlSetPosition [_x, _y, 0.4, 0.65];
        _hudVehicle ctrlCommit 0;
    };
        
    sleep 1;
};