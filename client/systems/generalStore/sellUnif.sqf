
//	@file Version: 1.0
//	@file Name: sellUnif.sqf
//	@file Author: [GoT] JoSchaap

#include "defines.hpp"

//Initialize Values
private["_uniform","_clothes_value","_total"];
_total = 0;
_clothes_value = 50;
_uniform = "";
_uniform = uniform player;


if(_uniform != "") then {
	removeUniform player;
	player setVariable [__MONEY_VAR_NAME__, (player getVariable [__MONEY_VAR_NAME__, 0]) + _clothes_value, true];
	_total = (_total + _clothes_value);
	};

if(_total != 0) then {
	hint format["You sold your uniform for $%1", _total];
} else {
	hint format["You do not wear anything worth selling"];
};