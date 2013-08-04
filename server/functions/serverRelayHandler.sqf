//	@file Version: 1.0
//	@file Name: serverRelayHandler.sqf
//	@file Author: His_Shadow
//	@file Created: 07/12/2013 20:55
//	@file Args: variable. See clientRelaySystem

diag_log format ["Setting clientRelaySystem = serverRelaySystem = %1", serverRelaySystem];
clientRelaySystem = serverRelaySystem;
publicVariable "clientRelaySystem";