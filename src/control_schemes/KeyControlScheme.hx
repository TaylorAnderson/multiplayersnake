package control_schemes;
import flash.geom.Point;
import openfl.events.KeyboardEvent;

/**
 * ...
 * @author Taylor Anderson
 */
class KeyControlScheme extends ControlScheme
{
	var leftKey:Int;
	var rightKey:Int;
	var upKey:Int;
	var downKey:Int;
	var keys:Array<Int>;
	
	/**
	 * The key currently held.  -1 indicates no relevant key is currently being held.
	 */
	var currentlyHeld:Int = -1;
	public function new() 
	{
		super();
		keys = [leftKey, rightKey, upKey, downKey];
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}
	
	function onKeyDown(e:KeyboardEvent)
	{
		currentlyHeld = e.keyCode;
		if (keys.indexOf(currentlyHeld) == -1) currentlyHeld = -1;
	}
	function onKeyUp(e)
	{
		if (currentlyHeld == e.keyCode) currentlyHeld = -1;
	}
	override public function getDirection(h:SnakeHead):Point
	{
		if (currentlyHeld == leftKey) 	return new Point(-1, 0);
		if (currentlyHeld == rightKey)	return new Point( 1, 0);
		if (currentlyHeld == upKey) 	return new Point( 0,-1);
		if (currentlyHeld == downKey) 	return new Point( 0, 1);
		return null;
	}
	
}