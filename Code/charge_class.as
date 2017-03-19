package  {
	
	import flash.display.MovieClip;
	
	
	public class charge_class extends MovieClip
	{
		var side:int=0;
		var dmg:int=0;
		var X:int=345;
		var Y:int=205;
		var hi:Boolean=false;
		
		public function charge_class(s:int,d:int)
		{
			side=s;
			dmg=d;
			if(side==0){this.rotation=-90;Y=140;}
			else if(side==1)X=410;
			else if(side==2){this.rotation=90;Y=270;}
			else if(side==3){this.rotation=180;X=280;}
			this.x=X;
			this.y=Y;
		}
		public function actions()
		{
			this.x=X;
			this.y=Y;
			this.alpha-=0.05;
			if(this.alpha<=0)del()
			if(hi==false){hi=true;hit()}
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
		public function del()
		{
			parent.removeChild(this);
			doc.particles.splice(doc.particles.indexOf(this,0),1);
		}
	}
}