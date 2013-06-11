//	@file Version: 1.0
//	@file Name: LargeDivers.sqf
//	@file Author: [GoT] JoSchaap

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man1","_man2","_man3","_man4","_man5"];

_group = _this select 0;
_pos = _this select 1;

//diver lead
_leader = _group createunit ["C_man_polo_1_F", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_leader addVest "V_RebreatherB"; 
_leader addUniform "U_B_Wetsuit"; 
_leader addBackpack "B_FieldPack_blk_DiverTL";
_leader addGoggles "G_Diving";
backpa = unitBackpack _leader;  
	clearMagazineCargo backpa;  
	backpa addmagazineCargoGlobal ["30Rnd_556x45_Stanag",2];  
	backpa addmagazineCargoGlobal ["20Rnd_556x45_UW_Mag",2];
_leader addmagazine "20Rnd_556x45_UW_Mag";
_leader addmagazine "20Rnd_556x45_UW_Mag";
_leader addmagazine "20Rnd_556x45_UW_Mag";
_leader addweapon "arifle_SDAR_F";
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
_man1 = _group createunit ["C_man_polo_3_F", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_man1 addUniform "U_B_Wetsuit"; 
_man1 addVest "V_RebreatherB"; 
_man1 addGoggles "G_Diving";
_man1 addmagazine "20Rnd_556x45_UW_Mag";
_man1 addmagazine "20Rnd_556x45_UW_Mag";
_man1 addmagazine "20Rnd_556x45_UW_Mag";
_man1 addweapon "arifle_SDAR_F";
_man1 setskill ["Endurance",1];
_man1 setskill ["aimingAccuracy",1];
_man1 setskill ["aimingShake",1];
_man1 setskill ["aimingSpeed",1];
_man1 setskill ["spotDistance",1];
_man1 setskill ["courage",1];
_man1 setskill ["reloadSpeed",1];
_man1 setskill ["commanding",1];
_man1 setskill ["general",1];
_man1 addEventHandler ["killed", "[_this select 0, _this select 1] execVM 'client\functions\aiKilled.sqf'"];

//Support
_man2 = _group createunit ["C_man_polo_2_F", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_man2 addUniform "U_B_Wetsuit"; 
_man2 addVest "V_RebreatherB"; 
_man2 addGoggles "G_Diving";
_man2 addmagazine "20Rnd_556x45_UW_Mag";
_man2 addmagazine "20Rnd_556x45_UW_Mag";
_man2 addmagazine "20Rnd_556x45_UW_Mag";
_man2 addweapon "arifle_SDAR_F";
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

//Rifleman
_man3 = _group createunit ["C_man_polo_3_F", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_man3 addUniform "U_B_Wetsuit"; 
_man3 addVest "V_RebreatherB"; 
_man3 addGoggles "G_Diving";
_man3 addmagazine "20Rnd_556x45_UW_Mag";
_man3 addmagazine "20Rnd_556x45_UW_Mag";
_man3 addmagazine "20Rnd_556x45_UW_Mag";
_man3 addweapon "arifle_SDAR_F";
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

//Rifleman
_man4 = _group createunit ["C_man_polo_3_F", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_man4 addUniform "U_B_Wetsuit"; 
_man4 addVest "V_RebreatherB"; 
_man4 addGoggles "G_Diving";
_man4 addmagazine "20Rnd_556x45_UW_Mag";
_man4 addmagazine "20Rnd_556x45_UW_Mag";
_man4 addmagazine "20Rnd_556x45_UW_Mag";
_man4 addweapon "arifle_SDAR_F";
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

//Rifleman
_man5 = _group createunit ["C_man_polo_3_F", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_man5 addUniform "U_B_Wetsuit"; 
_man5 addVest "V_RebreatherB"; 
_man5 addGoggles "G_Diving";
_man5 addmagazine "20Rnd_556x45_UW_Mag";
_man5 addmagazine "20Rnd_556x45_UW_Mag";
_man5 addmagazine "20Rnd_556x45_UW_Mag";
_man5 addweapon "arifle_SDAR_F";
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


_leader = leader _group;
[_group, _pos] call defendArea3;
