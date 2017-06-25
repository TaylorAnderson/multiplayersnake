package control_schemes;
import openfl.ui.Keyboard;

/**
 * ...
 * @author Taylor Anderson
 */
class ArrowScheme extends KeyControlScheme
{

	public function new() 
	{
		upKey 		= 	Keyboard.UP;
		downKey 	= 	Keyboard.DOWN;
		leftKey 	= 	Keyboard.LEFT;
		rightKey 	= 	Keyboard.RIGHT;
		super();
	}
	
}