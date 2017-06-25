package;

import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;
import openfl.Lib;

/**
 * ...
 * @author Taylor Anderson
 */
class SnakeHead extends SnakeTile
{

	public var tiles:Array<SnakeTile> = [];
	
	var player:PlayerProfile;
	var currentDir:Point = new Point(1, 0);
	
	var prevTime:Int = 0;
	var counter:Float = 0;
	public function new(player:PlayerProfile) 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		this.player = player;
		this.color = player.color;
		
		GameManager.PLAYERS.push(this);
	}
	function onAdded(e)
	{
		tiles.push(this);
		addTiles(3);
	}
	function onEnterFrame(e)
	{
		var currentTime = Lib.getTimer();
		counter += (currentTime - prevTime) / 1000;
		
		if (counter > 0.05)
		{
			updateSnake();
			counter=0;
		}

		prevTime = currentTime;//update for next go around
	}
	function updateSnake()
	{
		setDirection(player.controlScheme.getDirection(this));
		trace(currentDir.x * C.GRIDSIZE);
		x += currentDir.x * C.GRIDSIZE;
		y += currentDir.y * C.GRIDSIZE;
		
		//death checking
		
	
		for (p in GameManager.PLAYERS)
		{
			
			for (tile in p.tiles)
			{
				if (tile != this)
				{
					if (getBounds(stage).intersects(tile.getBounds(stage))) 
					{
						die();
						return;
					}
				}

			}
		}
		var levelBounds = GameManager.LEVEL.getBounds(stage);
		levelBounds.x += C.GRIDSIZE;
		levelBounds.y += C.GRIDSIZE;
		levelBounds.width -= C.GRIDSIZE*2;
		levelBounds.height -= C.GRIDSIZE*2;
		if (!this.getBounds(stage).intersects(levelBounds)) 
		{
			
			die();
			return;
		}
		
		
		if (getBounds(stage).intersects(GameManager.FOOD.getBounds(stage))) 
		{
			addTiles(1);
			parent.removeChild(GameManager.FOOD);
		}

		
		var i = tiles.length - 1;
		while (i > 0)
		{
			tiles[i].x = tiles[i-1].x;
			tiles[i].y = tiles[i-1].y;
			i--;
		}
		
	}
	public function addTiles(amt:Int)
	{
		for (i in 0...amt)
		{
			var part = new SnakeBody();
			
			part.color = player.color;

			
			parent.addChild(part);
			part.x = this.x;
			part.y = this.y;
			tiles.push(part);
		}
	}
	
	/**
	 * Sets the direction of the head, given its a valid direction.
	 * @param	dir The new direction.
	 * @param	force Whether to override the validity checks performed by the function.
	 */
	public function setDirection(dir:Point, force:Bool = false)
	{
		//if we've pressed something, and it doesnt make the snake completely turn around, take it
		if (force || (dir != null && dir.x * -1 != currentDir.x && dir.y * -1 != currentDir.y)) 
		{
			currentDir = dir;
		}
	}
	public function setColor(newColor:Int)
	{
		for (tile in tiles)
		{
			tile.color = newColor;
		}
	}

	function die()
	{
		if (parent == null) return;
		for (i in 1...tiles.length)
		{
			if (tiles[i] != this)
				parent.removeChild(tiles[i]);
		}
		parent.removeChild(this);
		
		removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		GameManager.instance.removePlayer(this);
	}
}