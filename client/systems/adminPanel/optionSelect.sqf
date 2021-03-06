//	@file Version: 1.0
//	@file Name: optionSelect.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:
private ["_panelType","_displayMod","_displayServerAdmin","_displayDebug","_modSelect","_serverAdminSelect","_debugSelect","_curPlayerInvulnState","_uid"];
#include "defines.hpp"

#define serverAdminMenu_option 50007
#define modMenu_option 50005
#define debugMenu_option 50003

disableSerialization;
_uid = getPlayerUID player;
if ((_uid in moderators) OR (_uid in serverAdministrators)) then {
	_panelType = _this select 0;
	
	_displayMod = uiNamespace getVariable "ModMenu";
	_displayServerAdmin = uiNamespace getVariable "ServerAdminMenu";
	_displayDebug = uiNamespace getVariable "DebugMenu";

	_modSelect = nil;
	_serverAdminSelect = nil;
	_debugSelect = nil;
	
	if (!isNil "_displayMod") then {
		_modSelect = _displayMod displayCtrl modMenu_option;
	};

	if (!isNil "_displayServerAdmin") then {
		_serverAdminSelect = _displayServerAdmin displayCtrl serverAdminMenu_option;
	};

	if (!isNil "_displayDebug") then {
		_debugSelect = _displayDebug displayCtrl debugMenu_option;
	};

	switch (_panelType) do
	{
	    case 0: //Moderator panel
		{
			switch (lbCurSel _modSelect) do
			{
			    case 0: //Player Menu
				{
	                closeDialog 0;
					execVM "client\systems\adminPanel\playerMenu.sqf";
				};
				case 1: //Basic Vehicle Menu
				{
					closeDialog 0;
					execVM "client\systems\adminPanel\vehicleManagement.sqf";
				};
			};
		};
	    case 1: //Server Administrator panel
	    {
			switch (lbCurSel _serverAdminSelect) do
			{
			    case 0: //Player Menu
				{
	                closeDialog 0;
					execVM "client\systems\adminPanel\playerMenu.sqf";
				};
				case 1: //Full Vehicle Management
				{
	                closeDialog 0;
					execVM "client\systems\adminPanel\vehicleManagement.sqf";
				};
				case 2: //Teleport
			    {
	                closeDialog 0;    
	                hint "Click on map to teleport";
	                onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';hint ''; true;";
			    };
			    case 3: //Tags
			    {
					execVM "client\systems\adminPanel\playerTags.sqf";
			    };

	            case 4: //Money
			    {      
					player setVariable[__MONEY_VAR_NAME__, (player getVariable __MONEY_VAR_NAME__)+1000,true];
			    };
	            case 5: //Debug Menu
			    {   
	            	closeDialog 0;
	            	execVM "client\systems\adminPanel\loadDebugMenu.sqf";
			    };
			};
	    };
	    case 2: //Debug panel
	    {      
			switch (lbCurSel _debugSelect) do
			{
			    case 0: //Access Gun Store
				{
	                closeDialog 0;
					execVM "client\systems\gunStore\loadGunStore.sqf";
				};
				case 1: //Access General Store
				{
	                closeDialog 0;
					execVM "client\systems\generalStore\loadGenStore.sqf";
				};
				case 2: //Access Proving Grounds
			    {
	                closeDialog 0;      
					createDialog "balca_debug_main";
			    };
			    case 3: //Access Respawn Dialog
			    {
	                closeDialog 0;
					true spawn client_respawnDialog;
			    };
	            case 4: //FPS Function
			    {      
					hint format["Server FPS: %1",serverFPS];
			    };
				case 5: //cleanup
				{
					[]execVM "client\systems\adminPanel\cleanup.sqf";
					hint "Cleanup script ran";
				};
				case 6:
				{
					#ifdef __DEBUG__ 
					if (X_Client) then {
						_curPlayerInvulnState = player getVariable ["isAdminInvulnerable", 0];
						diag_log format ["ADMIN: _curPlayerState is %1", _curPlayerInvulnState];
 
						diag_log "ADMIN: Adding invulnerability";
 
						if (_curPlayerInvulnState == 0) then
						{
							diag_log "ADMIN: Adding invulnerability";
							hint "You are now invulnerable";
							player setVariable ["isAdminInvulnerable", 1, true];
 
							player removeAllEventHandlers "handleDamage";
							player addEventHandler ["handleDamage", { false }];        
							player allowDamage false;
						}
						else
						{
							diag_log "ADMIN: Removing invulnerability";
							hint "You are no longer invulnerable";
							player setVariable ["isAdminInvulnerable", 0, true];
 
							player removeAllEventHandlers "handleDamage";
							player addEventHandler ["handleDamage", { true }];        
							player allowDamage true;
						};
 
						diag_log format ["ADMIN: End of isAdminInvulnerable section"];
					};
					#else
					hint "Sorry, god mode isn't available outside of DEBUG mode";
					#endif
				};
	            case 7: //Test Function
			    {
			    	// 
			    	
			    };
			};		
	    };
	};
} else {
  exit;  
};