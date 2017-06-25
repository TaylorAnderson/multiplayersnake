package control_schemes;
import openfl.ui.Keyboard;

/**
 * ...
 * @author Taylor Anderson
 */
class WASDScheme extends KeyControlScheme
{

	public function new() 
	{
		upKey 		= 	Keyboard.W;
		downKey 	= 	Keyboard.S;
		leftKey 	= 	Keyboard.A;
		rightKey 	= 	Keyboard.D;
		super();

	}
	
}