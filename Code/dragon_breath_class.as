package  {
	
	import flash.display.MovieClip;
	
	
	public class dragon_breath_class extends MovieClip
	{
		var len:int=0;
		var speedX:int=0;
		var speedY:int=0;
		var dmg:int=new int;
		
		public function dragon_breath_class(l:int,d:int)
		{
			this.x=345;
			this.y=205;
			this.alpha=0.8;
			if(doc.player_side==0){speedX=Math.random()*4-2;speedY=-10;}
			else if(doc.player_side==1){speedX=10;speedY=Math.random()*4-2;}
			else if(doc.player_side==2){speedX=Math.random()*4-2;speedY=10;}
			else if(doc.player_side==3){speedX=-10;speedY=Math.random()*4-2;}
			len=l*5;
			dmg=d;
			if(len>15)len=15;
			movement();
		}
		public function actions()
		{
			movement();
			hit();
			if(len<1)del();
		}
		public function hit()
		{
			for(var X:int=doc.enemies_cur.length-1;X>=0;X--)
			{
				if(this.hitTestObject(doc.enemies_cur[X]))
				{
					doc.enemies_cur[X].damage_recieve(dmg,false,0);
					break;
				}
			}
		}
		public function movement()
		{
			this.x+=speedX;
			this.y+=speedY;
			len--;
		}
		public function del()
		{
			doc.particles.splice(doc.particles.indexOf(this,0),1);
			parent.removeChild(this);
		}
	}
}
