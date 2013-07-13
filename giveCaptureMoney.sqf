//	@file Version: 1.0
//	@file Name: giveCaptureMoney.sqf
//	@file Author: [KoS]Bewilderbeest
//	@file Created: 7/13/2013 00:45
//	@file Args: [player side, money amount]

#include "defines.hpp"

_side = _this select 0;
_amount = _this select 1;

_amountStr = format["$%1", _amount];

if (playerSide == _side) then {player setVariable[__MONEY_VAR_NAME__, (player getVariable __MONEY_VAR_NAME__)+_amount,true];hint format["You got %1 for capturing the territory!", _amountStr];};
