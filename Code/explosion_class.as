package  {
	
	import flash.display.MovieClip;
	
	public class explosion_class extends MovieClip
	{
		var dmg:int=new int;
		
		public function explosion_class(X:int,Y:int,d:int):void
		{
			this.x=X;
			this.y=Y;
			dmg=d;
			hit();
		}
		public function hit():void
		{
			for(var X:int=doc.enemies_cur.length-1;X>=0;X--)
			{
				if(Math.pow(this.x-doc.enemies_cur[X].x,2)+Math.pow(this.y-doc.enemies_cur[X].y,2)<=15625)
				{
					doc.enemies_cur[X].damage_recieve(dmg,false,0);
				}
			}
		}
		public function actions()
		{
			this.alpha-=0.05;
			if(this.alpha<=0)del();
		}
		public function del()
		{
			doc.particles.splice(doc.particles.indexOf(this,0),1);
			parent.removeChild(this);
		}
	}
}
