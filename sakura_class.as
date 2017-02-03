package  {
	
	import flash.display.MovieClip;
	
	
	public class sakura_class extends MovieClip
	{
		var dmg:int=0;
		
		public function sakura_class(d:int)
		{
			dmg=d;
			this.x=345;
			this.y=205;
			hit();
		}
		public function hit()
		{
			for(var X:int=doc.enemies_cur.length-1;X>=0;X--)
			{
				if(this.hitTestObject(doc.enemies_cur[X]))
				{	
					doc.enemies_cur[X].damage_recieve(dmg,true,0);
				}
			}
		}
		public function actions()
		{
			this.alpha-=0.05;
			if(this.alpha<=0)del()
		}
		public function del()
		{
			doc.particles.splice(doc.particles.indexOf(this,0),1);
			parent.removeChild(this);
		}
	}
}