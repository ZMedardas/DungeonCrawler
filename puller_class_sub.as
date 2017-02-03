package
{
	import flash.display.MovieClip;
	
	
	public class puller_class_sub extends MovieClip
	{
		var side:int=0;
		var i:int=0;
		
		public function puller_class_sub(s:int,isa:int):void
		{
			side=s;
			i=isa;
			if(side==0)this.x=5-i*50
			else if(side==1)this.x=5-i*50
			else if(side==2)this.x=5-50*i
			else if(side==3)this.x=5-50*i
		}
		public function actions():void
		{
			
		}
	}
}