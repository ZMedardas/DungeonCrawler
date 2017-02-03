package  {
	
	import flash.display.MovieClip;
	
	
	public class bullet extends MovieClip {
		var speedX:int=Math.random()*4-2;
		var speedY:int=Math.random()*4-2;
		var posX:int=0;
		var posY:int=0;
		var len:int=0;
		var bounce:Boolean=false;
		var pen:int=0;
		var damage:int=new int;
		var hit_en:Array=new Array;
		
		public function bullet(side:int,b:Boolean,p:Boolean,l:int,dmg:int,pox:int,poy:int):void
		{
			this.x=345;
			this.y=205;
			posX=pox;
			posY=poy;
			damage=dmg;
			if(side==0)speedY=-25;
			else if(side==1)speedX=25;
			else if(side==2)speedY=25;
			else if(side==3)speedX=-25;
			else if(side==4)
			{
				speedX=Math.round(25-Math.random()*50);
				if(Math.random()>0.5)speedY=Math.sqrt(625-Math.pow(speedX,2))
				else speedY=Math.round(Math.sqrt(625-Math.pow(speedX,2)))*-1;
			}
			len=l*2;
			if(len>15)len=15;
			bounce=b;
			if(p)pen=3;
			this.x+=speedX;
			posX+=speedX;
			this.y+=speedY;
			posY+=speedY;
		}
		public function actions():void
		{
			if(len<=0)del()
			else if(movement())hit();
		}
		public function movement():Boolean
		{
			this.x+=speedX;
			posX+=speedX;
			this.y+=speedY;
			posY+=speedY;
			var bl:int=doc.level[Math.floor(posX/50)][Math.floor(posY/50)];
			if(bl!=5&&bl!=6)
			{
				del();
				return(false);
			}
			len--;
			return(true);
		}
		public function hit():void
		{
			for(var X:int=doc.enemies_cur.length-1;X>=0;X--)
			{
				if(this.hitTestObject(doc.enemies_cur[X])&&hit_en[0]!=doc.enemies_cur[X]&&hit_en[1]!=doc.enemies_cur[X])
				{	
					hit_en.push(doc.enemies_cur[X]);
					pen--;
					doc.enemies_cur[X].damage_recieve(damage,true,0);
					if(pen<=0)del();
					else if(bounce)
					{
						speedX=Math.round(25-Math.random()*50);
						if(Math.random()>0.5)speedY=Math.sqrt(625-Math.pow(speedX,2))
						else speedY=Math.round(Math.sqrt(625-Math.pow(speedX,2)))*-1;
					}
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
