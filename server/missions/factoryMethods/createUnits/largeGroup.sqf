//	@file Version: 1.0
//	@file Name: largeGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7","_man8","_man9","_man10"];

_group = _this select 0;
_pos = _this select 1;

//Anti Air no weapon
_leader = _group createunit ["C_man_polo_1_F", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];
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

//Sniper
_man5 = _group createunit ["C_man_polo_5_F", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man5 addMagazine "20Rnd_762x45_Mag";
_man5 addMagazine "20Rnd_762x45_Mag";
_man5 addWeapon "srifle_EBR_F";
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

//Grenadier
_man6 = _group createunit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
_man6 addMagazine "30Rnd_65x39_case_mag";
_man6 addMagazine "30Rnd_65x39_case_mag";
_man6 addMagazine "30Rnd_65x39_case_mag";
_man6 addWeapon "arifle_TRG20_F";
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

//Support
_man7 = _group createunit ["C_man_polo_4_F", [(_pos select 0) - 40, _pos select 1, 0], [], 0.5, "Form"];
_man7 addMagazine "200Rnd_65x39_cased_Box";
_man7 addMagazine "200Rnd_65x39_cased_Box";
_man7 addWeapon "LMG_Mk200_F";
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

//Grenadier
_man8 = _group createunit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) + 50, 0], [], 0.5, "Form"];
_man8 addMagazine "RPG32_F";
_man8 addMagazine "RPG32_F";
_man8 addWeapon "launch_RPG32_F";
_man8 addMagazine "30Rnd_65x39_case_mag";
_man8 addMagazine "30Rnd_65x39_case_mag";
_man8 addMagazine "30Rnd_65x39_case_mag";
_man8 addWeapon "arifle_TRG20_F";
_man8 setskill ["Endurance",1];
_man8 setskill ["aimingAccuracy",1];
_man8 setskill ["aimingShake",1];
_man8 setskill ["aimingSpeed",1];
_man8 setskill ["spotDistance",1];
_man8 setskill ["courage",1];
_man8 setskill ["reloadSpeed",1];
_man8 setskill ["commanding",1];
_man8 setskill ["general",1];
_man8 addEventHandler ["killed", "[_this select 0, _this select 1] execVM 'server\functions\aiKilled.sqf'"];

//Sniper
_man9 = _group createunit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 50, 0], [], 0.5, "Form"];
_man9 addMagazine "20Rnd_762x45_Mag";
_man9 addMagazine "20Rnd_762x45_Mag";
_man9 addWeapon "srifle_EBR_F";
_man9 setskill ["Endurance",1];
_man9 setskill ["aimingAccuracy",1];
_man9 setskill ["aimingShake",1];
_man9 setskill ["aimingSpeed",1];
_man9 setskill ["spotDistance",1];
_man9 setskill ["courage",1];
_man9 setskill ["reloadSpeed",1];
_man9 setskill ["commanding",1];
_man9 setskill ["general",1];
_man9 addEventHandler ["killed", "[_this select 0, _this select 1] execVM 'server\functions\aiKilled.sqf'"];

//Rifle_man
_man10 = _group createunit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man10 addMagazine "30Rnd_65x39_case_mag";
_man10 addMagazine "30Rnd_65x39_case_mag";
_man10 addMagazine "30Rnd_65x39_case_mag";
_man10 addWeapon "arifle_TRG20_F";
_man10 setskill ["Endurance",1];
_man10 setskill ["aimingAccuracy",1];
_man10 setskill ["aimingShake",1];
_man10 setskill ["aimingSpeed",1];
_man10 setskill ["spotDistance",1];
_man10 setskill ["courage",1];
_man10 setskill ["reloadSpeed",1];
_man10 setskill ["commanding",1];
_man10 setskill ["general",1];
_man10 addEventHandler ["killed", "[_this select 0, _this select 1] execVM 'server\functions\aiKilled.sqf'"];

_leader = leader _group;
[_group, _pos] call defendArea;