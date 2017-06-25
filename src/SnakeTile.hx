package;

import flash.display.Sprite;

/**
 * ...
 * @author Taylor Anderson
 */
class SnakeTile extends Sprite
{
	public var moveDelay:Int = 0;
	
	public var color(default, set):Int = 0;
	public function new() 
	{
		super();
		draw();
	}
	public function set_color(newColor:Int):Int
	{
		this.color = newColor;
		draw();
		return color;
	}
	function draw()
	{
		var g = graphics;
		g.beginFill(color);
		g.drawRect(0, 0, C.GRIDSIZE, C.GRIDSIZE);
		g.endFill();
	}
	
}