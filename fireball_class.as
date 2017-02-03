package  {
	
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.display.Bitmap;
	
	
	public class fireball_class extends MovieClip
	{
		var speedX:int=0;
		var speedY:int=0;
		var ultimate:Boolean=false;
		var len:int=0;
		var dmg:int=new int;
		var gra:Bitmap=new Bitmap(new fire_class_gra2);
		var gra_ch:int=new int;
		
		public function fireball_class(side:int,u:Boolean,l:int,d:int):void
		{		
			addChild(gra);
			gra.x-=40;
			gra.y-=24;
			this.x=345;
			this.y=205;
			if(side==0){speedY=-10;this.rotation=270;}
			else if(side==1)speedX=10
			else if(side==2){speedY=10;this.rotation=90;}
			else if(side==3){speedX=-10;this.rotation=180;}
			ultimate=u;
			len=l*5+1;
			dmg=d;
			if(l>50)l=51;
			movement();
		}
		public function actions():void
		{
			gra_ch++;
			if(gra_ch==5)gra.bitmapData=new fire_class_gra
			else if(gra_ch==10){gra_ch=0;gra.bitmapData=new fire_class_gra2;}
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
					doc.enemies_cur[X].damage_recieve(dmg,false,0);
					del();
					return;
				}
			}
		}
		public function del():void
		{
			if(ultimate)
			{
				doc.particles.push(new explosion_class(this.x,this.y,dmg));
				parent.addChild(doc.particles[doc.particles.length-1]);
			}
			doc.particles.splice(doc.particles.indexOf(this,0),1);
			parent.removeChild(this);
		}
	}
}
