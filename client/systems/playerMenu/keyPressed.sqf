private['_handled'];
_handled = false;
switch (_this select 1) do
{
   case 1:
   {
		// code here
		pMenuActive = false;
		closeDialog 0;
		_handled = true;
	};
	case 51:
	{
		// code here
		pMenuActive = false;
		closeDialog 0;
		_handled = true;
	};
};
_handled;
