//	@file Version: 1.0
//	@file Name: acceptGroupInvite.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
#include "defines.hpp"

private["_groupExists","_inviterUID","_inviter", "_accepterName","_destPlayerUID","_msg"];

//Get the inviters UID
_inviterUID = nil;
_inviter = nil;
_groupExists = false;
{
	if(getPlayerUID player == _x select 1) then
	{
    	_inviterUID = _x select 0;
        currentInvites set [_forEachIndex,"REMOVETHISCRAP"];
        currentInvites = currentInvites - ["REMOVETHISCRAP"];
        publicVariableServer "currentInvites";       
	};
}forEach currentInvites;

//Get the inviter with their UID
{
	if(getPlayerUID _x == _inviterUID) then
    {
    	_inviter = _x;
        _groupExists = true;	    
    };
}forEach playableUnits;

if(_groupExists and !isNil "_inviter") then
{
	[player] join (group _inviter);
    player globalChat format["You have accepted the invite."];
	
	//broadcast that the player has accepted the invite to the inviter
	_destPlayerUID = getPlayerUID _inviter;
	_accepterName = name player;
	_msg = format["%1 has accepted your invite", _accepterName];
	//if(X_Server) then {call serverRelayHandler};
	serverRelaySystem = [MESSAGE_BROADCAST_MSG_TO_PLAYER, MESSAGE_BROADCAST_MSG_TYPE_GCHAT, _destPlayerUID, _msg];
	publicVariable "serverRelaySystem";
} else {
	player globalChat format["The group no longer exists."];    
}; 