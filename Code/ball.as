package  {
	
	import flash.display.MovieClip;
	
	
	public class ball extends MovieClip {
		var speedX:int=0;
		var speedY:int=0;
		var len:int=0;
		var damage:int=new int;
		
		public function ball(side:int,l:int,dmg:int):void
		{
			this.x=345;
			this.y=205;
			damage=dmg;
			if(side==0)speedY=-10;
			else if(side==1)speedX=10;
			else if(side==2)speedY=10;
			else if(side==3)speedX=-10;
			len=l*5;
			trace(len);
			if(l>10)len=30;
			movement();
		}
		public function actions():void
		{
			movement();
			if(len<=0)del();
			else hit();
		}
		public function movement():void
		{
			this.x+=speedX;
			this.y+=speedY;
			len--;
		}
		public function hit():void
		{
			for(var X:int=doc.enemies_cur.length-1;X>=0;X--)
			{
				if(this.hitTestObject(doc.enemies_cur[X]))
				{
					doc.enemies_cur[X].damage_recieve(damage,false,0);
					del();
					return;
				}
			}
		}
		public function del():void
		{
			doc.particles.splice(doc.particles.indexOf(this,0),1);
			parent.removeChild(this);
		}
	}
}
