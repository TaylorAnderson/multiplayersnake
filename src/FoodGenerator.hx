package;

import flash.display.Sprite;

/**
 * ...
 * @author Taylor Anderson
 */
class FoodGenerator extends Sprite
{

	public function new() 
	{
		super();
		
	}
	public function generateFood() {
		
		var food:Food = new Food();
		var level = GameManager.LEVEL;
		food.x = randRange(0, cast(level.width - C.GRIDSIZE));
		food.y = randRange(0, cast(level.height - C.GRIDSIZE));
		food.x = snapToGrid(food.x, C.GRIDSIZE);
		food.y = snapToGrid(food.y, C.GRIDSIZE);
		
		food.x += level.x;
		food.y += level.y;
		
		food.generator = this;
		parent.addChild(food);
	}
	function randRange(from:Int, to:Int):Int
	{
		return from + Math.floor(((to - from + 1) * Math.random()));
	}
	function snapToGrid(num:Float, gridsize:Int):Int
	{
		return Math.floor(num / gridsize) * gridsize;
	}
	
}