package  {
	
	import flash.display.MovieClip;
	
	
	public class stone_shield_class extends MovieClip
	{
		var dmg:int=new int;
		var len:int=150;
		
		public function stone_shield_class(d:int):void
		{
			dmg=d;
			this.x=345;
			this.y=205;
		}
		public function actions():void
		{
			this.rotation+=5;
			this.x=345;
			this.y=205;
			hit();
			if(len>0)len--
			else del()
		}
		public function hit():void
		{
			for(var X:int=doc.enemies_cur.length-1;X>=0;X--)
			{
				if(this.hitTestObject(doc.enemies_cur[X]))
				{
					doc.enemies_cur[X].damage_recieve(Math.ceil(dmg/150),true,0);
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