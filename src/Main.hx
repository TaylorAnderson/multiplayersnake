package;

import control_schemes.ArrowScheme;
import control_schemes.WASDScheme;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.text.TextFieldAutoSize;
import openfl.ui.Keyboard;

/**
 * ...
 * @author Taylor Anderson
 */
class Main extends Sprite 
{
	var level:Level = new Level();
	
	var tlSpawn:SpawnPoint;
	var brSpawn:SpawnPoint;
	
	var gameOver:TextField;
	var restartSpr:Sprite;
	public function new() 
	{
		super();
		GameManager.LEVEL = level;
		addChild(level);
		var generator = new FoodGenerator();
		addChild(generator);
		generator.generateFood();
		
		tlSpawn = new SpawnPoint(level);
		tlSpawn.setPositionFromGrid(0, 0);
		
		brSpawn = new SpawnPoint(level);
		brSpawn.setPositionFromGrid(2, 2);
		
		addChild(tlSpawn);
		addChild(brSpawn);
		
		tlSpawn.setPlayer(new PlayerProfile(new WASDScheme(), 0, "Zach"));
		brSpawn.setPlayer(new PlayerProfile(new ArrowScheme(), 0x00CC00, "Jeremy"));
		
		tlSpawn.spawnPlayer();
		brSpawn.spawnPlayer();
		GameManager.instance.onEndGame = endGame;
	}
	
	function endGame():Void
	{
		gameOver = new TextField();
		gameOver.text = "GAME OVER";
		gameOver.autoSize = TextFieldAutoSize.CENTER;
		var tf:TextFormat = gameOver.defaultTextFormat;
		tf.size = 64;
		gameOver.setTextFormat(tf);
		gameOver.x = stage.stageWidth / 2 - gameOver.width / 2;
		gameOver.y = stage.stageHeight / 2 - gameOver.height / 2 - 50;
		addChild(gameOver);
		
		var restart:TextField = new TextField();
		restart.text = "Restart";
		restart.autoSize = TextFieldAutoSize.CENTER;
		var tf:TextFormat = restart.defaultTextFormat;
		tf.size = 48;
		restart.setTextFormat(tf);
		restart.selectable = false;
		restart.x = stage.stageWidth / 2 - restart.width / 2;
		restart.y = stage.stageHeight / 2 - restart.height / 2 + gameOver.height + 50;
		
		restartSpr = new Sprite();
		restartSpr.addChild(restart);
		restartSpr.buttonMode = true;
		restartSpr.mouseChildren = false;
		restartSpr.addEventListener(MouseEvent.MOUSE_DOWN, onRestartDown);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		addChild(restartSpr);
	}
	function onKeyDown(e:KeyboardEvent)
	{
		if (e.keyCode == Keyboard.SPACE)
		{
			restart();
			removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
	}
	function onRestartDown(e)
	{
		restart();
	}
	function restart() {
		tlSpawn.spawnPlayer();
		brSpawn.spawnPlayer();
		
		removeChild(gameOver);
		removeChild(restartSpr);	
	}
	

}
