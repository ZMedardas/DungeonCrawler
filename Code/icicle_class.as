package
{
	import flash.display.MovieClip;
	
	public class icicle_class extends MovieClip
	{
		var speedX:int=new int;
		var speedY:int=new int;
		var len:int=new int;
		var side:int=new int;
		var dmg:int=new int;
		var stun:int=new int;
		
		public function icicle_class(s:int,l:int,d:int,st:int):void
		{
			stun=st;
			len=l*5+1;
			if(len>50)len=50;
			side=s;
			dmg=d;
			if(side==0){this.rotation=270;speedX=0;speedY=-10;}
			else if(side==1){speedX=10;speedY=0;}
			else if(side==2){this.rotation=90;speedX=0;speedY=10;}
			else if(side==3){this.rotation=180;speedX=-10;speedY=0;}
			this.x=345;this.y=205;
			movement();
		}
		public function actions():void
		{
			movement();
			if(len<=0)del()
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
					doc.enemies_cur[X].damage_recieve(dmg,false,stun);
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