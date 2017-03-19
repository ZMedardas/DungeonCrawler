package 
{
	import flash.events.Event;
	
	public class AttackEvent extends Event
	{
		var damage:int=new int;
		var physical:Boolean=new Boolean;
		public function AttackEvent(type:String,d:int,p:Boolean)
		{
			damage=d;
			physical=p;
			super(type);
		}
	}
}