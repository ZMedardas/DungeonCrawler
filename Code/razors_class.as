package
{
	import flash.display.MovieClip;
	
	public class razors_class extends MovieClip
	{
		var ulti:Boolean=false;
		var side:int=new int;
		var dmg:int=new int;
		var stun:int=new int;
		
		public function razors_class(s:int,u:Boolean,d:int,st:int)
		{
			dmg=d;
			stun=st;
			side=s;
			if(u)
			{
				var iz:int=Math.floor(Math.random()*60+64);
				ulti=u;
				this.rotation=Math.round(Math.random()*360);
				trace(this.rotation);
				if(this.rotation>=90)
				{
					this.x=345+(Math.sqrt(Math.pow(iz,2)-Math.pow(iz*Math.sin((this.rotation-90)*Math.PI/180),2)));
					this.y=205+iz*(Math.sin((this.rotation-90)*Math.PI/180));
				}
				else if(this.rotation>=0)
				{
					this.x=345+iz*(Math.sin(this.rotation*Math.PI/180));
					this.y=205-(Math.sqrt(Math.pow(iz,2)-Math.pow(iz*Math.sin(this.rotation*Math.PI/180),2)));
				}
				else if(this.rotation>=(-90))
				{
					this.x=345-(Math.sqrt(Math.pow(iz,2)-Math.pow(iz*Math.sin((this.rotation+90)*Math.PI/180),2)));
					this.y=205-iz*(Math.sin((this.rotation+90)*Math.PI/180));
				}
				else
				{
					this.x=345-(Math.sqrt(Math.pow(iz,2)-Math.pow(iz*Math.sin((this.rotation-90)*Math.PI/180),2)));
					this.y=205+iz*(Math.sin((this.rotation-90)*Math.PI/180));
				}
			}
			else
			{
				if(side==0){this.x=324+42*Math.random();this.y=119+22*Math.random()}
				else if(side==1){this.rotation=90;this.x=409+22*Math.random();this.y=184+42*Math.random()}
				else if(side==2){this.x=324+42*Math.random();this.y=269+22*Math.random()}
				else if(side==3){this.rotation=270;this.x=259+22*Math.random();this.y=184+42*Math.random()}
			}
			hit();
		}
		public function hit()
		{
			for(var X:int=doc.enemies_cur.length-1;X>=0;X--)
			{
				if(this.hitTestObject(doc.enemies_cur[X]))
				{
					doc.enemies_cur[X].damage_recieve(dmg,false,stun);
				}
			}
		}
		public function actions()
		{
			this.alpha-=0.25;
			if(this.alpha<=0)del()
		}
		public function del()
		{
			doc.particles.splice(doc.particles.indexOf(this,0),1);
			parent.removeChild(this);
		}
	}
}