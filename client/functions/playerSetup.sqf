//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#include "defines.hpp"
private["_player", "_gun", "_money"];
_player = _this;

//Player initialization
_player setskill 0;
{_player disableAI _x} foreach ["move","anim","target","autotarget"];
_player setVariable ["BIS_noCoreConversations", true];

enableSentences false;
_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";
removeAllWeapons _player;
removeUniform _player;
removeVest _player;
removeBackpack _player;
removeHeadgear _player;
removeGoggles _player;
_player unassignItem "NVGoggles"; 
_player removeItem "NVGoggles"; 

switch (str(playerSide)) do
{
    case "WEST":
    {
		_player addUniform "U_B_CombatUniform_mcam";
		//_player addVest "V_HarnessO_brn";
		_player addVest (["V_HarnessO_brn","V_HarnessOGL_brn"] call BIS_fnc_selectRandom);
    };

    case "EAST":
    {
        _player addUniform "U_O_CombatUniform_ocamo";
		//_player addVest "V_HarnessO_brn";
		_player addVest (["V_HarnessO_brn","V_HarnessOGL_brn"] call BIS_fnc_selectRandom);
    };

default
    {
		//_player addUniform (["U_B_CombatUniform_mcam","U_O_CombatUniform_ocamo"] call BIS_fnc_selectRandom);
		_player addUniform "U_I_CombatUniform";
		_player addVest (["V_HarnessO_brn","V_HarnessOGL_brn"] call BIS_fnc_selectRandom);
    };
};

//_player addBackpack (["B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_blk","B_AssaultPack_mcamo"]call BIS_fnc_selectRandom);
_gun = (["hgun_P07_F","hgun_Rook40_F","hgun_ACPC2_F"] call BIS_fnc_selectRandom);

// ACP takes different ammo now
if (_gun == "hgun_ACPC2_F") then {
	_player addMagazine "9Rnd_45ACP_Mag";
	_player addMagazine "9Rnd_45ACP_Mag";
	_player addMagazine "9Rnd_45ACP_Mag";
} else {
	_player addMagazine "16Rnd_9x21_Mag";
	_player addMagazine "16Rnd_9x21_Mag";
	_player addMagazine "16Rnd_9x21_Mag";
};

_player addWeapon _gun;

if _
_player addrating 1000000;
_player switchMove "amovpknlmstpsraswpstdnon_gear";

thirstLevel = 100;
hungerLevel = 100;
fatigueLevel = 0;
playerSpawnTime = time; // Used to know if the player has died while in sleepy loops (hunger/thirst)

//decide whether we need to create the donation money
_money = 0;
if(computedMoney == 0) then 
{ 
#ifdef __SPAWN_WITH_PLENTY_DOLLA__
	_money = 100000;
#else
	_money = 100;
#endif
}
else 
{
	_player globalChat format["Thank you for your donation. You have spawned with $%1 extra cash.", computedMoney];
	_money = (100 + computedMoney);
};

_player setVariable["computedMoney", computedMoney, true];
_player setVariable[__MONEY_VAR_NAME__,_money,true];
_player setVariable["canfood",1,false];
_player setVariable["medkits",1,false];
_player setVariable["water",1,false];
_player setVariable["repairkits",1,false];
_player setVariable["fuelFull", 0, false];
_player setVariable["fuelEmpty", 1, false];
_player setVariable["spawnBeacon",0,false];
_player setVariable["camonet",0,false];

[] execVM "client\functions\playerActions.sqf";
_player selectWeapon _gun;

_player groupChat format["Player Initialization Complete"];
playerSetupComplete = true;