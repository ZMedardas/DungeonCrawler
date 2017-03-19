package
{
	import flash.display.MovieClip;
	
	
	public class crusher_class extends MovieClip
	{
		var side:int=0;
		var dmg:int=0;
		var stun:int=0;
		
		public function crusher_class(s:int,d:int,st:int):void
		{
			side=s;
			this.x=345;
			this.y=205;
			if(side==0){this.rotation=-90;this.y=140;}
			else if(side==1)this.x=410;
			else if(side==2){this.rotation=90;this.y=270;}
			else if(side==3){this.rotation=180;this.x=280;}
			dmg=d;
			stun=st;
			hit();
		}
		public function hit():void
		{
			for(var X:int=doc.enemies_cur.length-1;X>=0;X--)
			{
				if(this.hitTestObject(doc.enemies_cur[X]))
				{	
					doc.enemies_cur[X].damage_recieve(dmg,true,stun);
				}
			}
		}
		public function actions():void
		{
			this.alpha-=0.02;
			if(this.alpha<=0)del();
		}
		public function del():void
		{
			doc.particles.splice(doc.particles.indexOf(this,0),1);
			parent.removeChild(this);
		}
	}
}