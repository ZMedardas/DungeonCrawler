package 
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	
	public class puller_class extends MovieClip
	{
		var side:int=0;
		var dmg:int=0;
		var stun:int=0;
		var pul:int=10;
		var len:int=0;
		var par:Array=new Array;
		var cou:Object=new Object;
		
		public function puller_class(s:int,l:int,d:int,st:int):void
		{
			var i:int=1;
			side=s;
			dmg=d;
			stun=st;
			len=l-1;
			if(len>5)len=5;
			this.x=345;
			this.y=205;
			if(side==0){this.rotation=-90;this.y=210;}
			else if(side==1)this.x=340
			else if(side==2){this.rotation=90;this.y=200;}
			else if(side==3){this.rotation=180;this.x=350;}
			while(i<5)
			{
				var pos:Point=new Point(doc.player_pos.x,doc.player_pos.y);
				if(side==0&&(doc.level[pos.x][pos.y-i]==5||doc.level[pos.x][pos.y-i]==6)){this.y-=50;i++;}
				else if(side==1&&(doc.level[pos.x+i][pos.y]==5||doc.level[pos.x+i][pos.y]==6)){this.x+=50;i++;}
				else if(side==2&&(doc.level[pos.x][pos.y+i]==5||doc.level[pos.x][pos.y+i]==6)){this.y+=50;i++;}
				else if(side==3&&(doc.level[pos.x-i][pos.y]==5||doc.level[pos.x-i][pos.y]==6)){this.x-=50;i++;}
				else break;
				for(var X:int=doc.enemies_cur.length-1;X>=0;X--)
				{
					if(this.hitTestObject(doc.enemies_cur[X]))
					{
						cou=doc.enemies_cur[X];
						doc.enemies[cou.posX][cou.posY]=0
						if(side==0)
						{
							cou.posX=pos.x;
							cou.posY=pos.y-1;
							doc.enemies[pos.x][pos.y-1]=cou.ar;
						}
						else if(side==1)
						{
							cou.posX=pos.x+1;
							cou.posY=pos.y;
							doc.enemies[pos.x+1][pos.y]=cou.ar;
						}
						else if(side==2)
						{
							cou.posX=pos.x;
							cou.posY=pos.y+1;
							doc.enemies[pos.x][pos.y+1]=cou.ar;
						}
						else if(side==3)
						{
							cou.posX=pos.x-1;
							cou.posY=pos.y;
							doc.enemies[pos.x-1][pos.y]=cou.ar;
						}
						for(var Y:int=i-2;Y>0;Y--)
						{
							par.push(new puller_class_sub(side,Y));
							addChild(par[par.length-1]);
						}
					 	return;
					}
				}
			}
			for(var Y:int=i-2;Y>0;Y--)
			{
				par.push(new puller_class_sub(side,Y));
				addChild(par[par.length-1]);
			}
		}
		public function actions()
		{
			if(pul>0)pul--
			else if(par.length>0)
			{
				removeChild(par[0]);
				par.splice(0,1);
				if(side==0){this.y+=50;cou.y+=50;}
				else if(side==1){this.x-=50;cou.x-=50;}
				else if(side==2){this.y-=50;cou.y-=50;}
				else if(side==3){this.x+=50;cou.x+=50;}
			}
			else
			{
				if(side==0){cou.x=345;cou.y=155;}
				else if(side==1){cou.x=395;cou.y=205;}
				else if(side==2){cou.x=345;cou.y=255;}
				else if(side==3){cou.x=295;cou.y=205;}
				cou.path=new Vector.<int>;
				cou.timer=0;
				doc.particles.splice(doc.particles.indexOf(this,0),1);
				trace(cou);
				if(doc.enemies_cur.indexOf(cou,0)!=-1)cou.damage_recieve(dmg,true,stun);
				parent.removeChild(this);
			}
		}
	}
}