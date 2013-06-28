_group1 = createGroup civilian;
_group2 = createGroup RESISTANCE;
_group3 = createGroup EAST;
_group4 = createGroup WEST;

_location = [53.2724,7146.04,0];

_soldier1 = [_group1, _location] call createRandomAquaticSoldier;
_soldier1 removeAllEventHandlers "hit";
_soldier1 removeAllEventHandlers "dammaged";
_soldier1 removeAllEventHandlers "handleDamage";
_soldier1 addeventhandler ["hit", {(_this select 0) setdamage 0;}];
_soldier1 addeventhandler ["dammaged", {(_this select 0) setdamage 0;}];
_soldier1 addEventHandler["handledamage", {false}];
_soldier1 allowDamage false;
_soldier1 disableAI 'MOVE';
_soldier1 DisableAI 'ANIM';
_soldier1 disableAI 'FSM';
removeAllWeapons _soldier1;

_soldier2 = [_group2, _location] call createRandomAquaticSoldier;
_soldier2 removeAllEventHandlers "hit";
_soldier2 removeAllEventHandlers "dammaged";
_soldier2 removeAllEventHandlers "handleDamage";
_soldier2 addeventhandler ["hit", {(_this select 0) setdamage 0;}];
_soldier2 addeventhandler ["dammaged", {(_this select 0) setdamage 0;}];
_soldier2 addEventHandler["handledamage", {false}];
_soldier2 allowDamage false;
_soldier2 disableAI 'MOVE';
_soldier2 DisableAI 'ANIM';
_soldier2 disableAI 'FSM';
removeAllWeapons _soldier2;

_soldier3 = [_group3, _location] call createRandomAquaticSoldier; 
_soldier3 removeAllEventHandlers "hit";
_soldier3 removeAllEventHandlers "dammaged";
_soldier3 removeAllEventHandlers "handleDamage";
_soldier3 addeventhandler ["hit", {(_this select 0) setdamage 0;}];
_soldier3 addeventhandler ["dammaged", {(_this select 0) setdamage 0;}];
_soldier3 addEventHandler["handledamage", {false}];
_soldier3 allowDamage false;
_soldier3 disableAI 'MOVE';
_soldier3 DisableAI 'ANIM';
_soldier3 disableAI 'FSM';
removeAllWeapons _soldier3;

_soldier4 = [_group4, _location] call createRandomAquaticSoldier; 
_soldier4 removeAllEventHandlers "hit";
_soldier4 removeAllEventHandlers "dammaged";
_soldier4 removeAllEventHandlers "handleDamage";
_soldier4 addeventhandler ["hit", {(_this select 0) setdamage 0;}];
_soldier4 addeventhandler ["dammaged", {(_this select 0) setdamage 0;}];
_soldier4 addEventHandler["handledamage", {false}];
_soldier4 allowDamage false;
_soldier4 disableAI 'MOVE';
_soldier4 DisableAI 'ANIM';
_soldier4 disableAI 'FSM';
removeAllWeapons _soldier4;