//	@file Version: 1.0
//	@file Name: smallGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3"];

_group = _this select 0;
_pos = _this select 1;

//diver lead
_leader = _group createunit ["C_man_polo_1_F", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_leader setRank "LIEUTENANT";
_leader addUniform "U_B_GhillieSuit";
_leader addVest "V_PlateCarrier1_cbr";
_leader addmagazine "5Rnd_127x108_Mag";
_leader addmagazine "5Rnd_127x108_Mag";
_leader addmagazine "5Rnd_127x108_Mag";
_leader addmagazine "5Rnd_127x108_Mag";
_leader addmagazine "5Rnd_127x108_Mag";
_leader addmagazine "5Rnd_127x108_Mag";
_leader addweapon "srifle_GM6_SOS_F";
_leader addweapon "Rangefinder";
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
_man2 = _group createunit ["C_man_polo_2_F", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_man2 addUniform "U_O_GhillieSuit";
_man2 addVest "V_PlateCarrier1_cbr";
_man2 addmagazine "7Rnd_408_Mag";
_man2 addmagazine "7Rnd_408_Mag";
_man2 addmagazine "7Rnd_408_Mag";
_man2 addmagazine "7Rnd_408_Mag";
_man2 addmagazine "7Rnd_408_Mag";
_man2 addmagazine "7Rnd_408_Mag";
_man2 addweapon "srifle_LRR_SOS_F";
_man2 addweapon "Rangefinder";
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

_leader = leader _group;
_group setBehaviour "STEALTH";
[_group, _pos] call defendArea3;
