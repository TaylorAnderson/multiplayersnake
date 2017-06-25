package;
import flash.display.Sprite;
import flash.geom.Point;

/**
 * ...
 * @author Taylor Anderson
 */
class SpawnPoint extends Sprite
{
	public var player:PlayerProfile;
	public var startDir:Point;
	
	var level:Level;
	public function new(level:Level) 
	{
		super();
		this.level = level;
	}
	
	public function setPlayer(player:PlayerProfile)
	{
		this.player = player;
	}
	
	/**
	 * Set the position of the spawn. The level is split into a 3x3 grid of tiles, a spawn point can be in the center of any of those tiles.
	 * Both sliceX and sliceY are zero-indexed.
	 * @param	tileX The x position of the slice the spawn should occupy
	 * @param	tileY The y position of the slice the spawn should occupy
	 */
	public function setPositionFromGrid(tileX:Int, tileY:Int)
	{	
		var tileWidth = (C.LEVEL_WIDTH * C.GRIDSIZE) / 3;
		var tileHeight = (C.LEVEL_HEIGHT * C.GRIDSIZE) / 3;
		
		var originX = tileX * tileWidth;
		var originY = tileY * tileHeight;
		
		this.x = level.x + originX + tileWidth / 2;
		this.y = level.y + originY + tileHeight / 2;
		
		startDir = new Point(0, 0);
		if (tileX == 0) startDir.x = 1;
		if (tileX == 2) startDir.x = -1;
	}
	
	public function spawnPlayer()
	{
		if (this.player == null)
		{
			throw "You need to specify the player to spawn.";
		}
		var head:SnakeHead = new SnakeHead(player);
		head.x = this.x;
		head.y = this.y;
		head.setDirection(startDir, true);
		parent.addChild(head);
	}
}