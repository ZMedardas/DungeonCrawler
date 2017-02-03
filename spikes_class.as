package 
{
	
	import flash.display.MovieClip;
	
	
	public class spikes_class extends MovieClip
	{
		var side:int=new int;
		var dmg:int=new int;
		var stun:int=new int
		
		public function spikes_class(s:int,d:int,st:int,px:int,py:int)
		{
			side=s;
			this.x=px;
			this.y=py;
			if(side==0)this.y=155;
			else if(side==1)this.x=395;
			else if(side==2)this.y=255;
			else if(side==3)this.x=295;
			dmg=d;
			stun=st;
			hit();
		}
		public function actions()
		{
			if(stun>=0)stun--
			else this.alpha-=0.05;
			if(this.alpha<=0)del();
		}
		public function hit()
		{
			for(var X:int=doc.enemies_cur.length-1;X>=0;X--)
			{
				if(this.hitTestObject(doc.enemies_cur[X]))
				{
					doc.enemies_cur[X].damage_recieve(dmg,true,stun);
				}
			}
		}
		public function del()
		{
			doc.particles.splice(doc.particles.indexOf(this,0),1);
			parent.removeChild(this);
		}
	}
}