//	@file Version: 1.0
//	@file Name: serverRelayHandler.sqf
//	@file Author: His_Shadow
//	@file Created: 07/12/2013 20:55
//	@file Args: [vehicle, texture path, [r,g,b]] for now just texture path is supported

diag_log format ["serverRelaySystem is %1", serverRelaySystem];
clientRelaySystem = serverRelaySystem;
publicVariable "clientRelaySystem";