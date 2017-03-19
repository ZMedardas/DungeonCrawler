package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.display.Sprite;
	
	public class zombie extends MovieClip
	{
		var hp:int=new int;
		var hp_total:int=new int;
		var att:int=new int;
		var def:int=new int;
		var mag_def:int=new int;
		var att_delay=30;
		var ar:int=2;
		var posX:int=0;
		var posY:int=0;
		var path:Vector.<int>=new Vector.<int>;
		var s:int=1;
		var wait_time:int=0;
		var timer:int=new int;
		var timer_cos:int=25;
		var speed=2;
		var stuned:int=new int;
		var hp_bar:Bitmap=new Bitmap(new hp_inf_bar);
		var sprite:Bitmap=new Bitmap(new BitmapData(50,50,true,0x00000000));
		var sprite_h:Sprite=new Sprite;
		var sp_rect:Rectangle=new Rectangle(0,0,50,50);
		var sp_p:Point=new Point(0,0);
		var time:int=0;
		var at_time:int=0;
		var frame:int=0;
		
		public function zombie(X:int,Y:int,level_num:int):void
		{
			posX=X;
			posY=Y;
			hp_total=hp=20*level_num;
			addChild(sprite_h);
			sprite_h.addChild(sprite);
			addChild(hp_bar);
			hp_bar.width=40;
			hp_bar.height=5;
			hp_bar.x=-20;
			hp_bar.y=-20;
			att=3*level_num;
			def=-1+3*level_num;
			mag_def=-2+3*level_num;
			sprite.x-=25;
			sprite.y-=25;
			sprite.bitmapData.copyPixels(new zombie_sp,sp_rect,sp_p,null,null,true);
		}
		public function path_rec(p:Vector.<int>):void
		{
			path=p;
			path.shift();
		}
		public function actions():void
		{
			if(stuned<=0)
			{
				if(timer==0)
				{
					if(path.length!=0)
					{
						dir();
					}
					else
					{
						if(att_delay>30)
						{
							att_delay=0;
							attack();
						}
						if(at_time==0)
						{
							sp_rect.x=0;
							sprite.bitmapData=new BitmapData(50,50,true,0x00000000);
							sprite.bitmapData.copyPixels(new zombie_sp,sp_rect,sp_p,null,null,true);
							at_time--;
						}
						else if(at_time>0)at_time--;
						if(wait_time>30)
						{
							var even:PathEvent=new PathEvent("OBSTACLE");
							dispatchEvent(even);
							wait_time=0;
						}
						else wait_time++;
					}
					att_delay++;
				}
				else movement();
			}
			else stuned-=1;
		}
		public function dir():void
		{
			s=path[path.length-1];
			if(s==0)
			{
				if(doc.player_pos.x!=posX||doc.player_pos.y!=posY-1)
				{
					var a:int=doc.enemies[posX][posY-1];
					sprite_h.rotation=0;
					if(a!=0)
					{
						if(a==1)
						{
							wait_time++;
							if(wait_time>30)
							{
								var even:PathEvent=new PathEvent("OBSTACLE");
								dispatchEvent(even);
							}
							else return;
						}
						else
						{
							var even:PathEvent=new PathEvent("OBSTACLE");
							dispatchEvent(even);
						}
					}
					else
					{
						wait_time=0;
						doc.enemies[posX][posY]=0;
						path.pop();
						posY--;
						timer=timer_cos;
						doc.enemies[posX][posY]=1;
					}
				}
				else
				{
					var even:PathEvent=new PathEvent("OBSTACLE");
					dispatchEvent(even);
				}
			}
			else if(s==1)
			{
				if(doc.player_pos.y!=posY||doc.player_pos.x!=posX+1)
				{
					var a:int=doc.enemies[posX+1][posY];
					sprite_h.rotation=90;
					if(a!=0)
					{
						if(a==1)
						{
							wait_time++;
							if(wait_time>30)
							{
								var even:PathEvent=new PathEvent("OBSTACLE");
								dispatchEvent(even);
							}
							else return;
						}
						else
						{
							var even:PathEvent=new PathEvent("OBSTACLE");
							dispatchEvent(even);
						}
					}
					else
					{
						wait_time=0;
						doc.enemies[posX][posY]=0;
						path.pop();
						posX++;
						timer=timer_cos;
						doc.enemies[posX][posY]=1;
					}
				}
				else
				{
					var even:PathEvent=new PathEvent("OBSTACLE");
					dispatchEvent(even);
				}
			}
			else if(s==2)
			{
				if(doc.player_pos.x!=posX||doc.player_pos.y!=posY+1)
				{
					var a:int=doc.enemies[posX][posY+1];
					sprite_h.rotation=180;
					if(a!=0)
					{
						if(a==1)
						{
							wait_time++;
							if(wait_time>30)
							{
								var even:PathEvent=new PathEvent("OBSTACLE");
								dispatchEvent(even);
							}
							else return;
						}
						else
						{
							var even:PathEvent=new PathEvent("OBSTACLE");
							dispatchEvent(even);
						}
					}
					else
					{
						wait_time=0;
						doc.enemies[posX][posY]=0;
						path.pop();
						posY++;
						timer=timer_cos;
						doc.enemies[posX][posY]=1;
					}
				}
				else
				{
					var even:PathEvent=new PathEvent("OBSTACLE");
					dispatchEvent(even);
				}
			}
			else if(s==3)
			{
				if(doc.player_pos.y!=posY||doc.player_pos.x!=posX-1)
				{
					var a:int=doc.enemies[posX-1][posY];
					sprite_h.rotation=270;
					if(a!=0)
					{
						if(a==1)
						{
							wait_time++;
							if(wait_time>30)
							{
								var even:PathEvent=new PathEvent("OBSTACLE");
								dispatchEvent(even);
							}
							else return;
						}
						else
						{
							var even:PathEvent=new PathEvent("OBSTACLE");
							dispatchEvent(even);
						}
					}
					else
					{
						wait_time=0;
						doc.enemies[posX][posY]=0;
						path.pop();
						posX--;
						timer=timer_cos;
						doc.enemies[posX][posY]=1;
					}
				}
				else
				{
					var even:PathEvent=new PathEvent("OBSTACLE");
					dispatchEvent(even);
				}
			}
			if(path.length==0)
			{
				doc.enemies[posX][posY]=ar;
				time=0;
				frame=0;
				sp_rect.x=0;
				sprite.bitmapData=new BitmapData(50,50,true,0x00000000);
				sprite.bitmapData.copyPixels(new zombie_sp,sp_rect,sp_p,null,null,true);
			}
		}
		public function movement():void
		{
			if(s==0)this.y-=speed;
			else if(s==1)this.x+=speed;
			else if(s==2)this.y+=speed;
			else if(s==3)this.x-=speed;
			timer--;
			time++;
			if(time>10)
			{
				time=0
				frame++;
				if(frame>3)frame=0;
				sp_rect.x=frame*50;
				sprite.bitmapData=new BitmapData(50,50,true,0x00000000);
				sprite.bitmapData.copyPixels(new zombie_sp,sp_rect,sp_p,null,null,true);
			}
		}
		public function attack()
		{
			if(Math.abs(this.x-345)+Math.abs(this.y-205)<51)
			{
				sp_rect.x=200;
				sprite.bitmapData=new BitmapData(50,50,true,0x00000000);
				sprite.bitmapData.copyPixels(new zombie_sp,sp_rect,sp_p,null,null,true);
				at_time=5;
				if(this.y<200)sprite_h.rotation=180;
				else if(this.x>350)sprite_h.rotation=270;
				else if(this.y>210)sprite_h.rotation=0;
				else if(this.x<340)sprite_h.rotation=90;
				var even:AttackEvent=new AttackEvent("DAMAGE_RECIEVE",att,true);
				dispatchEvent(even);
			}
		}
		public function damage_recieve(dmg:int,physical:Boolean,st:int):void
		{
			var old_hp:int=new int;
			old_hp=hp;
			if(physical)hp-=dmg-def;
			else hp-=dmg-mag_def;
			if(old_hp<hp)hp=old_hp;
			if(hp<1)del()
			else hp_bar.width=40*(hp/hp_total);
			stuned+=st;
		}
		public function del():void
		{
			var even:KillEvent=new KillEvent("ENEMY_DEAD",Math.floor((hp_total+att+def+mag_def)/10));
			dispatchEvent(even);
			removeChild(hp_bar);
			doc.enemies[posX][posY]=0;
			doc.enemies_cur.splice(doc.enemies_cur.indexOf(this,0),1);
			parent.removeChild(this);
		}
	}
}