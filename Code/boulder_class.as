package 
{
	import flash.display.MovieClip;
	
	
	public class boulder_class extends MovieClip
	{
		var side:int=new int;
		var speedX:int=0;
		var speedY:int=0;
		var len:int=new int;
		var dmg:int=new int;
		var h:int=1;
		var hi:Array=new Array();
		
		public function boulder_class(s:int,l:int,d:int):void
		{
			this.x=345;
			this.y=205;
			side=s;
			if(side==0)speedY=-10
			else if(side==1)speedX=10;
			else if(side==2)speedY=10;
			else speedX=-10;
			dmg=d;
			len=l*5+1;
			if(len>50)len=50;
			movement();
		}
		public function actions():void
		{
			movement();
			hit();
			if(len<=0)del()
		}
		public function hit():void
		{
			for(var X:int=doc.enemies_cur.length-1;X>=0;X--)
			{
				if(doc.enemies_cur[X]!=hi[0]&&doc.enemies_cur[X]!=hi[1]&&this.hitTestObject(doc.enemies_cur[X]))
				{
					doc.enemies_cur[X].damage_recieve(Math.round(dmg/h),true,0);
					hi.push(doc.enemies_cur[X]);
					if(h==4){del();return;}
					else h*=2;
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