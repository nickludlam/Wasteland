/*
 * Creates a random civilian soldier.
 *
 * Arguments: [ position, group, init, skill, rank]: Array
 *    position: Position - Location unit is created at.
 *    group: Group - Existing group new unit will join.
 *    init: String - (optional, default "") Command to be executed upon creation of unit. Parameter this is set to the created unit and passed to the code.
 *    skill: Number - (optional, default 0.5)
 *    rank: String - (optional, default "PRIVATE")
 */

private ["_soldierTypes","_uniformTypes","_vestTypes","_helmetTypes","_weaponTypes","_group","_position","_soldier"];

_soldierTypes = ["C_man_1","C_man_1_2_F","C_man_1_3_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F"];
_uniformTypes = ["U_O_CombatUniform_ocamo", "U_B_CombatUniform_wdl_vest", "U_B_CombatUniform_wdl", "U_I_CombatUniform", "U_I_OfficerUniform", "U_B_CombatUniform_mcam_worn"];
_vestTypes = ["V_TacVest_blk","V_TacVest_brn","V_TacVest_camo","V_TacVest_oli","V_TacVest_khk"];
_helmetTypes = ["H_CrewHelmetHeli_B","H_CrewHelmetHeli_O","H_CrewHelmetHeli_I","H_PilotHelmetHeli_B","H_PilotHelmetHeli_O","H_PilotHelmetHeli_I","H_PilotHelmetFighter_B","H_PilotHelmetFighter_O"];
//_pistolTypes = [];
_weaponTypes = ["arifle_TRG20_F","LMG_Mk200_F","arifle_MXM_F","arifle_MX_GL_F"];
//_launcherType = ["launch_RPG32_F"];

_group = _this select 0;
_position = _this select 1;

_soldier = _group createUnit [_soldierTypes call BIS_fnc_selectRandom, _position, [], 0, "NONE"];
_soldier addVest (_vestTypes call BIS_fnc_selectRandom);
_soldier addUniform (_uniformTypes call BIS_fnc_selectRandom);
_soldier addHeadgear (_helmetTypes call BIS_fnc_selectRandom);
_soldier setskill ["Endurance",1];
_soldier setskill ["aimingAccuracy",1];
_soldier setskill ["aimingShake",1];
_soldier setskill ["aimingSpeed",1];
_soldier setskill ["spotDistance",1];
_soldier setskill ["courage",1];
_soldier setskill ["reloadSpeed",1];
_soldier setskill ["commanding",1];
_soldier setskill ["general",1];
[_soldier, _weaponTypes call BIS_fnc_selectRandom, 3] call BIS_fnc_addWeapon;

_soldier addEventHandler ["killed", "[_this select 0, _this select 1] execVM 'client\functions\aiKilled.sqf'"];

_soldier
