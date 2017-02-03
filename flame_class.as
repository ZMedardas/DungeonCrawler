package  {
	
	import flash.display.MovieClip;
	
	
	public class flame_class extends MovieClip
	{
		var len:int=0;
		var speedX=0;
		var speedY=0;
		
		public function flame_class()
		{
			this.x=345;
			this.y=205;
			if(doc.player_side==0){speedX=Math.random()*4-2;speedY=-25;}
			else if(doc.player_side==1){speedX=25;speedY=Math.random()*4-2;}
			else if(doc.player_side==2){speedX=Math.random()*4-2;speedY=25;}
			else if(doc.player_side==3){speedX=-25;speedY=Math.random()*4-2;}
		}
	}
}
