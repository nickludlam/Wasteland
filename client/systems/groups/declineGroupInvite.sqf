//	@file Version: 1.0
//	@file Name: declineGroupInvite.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

//Get the inviters UID
private["_inviterUID","_inviter"];
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

if(_groupExists) then
{
	_inviter globalChat format["%1 has declined your invite.", name player];
} else {
	player globalChat format["The group no longer exists"];
	};
	
player globalChat format["You have declined the invite."];