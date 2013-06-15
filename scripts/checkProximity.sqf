_leader = this select 0;
_side1 = side _leader;
_side2 = side _leader;
_dist = _leader distance _leader;
_cont = 1;
//check to see how close to the enemy the target leader is
{
	_side1 = side _x;
	_dist = _x distance _leader;
	_group = group _leader;
	_value = (count units group _leader);
	 player globalChat format["%1", _value];

	if((_side1 != _side2) AND (_dist <=100)) then
	{
		_cont = 0;
	};
}forEach playableUnits;
	
_cont