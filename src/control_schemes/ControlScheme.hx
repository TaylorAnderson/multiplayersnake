package control_schemes;
import flash.display.Stage;
import flash.geom.Point;
import openfl.Lib;

/**
 * ...
 * @author Taylor Anderson
 */
class ControlScheme
{
	var stage:Stage;
	public function new() 
	{
		this.stage = Lib.current.stage;
	}
	public function getDirection(head:SnakeHead):Point
	{
		return null;
	}
	
}