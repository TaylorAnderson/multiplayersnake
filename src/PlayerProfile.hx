package;
import control_schemes.ControlScheme;

/**
 * ...
 * @author Taylor Anderson
 */

class PlayerProfile
{
	public var color:Int = 0;
	public var name:String;
	public var controlScheme:ControlScheme;
	public function new(controlScheme:ControlScheme, color:Int=0, name:String = "") 
	{
		this.color = color;
		this.name = name;
		this.controlScheme = controlScheme;
	}
	
}