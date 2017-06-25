package;

/**
 * ...
 * @author Taylor Anderson
 */
class GameManager
{
	public static var PLAYERS:Array<SnakeHead> = [];
	public static var LEVEL:Level;
	public static var FOOD:Food;
	public static var instance(default, null):GameManager = new GameManager();
	
	public var onEndGame:Void->Void;
	private function new() 
	{
		
	}
	public function removePlayer(p:SnakeHead)
	{
		PLAYERS.remove(p);
		if (PLAYERS.length == 0)
		{
			if (onEndGame != null) onEndGame();
		}
	}
	
}