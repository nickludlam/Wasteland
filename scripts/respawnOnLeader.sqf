/*
Move player 3m behind his group leader or into leader's vehicle
By Megagoth1702, thanks to Sandiford and Cheesenoggin, slightly modified by ZZEZ
*/

private ["_leader","_LX","_LY","_LZ", "_side1", "_side2", "_dist", "_cont", "_group", "_value", "_do"];

//setting up basic variables
 _leader = leader player;	
_side1 = side _leader;
_side2 = side _leader;
_dist = _leader distance _leader;
_enemyClose = 0;

// Stop the weird spawn behind yourself problem
if (_leader == player) then
{
	player globalChat "You can't spawn on yourself!"
}
else
{
	// Check to see if we should block spawning due to enemy proximity

	{
		_side1 = side _x;
		_side2 = side _leader;
		_dist = _x distance _leader;
		_group = group _leader;
		_value = (_x in units group _leader);

		if((_side1 != _side2) AND (_dist <=100)) then
		{
			_enemyClose = 1;
		};
	} forEach playableUnits;


	if(_enemyClose == 1) then
	{
		player globalChat "This player is in combat. You can't spawn on them.";
	}
	else 
	{
		//If leader's vehicle is the leader himself, move player 3m behind him
		if (vehicle _leader == _leader) then
		{
			//Getting the coords	
			_LX = (getpos _leader select 0) +
							(3*sin ((getDir _leader) -180));
			_LY = (getpos _leader select 1) +
							(3*cos ((getDir _leader) -180));
			_LZ = (getpos _leader select 2);
			
			player setpos [_LX,_LY,_LZ];
		}
		else //If leader is inside vehicle, move player into vehicle cargo
		{
			/*Checking if there is room in the vehicle, gives hint if there is none
			if there is room, player is moved into cargo of leader's vehicle
			*/        
			if ((vehicle _leader) emptyPositions "cargo"==0) then
				{hint "No room in squad leader's vehicle."}
			else{player moveincargo vehicle _leader;};
		};
	};
};
