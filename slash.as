package  {
	
	import flash.display.MovieClip;
	
	public class slash extends MovieClip {
		var damage:int=new int;
		
		public function slash(s:int,dmg:int):void
		{
			if(s==0){this.rotation=-90;this.x=345;this.y=155;}
			else if(s==1){this.x=395;this.y=205;}
			else if(s==2){this.rotation=90;this.x=345;this.y=255;}
			else if(s==3){this.rotation=180;this.x=295;this.y=205;}
			damage=dmg;
			hit();
		}
		public function hit():void
		{
			for(var X:int=doc.enemies_cur.length-1;X>=0;X--)
			{
				if(this.hitTestObject(doc.enemies_cur[X]))
				{
					doc.enemies_cur[X].damage_recieve(damage,true,0);
					break;
				}
			}
		}
		public function actions():void
		{
			this.alpha-=0.1;
			if(this.alpha<=0)del();
		}
		public function del():void
		{
			doc.particles.splice(doc.particles.indexOf(this,0),1);
			parent.removeChild(this);
		}
	}
}
