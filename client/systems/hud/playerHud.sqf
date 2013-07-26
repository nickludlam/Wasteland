
//	@file Version: 1.0
//	@file Name: playerHud.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 11/09/2012 04:23
//	@file Args:

#include "defines.hpp"

disableSerialization;
private["_ui","_fatigue", "_hud","_food","_water", "_lastHealthReading", "_sprintFatigue", "_percentSprintFatigue", "_runningIconName", "_stamina", "_counter", "_modulo","_vitals","_hudVehicle","_decimalPlaces","_health","_healthTextColor",
"_foodWaterTextColor","_tempString","_yOffset","_x","_y"];

_counter = 0; // used for flashing UI elements, with the _modulo var

_lastHealthReading = 100; // Used to flash the health reading when it changes

while {true} do
{
    1000 cutRsc ["WastelandHud","PLAIN"];
    _ui = uiNameSpace getVariable "WastelandHud";
    _vitals = _ui displayCtrl 3600;
    _hudVehicle = _ui displayCtrl 3601;
    _runningIconName = 'running.paa';
    _stamina = "100";


    //Calculate Health 0 - 100
    _decimalPlaces = 2;
    _health = damage player;
    _health = round (_health * (10 ^ _decimalPlaces)) / (10 ^ _decimalPlaces);
    _health = 100 - (_health * 100);

    // If fatigue is over 0.5 then the player can't sprint
    // Our meter is normalised from 0 -> 0.5  to 0 -> 1.0
    //
    // Then we take the inverse and call that our sprint meter
    _sprintFatigue = getFatigue player;
    if (_sprintFatigue > 0.5) then {
        _sprintFatigue = 0.5;
    };

    _counter = _counter + 1;
    _modulo = _counter mod 2;

    // fatigueLevel: -3 = exhausted, -2 = tired, -1 = resting, 0 = fine, 1 = hot n thirsty
    _percentSprintFatigue = round (_sprintFatigue * 200);  // 0 = fine, 100 = no sprint ability

#ifdef __RUNNING_EXHAUSTION__
    if (fatigueLevel == FATIGUE_EXHAUSTED) then {
        if (_modulo == 0) then {
            _stamina = format ["<t color='#FF0000'>%1</t>", "EXHAUSTED!"];
            _runningIconName = 'running.paa';
        } else {
            _stamina = format ["<t color='#FFFFFF'>%1</t>", "EXHAUSTED!"];
            _runningIconName = 'running_red.paa';
        };
    };

    if (fatigueLevel == FATIGUE_TIRED) then {
        _runningIconName = 'running_red.paa';
        _stamina = format ["%1", "TIRED"];
    };

    if (fatigueLevel == FATIGUE_RESTING) then {
        _runningIconName = 'running_red.paa';
        _stamina = format ["%1", "RESTING"];
    };
#endif

    if (fatigueLevel >= 0) then {
        _runningIconName = 'running.paa';
        _stamina = format ["%1", (100 - _percentSprintFatigue)];
    };

    // Flash the health colour on the HUD according to it going up, down or the same
    _healthTextColor = "#FFFFFF";
    _foodWaterTextColor = "#FFFFFF";
    if (_health != _lastHealthReading) then {
        // Health change. Up or down?
        if (_health < _lastHealthReading) then {
            // Gone down. Red flash
            _healthTextColor = "#FF1717";
        } else {
            // Gone up. Green flash
            _healthTextColor = "#17FF17";
            if (_health - _lastHealthReading == 1) then {
                // Its because of food + water, so colour them too
                _foodWaterTextColor = "#17FF17";
            };
        };
    };

    _vitals ctrlSetStructuredText parseText format ["%1 <img size='0.8' image='client\icons\%2'/><br/><t color='%7'>%3</t> <img size='0.8' image='client\icons\1.paa'/><br/><t color='%8'>%4</t> <img size='0.8' image='client\icons\water.paa'/><br/><t color='%8'>%5</t> <img size='0.8' image='client\icons\food.paa'/><br/>%6 <img size='0.8' image='client\icons\money.paa'/>", _stamina, _runningIconName, _health, thirstLevel, hungerLevel, (player getVariable __MONEY_VAR_NAME__), _healthTextColor, _foodWaterTextColor];
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

    // Make sure we keep a record of the health value from this iteration
    _lastHealthReading = _health;

    sleep 1;
};