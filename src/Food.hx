package;

import flash.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Taylor Anderson
 */
class Food extends Sprite
{
	public var generator:FoodGenerator;
	public function new() 
	{
		super();
		GameManager.FOOD = this;
		graphics.beginFill(0x0000FF);
		graphics.drawRect(0, 0, C.GRIDSIZE, C.GRIDSIZE);
		graphics.endFill();
		addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
	}
	function onRemoved(e)
	{
		generator.generateFood();
	}
	
}