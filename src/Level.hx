package;

import flash.display.Sprite;
import openfl.events.Event;
import control_schemes.ArrowScheme;
import control_schemes.WASDScheme;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.text.TextFieldAutoSize;

/**
 * ...
 * @author Taylor Anderson
 */
class Level extends Sprite
{
	var padding:Float = 30;
	
	var pixelWidth = C.LEVEL_WIDTH * C.GRIDSIZE;
	var pixelHeight = C.LEVEL_HEIGHT * C.GRIDSIZE;
	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}
	function onAdded(e)
	{
		
		var g = graphics;
		g.beginFill(0);
		g.drawRect(0, 0, pixelWidth, pixelHeight);
		g.endFill();
		g.beginFill(0xFFFFFF);
		g.drawRect(C.GRIDSIZE, C.GRIDSIZE, pixelWidth - C.GRIDSIZE * 2, pixelHeight - C.GRIDSIZE * 2);
		g.endFill();
		
		this.x = stage.stageWidth / 2 - this.width / 2;
		this.y = stage.stageHeight / 2 - this.height / 2;
		

	}
	
}