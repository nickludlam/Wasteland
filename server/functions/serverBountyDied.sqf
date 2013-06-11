
_player = (_this select 0) select 0;
_killer = (_this select 0) select 1;

if (side _killer == west) then {player setVariable["cmoney", (player getVariable "cmoney")+200,true];hint format["You got $200 for capturing the territory!"];};
if (side _killer == east) then {player setVariable["cmoney", (player getVariable "cmoney")+200,true];hint format["You got $200 for capturing the territory!"];};
if (side _killer == resistance) then {player setVariable["cmoney", (player getVariable "cmoney")+200,true];hint format["You got $200 for capturing the territory!"];};