package 
{
	import flash.events.Event;
	
	public class KillEvent extends Event
	{
		var xp:int=new int;
		public function KillEvent(type:String,X:int)
		{
			xp=X;
			super(type);
		}
	}
}