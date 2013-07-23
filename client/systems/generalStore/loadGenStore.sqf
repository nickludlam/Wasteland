
//	@file Version: 1.0
//	@file Name: loadGunStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "defines.hpp"
#include "dialog\genstoreDefines.sqf";
disableSerialization;

_genshopDialog = createDialog "genstored";
genStoreCart = 0;

_Dialog = findDisplay genstore_DIALOG;
_playerMoney = _Dialog displayCtrl genstore_money;
_money = player getVariable __MONEY_VAR_NAME__;
_playerMoney CtrlsetText format["Cash: $%1", _money];
if(!isNil "_this") then {_owner = _this select 0;};
if(!isNil "_owner") then {currentOwnerName = name _owner;};
if(!isNil "_owner") then {currentOwnerID = _owner;};