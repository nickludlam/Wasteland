//	@file Version: 1.0
//	@file Name: NewPlayerHandle.sqf
//	@file Author: Reaper
//	@file Created: 8/4/2013
//	@file Description: Passed a player when they join the server or respawn.
//	@file Args: Object Player

Private ["_NewPlayer","_uid","_side","_key","_Player","_DBCheck"];

// _NewPlayer = _this Select 0;
// _uid = GetPlayerUID _NewPlayer;
// _side = Side _NewPlayer;
// _key = Format ["%1_%2", _uid, _side];

// diag_log format ["New Player %1 has joined with key %2",_NewPlayer, _Key];


_NewPlayerHandle =
" 
	_Player = _this Select 1;
	_uid = GetPlayerUID _Player;
	_side = Side _Player;
	_key = Format [""%1_%2"", _uid, _side];
	
	diag_log format [""New Player %1 has joined with key %2"",_Player, _Key];
	diag_log format [""Checking to see if %1 has an account"",_Player];
	
	_DBCheck = _key Call inidb_exists;
	
	If (_DBCheck) Then {
		diag_log format [""Player %1 has a valid database"", _Player];
		accountToClient = [_Player, _Key];
		PublicVariable ""accountToClient"";
		
	}
	Else {
		diag_log format [""Player %1 does not have a valid database"", _Player];
	};
	
	
	
	
";

NewPlayerHandle = compile _NewPlayerHandle;