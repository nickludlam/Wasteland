//	@file Version: 1.0
//	@file Name: placePurchasedCrate.sqf
//	@file Author: His_Shadow
//	@file Created: 06/15/2012 05:13
//	@file Args: [CrateType] (60 = ammo, 61 = weapon)
#include "defines.hpp"
private["_storeOwnerID", "_storeOwnerName", "_crateType"];

_storeOwnerID = _this select 0;
_storeOwnerName = _this select 1;
_crateType = _this select 2;

_ammoClasses = ["Box_NATO_Ammo_F","Box_NATO_Grenades_F","Box_NATO_AmmoOrd_F","Box_IND_Ammo_F","Box_IND_Grenades_F","Box_IND_AmmoOrd_F","Box_EAST_Ammo_F","Box_EAST_Grenades_F","Box_EAST_AmmoOrd_F"];
//_weaponClasses = ["Box_NATO_Wps_F","Box_NATO_WpsLaunch_F","Box_NATO_WpsSpecial_F","Box_NATO_Support_F","Box_IND_Wps_F","Box_IND_WpsLaunch_F","Box_IND_WpsSpecial_F","Box_IND_Support_F", "Box_EAST_Wps_F","Box_EAST_WpsLaunch_F","Box_EAST_WpsSpecial_F","Box_EAST_Support_F"];

_createThisFuckingCrate = 
{
	private["_classes", "_storeOwnerID", "_storeOwnerName"];
	_classes = _this select 0;
	_storeOwnerID = _this select 1;
	_storeOwnerName = _this select 2;
	
	_class = _classes call BIS_fnc_selectRandom;
	_playerPos = getPos player;
	_sbox = createVehicle [_class,[(_playerPos select 0), (_playerPos select 1),0],[], 0, "NONE"];
	_sbox addEventHandler ["hit", {(_this select 0) setDamage 0;}];
    _sbox addEventHandler ["dammaged", {(_this select 0) setDamage 0;}]; 
	clearMagazineCargoGlobal _sbox;
	clearWeaponCargoGlobal _sbox;
	clearItemCargoGlobal _sbox;

	switch _storeOwnerName do
	{
		case "North GS":{_sBox setPosASL ([4481.2,6806.38,104.791]);};
		case "West GS":{_sBox setPosASL ([2005.79,2714.25,6.63157]);};//2 or 5 or 4 or 6
		case "West GSA":{_sBox setPosASL ([2015.23,5347.91,3.13762]);};//3
		case "East GS":{_sBox setPosASL ([4481.7,6804.34,104.812]);};
		case "West GR":{_sBox setPosASL ([2428.99,1171.84,3.50737]);};
		case "North Gen":{_sBox setPosASL ([6041.11,5630.9,17.7211]);};
		case "West Gen":{_sBox setPosASL ([2168.89,1888.25,3.64925]);};
		case "East Gen":{_sBox setPosASL ([4348.51,4351.19,177.601]);};
		case "East GenS":{_sBox setPosASL ([4298.08,2671.96,3.63187]);};
		case "East GR":{_sBox setPosASL ([5386.03,3786.6,4.96108]);};
		case "East GSE":{_sBox setPosASL ([5506.49,4728.77,83.8263]);};
		case "North GenS":{_sBox setPosASL ([3093.88,6049.08,5.16202]);};
	};
};

if(_crateType == PURCHASED_CRATE_TYPE_AMMO) then {[_ammoClasses, _storeOwnerID, _storeOwnerName] call _createThisFuckingCrate;};
//if(_crateType == PURCHASED_CRATE_TYPE_WEAPON) then {[_weaponClasses, _storeOwnerID, _storeOwnerName] call _createThisFuckingCrate;};