﻿package  {
	
	import flash.display.MovieClip;
	
	
	public class heavy_strike_class extends MovieClip
	{
		var side:int=0;
		var dmg:int=0;
		
		public function heavy_strike_class(s:int,d:int):void
		{
			side=s;
			this.x=345;
			this.y=205;
			if(side==0){this.rotation=270;this.y=155;}
			else if(side==1)this.x=395;
			else if(side==2){this.rotation=90;this.y=255;}
			else if(side==3){this.rotation=180;this.x=295;}
			dmg=d;
			hit();
		}
		public function hit():void
		{
			for(var X:int=doc.enemies_cur.length-1;X>=0;X--)
			{
				if(this.hitTestObject(doc.enemies_cur[X]))
				{	
					doc.enemies_cur[X].damage_recieve(dmg,true,0);
					return;
				}
			}
		}
		public function actions():void
		{
			this.alpha-=0.05;
			if(this.alpha<=0)del();
		}
		public function del():void
		{
			doc.particles.splice(doc.particles.indexOf(this,0),1);
			parent.removeChild(this);
		}
	}
}