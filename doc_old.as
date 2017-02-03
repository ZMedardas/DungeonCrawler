package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.net.SharedObject;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	import flash.geom.Point;
	import flash.sampler.getSize;
	import flash.text.TextField;
	import flash.display.Sprite;
	
	public class doc extends MovieClip
	{
		//doc
		
		var save_game:SharedObject=SharedObject.getLocal("01000001011010000111001001101001");
		var level_num:int=1;
		
		//menu
		
		var stb:start_button=new start_button;
		var crb:credits_button=new credits_button;
		var heb:help_button=new help_button;
		var cob:continue_button=new continue_button;
		var meb:menu_button=new menu_button;
		var crback:credits_background=new credits_background;
		var heback:help_background=new help_background;
		
		//map creation
			
			//loading
			
			var lb_sheet:BitmapData=new lbs;
			var lb:Bitmap=new Bitmap;
			var lb_rect:Rectangle=new Rectangle(0,0,640,360);
			
			var loadingbar:Bitmap=new Bitmap();
			
			//sewers
		
			var sewer_start:Array=new Array(1,5,6,5,1,1,5,6,5,1,4,5,6,5,3,1,5,5,5,1,1,1,5,1,1);
			var sewer_start_rot90:Array=new Array(1,1,2,1,1,1,5,5,5,5,5,5,6,6,6,1,5,5,5,5,1,1,1,1,1);
			var sewer_start_rot180:Array=new Array(1,1,5,1,1,1,5,5,5,1,4,5,6,5,3,1,5,6,5,1,1,5,6,5,1);
			var sewer_start_rot270:Array=new Array(1,1,2,1,1,5,5,5,5,1,6,6,6,5,5,5,5,5,5,1,1,1,1,1,1);
			var sewer:Array=new Array(1,1,2,1,1,5,5,5,5,5,6,6,6,6,6,5,5,5,5,5,1,1,1,1,1);
			var sewer_rot90:Array=new Array(1,5,6,5,1,1,5,6,5,1,4,5,6,5,3,1,5,6,5,1,1,5,6,5,1);
			var sewer_ent:Array=new Array(1,2,5,2,1,5,5,5,5,5,6,6,6,6,6,5,5,5,5,5,1,1,5,1,1);
			var sewer_rot90_ent:Array=new Array(1,5,6,5,1,4,5,6,5,3,5,5,6,5,5,4,5,6,5,3,1,5,6,5,1);
			var sewer_int:Array=new Array(1,2,6,2,1,4,5,6,5,3,6,6,6,6,6,1,5,6,5,1,1,1,6,1,1);
			var sewer_turn_lu:Array=new Array(2,5,6,5,1,5,5,6,5,1,6,6,6,5,3,5,5,5,5,1,1,1,1,1,1);
			var sewer_turn_ld:Array=new Array(1,1,1,1,1,5,5,5,5,1,6,6,6,5,3,5,5,6,5,1,4,5,6,5,1);
			var sewer_turn_ru:Array=new Array(1,5,6,5,2,1,5,6,5,5,4,5,6,6,6,1,5,5,5,5,1,1,1,1,1);
			var sewer_turn_rd:Array=new Array(1,1,2,1,1,1,5,5,5,5,4,5,6,6,6,1,5,6,5,5,1,5,6,5,1);
		
			//rooms
		
			var start_point:Array=new Array(2,2,2,2,2,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1,1,1,1,1);
			var end_point:Array=new Array(2,2,2,2,2,5,5,5,5,5,5,5,6,5,5,5,5,5,5,5,1,1,1,1,1);
			var room1:Array=new Array(1,2,5,2,1,4,5,5,5,3,5,5,5,5,5,1,5,5,5,1,1,1,5,1,1);
			var room2:Array=new Array(1,2,5,2,1,4,5,5,5,3,5,5,1,5,5,1,5,5,5,1,1,1,5,1,1);
			var earth:Array=new Array(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
			var room_big:Array=new Array(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5);
			var room_big_col:Array=new Array(5,5,5,5,5,5,5,5,5,5,5,5,2,5,5,5,5,5,5,5,5,5,5,5,5);
			var room_big_col4:Array=new Array(4,5,5,5,3,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,4,5,5,5,3);
			var room_corridor:Array=new Array(1,1,2,1,1,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1,1,1,1,1);
			var room_corridor_rot90:Array=new Array(1,5,5,5,1,1,5,5,5,1,4,5,5,5,3,1,5,5,5,1,1,5,5,5,1);
			var room_corridor_ru:Array=new Array(1,5,5,5,1,1,5,5,5,5,4,5,5,5,5,1,5,5,5,5,1,1,1,1,1);
			var room_corridor_rd:Array=new Array(1,1,2,1,1,1,5,5,5,5,4,5,5,5,5,1,5,5,5,5,1,5,5,5,1);
			var room_corridor_lu:Array=new Array(1,5,5,5,1,5,5,5,5,1,5,5,5,5,3,5,5,5,5,1,1,1,1,1,1);
			var room_corridor_ld:Array=new Array(1,1,2,1,1,5,5,5,5,1,5,5,5,5,3,5,5,5,5,1,1,5,5,5,1);
			
			var sewers:Array=new Array("nothing",sewer_start,sewer_start_rot90,sewer_start_rot180,sewer_start_rot270,sewer,sewer_rot90,sewer_ent,sewer_rot90_ent,
									 sewer_int,sewer_turn_lu,sewer_turn_ld,sewer_turn_ru,sewer_turn_rd);
			var rooms:Array=new Array("nothing",start_point,end_point,earth,room1,room2,room_big,room_big_col,room_big_col4,room_corridor,room_corridor_rot90,room_corridor_ru,room_corridor_rd,room_corridor_lu,
								  room_corridor_ld);
								  
			//maps
			
			var level:Array=new Array();
			var chunks:Array=new Array();
			var sewer_chunks:Array=new Array();
			var access:Array=new Array();
			var treasure:Array=new Array();
			
			//variables
			
			var sewer_length:int=0;
			//var loadingbar:loadingbar1=new loadingbar1;
			var conti:Boolean=new Boolean;
			var aaa:int=0;
		
		//game
		
		var player_pos:Point=new Point(50,50);
		var blocks:Array=new Array();
		var stuff_sheet:BitmapData=new stu;
		
			//blocks
			
			 var bs_sheet:BitmapData=new BitmapData(1000,1000);
			 var bs_temp:BitmapData=new BitmapData(50,50);
			 var bs_rect:Rectangle=new Rectangle(0,0,50,50);
			 var treasure_sheet:BitmapData=new tre;
			 
			 //keys and movement
			 
			 var hor:int=0;
			 var lkd:Boolean=false;
			 var ukd:Boolean=false;
			 var rkd:Boolean=false;
			 var dkd:Boolean=false;
			 var lm:Boolean=false;
			 var um:Boolean=false;
			 var rm:Boolean=false;
			 var dm:Boolean=false;
			 
			 //blocks recreation
			 
			 var timer:int=new int;
			 var time_cons:int=10;
			 var speed:int=5;
			 
			 //UI
			 
			 var inv_open:Boolean=false;
			 var taskbar_source:BitmapData=new ts;
			 var taskbar:Bitmap=new Bitmap;
			 var inventory_holder:Sprite=new Sprite;
			 var inventory:Bitmap=new Bitmap;
			 var stats_button_holder:Sprite=new Sprite;
			 var stats_button:Bitmap=new Bitmap;
			 
			 // Inventory
			 
			 var inventory_window_holder:Sprite=new Sprite;
			 var inventory_window:Bitmap=new Bitmap;
			 var delete_item_button_holder:Sprite=new Sprite;
			 var grid_holder:Sprite=new Sprite;
			 var delete_item_button:Bitmap=new Bitmap;
			 var inventory_sort_button_holder:Sprite=new Sprite;
			 var inventory_sort_button:Bitmap=new Bitmap;
			 var inventory_grid:Bitmap=new Bitmap;
			 var inventory_tab:int=0;
			 var item_place:int=0;
			 var p1:int=new int;
			 var p2:int=new int;
			 var num:int=0;
			 var selected_item:int=0;
			 var inventory_contents:Array=new Array;
			 var equiped_items:Array=new Array;
			 var display_attack:TextField=new TextField;
			 var display_magicattack:TextField=new TextField;
			 var display_defense:TextField=new TextField;
			 var display_magicdefense:TextField=new TextField;
			 var display_bonus:TextField=new TextField;
			 var words:Vector.<String>=new <String>["","attack","magic attack","attack","magic defense","movement speed","health regen"];
			 
			 
		//cheet vars
		
		var through_walls:Boolean=false;
			
		//game
		
		public function doc()
		{
			preload();
			menu_main();
		}
		public function preload()
		{
			display_attack.mouseEnabled=display_magicattack.mouseEnabled=display_defense.mouseEnabled=false;
			taskbar.bitmapData=taskbar_source;
			inventory_window.bitmapData=new inv_win;
			inventory.bitmapData=new inv;
			inventory_sort_button.bitmapData=new inv_sort;
			stats_button.bitmapData=new sta;
			display_attack.border=display_magicattack.border=display_defense.border=display_magicdefense.border=display_bonus.border=true;
			display_attack.wordWrap=display_magicattack.wordWrap=display_defense.wordWrap=display_magicdefense.wordWrap=display_bonus.wordWrap=true;
			display_attack.width=display_magicattack.width=display_defense.width=display_magicdefense.width=50;
			display_attack.height=display_magicattack.height=display_defense.height=display_magicdefense.height=30;
			display_bonus.width=100;
			display_bonus.height=60;
			delete_item_button.bitmapData=new del_but;
			inventory_grid.bitmapData=new gri;
			for(var X:int=0;X<6;X++)
			{
				equiped_items[X]=100;
			}
		}
		
		//menu
		
		public function menu_main()
		{
			addChild(stb);
			addChild(cob);
			addChild(crb);
			addChild(heb);
			stb.x=140;
			cob.x=500;
			stb.y=cob.y=200;
			crb.y=heb.y=300;
			crb.x=200;
			heb.x=440;
			stb.addEventListener(MouseEvent.CLICK,start_game);
			crb.addEventListener(MouseEvent.CLICK,menu_credits);
			heb.addEventListener(MouseEvent.CLICK,menu_help);
			cob.addEventListener(MouseEvent.CLICK,continue_game);
		}
		public function start_game(e:MouseEvent)
		{	
			delete_menu();
			map_creation_main();
		}
		public function continue_game(e:MouseEvent)
		{
			if(save_game.data.level_number!=undefined)
			{
				delete_menu();
				level_num=save_game.data.level_number;
				create_level();
			}
		}
		public function menu_credits(e:MouseEvent)
		{
			addChild(crback);
			crback.x=320;
			crback.y=180;
			addChild(meb);
			meb.x=320;
			meb.y=300;
			meb.addEventListener(MouseEvent.CLICK,delete_menu_credits);
		}
		public function delete_menu_credits(e:MouseEvent)
		{
			meb.removeEventListener(MouseEvent.CLICK,delete_menu_credits);
			removeChild(crback);
			removeChild(meb);
		}
		public function menu_help(e:MouseEvent)
		{
			addChild(heback);
			heback.x=320;
			heback.y=180;
			addChild(meb);
			meb.x=320;
			meb.y=300;
			meb.addEventListener(MouseEvent.CLICK,delete_menu_help);
		}
		public function delete_menu_help(e:MouseEvent)
		{
			meb.removeEventListener(MouseEvent.CLICK,delete_menu_help);
			removeChild(heback);
			removeChild(meb);
		}
		public function delete_menu()
		{
			stb.removeEventListener(MouseEvent.CLICK,start_game);
			crb.removeEventListener(MouseEvent.CLICK,menu_credits);
			heb.removeEventListener(MouseEvent.CLICK,menu_help);
			cob.removeEventListener(MouseEvent.CLICK,continue_game);
			removeChild(stb);
			removeChild(cob);
			removeChild(crb);
			removeChild(heb);
		}
		
		//map creation
		
		public function map_creation_main()
		{
			var p:Point=new Point(0,0);
			
			lb_rect.y=360*level_num-360;
			lb.bitmapData=new BitmapData(640,360);
			lb.bitmapData.copyPixels(lb_sheet,lb_rect,p);
			addChild(lb);
			lb.x=0;
			lb.y=0;
			addChild(loadingbar);
			loadingbar.x=0;
			loadingbar.y=330;
			if(level_num>6)bs_sheet=new bs3;
			else if(level_num>3) bs_sheet=new bs2;
			else bs_sheet=new bs;
			create_blank_level();
			generate_sewer_start();
		}
		public function create_blank_level()
		{
			for(var m:int=0;m<100;m++)
			{
				level[m]=new Vector.<int>;
				for(var n:int=0;n<100;n++)
				{
					level[m][n]=0;
				}
			}
			for(var m:int=0;m<20;m++)
			{
				chunks[m]= new Vector.<int>;
				for(var n:int=0;n<20;n++)
				{
					chunks[m][n]=0;
				}
			}
			for(var m:int=0;m<20;m++)
			{
				sewer_chunks[m]= new Vector.<int>;
				for(var n:int=0;n<20;n++)
				{
					sewer_chunks[m][n]=0;
				}
			}
			for(var m:int=0;m<20;m++)
			{
				access[m]= new Vector.<int>;
				for(var n:int=0;n<20;n++)
				{
					access[m][n]=0;
				}
			}
			for(var m:int=0;m<100;m++)
			{
				treasure[m]= new Vector.<int>;
				for(var n:int=0;n<100;n++)
				{
					treasure[m][n]=0;
				}
			}
		}
		public function generate_sewer_start()
		{
			var s_start_x:int=Math.floor(Math.random()*18+1);
			var s_start_y:int=Math.floor(Math.random()*18+1);
			
			sewer_chunks[s_start_x][s_start_y]=9;
			access[s_start_x][s_start_y]=3;
			addEventListener(Event.ENTER_FRAME,generate_sewer);
		}
		public function generate_sewer(e:Event)
		{
			for(var m:int=1;m<19;m++)
			{
				for(var n:int=1;n<19;n++)
				{
					if(sewer_chunks[m][n]>0)
					{
						if(sewer_chunks[m][n]==5||sewer_chunks[m][n]==7)
						{
							if(sewer_chunks[m+1][n]==0)
							{
								var sew:Vector.<int>=new<int>[5,7,9,10,11,4,4];
								sewer_chunks[m+1][n]=sew[Math.floor(Math.random()*7)];
								access[m+1][n]=3;
								m=n=100;
							}
							else if(sewer_chunks[m-1][n]==0)
							{
								var sew:Vector.<int>=new<int>[5,7,9,12,13,2,2];
								sewer_chunks[m-1][n]=sew[Math.floor(Math.random()*7)];
								access[m-1][n]=3;
								m=n=100;
							}
						}
						else if(sewer_chunks[m][n]==6||sewer_chunks[m][n]==8)
						{
							if(sewer_chunks[m][n+1]==0)
							{
								var sew:Vector.<int>=new<int>[6,8,9,10,12,1,1];
								sewer_chunks[m][n+1]=sew[Math.floor(Math.random()*7)];
								access[m][n+1]=3;
								m=n=100;
							}
							else if(sewer_chunks[m][n-1]==0)
							{
								var sew:Vector.<int>=new<int>[6,8,9,11,13,3,3];
								sewer_chunks[m][n-1]=sew[Math.floor(Math.random()*7)];
								access[m][n-1]=3;
								m=n=100;
							}
						}
						else if(sewer_chunks[m][n]==9)
						{
							if(sewer_chunks[m][n-1]==0)
							{
								sewer_chunks[m][n-1]=6;
								access[m][n-1]=3;
								m=n=100;
							}
							else if(sewer_chunks[m+1][n]==0)
							{
								sewer_chunks[m+1][n]=5;
								access[m+1][n]=3;
								m=n=100;
							}
							else if(sewer_chunks[m][n+1]==0)
							{
								sewer_chunks[m][n+1]=6;
								access[m][n+1]=3;
								m=n=100;
							}
							else if(sewer_chunks[m-1][n]==0)
							{
								sewer_chunks[m-1][n]=2;
								access[m-1][n]=3;
								m=n=100;
							}
						}
						else if(sewer_chunks[m][n]==10)
						{
							if(sewer_chunks[m][n-1]==0)
							{
								var sew:Vector.<int>=new<int>[6,6,8,8,3];
								sewer_chunks[m][n-1]=sew[Math.floor(Math.random()*5)];
								access[m][n-1]=3;
								m=n=100;
							}
							else if(sewer_chunks[m-1][n]==0)
							{
								var sew:Vector.<int>=new<int>[5,5,7,7,2];
								sewer_chunks[m-1][n]=sew[Math.floor(Math.random()*5)];
								access[m-1][n]=3;
								m=n=100;
							}
						}
						else if(sewer_chunks[m][n]==11)
						{
							if(sewer_chunks[m-1][n]==0)
							{
								var sew:Vector.<int>=new<int>[5,5,7,7,2];
								sewer_chunks[m-1][n]=sew[Math.floor(Math.random()*5)];
								access[m-1][n]=3;
								m=n=100;
							}
							else if(sewer_chunks[m][n+1]==0)
							{
								var sew:Vector.<int>=new<int>[6,6,8,8,1];
								sewer_chunks[m][n+1]=sew[Math.floor(Math.random()*5)];
								access[m][n+1]=3;
								m=n=100;
							}
						}
						else if(sewer_chunks[m][n]==12)
						{
							if(sewer_chunks[m][n-1]==0)
							{
								var sew:Vector.<int>=new<int>[6,6,8,8,3];
								sewer_chunks[m][n-1]=sew[Math.floor(Math.random()*5)];
								access[m][n-1]=3;
								m=n=100;
							}
							else if(sewer_chunks[m+1][n]==0)
							{
								var sew:Vector.<int>=new<int>[5,5,7,7,4];
								sewer_chunks[m+1][n]=sew[Math.floor(Math.random()*5)];
								access[m+1][n]=3;
								m=n=100;
							}
						}
						else if(sewer_chunks[m][n]==13)
						{
							if(sewer_chunks[m+1][n]==0)
							{
								var sew:Vector.<int>=new<int>[5,5,7,7,4];
								sewer_chunks[m+1][n]=sew[Math.floor(Math.random()*5)];
								access[m+1][n]=3;
								m=n=100;
							}
							else if(sewer_chunks[m][n+1]==0)
							{
								var sew:Vector.<int>=new<int>[6,6,8,8,1];
								sewer_chunks[m][n+1]=sew[Math.floor(Math.random()*5)];
								access[m][n+1]=3;
								m=n=100;
							}
						}
					}
					if((m==18&&n==18)||sewer_length>80){m=100;n=100;create_level();removeEventListener(Event.ENTER_FRAME,generate_sewer);addEventListener(Event.ENTER_FRAME,generate_map);}
				}
			}
			sewer_length++;
		}
		public function generate_start_point()
		{
			var xx:int=Math.random()*14+3;
			var yy:int=Math.random()*14+3;
			for(var i:int;i<1000;i++)
			{
				if(chunks[xx][yy]==0) break;
				else
				{
					xx=Math.floor(Math.random()*20);
					yy=Math.floor(Math.random()*20);
				}
				if(i==999)xx=yy=10;
			}
			player_pos.x=xx*5+2;
			player_pos.y=yy*5+2;
			chunks[xx][yy]=1;
			access[xx][yy]=1;
			addEventListener(Event.ENTER_FRAME,generate_map);
		}
		public function generate_map(e:Event)
		{
			var i:int=Math.floor(Math.random()*(rooms.length-3)+1);
			for(var m:int=0;m<20;m++)
			{
				for(var n:int=0;n<20;n++)
				{
					if(access[n][m]==1)
					{
						conti=true;
						if(m-1!=-1&&access[n][m-1]==0)
						{
							if(rooms[chunks[n][m]][2]==5)
							{
								while(rooms[i][22]!=5)i=Math.floor(Math.random()*(rooms.length-3)+1);
								chunks[n][m-1]=i;
								access[n][m-1]=1;
								i=Math.floor(Math.random()*(rooms.length-3)+1);
							}
						}
						if(n+1!=20&&access[n+1][m]==0)
						{
							if(rooms[chunks[n][m]][14]==5)
							{
								while(rooms[i][10]!=5)i=Math.floor(Math.random()*(rooms.length-3)+1);
								chunks[n+1][m]=i;
								access[n+1][m]=1;
								i=Math.floor(Math.random()*(rooms.length-3)+1);
							}
						}
						if(m+1!=20&&access[n][m+1]==0)
						{
							if(rooms[chunks[n][m]][22]==5)
							{
								while(rooms[i][2]!=5)i=Math.floor(Math.random()*(rooms.length-3)+1);
								chunks[n][m+1]=i;
								access[n][m+1]=1;
								i=Math.floor(Math.random()*(rooms.length-3)+1);
							}
						}
						if(n-1!=-1&&access[n-1][m]==0)
						{
							if(rooms[chunks[n][m]][10]==5)
							{
								while(rooms[i][14]!=5)i=Math.floor(Math.random()*(rooms.length-3)+1);
								chunks[n-1][m]=i;
								access[n-1][m]=1;
								i=Math.floor(Math.random()*(rooms.length-3)+1);
							}
						}
						access[n][m]=2;
					}
					if(access[n][m]==3)
					{
						conti=true;
						if(m-1!=-1&&access[n][m-1]==0)
						{
							if(sewers[sewer_chunks[n][m]][2]==5)
							{
								while(rooms[i][22]!=5)i=Math.floor(Math.random()*(rooms.length-3)+1);
								chunks[n][m-1]=i;
								access[n][m-1]=1;
								i=Math.floor(Math.random()*(rooms.length-3)+1);
							}
						}
						if(n+1!=20&&sewer_chunks[n+1][m]==0)
						{
							if(sewers[sewer_chunks[n][m]][14]==5)
							{
								while(rooms[i][10]!=5)i=Math.floor(Math.random()*(rooms.length-3)+1);
								chunks[n+1][m]=i;
								access[n+1][m]=1;
								i=Math.floor(Math.random()*(rooms.length-3)+1);
							}
						}
						if(m+1!=20&&sewer_chunks[n][m+1]==0)
						{
							
							if(sewers[sewer_chunks[n][m]][22]==5)
							{
								while(rooms[i][2]!=5){;i=Math.floor(Math.random()*(rooms.length-3)+1);}
								chunks[n][m+1]=i;
								access[n][m+1]=1;
								i=Math.floor(Math.random()*(rooms.length-3)+1);
							}
						}
						if(n-1!=-1&&sewer_chunks[n-1][m]==0)
						{
							if(sewers[sewer_chunks[n][m]][10]==5)
							{
								while(rooms[i][14]!=5)i=Math.floor(Math.random()*(rooms.length-3)+1);
								chunks[n-1][m]=i;
								access[n-1][m]=1;
								i=Math.floor(Math.random()*(rooms.length-3)+1);
							}
						}
						access[n][m]=4;
					}
				}
			}
			aaa++;
			if(conti==false)
			{
				removeEventListener(Event.ENTER_FRAME,generate_map);
				removeChild(lb);
				for(var m:int=0;m<20;m++)
				{
					for(var n:int=0;n<20;n++)
					{
						if(access[n][m]==0)
						{
							chunks[n][m]=3;
							access[n][m]=2;
						}
					}
				}
				create_level();
				create_treasure();
				map_initialization();
			}
			else conti=false;
		}
		public function create_level()
		{
			for(var n1:int=0;n1<20;n1++)
			{
				for(var m1:int=0;m1<20;m1++)
				{
					for(var n2:int=0;n2<5;n2++)
					{
						for(var m2:int=0;m2<5;m2++)
						{
							if(sewer_chunks[m1][n1]!=0)level[m1*5+m2][n1*5+n2]=sewers[sewer_chunks[m1][n1]][n2*5+m2];
							else if(chunks[m1][n1]!=0)level[m1*5+m2][n1*5+n2]=rooms[chunks[m1][n1]][n2*5+m2];
						}
					}
				}
			}
			for(var X:int=0;X<100;X++)
			{
				level[X][0]=1;
				level[X][99]=1;
				level[0][X]=1;
				level[99][X]=1;
			}
		}
		public function create_treasure()
		{
			for(var m:int=0;m<100;m++)
			{
				for(var n:int=0;n<100;n++)
				{
					if(level[n][m]==5)
					{
						var mat:Number=Math.random();
						if(mat>0.9)treasure[n][m]=3;
						else if(mat>0.75)treasure[n][m]=2;
						else if(mat>0.6)treasure[n][m]=1;
					}
				}
			}
		}
		
		//game
		
		public function map_initialization()
		{
			var p:Point=new Point(0,0);
			
			for(var m:int=0;m<=20;m++)
			{
				blocks[m]=new Vector.<Bitmap>;
			}
			for(var m:int=0;m<=20;m++)
			{
				for(var n:int=0;n<=20;n++)
				{
					blocks[n][m]=new Bitmap;
					blocks[n][m].bitmapData=new BitmapData(50,50,true,0);
					bs_rect.x=(level[player_pos.x+n-10][player_pos.y+m-10]%10)*50;
					bs_rect.y=(Math.floor(level[player_pos.y+m-10][player_pos.y+m-10]/10))*50;
					blocks[n][m].bitmapData.copyPixels(bs_sheet,bs_rect,p);
					addChild(blocks[n][m]);
					blocks[n][m].x=320+(n-10)*50;
					blocks[n][m].y=180+(m-10)*50;
					if(treasure[player_pos.x+n-10][player_pos.y+m-10]!=0)
					{
						bs_rect.x=treasure[player_pos.x+n-10][player_pos.y+m-10]*50-50;
						bs_rect.y=0;
						blocks[n][m].bitmapData.copyPixels(treasure_sheet,bs_rect,p,null,null,true);
					}
				}
			}
			bs_rect.x=0;
			bs_rect.y=0;
			bs_temp.copyPixels(bs_sheet,bs_rect,p);
			loadingbar.bitmapData=bs_temp;
			addChild(loadingbar);
			loadingbar.x=320;
			loadingbar.y=180;
			UI_init();
			game_init();
		}
		public function UI_init()
		{
			addChild(taskbar);
			taskbar.x=taskbar.y=0;
			addChild(inventory_holder);
			inventory_holder.addChild(inventory);
			inventory_holder.x=5;
			inventory_holder.y=10;
			inventory_holder.addEventListener(MouseEvent.CLICK,inventory_open);
			addChild(stats_button_holder);
			stats_button_holder.x=5;
			stats_button_holder.y=65;
			stats_button_holder.addChild(stats_button);
			stats_button_holder.addEventListener(MouseEvent.CLICK,stats_open);
		}
		public function game_init()
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyboard_up);
			addEventListener(Event.ENTER_FRAME,gameLoop);
		}
		public function inventory_open(e:MouseEvent)
		{
			if(inv_open==false)
			{
				inv_open=true;
				removeEventListener(Event.ENTER_FRAME,gameLoop);
				addChild(inventory_window_holder);
				inventory_window_holder.x=60;
				inventory_window_holder.addChild(inventory_window);
				addChild(inventory_sort_button_holder);
				inventory_sort_button_holder.x=100;
				inventory_sort_button_holder.y=30;
				inventory_sort_button_holder.addChild(inventory_sort_button);
				addChild(delete_item_button_holder);
				delete_item_button_holder.x=500;
				delete_item_button_holder.y=300;
				delete_item_button_holder.addChild(delete_item_button);
				addChild(grid_holder);
				grid_holder.x=450;
				grid_holder.y=30;
				grid_holder.addChild(inventory_grid);
				addChild(display_attack);
				addChild(display_magicattack);
				addChild(display_defense);
				addChild(display_magicdefense);
				addChild(display_bonus);
				display_attack.x=display_magicattack.x=display_bonus.x=475;
				display_defense.x=display_magicdefense.x=525;
				display_attack.y=display_defense.y=140;
				display_magicattack.y=display_magicdefense.y=170;
				display_bonus.y=200;
				inventory_sort_all();
				render_grid();
				inventory_sort_button_holder.addEventListener(MouseEvent.CLICK,inventory_sort);
				inventory_window_holder.addEventListener(MouseEvent.CLICK,display_parameters);
				delete_item_button_holder.addEventListener(MouseEvent.CLICK,delete_item);
				grid_holder.addEventListener(MouseEvent.CLICK, equip_item);
			}
			else
			{
				inv_open=false;
				inventory_close();
				addEventListener(Event.ENTER_FRAME,gameLoop);
			}
		}
		public function inventory_sort(e:MouseEvent)
		{
			inventory_tab=Math.floor(e.localX/50);
			inventory_sort_2();
			item_place=100;
		}
		public function inventory_sort_2()
		{
			
			if(inventory_tab==0)
			{
				inventory_sort_all();
			}
			else if(inventory_tab==1)
			{
				inventory_sort_main(0,40,80,true);
				inventory_sort_main(1,p1,p2,false);
			}
			else if(inventory_tab==2)inventory_sort_main(2,40,80,true);
			else if(inventory_tab==3)
			{
				inventory_sort_main(3,40,80,true);
				inventory_sort_main(4,p1,p2,false);
				inventory_sort_main(5,p1,p2,false);
			}
			else if(inventory_tab==4)inventory_sort_main(6,40,80,true);
			else if(inventory_tab==5)inventory_sort_main(7,40,80,true);
		}
		public function inventory_sort_all()
		{
			inventory_sort_main(0,40,80,true);
			for(var Y:int=1;Y<8;Y++)
			{
				inventory_sort_main(Y,p1,p2,false);
			}
		}
		public function inventory_sort_main(type,m:int,n:int,reset:Boolean)
		{
			var p:Point=new Point(m,n);
			
			if(reset)inventory_window.bitmapData=new inv_win;
			bs_rect.y=type*50;
			for(var X:int=0;X<inventory_contents.length;X++)
			{
				if(inventory_contents[X][0]==type)
				{
					bs_rect.x=inventory_contents[X][1]*50;
					inventory_window.bitmapData.copyPixels(stuff_sheet,bs_rect,p,null,null,true);
					if(p.x<250)p.x+=50;
					else {p.y+=50;p.x=40;}
				}
			}
			p1=p.x;
			p2=p.y;
		}
		public function display_parameters(e:MouseEvent)
		{
			if(e.localX-40<300&&e.localY-80<300)
			{
				item_place=Math.floor((e.localX-40)/50)+Math.floor((e.localY-80)/50)*6;
				display_parameters_2();
			}
		}
		public function display_parameters_2()
		{
			num=0;
			if(inventory_tab==0)
			{
				display_parameters_main(0,item_place);
				display_parameters_main(1,item_place);
				display_parameters_main(2,item_place);
				display_parameters_main(3,item_place);
				display_parameters_main(4,item_place);
				display_parameters_main(5,item_place);
				display_parameters_main(6,item_place);
				display_parameters_main(7,item_place);
			}
			else if(inventory_tab==1)
			{
				display_parameters_main(0,item_place);
				display_parameters_main(1,item_place);
			}
			else if(inventory_tab==2)
			{
				display_parameters_main(2,item_place);
			}
			else if(inventory_tab==3)
			{
				display_parameters_main(3,item_place);
				display_parameters_main(4,item_place);
				display_parameters_main(5,item_place);
			}
			else if(inventory_tab==4)
			{
				display_parameters_main(6,item_place);
			}
			else if(inventory_tab==5)
			{
				display_parameters_main(7,item_place);
			}
		}
		public function display_parameters_main(type:int,place:int)
		{
			if(num<=place)
			{
				for(var X:int=0;X<inventory_contents.length;X++)
				{
					if(inventory_contents[X][0]==type)
					{
						if(num==place)
						{
							display_attack.text=inventory_contents[X][2];
							display_magicattack.text=inventory_contents[X][3];
							display_defense.text=inventory_contents[X][4];
							display_magicdefense.text=inventory_contents[X][5];
							
							if(inventory_contents[X][6]!=0)
							{
								display_bonus.text="+";
								display_bonus.appendText(inventory_contents[X][7]);
								display_bonus.appendText("% ");
								display_bonus.appendText(words[inventory_contents[X][6]]);
							}
							else display_bonus.text="";
							num++;
							selected_item=X;
							break;
						}
						else num++;
					}
				}
			}
		}
		public function equip_item(e:MouseEvent)
		{
			var place:int=Math.floor(e.localX/50)+Math.floor(e.localY/50)*3;
			var sel:int=inventory_contents[selected_item][0];
			
			trace(place,selected_item,sel);
			if(selected_item<inventory_contents.length)
			{
				if(place==0||place==2)
				{
					if(sel==0||sel==1||sel==2||sel==4)
					{
						if(equiped_items[0]==selected_item)equiped_items[0]=100;
						if(equiped_items[2]==selected_item)equiped_items[2]=100;
						equiped_items[place]=selected_item;
					}
				}
				else if(place==1)
				{
					if(sel==3)
					{
						equiped_items[1]=selected_item;
					}
				}
				else if(place==3||place==5)
				{
					if(sel==6)
					{
						if(equiped_items[3]==selected_item)equiped_items[3]=100;
						if(equiped_items[5]==selected_item)equiped_items[5]=100;
						equiped_items[place]=selected_item;
					}
				}
				if(place==4)
				{
					if(sel==5)
					{
						equiped_items[4]=selected_item;
					}
				}
				render_grid();
			}
		}
		public function add_item()
		{
			var AttackCo:Vector.<Number>=new <Number>[1,0.75,0.2,0.8,0.3,0];
			var p:Point=new Point;
			
			inventory_contents.push(new Vector.<int>);
			if(inventory_tab!=7)
			{
				inventory_contents[inventory_contents.length-1][0]=Math.floor(Math.random()*8);//type
				inventory_contents[inventory_contents.length-1][1]=0;//bitmap
				inventory_contents[inventory_contents.length-1][2]=Math.floor(Math.random()*6)//attack
				inventory_contents[inventory_contents.length-1][3]=Math.floor(Math.random()*6);//magic attack
				inventory_contents[inventory_contents.length-1][4]=Math.floor(Math.random()*6);//defense
				inventory_contents[inventory_contents.length-1][5]=Math.floor(Math.random()*6);//magic defense
				if(Math.random()>0.5)
				{
					inventory_contents[inventory_contents.length-1][6]=Math.floor(Math.random()*6+1);//bonus stat
					inventory_contents[inventory_contents.length-1][7]=Math.floor(Math.random()*3+1)*5;//bonus amount percent
					if(inventory_contents[inventory_contents.length-1][0]==5)
					{
						inventory_contents[inventory_contents.length-1][6]=5;//bonus speed
						inventory_contents[inventory_contents.length-1][7]=Math.floor(Math.random()*3+1)*10;//bonus speed percent
					}
					else if(inventory_contents[inventory_contents.length-1][0]==6)
					{
						inventory_contents[inventory_contents.length-1][6]=Math.floor(Math.random()*6+1);//bonus stat
						inventory_contents[inventory_contents.length-1][7]=Math.floor(Math.random()*4+1)*5;//bonus amount percent
					}
				}
				else inventory_contents[inventory_contents.length-1][6]=0;
			}
			trace(inventory_contents[inventory_contents.length-1]);
			treasure[player_pos.x][player_pos.y]=0;
			bs_rect.x=(level[player_pos.x][player_pos.y]%10)*50;
			bs_rect.y=(Math.floor(level[player_pos.x][player_pos.y]/10))*50;
			for(var m:int=0;m<=20;m++)
			{
				for(var n:int=0;n<=20;n++)
				{
					if(blocks[n][m].x==320&&blocks[n][m].y==180)
					{
						blocks[n][m].bitmapData.copyPixels(bs_sheet,bs_rect,p);
						m=n=21;
					}
				}
			}
		}
		public function delete_item(e:MouseEvent)
		{
			if(item_place!=100&&item_place<inventory_contents.length)
			{
				inventory_contents.splice(selected_item,1);
				for(var X:int=0;X<6;X++)
				{
					trace(selected_item,equiped_items[X]);
					if(selected_item==equiped_items[X])equiped_items[X]=100;
					if(selected_item<equiped_items[X]&&equiped_items[X]!=100)equiped_items[X]-=1;
				}
				inventory_sort_2();
				display_parameters_2();
				render_grid();
			}
		}
		public function render_grid()
		{
			var p:Point=new Point(0,0);
			
			trace(equiped_items);
			inventory_grid.bitmapData=new gri;
			for(var Y:int=0;Y<6;Y++)
			{
				if(equiped_items[Y]!=100)
				{
					bs_rect.x=inventory_contents[equiped_items[Y]][1]*50;
					bs_rect.y=inventory_contents[equiped_items[Y]][0]*50;
					p.x=Y%3*50;
					p.y=Math.floor(Y/3)*50;
					inventory_grid.bitmapData.copyPixels(stuff_sheet,bs_rect,p,null,null,false);
				}
			}
		}
		public function inventory_close()
		{
			inventory_sort_button.removeEventListener(MouseEvent.CLICK,inventory_sort);
			inventory_window_holder.removeEventListener(MouseEvent.CLICK,display_parameters);
			delete_item_button_holder.removeEventListener(MouseEvent.CLICK,delete_item);
			grid_holder.removeEventListener(MouseEvent.CLICK, equip_item);
			inventory_window_holder.removeChild(inventory_window);
			removeChild(inventory_window_holder);
			inventory_sort_button_holder.removeChild(inventory_sort_button);
			removeChild(inventory_sort_button_holder);
			removeChild(display_attack);
			removeChild(display_magicattack);
			removeChild(display_defense);
			removeChild(display_magicdefense);
			removeChild(display_bonus);
			delete_item_button_holder.removeChild(delete_item_button);
			removeChild(delete_item_button_holder);
			grid_holder.removeChild(inventory_grid);
			removeChild(grid_holder);
			display_attack.text="";
			display_magicattack.text="";
			display_defense.text="";
			display_magicdefense.text="";
			display_bonus.text="";
		}
		public function stats_open(e:MouseEvent)
		{
			
		}
		public function keyboard_down(e:KeyboardEvent)
		{
			if(e.keyCode==37)
			{
				lkd=true;
			}
			else if(e.keyCode==38)
			{
				ukd=true;
			}
			else if(e.keyCode==39)
			{
				rkd=true;
			}
			else if(e.keyCode==40)
			{
				dkd=true;
			}
			if(timer==0)
			{
				if(e.keyCode==81){time_cons=10;speed=5;}
				if(e.keyCode==87){time_cons=5;speed=10;}
				if(e.keyCode==69){time_cons=2;speed=25;}
				if(e.keyCode==82){time_cons=1;speed=50;}
				if(e.keyCode==65)through_walls=!through_walls;
			}
		}
		public function keyboard_up(e:KeyboardEvent)
		{
			if(e.keyCode==37)
			{
				lkd=false;
			}
			if(e.keyCode==38)
			{
				ukd=false;
			}
			if(e.keyCode==39)
			{
				rkd=false;
			}
			if(e.keyCode==40)
			{
				dkd=false;
			}
		}
		public function gameLoop(e:Event)
		{
			var p:Point=new Point(0,0);
			
			if(timer==0)
			{
				if(through_walls==false)
				{
					if(lkd&&player_pos.x-1!=-1&&level[player_pos.x-1][player_pos.y]==5)
					{
						lm=true;
						timer=time_cons;
					}
					else if(ukd&&player_pos.y-1!=-1&&level[player_pos.x][player_pos.y-1]==5)
					{
						um=true;
						timer=time_cons;
					}
					else if(rkd&&player_pos.x+1!=100&&level[player_pos.x+1][player_pos.y]==5)
					{
						rm=true;
						timer=time_cons;
					}
					else if(dkd&&player_pos.y+1!=100&&level[player_pos.x][player_pos.y+1]==5)
					{
						dm=true;
						timer=time_cons;
					}
				}
				else
				{
					if(lkd)
					{
						lm=true;
						timer=time_cons;
					}
					else if(ukd)
					{
						um=true;
						timer=time_cons;
					}
					else if(rkd)
					{
						rm=true;
						timer=time_cons;
					}
					else if(dkd)
					{
						dm=true;
						timer=time_cons;
					}
				}
			}
			if(timer!=0)
			{
				timer--;
				if(lm==true)
				{
					for(var m:int=0;m<=20;m++)
					{
						for(var n:int=0;n<=20;n++)
						{
							blocks[n][m].x+=speed;
						}
					}
					if(timer==0)
					{
						lm=false;
						player_pos.x--;
						if(treasure[player_pos.x][player_pos.y]!=0&&inventory_contents.length<30)add_item();
						if(player_pos.x-10>=0)
						{
							for(var X:int=0;X<=20;X++)
							{
								if(blocks[X][0].x>=870)
								{
									for(var m:int=0;m<=20;m++)
									{
										blocks[X][m].x-=1050
										bs_rect.x=(level[player_pos.x-10][player_pos.y+(blocks[X][m].y-180)/50]%10)*50;
										bs_rect.y=(Math.floor(level[player_pos.x-10][player_pos.y+(blocks[X][m].y-180)/50]/10))*50;
										blocks[X][m].bitmapData.copyPixels(bs_sheet,bs_rect,p);
										if(treasure[player_pos.x-10][player_pos.y+(blocks[X][m].y-180)/50]!=0)
										{
											bs_rect.x=treasure[player_pos.x-10][player_pos.y+(blocks[X][m].y-180)/50]*50-50;
											bs_rect.y=0;
											blocks[X][m].bitmapData.copyPixels(treasure_sheet,bs_rect,p,null,null,true);
										}
									}
								}
							}
						}
					}
				}
				else if(um==true)
				{
					for(var m:int=0;m<=20;m++)
					{
						for(var n:int=0;n<=20;n++)
						{
							blocks[n][m].y+=speed;
						}
					}
					if(timer==0)
					{
						um=false;
						player_pos.y--;
						if(treasure[player_pos.x][player_pos.y]!=0&&inventory_contents.length<30)add_item();
						if(player_pos.y-10>=0)
						{
							for(var X:int=0;X<=20;X++)
							{
								if(blocks[0][X].y>=730)
								{
									for(var m:int=0;m<=20;m++)
									{
										blocks[m][X].y-=1050;
										bs_rect.x=(level[player_pos.x+(blocks[m][X].x-320)/50][player_pos.y-10]%10)*50;
										bs_rect.y=(Math.floor(level[player_pos.x+(blocks[m][X].x-320)/50][player_pos.y-10]/10))*50;
										blocks[m][X].bitmapData.copyPixels(bs_sheet,bs_rect,p);
										if(treasure[player_pos.x+(blocks[m][X].x-320)/50][player_pos.y-10]!=0)
										{
											bs_rect.x=treasure[player_pos.x+(blocks[m][X].x-320)/50][player_pos.y-10]*50-50;
											bs_rect.y=0;
											blocks[m][X].bitmapData.copyPixels(treasure_sheet,bs_rect,p,null,null,true);
										}
									}
								}
							}
						}
					}
				}
				else if(rm==true)
				{
					for(var m:int=0;m<=20;m++)
					{
						for(var n:int=0;n<=20;n++)
						{
							blocks[n][m].x-=speed;
						}
					}
					if(timer==0)
					{
						rm=false;
						player_pos.x++;
						if(treasure[player_pos.x][player_pos.y]!=0&&inventory_contents.length<30)add_item();
						if(player_pos.x+10<=99)
						{
							for(var X:int=0;X<=20;X++)
							{
								if(blocks[X][0].x<=-230)
								{
									for(var m:int=0;m<=20;m++)
									{
										blocks[X][m].x+=1050
										bs_rect.x=(level[player_pos.x+10][player_pos.y+(blocks[X][m].y-180)/50]%10)*50;
										bs_rect.y=(Math.floor(level[player_pos.x+10][player_pos.y+(blocks[X][m].y-180)/50]/10))*50;
										blocks[X][m].bitmapData.copyPixels(bs_sheet,bs_rect,p);
										if(treasure[player_pos.x+10][player_pos.y+(blocks[X][m].y-180)/50]!=0)
										{
											bs_rect.x=treasure[player_pos.x+10][player_pos.y+(blocks[X][m].y-180)/50]*50-50;
											bs_rect.y=0;
											blocks[X][m].bitmapData.copyPixels(treasure_sheet,bs_rect,p,null,null,true);
										}
									}
								}
							}
						}
					}
				}
				else if(dm==true)
				{
					for(var m:int=0;m<=20;m++)
					{
						for(var n:int=0;n<=20;n++)
						{
							blocks[n][m].y-=speed;
						}
					}
					if(timer==0)
					{
						dm=false;
						player_pos.y++;
						if(treasure[player_pos.x][player_pos.y]!=0&&inventory_contents.length<30)add_item();
						if(player_pos.y+10<=99)
						{
							for(var X:int=0;X<=20;X++)
							{
								if(blocks[0][X].y<=-370)
								{
									for(var m:int=0;m<=20;m++)
									{
										blocks[m][X].y+=1050
										bs_rect.x=(level[player_pos.x+(blocks[m][X].x-320)/50][player_pos.y+10]%10)*50;
										bs_rect.y=(Math.floor(level[player_pos.x+(blocks[m][X].x-320)/50][player_pos.y+10]/10))*50;
										blocks[m][X].bitmapData.copyPixels(bs_sheet,bs_rect,p);
										if(treasure[player_pos.x+(blocks[m][X].x-320)/50][player_pos.y+10]!=0)
										{
											bs_rect.x=treasure[player_pos.x+(blocks[m][X].x-320)/50][player_pos.y+10]*50-50;
											bs_rect.y=0;
											blocks[m][X].bitmapData.copyPixels(treasure_sheet,bs_rect,p,null,null,true);
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}