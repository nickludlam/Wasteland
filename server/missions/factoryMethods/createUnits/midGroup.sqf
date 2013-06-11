//	@file Version: 1.0
//	@file Name: midGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7"];

_group = _this select 0;
_pos = _this select 1;

//Anti Vehicle
_leader = _group createunit ["C_man_polo_1_F", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_leader addUniform "U_B_CombatUniform_mcam_vest";
_leader addVest "V_PlateCarrier1_cbr";
_leader addMagazine "RPG32_F";
_leader addMagazine "RPG32_F";
_leader addWeapon "launch_RPG32_F";
_leader addMagazine "30Rnd_65x39_case_mag";
_leader addMagazine "30Rnd_65x39_case_mag";
_leader addMagazine "30Rnd_65x39_case_mag";
_leader addWeapon "arifle_TRG20_F";
_leader setskill ["Endurance",1];
_leader setskill ["aimingAccuracy",1];
_leader setskill ["aimingShake",1];
_leader setskill ["aimingSpeed",1];
_leader setskill ["spotDistance",1];
_leader setskill ["courage",1];
_leader setskill ["reloadSpeed",1];
_leader setskill ["commanding",1];
_leader setskill ["general",1];
_leader addEventHandler ["killed", "[_this select 0, _this select 1] execVM 'client\functions\aiKilled.sqf'"];

//Support
_man2 = _group createunit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 addUniform "U_B_CombatUniform_mcam_tshirt";
_man2 addVest "V_PlateCarrier1_rgr";
_man2 addMagazine "200Rnd_65x39_cased_Box";
_man2 addMagazine "200Rnd_65x39_cased_Box";
_man2 addWeapon "LMG_Mk200_F";
_man2 setskill ["Endurance",1];
_man2 setskill ["aimingAccuracy",1];
_man2 setskill ["aimingShake",1];
_man2 setskill ["aimingSpeed",1];
_man2 setskill ["spotDistance",1];
_man2 setskill ["courage",1];
_man2 setskill ["reloadSpeed",1];
_man2 setskill ["commanding",1];
_man2 setskill ["general",1];
_man2 addEventHandler ["killed", "[_this select 0, _this select 1] execVM 'client\functions\aiKilled.sqf'"];

//Rifle_man
_man3 = _group createunit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man3 addUniform "U_B_CombatUniform_mcam";
_man3 addVest "V_PlateCarrier1_cbr";
_man3 addMagazine "30Rnd_65x39_case_mag";
_man3 addMagazine "30Rnd_65x39_case_mag";
_man3 addMagazine "30Rnd_65x39_case_mag";
_man3 addWeapon "arifle_TRG20_F";
_man3 setskill ["Endurance",1];
_man3 setskill ["aimingAccuracy",1];
_man3 setskill ["aimingShake",1];
_man3 setskill ["aimingSpeed",1];
_man3 setskill ["spotDistance",1];
_man3 setskill ["courage",1];
_man3 setskill ["reloadSpeed",1];
_man3 setskill ["commanding",1];
_man3 setskill ["general",1];
_man3 addEventHandler ["killed", "[_this select 0, _this select 1] execVM 'client\functions\aiKilled.sqf'"];

//Rifle_man
_man4 = _group createunit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man4 addUniform "U_B_CombatUniform_mcam";
_man4 addVest "V_PlateCarrier1_cbr";
_man4 addMagazine "30Rnd_65x39_case_mag";
_man4 addMagazine "30Rnd_65x39_case_mag";
_man4 addMagazine "30Rnd_65x39_case_mag";
_man4 addWeapon "arifle_TRG20_F";
_man4 setskill ["Endurance",1];
_man4 setskill ["aimingAccuracy",1];
_man4 setskill ["aimingShake",1];
_man4 setskill ["aimingSpeed",1];
_man4 setskill ["spotDistance",1];
_man4 setskill ["courage",1];
_man4 setskill ["reloadSpeed",1];
_man4 setskill ["commanding",1];
_man4 setskill ["general",1];
_man4 addEventHandler ["killed", "[_this select 0, _this select 1] execVM 'client\functions\aiKilled.sqf'"];

//Rifle_man
_man5 = _group createunit ["C_man_polo_5_F", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man5 addUniform "U_B_CombatUniform_mcam";
_man5 addVest "V_PlateCarrier1_cbr";
_man5 addMagazine "30Rnd_65x39_case_mag";
_man5 addMagazine "30Rnd_65x39_case_mag";
_man5 addMagazine "30Rnd_65x39_case_mag";
_man5 addWeapon "arifle_TRG20_F";
_man5 setskill ["Endurance",1];
_man5 setskill ["aimingAccuracy",1];
_man5 setskill ["aimingShake",1];
_man5 setskill ["aimingSpeed",1];
_man5 setskill ["spotDistance",1];
_man5 setskill ["courage",1];
_man5 setskill ["reloadSpeed",1];
_man5 setskill ["commanding",1];
_man5 setskill ["general",1];
_man5 addEventHandler ["killed", "[_this select 0, _this select 1] execVM 'client\functions\aiKilled.sqf'"];

//Sniper
_man6 = _group createunit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man6 addUniform "U_B_CombatUniform_mcam_vest";
_man6 addVest "V_PlateCarrier1_rgr";
_man6 addMagazine "20Rnd_762x51_Mag";
_man6 addMagazine "20Rnd_762x51_Mag";
_man6 addWeapon "srifle_EBR_F";
_man6 setskill ["Endurance",1];
_man6 setskill ["aimingAccuracy",1];
_man6 setskill ["aimingShake",1];
_man6 setskill ["aimingSpeed",1];
_man6 setskill ["spotDistance",1];
_man6 setskill ["courage",1];
_man6 setskill ["reloadSpeed",1];
_man6 setskill ["commanding",1];
_man6 setskill ["general",1];
_man6 addEventHandler ["killed", "[_this select 0, _this select 1] execVM 'client\functions\aiKilled.sqf'"];

//Grenadier
_man7 = _group createunit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
_man7 addUniform "U_B_CombatUniform_mcam";
_man7 addVest "V_PlateCarrier1_cbr";
_man7 addMagazine "30Rnd_65x39_caseless_mag";
_man7 addMagazine "30Rnd_65x39_caseless_mag";
_man7 addMagazine "30Rnd_65x39_caseless_mag";
_man7 addMagazine "1Rnd_HE_Grenade_shell";
_man7 addMagazine "1Rnd_HE_Grenade_shell";
_man7 addMagazine "1Rnd_HE_Grenade_shell";
_man7 addWeapon "arifle_MX_GL_F";
_man7 setskill ["Endurance",1];
_man7 setskill ["aimingAccuracy",1];
_man7 setskill ["aimingShake",1];
_man7 setskill ["aimingSpeed",1];
_man7 setskill ["spotDistance",1];
_man7 setskill ["courage",1];
_man7 setskill ["reloadSpeed",1];
_man7 setskill ["commanding",1];
_man7 setskill ["general",1];
_man7 addEventHandler ["killed", "[_this select 0, _this select 1] execVM 'client\functions\aiKilled.sqf'"];

_leader = leader _group;
[_group, _pos] call defendArea;
