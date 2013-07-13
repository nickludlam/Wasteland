//	@file Version: 1.0
//	@file Name: loadVehStore.sqf
//	@file Author: His_Shadow
//	@file Created: 06/15/2012 05:13
//	@file Args:

#include "defines.hpp"
#include "dialog\vehstoreDefines.sqf";
disableSerialization;

_vehshopDialog = createDialog "vehshopd";
gunStoreCart = 0;

_Dialog = findDisplay vehshop_DIALOG;
_playerMoney = _Dialog displayCtrl vehshop_money;
_money = player getVariable __MONEY_VAR_NAME__;
_playerMoney CtrlsetText format["Cash: $%1", _money];
_owner = _this select 0;
currentOwnerName = name _owner;
currentOwnerID = _owner;