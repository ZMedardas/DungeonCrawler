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
	import flash.text.TextField;
	import flash.display.Sprite;
	import flash.ui.Mouse;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.AntiAliasType;
	
	public class doc extends MovieClip
	{
		//doc
		
		var level_num:int=1;
		var format:TextFormat=new TextFormat();
		var format2:TextFormat=new TextFormat();
		var format3:TextFormat=new TextFormat();
		var format_lv:TextFormat=new TextFormat();
		var font1=new year;
		
		//menu
		
		var m_m_window:Bitmap=new Bitmap(new m_m_win);
		var stb:start_button=new start_button;
		var crb:credits_button=new credits_button;
		var heb:help_button=new help_button;
		var cob:continue_button=new continue_button;
		var meb:main_menu_button=new main_menu_button;
		var crback:credits_background=new credits_background;
		var heback:help_background=new help_background;
		
		//map creation
			
			//loading
			
			var lb:Bitmap=new Bitmap(new lbs);
			
			//sewers
		
			var sewer_start:Array=new Array(1,5,6,5,1,1,5,6,5,1,1,5,6,5,1,1,5,5,5,1,1,1,5,1,1);
			var sewer_start_rot90:Array=new Array(1,1,1,1,1,1,5,5,5,5,5,5,6,6,6,1,5,5,5,5,1,1,1,1,1);
			var sewer_start_rot180:Array=new Array(1,1,5,1,1,1,5,5,5,1,1,5,6,5,1,1,5,6,5,1,1,5,6,5,1);
			var sewer_start_rot270:Array=new Array(1,1,1,1,1,5,5,5,5,1,6,6,6,5,5,5,5,5,5,1,1,1,1,1,1);
			var sewer:Array=new Array(1,1,1,1,1,5,5,5,5,5,6,6,6,6,6,5,5,5,5,5,1,1,1,1,1);
			var sewer_rot90:Array=new Array(1,5,6,5,1,1,5,6,5,1,1,5,6,5,1,1,5,6,5,1,1,5,6,5,1);
			var sewer_ent:Array=new Array(1,1,5,1,1,5,5,5,5,5,6,6,6,6,6,5,5,5,5,5,1,1,5,1,1);
			var sewer_rot90_ent:Array=new Array(1,5,6,5,1,1,5,6,5,1,5,5,6,5,5,1,5,6,5,1,1,5,6,5,1);
			var sewer_int:Array=new Array(1,1,6,1,1,1,5,6,5,1,6,6,6,6,6,1,5,6,5,1,1,1,6,1,1);
			var sewer_turn_lu:Array=new Array(1,5,6,5,1,5,5,6,5,1,6,6,6,5,1,5,5,5,5,1,1,1,1,1,1);
			var sewer_turn_ld:Array=new Array(1,1,1,1,1,5,5,5,5,1,6,6,6,5,1,5,5,6,5,1,1,5,6,5,1);
			var sewer_turn_ru:Array=new Array(1,5,6,5,1,1,5,6,5,5,1,5,6,6,6,1,5,5,5,5,1,1,1,1,1);
			var sewer_turn_rd:Array=new Array(1,1,1,1,1,1,5,5,5,5,1,5,6,6,6,1,5,6,5,5,1,5,6,5,1);
		
			//rooms
		
			var start_point:Array=new Array(1,1,1,1,1,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1,1,1,1,1);
			var end_point:Array=new Array(1,1,1,1,1,5,5,5,5,5,5,5,2,5,5,5,5,5,5,5,1,1,1,1,1);
			var room1:Array=new Array(1,1,5,1,1,1,5,5,5,1,5,5,5,5,5,1,5,5,5,1,1,1,5,1,1);
			var room2:Array=new Array(1,1,5,1,1,1,5,5,5,1,5,5,1,5,5,1,5,5,5,1,1,1,5,1,1);
			var earth:Array=new Array(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
			var room_big:Array=new Array(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5);
			var room_big_col:Array=new Array(5,5,5,5,5,5,5,5,5,5,5,5,1,5,5,5,5,5,5,5,5,5,5,5,5);
			var room_big_col4:Array=new Array(1,5,5,5,1,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1,5,5,5,1);
			var room_corridor:Array=new Array(1,1,1,1,1,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1,1,1,1,1);
			var room_corridor_rot90:Array=new Array(1,5,5,5,1,1,5,5,5,1,1,5,5,5,1,1,5,5,5,1,1,5,5,5,1);
			var room_corridor_ru:Array=new Array(1,5,5,5,1,1,5,5,5,5,1,5,5,5,5,1,5,5,5,5,1,1,1,1,1);
			var room_corridor_rd:Array=new Array(1,1,1,1,1,1,5,5,5,5,1,5,5,5,5,1,5,5,5,5,1,5,5,5,1);
			var room_corridor_lu:Array=new Array(1,5,5,5,1,5,5,5,5,1,5,5,5,5,1,5,5,5,5,1,1,1,1,1,1);
			var room_corridor_ld:Array=new Array(1,1,1,1,1,5,5,5,5,1,5,5,5,5,1,5,5,5,5,1,1,5,5,5,1);
			
			var sewers:Array=new Array("nothing",sewer_start,sewer_start_rot90,sewer_start_rot180,sewer_start_rot270,sewer,sewer_rot90,sewer_ent,sewer_rot90_ent,
									 sewer_int,sewer_turn_lu,sewer_turn_ld,sewer_turn_ru,sewer_turn_rd);
			var rooms:Array=new Array("nothing",start_point,end_point,earth,room1,room2,room_big,room_big_col,room_big_col4,room_corridor,room_corridor_rot90,room_corridor_ru,room_corridor_rd,room_corridor_lu,
								  room_corridor_ld);
								  
			//maps
			
			static var level:Array=new Array();
			var chunks:Array=new Array();
			var sewer_chunks:Array=new Array();
			var access:Array=new Array();
			var treasure:Array=new Array();
			var explored:Array=new Array();
			static var enemies:Array=new Array();
			
			//variables
			
			var sewer_length:int=0;
			var conti:Boolean=new Boolean;
			var aaa:int=0;
		
		//game
		
		static var player_pos:Point=new Point(50,50);
		static var player_side:int=1;
		var char_gra_holder:Sprite=new Sprite;
		var char_gra:Bitmap=new Bitmap(new BitmapData(50,50,true,0x00000000));
		var hp:int=new int;
		var total_hp:int=new int;
		var blocks:Bitmap=new Bitmap(new BitmapData(1050,1050));
		var stuff_sheet:BitmapData=new stu;
		var player_level:int=new int;
		var player_stats:Vector.<int>=Vector.<int>([0,0,0,0,0,0]);
		var player_stats_old:Vector.<int>=Vector.<int>([0,0,0,0,0,0]);
		var player_abilities:Array=[Vector.<int>([0,0,0,0]),Vector.<int>([0,0,0,0]),Vector.<int>([0,0,0,0]),Vector.<int>([0,0,0,0]),Vector.<int>([0,0,0,0]),Vector.<int>([0,0,0,0])];
		var player_abilities_old:Array=[Vector.<int>([0,0,0,0]),Vector.<int>([0,0,0,0]),Vector.<int>([0,0,0,0]),Vector.<int>([0,0,0,0]),Vector.<int>([0,0,0,0]),Vector.<int>([0,0,0,0])];
		var player_stats_full:Vector.<int>=Vector.<int>([0,0,0,0,0,0]);
		var free_points:int=0;
		var free_points_old:int=0;
		var xp:int=new int;
		var needed_xp:int=new int;
		var energy:int=0;
		var energy_old:int=0;
		var abilities_array:Array=[['abi_fireball','abi_explosion','abi_dragon_breath','abi_fire_sphere'],['abi_heal','abi_icicle','abi_razors','abi_hail'],['abi_boulder','abi_spikes','abi_stone_shield','abi_earthquake'],['abi_rapid_shot','abi_scatter_shot','abi_escape_shot','abi_bullet_hell'],['abi_heavy_strike','abi_knock_out','abi_puller','abi_crusher'],['abi_needles','abi_charge','abi_sakura','abi_overdrive']]
		var enemies_array:Array=[,,zombie,dog,scelet_axe,razor,scelet_sword,bomb,troll,ninja,wizard];
		static var particles:Array=new Array;
		static var enemies_cur:Array=new Array;
		var ba_re:int=0;
		var init_af_cr:Boolean=false;
		
		//gra
		
		var char_time:int=new int();
		var at_time:int=new int();
		var char_frame:int=new int()
		var char_p:Point=new Point(0,0);
		var char_rect:Rectangle=new Rectangle(0,0,50,50);
		var char_sheet:BitmapData=new char_sp;
		
		//abilities length
		
		var db_len:int=0;
		var ra_len:int=0;
		var ha_len:int=0;
		var stsh_len:int=0;
		var ea_len:int=0;
		var rs_len:int=0;
		var es_len:int=0;
		var bh_len:int=0;
		var ne_len:int=0;
		var ch_len:int=0;
		var ov_len:int=0;
		var pu_len:int=0;
		
			//blocks
			
			 var bs_sheet:BitmapData=new BitmapData(1000,1000);
			 var bs_temp:BitmapData=new BitmapData(50,50);
			 var bs_rect:Rectangle=new Rectangle(0,0,50,50);
			 var treasure_sheet:BitmapData=new tre;
			 
			 //keys and movement
			 
			 var lkd:Boolean=false;
			 var ukd:Boolean=false;
			 var rkd:Boolean=false;
			 var dkd:Boolean=false;
			 var lm:Boolean=false;
			 var um:Boolean=false;
			 var rm:Boolean=false;
			 var dm:Boolean=false;
			 var ba:Boolean=false;
			 
			 //blocks recreation
			 
			 var timer:int=new int;
			 var time_cons:int=10;
			 var speed:int=5;
			 
			 //UI
			 
			 var inv_open:Boolean=false;
			 var sta_open:Boolean=false;
			 var abi_open:Boolean=false;
			 var ma_open:Boolean=false;
			 var gam_men_open:Boolean=false;
			 var addListeners:Vector.<Boolean>=Vector.<Boolean>([true,true,true,true])
			 var taskbar_holder:Sprite=new Sprite;
			 var taskbar:Bitmap=new Bitmap(new ts);
			 var inventory_holder:Sprite=new Sprite;
			 var inventory:Bitmap=new Bitmap(new inv);
			 var stats_button_holder:Sprite=new Sprite;
			 var stats_button:Bitmap=new Bitmap(new sta);
			 var abilities_holder:Sprite=new Sprite;
			 var abilities:Bitmap=new Bitmap(new abi);
			 var info_bar_holder:Sprite=new Sprite;
			 var info_bar:Bitmap=new Bitmap(new inf_bar);
			 var hp_info_bar:Bitmap=new Bitmap(new hp_inf_bar);
			 var xp_info_bar:Bitmap=new Bitmap(new xp_inf_bar);
			 var info_bar2_holder:Sprite=new Sprite;
			 var info_bar2:Bitmap=new Bitmap(new inf_bar2);
			 var map_button_holder:Sprite=new Sprite;
			 var map_button:Bitmap=new Bitmap(new map);
			 var menu_button_holder:Sprite=new Sprite;
			 var menu_button:Bitmap=new Bitmap(new menu);
			 var hotkeys_holder:Vector.<Sprite>=Vector.<Sprite>([new Sprite,new Sprite,new Sprite,new Sprite]);
			 var hotkeys_bitmap:Array=new Array(new Bitmap(new empty_cell),new Bitmap(new empty_cell),new Bitmap(new empty_cell),new Bitmap(new empty_cell));
			 var hotkeys_set:Array=new Array(new Point(0,0),new Point(0,0),new Point(0,0),new Point(0,0));
			 var hotkeys_recharge:Vector.<int>=Vector.<int>([0,0,0,0]);
			 var hotkeys_cov:Vector.<Bitmap>=Vector.<Bitmap>([new Bitmap(new cov),new Bitmap(new cov),new Bitmap(new cov),new Bitmap(new cov)]);
			 var fog1:Bitmap=new Bitmap(new fog);
			 var sel_b:Bitmap=new Bitmap(new sel_box);
			 var floor_t:TextField=new TextField;
			 var black_back:Bitmap=new Bitmap(new dea_scr);
			 var black_back_holder:Sprite=new Sprite;
			 var res_but_hol:Sprite=new Sprite;
			 var qui_but_hol:Sprite=new Sprite;
			 var res_but:Bitmap=new Bitmap(new game_menu_restart_but);
			 var qui_but:Bitmap=new Bitmap(new game_menu_qui_but);
			 
			 // Inventory
			 
			 var inventory_window_holder:Sprite=new Sprite;
			 var inventory_window:Bitmap=new Bitmap(new inv_win);
			 var delete_item_button_holder:Sprite=new Sprite;
			 var delete_item_button:Bitmap=new Bitmap(new del_but);
			 var upgrade_item_button_holder:Sprite=new Sprite;
			 var upgrade_item_button:Bitmap=new Bitmap(new upg_but);
			 var grid_holder:Sprite=new Sprite;
			 var inventory_grid:Bitmap=new Bitmap(new gri);
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
			 var display_energy:TextField=new TextField;
			 var display_sell:TextField=new TextField;
			 var display_buy:TextField=new TextField;
			 var words:Vector.<String>=new <String>["","att","def","magic att","magic def","evasion","crit. chance"];
			 
			 //stats
			 
			 var stats_menu_contents:Vector.<Sprite>=Vector.<Sprite>([new Sprite,new Sprite,new Sprite,new Sprite,new Sprite,new Sprite]);
			 var stats_menu_bitmaps:Vector.<Bitmap>=Vector.<Bitmap>([new Bitmap(new sta_att_but),new Bitmap(new sta_def_but),new Bitmap(new sta_mag_but),new Bitmap(new sta_magdef_but),new Bitmap(new sta_cri_but),new Bitmap(new sta_eva_but)]);
			 var stats_menu_text:Vector.<TextField>=Vector.<TextField>([new TextField,new TextField,new TextField,new TextField,new TextField,new TextField]);
			 var stats_des:Vector.<String>=Vector.<String>(["The bigger the attack stat is, the bigger the damage is","Helps you negate physical damage","Increases your magical damage","Improves you ability to negate magical damage","Higher chance of critical hits","Higher chance to evade attacks"]); 
			 var stats_window:Bitmap=new Bitmap(new sta_win);
			 var stats_xp_bar:Bitmap=new Bitmap(new xp_b);
			 var stats_top_text:TextField=new TextField;
			 var stats_side_text:TextField=new TextField;
			 var stats_bot_text:TextField=new TextField;
			 var holder_restore_button:Sprite=new Sprite;
			 var restore_button:Bitmap=new Bitmap(new abi_res);
			 var holder_increase_stat_button:Sprite=new Sprite;
			 var increase_stat_button:Bitmap=new Bitmap(new inc_abi);
			 var stat_num:int=7;
			 var co_p:Number=new Number;
			 var co_m:Number=new Number;
			 var cr_ch:Number=new Number;
			 
			 //abilities
			 
			 var abilities_window:Bitmap=new Bitmap(new abi_win);
			 var abilities_menu_holder:Array=[Vector.<Sprite>([new Sprite,new Sprite,new Sprite,new Sprite]),Vector.<Sprite>([new Sprite,new Sprite,new Sprite,new Sprite]),Vector.<Sprite>([new Sprite,new Sprite,new Sprite,new Sprite]),Vector.<Sprite>([new Sprite,new Sprite,new Sprite,new Sprite]),Vector.<Sprite>([new Sprite,new Sprite,new Sprite,new Sprite]),Vector.<Sprite>([new Sprite,new Sprite,new Sprite,new Sprite])];
			 var abilities_menu_bitmap:Array=[Vector.<Bitmap>([new Bitmap(new fireball),new Bitmap(new explosion),new Bitmap(new dragon_breath),new Bitmap(new fire_sphere)]),Vector.<Bitmap>([new Bitmap(new heal),new Bitmap(new icicle),new Bitmap(new razors),new Bitmap(new hail)]),Vector.<Bitmap>([new Bitmap(new boulder),new Bitmap(new spikes),new Bitmap(new stone_shield),new Bitmap(new earthquake)]),Vector.<Bitmap>([new Bitmap(new rapid_shot),new Bitmap(new scatter_shot),new Bitmap(new escape_shot),new Bitmap(new bullet_hell)]),Vector.<Bitmap>([new Bitmap(new heavy_strike),new Bitmap(new knock_out),new Bitmap(new puller),new Bitmap(new crusher)]),Vector.<Bitmap>([new Bitmap(new needles),new Bitmap(new charge),new Bitmap(new sakura),new Bitmap(new overdrive)])];
			 var abilities_menu_bitmap_ex:Vector.<Vector.<Bitmap>>=Vector.<Vector.<Bitmap>>([Vector.<Bitmap>([new Bitmap(new level_label),new Bitmap(new level_label),new Bitmap(new level_label),new Bitmap(new level_label)]),Vector.<Bitmap>([new Bitmap(new level_label),new Bitmap(new level_label),new Bitmap(new level_label),new Bitmap(new level_label)]),Vector.<Bitmap>([new Bitmap(new level_label),new Bitmap(new level_label),new Bitmap(new level_label),new Bitmap(new level_label)]),Vector.<Bitmap>([new Bitmap(new level_label),new Bitmap(new level_label),new Bitmap(new level_label),new Bitmap(new level_label)]),Vector.<Bitmap>([new Bitmap(new level_label),new Bitmap(new level_label),new Bitmap(new level_label),new Bitmap(new level_label)]),Vector.<Bitmap>([new Bitmap(new level_label),new Bitmap(new level_label),new Bitmap(new level_label),new Bitmap(new level_label)])]);
			 var abilities_menu_text:Array=[Vector.<TextField>([new TextField,new TextField,new TextField,new TextField]),Vector.<TextField>([new TextField,new TextField,new TextField,new TextField]),Vector.<TextField>([new TextField,new TextField,new TextField,new TextField]),Vector.<TextField>([new TextField,new TextField,new TextField,new TextField]),Vector.<TextField>([new TextField,new TextField,new TextField,new TextField]),Vector.<TextField>([new TextField,new TextField,new TextField,new TextField])];
			 var abilities_des:Array=[Vector.<String>(["01","02","03","04"]),Vector.<String>(["11","12","13","14"]),Vector.<String>(["21","22","23","24"]),Vector.<String>(["31","32","33","34"]),Vector.<String>(["41","42","43","44"]),Vector.<String>(["51","52","53","54"])]
			 var abilities_info:Vector.<Vector.<Vector.<int>>>=Vector.<Vector.<Vector.<int>>>([Vector.<Vector.<int>>([Vector.<int>([/*cost*/100,/*damage*/10,/*heal*/0,/*recharge*/300,/*stun*/0]),Vector.<int>([250,15,0,450,0]),Vector.<int>([500,60,0,450,0]),Vector.<int>([1000,30,0,900,0])]),Vector.<Vector.<int>>([Vector.<int>([50,0,10,900,0]),Vector.<int>([200,10,0,300,30]),Vector.<int>([500,60,0,450,30]),Vector.<int>([10,0,60,900,0])]),Vector.<Vector.<int>>([Vector.<int>([100,10,0,300,0]),Vector.<int>([300,20,0,450,30]),Vector.<int>([750,150,0,600,0]),Vector.<int>([1200,90,0,600,90])]),Vector.<Vector.<int>>([Vector.<int>([150,10,0,300,0]),Vector.<int>([400,20,0,450,0]),Vector.<int>([750,20,0,450,0]),Vector.<int>([1200,30,0,600,0])]),Vector.<Vector.<int>>([Vector.<int>([100,10,0,300,0]),Vector.<int>([250,10,0,330,60]),Vector.<int>([500,20,0,450,60]),Vector.<int>([1000,50,0,600,60])]),Vector.<Vector.<int>>([Vector.<int>([100,5,0,300,0]),Vector.<int>([300,10,0,330,0]),Vector.<int>([500,20,0,360,0]),Vector.<int>([1200,20,0,450,0])])]);
			 var abilities_info_original:Vector.<Vector.<Vector.<int>>>=Vector.<Vector.<Vector.<int>>>([Vector.<Vector.<int>>([Vector.<int>([/*cost*/0,/*damage*/0,/*heal*/0,/*duration*/0,/*recharge*/0,/*radius*/0]),Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0])]),Vector.<Vector.<int>>([Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0])]),,Vector.<Vector.<int>>([Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0])]),Vector.<Vector.<int>>([Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0])]),Vector.<Vector.<int>>([Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0]),Vector.<int>([0,0,0,0,0,0])])]);
			 var abilities_coe:Vector.<Vector.<Vector.<Number>>>=Vector.<Vector.<Vector.<Number>>>([Vector.<Vector.<Number>>([Vector.<Number>([0,0.75]),Vector.<Number>([0,0.5]),Vector.<Number>([0,0.4]),Vector.<Number>([0,1])]),Vector.<Vector.<Number>>([Vector.<Number>([0,0]),Vector.<Number>([0,0.75]),Vector.<Number>([0,0.4]),Vector.<Number>([0,0])]),Vector.<Vector.<Number>>([Vector.<Number>([0,0.75]),Vector.<Number>([0,0.8]),Vector.<Number>([0,0.25]),Vector.<Number>([0,0.5])]),Vector.<Vector.<Number>>([Vector.<Number>([0.5,0]),Vector.<Number>([0,0]),Vector.<Number>([0,0]),Vector.<Number>([0,0])]),Vector.<Vector.<Number>>([Vector.<Number>([0,0]),Vector.<Number>([0,0]),Vector.<Number>([0,0]),Vector.<Number>([0,0])]),Vector.<Vector.<Number>>([Vector.<Number>([0,0]),Vector.<Number>([0,0]),Vector.<Number>([0,0]),Vector.<Number>([0,0])])]);
			 var abilities_side_text:TextField=new TextField;
			 var abilities_bot_text:TextField=new TextField;
			 var increase_ability_holder:Sprite=new Sprite;
			 var increase_ability:Bitmap=new Bitmap(new inc_abi);
			 var abilities_restore_holder:Sprite=new Sprite;
			 var abilities_restore:Bitmap=new Bitmap(new abi_res);
			 var ability_num:Point=new Point(10,10);
			 
			 //map
			 
			 var map_window:Bitmap=new Bitmap(new BitmapData(900,900,false,0x00000000));
			 var map_window_holder:Sprite=new Sprite;
			 var map_back:Bitmap=new Bitmap(new BitmapData(640,360,false,0x00000000));
			 var draged:Boolean=false;
			 
			 //game menu
			 
			 var game_menu_window:Bitmap=new Bitmap(new game_menu_win);
			 var game_menu_restart_button_holder:Sprite=new Sprite;
			 var game_menu_restart_button:Bitmap=new Bitmap(new game_menu_restart_but);
			 var game_menu_music_button_holder:Sprite=new Sprite;
			 var game_menu_music_button:Bitmap=new Bitmap(new game_menu_mus_but);
			 var game_menu_sound_button_holder:Sprite=new Sprite;
			 var game_menu_sound_button:Bitmap=new Bitmap(new game_menu_sou_but);
			 var game_menu_quit_button_holder:Sprite=new Sprite;
			 var game_menu_quit_button:Bitmap=new Bitmap(new game_menu_qui_but);
			 
		//cheet vars
		
		var through_walls:Boolean=false;
			
		//game
		
		public function doc()
		{
			preload();
			menu_main();
			var save_game:SharedObject=SharedObject.getLocal("01000001011010000111001001101001");
			save_game.flush(120000);
			var save_game_old:SharedObject=SharedObject.getLocal("010000010110100001110010011010012");
			save_game_old.flush(120000);
		}
		public function preload()
		{
			format.font=font1.fontName;
			format.size=20;
			format2.font=font1.fontName;
			format2.size=15;
			format3.font=font1.fontName;
			format3.size=20;
			format3.align='center';
			format_lv.font=font1.fontName;
			format_lv.size=14;
			format_lv.align='center'
			//ui
			for(var X:int=0;X<4;X++)
			{
				hotkeys_holder[X].x=5;
				hotkeys_holder[X].y=154+51*X;
			}
			info_bar_holder.x=440;info_bar_holder.y=0;
			hp_info_bar.x=29;hp_info_bar.y=4;
			xp_info_bar.x=80;xp_info_bar.y=40;
			info_bar2_holder.x=440;info_bar2_holder.y=285;
			menu_button_holder.x=145;menu_button_holder.y=14;
			map_button_holder.x=85;map_button_holder.y=14;
			hotkeys_cov[0].y=154;
			hotkeys_cov[1].y=205;
			hotkeys_cov[2].y=256;
			hotkeys_cov[3].y=307;
			hotkeys_cov[0].x=hotkeys_cov[1].x=hotkeys_cov[2].x=hotkeys_cov[3].x=5;
			floor_t.mouseEnabled=false;
			floor_t.border=true;
			floor_t.embedFonts=true;
			floor_t.defaultTextFormat=format;
			floor_t.antiAliasType=AntiAliasType.ADVANCED;
			//inventory
			inventory_window_holder.x=60;
			delete_item_button_holder.x=443;delete_item_button_holder.y=300;
			upgrade_item_button_holder.x=532;upgrade_item_button_holder.y=300;
			grid_holder.x=445;grid_holder.y=17;
			display_energy.mouseEnabled=display_attack.mouseEnabled=display_magicattack.mouseEnabled=display_defense.mouseEnabled=display_magicdefense.mouseEnabled=display_sell.mouseEnabled=display_buy.mouseEnabled=display_bonus.mouseEnabled=false;
			display_energy.border=display_attack.border=display_magicattack.border=display_defense.border=display_magicdefense.border=display_bonus.border=display_sell.border=display_buy.border=false;
			display_energy.embedFonts=display_attack.embedFonts=display_magicattack.embedFonts=display_defense.embedFonts=display_magicdefense.embedFonts=display_sell.embedFonts=display_buy.embedFonts=display_bonus.embedFonts=true;
			display_energy.defaultTextFormat=display_attack.defaultTextFormat=display_magicattack.defaultTextFormat=display_defense.defaultTextFormat=display_magicdefense.defaultTextFormat=display_sell.defaultTextFormat=display_buy.defaultTextFormat=display_bonus.defaultTextFormat=format;
			display_energy.antiAliasType=display_attack.antiAliasType=display_magicattack.antiAliasType=display_defense.antiAliasType=display_magicdefense.antiAliasType=display_sell.antiAliasType=display_buy.antiAliasType=display_bonus.antiAliasType=AntiAliasType.ADVANCED;
			display_energy.wordWrap=display_attack.wordWrap=display_magicattack.wordWrap=display_defense.wordWrap=display_magicdefense.wordWrap=display_bonus.wordWrap=true;
			display_attack.width=display_magicattack.width=display_defense.width=display_magicdefense.width=78;
			display_attack.height=display_magicattack.height=display_defense.height=display_magicdefense.height=36;
			display_energy.width=display_bonus.width=162;display_bonus.height=76;
			display_energy.height=30;
			display_energy.y=260;
			display_energy.x=display_attack.x=display_magicattack.x=display_bonus.x=445;
			display_defense.x=display_magicdefense.x=529;
			display_attack.y=display_defense.y=128;
			display_magicattack.y=display_magicdefense.y=168;
			display_bonus.y=208;
			display_sell.width=display_buy.width=75;display_sell.height=display_buy.height=30;
			display_sell.y=display_buy.y=20;
			//stats
			stats_menu_contents[0].x=80;stats_menu_contents[0].y=100;
			stats_menu_contents[1].x=270;stats_menu_contents[1].y=stats_menu_text[1].y=100;stats_menu_text[1].x=330;
			stats_menu_contents[2].x=80;stats_menu_contents[2].y=stats_menu_text[2].y=180;stats_menu_text[2].x=140;
			stats_menu_contents[3].x=270;stats_menu_contents[3].y=stats_menu_text[3].y=180;stats_menu_text[3].x=330;
			stats_menu_contents[4].x=80;stats_menu_contents[4].y=stats_menu_text[4].y=260;stats_menu_text[4].x=140;
			stats_menu_contents[5].x=270;stats_menu_contents[5].y=stats_menu_text[5].y=260;stats_menu_text[5].x=330;
			stats_menu_text[0].x=stats_menu_text[2].x=stats_menu_text[4].x=132;
			stats_menu_text[1].x=stats_menu_text[3].x=stats_menu_text[5].x=322;
			stats_menu_text[0].y=stats_menu_text[1].y=112;
			stats_menu_text[2].y=stats_menu_text[3].y=192;
			stats_menu_text[4].y=stats_menu_text[5].y=272;
			stats_bot_text.mouseEnabled=stats_side_text.mouseEnabled=stats_top_text.mouseEnabled=stats_menu_text[0].mouseEnabled=stats_menu_text[1].mouseEnabled=stats_menu_text[2].mouseEnabled=stats_menu_text[3].mouseEnabled=stats_menu_text[4].mouseEnabled=stats_menu_text[5].mouseEnabled=false;
			stats_menu_text[0].embedFonts=stats_menu_text[1].embedFonts=stats_menu_text[2].embedFonts=stats_menu_text[3].embedFonts=stats_menu_text[4].embedFonts=stats_menu_text[5].embedFonts=true;
			stats_menu_text[0].defaultTextFormat=stats_menu_text[1].defaultTextFormat=stats_menu_text[2].defaultTextFormat=stats_menu_text[3].defaultTextFormat=stats_menu_text[4].defaultTextFormat=stats_menu_text[5].defaultTextFormat=format_lv;
			stats_menu_text[0].antiAliasType=stats_menu_text[1].antiAliasType=stats_menu_text[2].antiAliasType=stats_menu_text[3].antiAliasType=stats_menu_text[4].antiAliasType=stats_menu_text[5].antiAliasType=AntiAliasType.ADVANCED;
			stats_menu_text[0].width=stats_menu_text[1].width=stats_menu_text[2].width=stats_menu_text[3].width=stats_menu_text[4].width=stats_menu_text[5].width=52;
			stats_menu_text[0].height=stats_menu_text[1].height=stats_menu_text[2].height=stats_menu_text[3].height=stats_menu_text[4].height=stats_menu_text[5].height=26;
			stats_top_text.height=40;stats_top_text.width=400;
			stats_top_text.x=60;stats_top_text.y=35;
			stats_side_text.height=240;stats_side_text.width=150;
			stats_side_text.x=476;stats_side_text.y=10;
			stats_side_text.wordWrap=true;
			stats_bot_text.height=32;stats_bot_text.width=158;
			stats_bot_text.x=475;stats_bot_text.y=257;
			holder_restore_button.x=470;holder_restore_button.y=300;
			holder_increase_stat_button.x=580;holder_increase_stat_button.y=300;
			stats_top_text.embedFonts=stats_side_text.embedFonts=stats_bot_text.embedFonts=true;
			stats_top_text.defaultTextFormat=format3;
			stats_side_text.defaultTextFormat=stats_bot_text.defaultTextFormat=format;
			stats_top_text.antiAliasType=stats_side_text.antiAliasType=stats_bot_text.antiAliasType=AntiAliasType.ADVANCED;
			//abilities
			abilities_window.x=60;abilities_window.y=0;
			for(var X:int=0;X<6;X++)
			{
				for(var Y:int=0;Y<4;Y++)
				{
					abilities_menu_holder[X][Y].x=62+X*66;
					abilities_menu_holder[X][Y].y=10+Y*86;
					abilities_menu_text[X][Y].width=50;abilities_menu_text[X][Y].height=35;
					abilities_menu_text[X][Y].x=62+X*66;abilities_menu_text[X][Y].y=60+Y*85;
					abilities_menu_bitmap_ex[X][Y].x=62+X*66;
					abilities_menu_bitmap_ex[X][Y].y=60+Y*86;
					abilities_menu_text[X][Y].mouseEnabled=false;
					abilities_menu_text[X][Y].embedFonts=true;
					abilities_menu_text[X][Y].defaultTextFormat=format_lv;
					abilities_menu_text[X][Y].antiAliasType=AntiAliasType.ADVANCED;
				}
			}
			abilities_side_text.mouseEnabled=abilities_bot_text.mouseEnabled=false;
			abilities_side_text.width=158,abilities_side_text.height=240;
			abilities_side_text.x=472,abilities_side_text.y=10;
			abilities_bot_text.width=158;abilities_bot_text.height=26;
			abilities_bot_text.x=470;abilities_bot_text.y=257;
			abilities_side_text.embedFonts=abilities_bot_text.embedFonts=true;
			abilities_bot_text.defaultTextFormat=format;
			abilities_side_text.defaultTextFormat=format2;
			abilities_side_text.antiAliasType=abilities_bot_text.antiAliasType=AntiAliasType.ADVANCED;
			increase_ability_holder.x=580;increase_ability_holder.y=300;
			abilities_restore_holder.x=470;abilities_restore_holder.y=300;
			//map
			map_window.x=60;map_window.y=0;
			//game menu
			game_menu_window.x=0;game_menu_window.y=0;
			game_menu_restart_button_holder.x=240;game_menu_restart_button_holder.y=60;
			game_menu_quit_button_holder.x=240;game_menu_quit_button_holder.y=180;
		}
		
		//menu
		
		public function menu_main():void
		{
			addChild(m_m_window);
			addChild(stb);
			addChild(cob);
			stb.x=225;
			cob.x=418;
			stb.y=cob.y=200;
			crb.y=heb.y=300;
			crb.x=200;
			heb.x=440;
			stb.addEventListener(MouseEvent.CLICK,start_game);
			cob.addEventListener(MouseEvent.CLICK,continue_game);
		}
		public function start_game(e:MouseEvent):void
		{	
			delete_menu();
			player_level=1;
			xp=0;
			needed_xp=100;
			for(var X:int=0;X<6;X++)
			{
				for(var Y:int=0;Y<4;Y++)
				{
					if(Y==0)
					{
						player_abilities[X][Y]=1;
						player_abilities_old[X][Y]=1;
					}
					else
					{
						player_abilities[X][Y]=0;
						player_abilities_old[X][Y]=0;
					}
				}
			}
			abilities_alpha_change();
			for(var X:int=0;X<6;X++)
			{
				player_stats[X]=1;
				player_stats_old[X]=1;
				player_stats_full[X]=1;
			}
			energy=energy_old=0;
			free_points=0;
			free_points_old=0;
			player_side=0;
			hp=total_hp=10;
			ba_re=0;
			hotkeys_bitmap=new Array(new Bitmap(new sta),new Bitmap(new sta),new Bitmap(new sta),new Bitmap(new sta));
			hotkeys_set=new Array(new Point(10,10),new Point(10,10),new Point(10,10),new Point(10,10));
			inventory_contents=new Array(Vector.<int>([0,0,3,2,0,1,0,0]),Vector.<int>([1,0,2,1,0,0,0,0]),Vector.<int>([2,0,0,1,3,2,0,0]));
			for(var X:int=0;X<6;X++)
			{
				equiped_items[X]=100;
			}
			init_af_cr=true;
			map_creation_main();
		}
		public function continue_game(e:MouseEvent):void
		{
			var save_game:SharedObject=SharedObject.getLocal("01000001011010000111001001101001");
			if(save_game.data.level_number!=undefined)
			{
				delete_menu();
				level_num=save_game.data.level_number;
				level=save_game.data.level;
				treasure=save_game.data.treasure;
				explored=save_game.data.explored;
				enemies=save_game.data.enemies;
				player_pos.x=save_game.data.player_pos.x;
				player_pos.y=save_game.data.player_pos.y;
				hp=save_game.data.hp;
				total_hp=save_game.data.total_hp;
				player_level=save_game.data.player_level;
				player_stats=player_stats_old=save_game.data.player_stats;
				player_abilities=player_abilities_old=save_game.data.player_abilities;
				player_stats_full=save_game.data.player_stats_full;
				free_points=free_points_old=save_game.data.free_points;
				xp=save_game.data.xp;
				needed_xp=save_game.data.needed_xp;
				energy=energy_old=save_game.data.energy
				particles=save_game.data.particles;
				ba_re=save_game.data.ba_re;
				hotkeys_set=save_game.data.hotkeys_set;
				inventory_contents=save_game.data.inventory_contents;
				equiped_items=save_game.data.equiped_items;
				init_af_cr=true;
				map_initialization();
			}
		}
		public function delete_menu():void
		{
			stb.removeEventListener(MouseEvent.CLICK,start_game);
			cob.removeEventListener(MouseEvent.CLICK,continue_game);
			removeChild(stb);
			removeChild(cob);
			removeChild(m_m_window);
		}
		
		//map creation
		
		public function map_creation_main():void
		{
			addChild(lb);
			lb.x=0;
			lb.y=0;
			create_blank_level();
			generate_sewer_start();
		}
		public function create_blank_level():void
		{
			for(var m:int=0;m<100;m++)
			{
				level[m]=new Vector.<int>;
				treasure[m]= new Vector.<int>;
				enemies[m]= new Vector.<int>;
				for(var n:int=0;n<100;n++)
				{
					level[m][n]=0;
					treasure[m][n]=0;
					enemies[m][n]=0;
				}
			}
			for(var m:int=0;m<20;m++)
			{
				chunks[m]= new Vector.<int>;
				sewer_chunks[m]= new Vector.<int>;
				access[m]= new Vector.<int>;
				explored[m]= new Vector.<int>;
				for(var n:int=0;n<20;n++)
				{
					chunks[m][n]=0;
					sewer_chunks[m][n]=0;
					access[m][n]=0;
					explored[m][n]=0;
				}
			}
			sewer_length=0;
			conti=false
			aaa=0;
		
		}
		public function generate_sewer_start():void
		{
			var s_start_x:int=Math.floor(Math.random()*18+1);
			var s_start_y:int=Math.floor(Math.random()*18+1);
			
			sewer_chunks[s_start_x][s_start_y]=9;
			access[s_start_x][s_start_y]=3;
			addEventListener(Event.ENTER_FRAME,generate_sewer);
		}
		public function generate_sewer(e:Event):void
		{
			for(var m:int=1;m<19;m++)
			{
				for(var n:int=1;n<19;n++)
				{
					if(sewer_chunks[m][n]>0)
					{
						if(sewer_chunks[m][n]==5||sewer_chunks[m][n]==7)// connects sewer chunks to available sides of other chunks
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
		public function generate_map(e:Event):void
		{
			var i:int=Math.floor(Math.random()*(rooms.length-3)+3);
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
								while(rooms[i][22]!=5)i=Math.floor(Math.random()*(rooms.length-3)+3);
								chunks[n][m-1]=i;
								access[n][m-1]=1;
								i=Math.floor(Math.random()*(rooms.length-3)+3);
							}
						}
						if(n+1!=20&&access[n+1][m]==0)
						{
							if(rooms[chunks[n][m]][14]==5)
							{
								while(rooms[i][10]!=5)i=Math.floor(Math.random()*(rooms.length-3)+3);
								chunks[n+1][m]=i;
								access[n+1][m]=1;
								i=Math.floor(Math.random()*(rooms.length-3)+3);
							}
						}
						if(m+1!=20&&access[n][m+1]==0)
						{
							if(rooms[chunks[n][m]][22]==5)
							{
								while(rooms[i][2]!=5)i=Math.floor(Math.random()*(rooms.length-3)+3);
								chunks[n][m+1]=i;
								access[n][m+1]=1;
								i=Math.floor(Math.random()*(rooms.length-3)+3);
							}
						}
						if(n-1!=-1&&access[n-1][m]==0)
						{
							if(rooms[chunks[n][m]][10]==5)
							{
								while(rooms[i][14]!=5)i=Math.floor(Math.random()*(rooms.length-3)+3);
								chunks[n-1][m]=i;
								access[n-1][m]=1;
								i=Math.floor(Math.random()*(rooms.length-3)+3);
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
				var poi:Point=new Point(Math.floor(Math.random()*20),Math.floor(Math.random()*20));
				while(access[poi.x][poi.y]!=2)
				{
					poi=new Point(Math.floor(Math.random()*20),Math.floor(Math.random()*20));
				}
				chunks[poi.x][poi.y]=2;
				create_level();
				create_treasure();
				create_enemies();
				clear_area();
				if(init_af_cr)map_initialization();
			}
			else conti=false;
		}
		public function create_level():void
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
			for(var X:int=0;X<100;X++)//sets outside blocks to walls
			{
				level[X][0]=1;
				level[X][99]=1;
				level[0][X]=1;
				level[99][X]=1;
			}
		}
		public function create_treasure():void
		{
			for(var m:int=0;m<100;m++)
			{
				for(var n:int=0;n<100;n++)
				{
					if(level[n][m]==5)
					{
						var mat:Number=Math.random();
						if(mat>0.998)treasure[n][m]=3;
						else if(mat>0.99)treasure[n][m]=2;
						else if(mat>0.96)treasure[n][m]=1;
					}
				}
			}
		}
		public function create_enemies():void
		{
			var en_nu:int=0;
			en_nu=level_num+1;
			if(en_nu>9)en_nu=9;
			for(var m:int=0;m<100;m++)
			{
				for(var n:int=0;n<100;n++)
				{
					if(level[n][m]==5)
					{
						var mat:Number=Math.random();
						if(mat>Math.pow(0.983,level_num))enemies[n][m]=Math.floor(Math.random()*en_nu)+2;
					}
				}
			}
		}
		public function clear_area():void
		{
			while(level[player_pos.x][player_pos.y]!=5||(player_pos.x<15||player_pos.x>85||player_pos.y<15||player_pos.y>85))player_pos=new Point(Math.floor(Math.random()*100),Math.floor(Math.random()*100));
			for(var X:int=0;X<11;X++)
			{
				for(var Y:int=0;Y<11;Y++)
				{
					enemies[player_pos.x-5+X][player_pos.y-5+Y]=0;
				}
			}
			for(var X:int=0;X<5;X++)
			{
				for(var Y:int=0;Y<5;Y++)
				{
					treasure[player_pos.x-2+X][player_pos.y-2+Y]=0;
				}
			}
		}
		
		//game 
		
		public function map_initialization():void
		{
			var p:Point=new Point(0,0);
			var p_pos_temp:Point=new Point(player_pos.x,player_pos.y);
			if(p_pos_temp.x<10)p_pos_temp.x=10;
			else if(p_pos_temp.x>89)p_pos_temp.x=89;
			if(p_pos_temp.y<10)p_pos_temp.y=10;
			else if(p_pos_temp.y>89)p_pos_temp.y=89;
			if(level_num>3) bs_sheet=new bs2;
			else bs_sheet=new bs;
			addChild(blocks);
			blocks.x=-180+(p_pos_temp.x-player_pos.x)*50;
			blocks.y=-320+(p_pos_temp.y-player_pos.y)*50;
			for(var m:int=0;m<=20;m++)
			{
				for(var n:int=0;n<=20;n++)
				{
					bs_rect.x=(level[p_pos_temp.x+n-10][p_pos_temp.y+m-10]%10)*50;
					bs_rect.y=(Math.floor(level[p_pos_temp.y+m-10][p_pos_temp.y+m-10]/10))*50;
					p.x=n*50;
					p.y=m*50;
					blocks.bitmapData.copyPixels(bs_sheet,bs_rect,p);
					if(treasure[p_pos_temp.x+n-10][p_pos_temp.y+m-10]!=0)
					{
						bs_rect.x=treasure[p_pos_temp.x+n-10][p_pos_temp.y+m-10]*50-50;
						bs_rect.y=0;
						blocks.bitmapData.copyPixels(treasure_sheet,bs_rect,p,null,null,true);
					}
					if(enemies[p_pos_temp.x+n-10][p_pos_temp.y+m-10]!=0)
					{
						enemies_cur.push(new enemies_array[enemies[p_pos_temp.x+n-10][p_pos_temp.y+m-10]](p_pos_temp.x+n-10,p_pos_temp.y+m-10,level_num));
						enemies_cur[enemies_cur.length-1].x=345+(n-10)*50+(p_pos_temp.x-player_pos.x)*50;
						enemies_cur[enemies_cur.length-1].y=205+(m-10)*50+(p_pos_temp.y-player_pos.y)*50;
						addChild(enemies_cur[enemies_cur.length-1]);
						enemies_cur[enemies_cur.length-1].addEventListener("OBSTACLE",call_pathfinder);
						enemies_cur[enemies_cur.length-1].addEventListener("DAMAGE_RECIEVE",damage_recieve);
						enemies_cur[enemies_cur.length-1].addEventListener("ENEMY_DEAD",xp_increase);
					}
				}
			}
			bs_rect.x=0;
			bs_rect.y=0;
			p=new Point(0,0);
			char_gra.bitmapData.copyPixels(new char_sp,bs_rect,p,null,null,true);
			addChild(char_gra_holder);
			char_gra_holder.addChild(char_gra);
			char_gra_holder.x=345;
			char_gra_holder.y=205;
			char_gra.x=-25;
			char_gra.y=-25;
			update_stats();
			UI_init();
			game_init();
			flush_game_data();
			flush_game_data_old();
			for(var m:int=0;m<100;m++)
			{
				for(var n:int=0;n<100;n++)
				{
					if(level[n][m]==2)
					{
						trace(n,m);
						return;
					}
				}
			}
		}
		public function UI_init():void
		{
			addChild(taskbar_holder);
			taskbar_holder.x=taskbar.y=0;
			taskbar_holder.addChild(taskbar);
			taskbar_holder.addChild(inventory_holder);
			inventory_holder.addChild(inventory);
			inventory_holder.x=5;
			inventory_holder.y=1;
			inventory_holder.addEventListener(MouseEvent.CLICK,inventory_open);
			taskbar_holder.addChild(stats_button_holder);
			stats_button_holder.x=5;
			stats_button_holder.y=52;
			stats_button_holder.addChild(stats_button);
			stats_button_holder.addEventListener(MouseEvent.CLICK,stats_open);
			taskbar_holder.addChild(abilities_holder);
			abilities_holder.x=5;
			abilities_holder.y=103;
			abilities_holder.addChild(abilities);
			abilities_holder.addEventListener(MouseEvent.CLICK,abilities_open);
			for(var X:int=0;X<4;X++)
			{
				taskbar_holder.addChild(hotkeys_holder[X]);
				hotkeys_holder[X].addChild(hotkeys_bitmap[X]);
			}
			addChild(info_bar_holder);
			info_bar_holder.addChild(info_bar);
			info_bar_holder.addChild(hp_info_bar);
			info_bar_holder.addChild(xp_info_bar);
			info_bar_holder.addEventListener(MouseEvent.ROLL_OVER,roll_over);
			info_bar_holder.addEventListener(MouseEvent.ROLL_OUT,roll_out);
			hp_info_bar.width=160*hp/total_hp;
			xp_info_bar.width=110*xp/needed_xp;
			addChild(info_bar2_holder);
			info_bar2_holder.addChild(info_bar2);
			info_bar2_holder.addChild(map_button_holder);
			map_button_holder.addChild(map_button);
			map_button_holder.addEventListener(MouseEvent.CLICK,map_open);
			info_bar2_holder.addChild(menu_button_holder);
			menu_button_holder.addChild(menu_button);
			menu_button_holder.addEventListener(MouseEvent.CLICK,game_menu_open);
			info_bar2_holder.addEventListener(MouseEvent.ROLL_OVER,roll_over);
			info_bar2_holder.addEventListener(MouseEvent.ROLL_OUT,roll_out);
			info_bar_holder.x=info_bar2_holder.x=440;
			addChild(fog1);
			fog1.alpha=1;
			fog1.x=60;
			for(var X:int=0;X<4;X++)
			{
				addChild(hotkeys_cov[X]);
			}
			hotkeys_refresh();
		}
		public function game_init():void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyboard_up);
			addEventListener(Event.ENTER_FRAME,gameLoop);
			addEventListener(Event.EXIT_FRAME,setDepth);
		}
		public function roll_over(e:MouseEvent):void
		{
			e.target.x=440;
		}
		public function roll_out(e:MouseEvent):void
		{
			if(inv_open||abi_open||sta_open||ma_open||gam_men_open)e.target.x=620;
		}
		public function check_open(num:int):void
		{
			if(inv_open&&num!=1)inventory_close();
			else if(sta_open&&num!=2)stats_close();
			else if(abi_open&&num!=3)abilities_close();
			else if(ma_open&&num!=4)map_close();
			else if(gam_men_open&&num!=5)game_menu_close();
			if(inv_open||sta_open||abi_open||ma_open||gam_men_open)
			{
				if(addListeners[0]==true)removeEventListener(Event.ENTER_FRAME,gameLoop);
				if(addListeners[1]==true)stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
				if(addListeners[2]==true)stage.removeEventListener(KeyboardEvent.KEY_UP,keyboard_up);
				info_bar_holder.x=info_bar2_holder.x=620;
			}
			else
			{
				if(addListeners[0]==true)addEventListener(Event.ENTER_FRAME,gameLoop);
				if(addListeners[1]==true)stage.addEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
				if(addListeners[2]==true)stage.addEventListener(KeyboardEvent.KEY_UP,keyboard_up);
				info_bar_holder.x=info_bar2_holder.x=440;
			}
		}
		public function inventory_open(e:MouseEvent):void
		{
			if(inv_open==false)
			{
				inv_open=true;
				check_open(1);
				addChild(inventory_window_holder);
				inventory_window_holder.addChild(inventory_window);
				addChild(delete_item_button_holder);
				delete_item_button_holder.addChild(delete_item_button);
				delete_item_button_holder.addChild(display_sell);
				addChild(upgrade_item_button_holder);
				upgrade_item_button_holder.addChild(upgrade_item_button);
				upgrade_item_button_holder.addChild(display_buy);
				addChild(grid_holder);
				grid_holder.addChild(inventory_grid);
				addChild(display_attack);
				addChild(display_magicattack);
				addChild(display_defense);
				addChild(display_magicdefense);
				addChild(display_bonus);
				addChild(display_energy);
				display_energy.text=String(energy);
				inventory_sort_all();
				render_grid();
				addChild(sel_b);
				sel_b.x=sel_b.y=-100;
				inventory_window_holder.addEventListener(MouseEvent.CLICK,display_parameters);
				delete_item_button_holder.addEventListener(MouseEvent.CLICK,delete_item);
				upgrade_item_button_holder.addEventListener(MouseEvent.CLICK,upgrade_item);
				grid_holder.addEventListener(MouseEvent.CLICK, equip_item);
			}
			else
			{
				check_open(0)
			}
		}
		public function inventory_sort_all():void
		{
			inventory_sort_main(0,30,18,true);
			for(var Y:int=1;Y<8;Y++)
			{
				inventory_sort_main(Y,p1,p2,false);
			}
		}
		public function inventory_sort_main(type,m:int,n:int,reset:Boolean):void
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
					if(p.x<250)p.x+=54;
					else {p.y+=54;p.x=30;}
				}
			}
			p1=p.x;
			p2=p.y;
		}
		public function display_parameters(e:MouseEvent):void
		{
			if(e.localX>28&&e.localY>18&&e.localX-28<324&&e.localY-18<324)
			{
				item_place=Math.floor((e.localX-28)/54)+Math.floor((e.localY-18)/54)*6;
				sel_b.x=89+Math.floor((e.localX-28)/54)*54;
				sel_b.y=19+Math.floor((e.localY-18)/54)*54;
				display_parameters_2();
			}
		}
		public function display_parameters_2():void
		{
			num=0;
			for(var I:int=0;I<8;I++)display_parameters_main(I,item_place);
		}
		public function display_parameters_main(type:int,place:int):void
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
							display_defense.text=inventory_contents[X][3];
							display_magicattack.text=inventory_contents[X][4];
							display_magicdefense.text=inventory_contents[X][5];
							if(inventory_contents[X][6]!=0)
							{
								display_bonus.text="+";
								display_bonus.text+=(inventory_contents[X][7]/100);
								display_bonus.appendText("% ");
								display_bonus.appendText(words[inventory_contents[X][6]]);
								display_sell.text=String(sell_cost(X));
								display_buy.text=String(upg_cost(X));
							}
							else
							{
								display_sell.text=String(sell_cost(X));
								display_buy.text=String(upg_cost(X));
								display_bonus.text="";
							}
							num++;
							selected_item=X;
							break;
						}
						else num++;
					}
				}
			}
		}
		public function sell_cost(p:int):int
		{
			if(inventory_contents[p][6]!=0)return(Math.floor(inventory_contents[p][2]+inventory_contents[p][3]+inventory_contents[p][4]+inventory_contents[p][5]+inventory_contents[p][7]*0.05))
			else return(Math.floor(inventory_contents[p][2]+inventory_contents[p][3]+inventory_contents[p][4]+inventory_contents[p][5]));
		}
		public function upg_cost(p:int):int
		{
			if(inventory_contents[p][6]!=0)return(Math.floor((inventory_contents[p][2]+inventory_contents[p][3]+inventory_contents[p][4]+inventory_contents[p][5]+inventory_contents[p][7]*0.1)*0.5))
			else return(Math.floor((inventory_contents[p][2]+inventory_contents[p][3]+inventory_contents[p][4]+inventory_contents[p][5])*0.5));
		}
		public function equip_item(e:MouseEvent):void
		{
			var place:int=Math.floor(e.localX/54)+Math.floor(e.localY/54)*3;
			
			if(selected_item<inventory_contents.length)
			{
				var sel:int=inventory_contents[selected_item][0];
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
				update_stats();
			}
		}
		public function add_item():void
		{
			var AttackCo:Vector.<Number>=new <Number>[1,0.8,0.35,0.2,0.45,0.35,0.4];
			var DefenseCo:Vector.<Number>=new <Number>[0.6,0.3,0.5,1,0.75,0.35,0.4];
			var MagAttackCo:Vector.<Number>=new <Number>[0.3,0.4,1,0.2,0.3,0.35,0.4];
			var MagDefenseCo:Vector.<Number>=new <Number>[0.4,0.3,0.6,0.75,0.5,0.35,0.4];
			var p:Point=new Point;
			
			inventory_contents.push(new Vector.<int>);
			inventory_contents[inventory_contents.length-1][0]=Math.floor(Math.random()*7);//type
			//inventory_contents[inventory_contents.length-1][1]=Math.floor(3*Math.random())+level_num-1;//bitmap
			inventory_contents[inventory_contents.length-1][1]=Math.floor(10*Math.random());
			if(inventory_contents[inventory_contents.length-1][1]>9)inventory_contents[inventory_contents.length-1][1]=Math.floor(3*Math.random())+7;
			if(inventory_contents[inventory_contents.length-1][0]!=7)
			{
				inventory_contents[inventory_contents.length-1][2]=(7*level_num-7+Math.floor(Math.random()*7))*AttackCo[inventory_contents[inventory_contents.length-1][0]];//attack
				inventory_contents[inventory_contents.length-1][3]=(7*level_num-7+Math.floor(Math.random()*7))*DefenseCo[inventory_contents[inventory_contents.length-1][0]];//defense
				inventory_contents[inventory_contents.length-1][4]=(7*level_num-7+Math.floor(Math.random()*7))*MagAttackCo[inventory_contents[inventory_contents.length-1][0]];//magic attack
				inventory_contents[inventory_contents.length-1][5]=(7*level_num-7+Math.floor(Math.random()*7))*MagDefenseCo[inventory_contents[inventory_contents.length-1][0]];//magic defense
				if(inventory_contents[inventory_contents.length-1][0]==6)
				{
					inventory_contents[inventory_contents.length-1][6]=Math.floor(Math.random()*6+1);
					inventory_contents[inventory_contents.length-1][7]=Math.floor(Math.random()*1000+100);
				}
				else if(Math.random()>0.5)
				{
					inventory_contents[inventory_contents.length-1][6]=Math.floor(Math.random()*6+1);//bonus stat
					inventory_contents[inventory_contents.length-1][7]=Math.floor(Math.random()*750+100);//bonus amount percent
				}
				else
				{
					inventory_contents[inventory_contents.length-1][6]=0;
					inventory_contents[inventory_contents.length-1][7]=0;
				}
			}
			treasure[player_pos.x][player_pos.y]=0;
			bs_rect.x=(level[player_pos.x][player_pos.y]%10)*50;
			bs_rect.y=(Math.floor(level[player_pos.x][player_pos.y]/10))*50;
			if(player_pos.x<10)p.x=player_pos.x*50;
			else if(player_pos.x>89)p.x=1000-(99-player_pos.x)*50;
			else p.x=500;
			if(player_pos.y<10)p.y=player_pos.y*50;
			else if(player_pos.y>89)p.y=1000-(99-player_pos.y)*50;
			else p.y=500
			blocks.bitmapData.copyPixels(bs_sheet,bs_rect,p);
		}
		public function upgrade_item(e:MouseEvent):void
		{
			if(item_place!=100&&item_place<inventory_contents.length&&energy>=Math.floor((inventory_contents[selected_item][2]+inventory_contents[selected_item][3]+inventory_contents[selected_item][4]+inventory_contents[selected_item][5]+inventory_contents[selected_item][7]*10)*0.5))
			{
				inventory_contents[selected_item][2]=Math.round(inventory_contents[selected_item][2]*(1+0.05+0.1*Math.random()));
				inventory_contents[selected_item][3]=Math.round(inventory_contents[selected_item][3]*(1+0.05+0.1*Math.random()));
				inventory_contents[selected_item][4]=Math.round(inventory_contents[selected_item][4]*(1+0.05+0.1*Math.random()));
				inventory_contents[selected_item][5]=Math.round(inventory_contents[selected_item][5]*(1+0.05+0.1*Math.random()));
				if(inventory_contents[selected_item][6]!=0&&Math.random()>Math.sqrt(Math.sqrt(inventory_contents[selected_item][7]/100)))inventory_contents[selected_item][7]=Math.ceil(inventory_contents[selected_item][7]*(1+0.05+0.1*Math.random()));
				energy-=upg_cost(selected_item);
				display_parameters_2();
			}
			display_energy.text=String(energy);
		}
		public function delete_item(e:MouseEvent):void
		{
			if(item_place!=100&&item_place<inventory_contents.length)
			{
				energy+=sell_cost(selected_item);
				inventory_contents.splice(selected_item,1);
				for(var X:int=0;X<6;X++)
				{
					if(selected_item==equiped_items[X])equiped_items[X]=100;
					if(selected_item<equiped_items[X]&&equiped_items[X]!=100)equiped_items[X]-=1;
				}
				inventory_sort_all();
				display_parameters_2();
				render_grid();
			}
			display_energy.text=String(energy);
		}
		public function render_grid():void
		{
			var p:Point=new Point(0,0);
			
			inventory_grid.bitmapData=new gri;
			for(var Y:int=0;Y<6;Y++)
			{
				if(equiped_items[Y]!=100)
				{
					p.x=Y%3*54+2;
					p.y=Math.floor(Y/3)*54+2;
					bs_rect.x=0;
					bs_rect.y=0;
					inventory_grid.bitmapData.copyPixels(new gr_bl,bs_rect,p,null,null,false);
					bs_rect.x=inventory_contents[equiped_items[Y]][1]*50;
					bs_rect.y=inventory_contents[equiped_items[Y]][0]*50;
					inventory_grid.bitmapData.copyPixels(stuff_sheet,bs_rect,p,null,null,false);
				}
			}
		}
		public function inventory_close():void
		{
			removeChild(sel_b);
			energy_old=energy;
			update_stats();
			inventory_window_holder.removeEventListener(MouseEvent.CLICK,display_parameters);
			delete_item_button_holder.removeEventListener(MouseEvent.CLICK,delete_item);
			grid_holder.removeEventListener(MouseEvent.CLICK, equip_item);
			upgrade_item_button_holder.removeEventListener(MouseEvent.CLICK,upgrade_item);
			inventory_window_holder.removeChild(inventory_window);
			removeChild(inventory_window_holder);
			removeChild(display_attack);
			removeChild(display_magicattack);
			removeChild(display_defense);
			removeChild(display_magicdefense);
			removeChild(display_bonus);
			removeChild(display_energy);
			upgrade_item_button_holder.removeChild(display_buy);
			upgrade_item_button_holder.removeChild(upgrade_item_button);
			removeChild(upgrade_item_button_holder);
			delete_item_button_holder.removeChild(display_sell);
			delete_item_button_holder.removeChild(delete_item_button);
			removeChild(delete_item_button_holder);
			grid_holder.removeChild(inventory_grid);
			removeChild(grid_holder);
			display_attack.text="";
			display_magicattack.text="";
			display_defense.text="";
			display_magicdefense.text="";
			display_bonus.text="";
			display_sell.text="";
			display_buy.text="";
			inv_open=false;
		}
		public function stats_open(e:MouseEvent):void
		{
			if(sta_open)
			{
				check_open(0)
			}
			else
			{
				sta_open=true;
				check_open(2);
				addChild(stats_window);
				stats_window.x=60;
				stats_window.y=0;
				for(var X:int=0;X<6;X++)
				{
					addChild(stats_menu_contents[X]);
					stats_menu_contents[X].addChild(stats_menu_bitmaps[X]);
					addChild(stats_menu_text[X]);
					stats_menu_text[X].text=String(player_stats[X]);
					stats_menu_contents[X].addEventListener(MouseEvent.CLICK,stats_select);
				}
				addChild(stats_top_text);
				stats_top_text.text="Level "+String(player_level)+", XP "+String(xp)+"/"+String(needed_xp);
				addChild(stats_side_text);
				addChild(stats_bot_text);
				stats_bot_text.text="Points left: "+String(free_points);
				addChild(holder_restore_button);
				holder_restore_button.addChild(restore_button);
				holder_restore_button.addEventListener(MouseEvent.CLICK,stats_restore);
				addChild(holder_increase_stat_button);
				holder_increase_stat_button.addChild(increase_stat_button);
				holder_increase_stat_button.addEventListener(MouseEvent.CLICK,stats_increase);
				addChild(stats_xp_bar);
				stats_xp_bar.width=300*(xp/needed_xp);
				stats_xp_bar.x=111;stats_xp_bar.y=71;
				addChild(sel_b);
				sel_b.x=sel_b.y=-100;
			}
		}
		public function stats_select(e:MouseEvent):void
		{
			stat_num=stats_menu_contents.indexOf(e.target,0);
			sel_b.x=e.target.x;
			sel_b.y=e.target.y;
			stats_side_text.text=stats_des[stat_num];
		}
		public function stats_increase(e:MouseEvent):void
		{
			if(stat_num!=7&&free_points>0)
			{
				player_stats[stat_num]+=1;
				free_points--;
				stats_bot_text.text="Points left: "+String(free_points);
				stats_menu_text[stat_num].text=String(player_stats[stat_num]);
			}
		}
		public function stats_restore(e:MouseEvent):void
		{
			for(var X:int=0;X<6;X++)
			{
				player_stats[X]=player_stats_old[X];
				stats_menu_text[X].text=String(player_stats[X]);
			}
			free_points=free_points_old;
			stats_bot_text.text="Points left: "+String(free_points);
		}
		public function stats_close():void
		{
			removeChild(sel_b);
			removeChild(stats_xp_bar);
			for(var X:int=0;X<6;X++)
			{
				player_stats_full[X]=0;
			}
			for(var X:int=0;X<6;X++)
			{
				if(equiped_items[X]!=100)
				{
					player_stats_full[0]+=inventory_contents[equiped_items[X]][2];
					player_stats_full[1]+=inventory_contents[equiped_items[X]][3];
					player_stats_full[2]+=inventory_contents[equiped_items[X]][4];
					player_stats_full[3]+=inventory_contents[equiped_items[X]][5];
				}
			}
			if(player_stats_full[0]>player_stats[0])player_stats_full[0]=2*player_stats[0]+0.5*(player_stats_full[0]-player_stats[0])
			else player_stats_full[0]+=player_stats[0];
			player_stats_full[1]+=player_stats[1];
			if(player_stats_full[2]>player_stats[2])player_stats_full[2]=2*player_stats[2]+0.5*(player_stats_full[2]-player_stats[2])
			else player_stats_full[2]+=player_stats[2];
			player_stats_full[3]+=player_stats[3];
			
			for(var X:int=0;X<6;X++)
			{
				player_stats_old[X]=player_stats[X];
			}
			free_points_old=free_points;
			holder_increase_stat_button.removeEventListener(MouseEvent.CLICK,stats_increase);
			holder_increase_stat_button.removeChild(increase_stat_button);
			removeChild(holder_increase_stat_button);
			holder_restore_button.removeEventListener(MouseEvent.CLICK,stats_restore);
			holder_restore_button.removeChild(restore_button);
			removeChild(holder_restore_button);
			removeChild(stats_bot_text);
			removeChild(stats_top_text);
			stats_side_text.text="";
			removeChild(stats_side_text);
			for(var X:int=0;X<6;X++)
			{
				stats_menu_contents[X].removeEventListener(MouseEvent.CLICK,stats_select);
				removeChild(stats_menu_text[X]);
				stats_menu_contents[X].removeChild(stats_menu_bitmaps[X]);
				removeChild(stats_menu_contents[X]);
			}
			removeChild(stats_window)
			sta_open=false;
			stat_num=7;
			update_stats();
		}
		public function abilities_open(e:MouseEvent):void
		{
			if(abi_open)
			{
				check_open(0);
			}
			else
			{
				abi_open=true;
				check_open(3);
				addChild(abilities_window);
				for(var X:int=0;X<6;X++)
				{
					for(var Y:int=0;Y<4;Y++)
					{
						addChild(abilities_menu_holder[X][Y]);
						abilities_menu_holder[X][Y].addEventListener(MouseEvent.CLICK,abilities_select);
						abilities_menu_holder[X][Y].addChild(abilities_menu_bitmap[X][Y]);
						addChild(abilities_menu_bitmap_ex[X][Y]);
						addChild(abilities_menu_text[X][Y]);
						abilities_menu_text[X][Y].text="Lv. "+String(player_abilities[X][Y]);
					}
				}
				addChild(abilities_side_text);
				abilities_side_text.text="";
				addChild(abilities_bot_text);
				abilities_bot_text.text=String(energy);
				addChild(increase_ability_holder);
				increase_ability_holder.addChild(increase_ability);
				increase_ability_holder.addEventListener(MouseEvent.CLICK,abilities_increase);
				addChild(abilities_restore_holder);
				abilities_restore_holder.addChild(abilities_restore);
				abilities_restore_holder.addEventListener(MouseEvent.CLICK,abilities_restore_fun);
				for(var X:int=0;X<4;X++)
				{
					hotkeys_holder[X].addEventListener(MouseEvent.CLICK,abilities_equip);
				}
				addChild(sel_b);
				sel_b.x=sel_b.y=-100;
				abi_open=true;
			}
		}
		public function abilities_select(e:MouseEvent)
		{
			var str:String=new String;
			if(abilities_menu_holder[0].indexOf(e.target,0)!=-1){ability_num.x=0,ability_num.y=abilities_menu_holder[0].indexOf(e.target,0)}
			else if(abilities_menu_holder[1].indexOf(e.target,0)!=-1){ability_num.x=1,ability_num.y=abilities_menu_holder[1].indexOf(e.target,0)}
			else if(abilities_menu_holder[2].indexOf(e.target,0)!=-1){ability_num.x=2,ability_num.y=abilities_menu_holder[2].indexOf(e.target,0)}
			else if(abilities_menu_holder[3].indexOf(e.target,0)!=-1){ability_num.x=3,ability_num.y=abilities_menu_holder[3].indexOf(e.target,0)}
			else if(abilities_menu_holder[4].indexOf(e.target,0)!=-1){ability_num.x=4,ability_num.y=abilities_menu_holder[4].indexOf(e.target,0)}
			else {ability_num.x=5,ability_num.y=abilities_menu_holder[5].indexOf(e.target,0)}
			str="Upgrade cost: "+abilities_info[ability_num.x][ability_num.y][0]+'\n';
			if(abilities_info[ability_num.x][ability_num.y][1]!=0)
			{
				str+="Base damage: "+String(abilities_info[ability_num.x][ability_num.y][1])+" (+"+String(Math.floor(0.1*abilities_info[ability_num.x][ability_num.y][1]))+")"+'\n';
				str+="Damage: "+String(Math.floor(abilities_info[ability_num.x][ability_num.y][1]+player_stats_full[0]*abilities_coe[ability_num.x][ability_num.y][0]+player_stats_full[2]*abilities_coe[ability_num.x][ability_num.y][1]))+" (+"+String(Math.floor(0.1*abilities_info[ability_num.x][ability_num.y][1]))+")"+'\n';
			}
			if(abilities_info[ability_num.x][ability_num.y][2]!=0)str+="Healing: "+String(abilities_info[ability_num.x][ability_num.y][2])+" (+"+String(abilities_info[ability_num.x][ability_num.y][2]*0.1)+")"+'\n';
			if(abilities_info[ability_num.x][ability_num.y][4]!=0)str+="Stun duration: "+String((Math.round((abilities_info[ability_num.x][ability_num.y][4]/30)*100))/100)+" ("+String((Math.round(((Math.floor(abilities_info[ability_num.x][ability_num.y][4]+(27000/(Math.pow(abilities_info[ability_num.x][ability_num.y][4],2)))))/30)*100))/100)+")"+'\n';
			if(abilities_info[ability_num.x][ability_num.y][3]!=0)str+="Recharge: "+String((Math.round((abilities_info[ability_num.x][ability_num.y][3]/30)*100))/100)+" ("+String((Math.round(((Math.floor(abilities_info[ability_num.x][ability_num.y][3]*0.99))/30)*100))/100)+")"+'\n';
			abilities_side_text.text=str;
			sel_b.x=62+ability_num.x*66;
			sel_b.y=10+ability_num.y*86;
		}
		public function abilities_increase(e:MouseEvent):void
		{
			if(ability_num.x!=10&&energy>=abilities_info[ability_num.x][ability_num.y][0]&&(ability_num.y==0||player_abilities[ability_num.x][ability_num.y-1]!=0))
			{
				energy-=abilities_info[ability_num.x][ability_num.y][0];
				abilities_info[ability_num.x][ability_num.y][0]=Math.floor(abilities_info[ability_num.x][ability_num.y][0]*1.15);
				abilities_info[ability_num.x][ability_num.y][1]=Math.floor(abilities_info[ability_num.x][ability_num.y][1]*1.1);
				abilities_info[ability_num.x][ability_num.y][2]=Math.floor(abilities_info[ability_num.x][ability_num.y][2]*1.1);
				abilities_info[ability_num.x][ability_num.y][3]=Math.floor(abilities_info[ability_num.x][ability_num.y][3]*0.99);
				if(abilities_info[ability_num.x][ability_num.y][4]!=0)abilities_info[ability_num.x][ability_num.y][4]=Math.floor(abilities_info[ability_num.x][ability_num.y][4]+(27000/(Math.pow(abilities_info[ability_num.x][ability_num.y][4],2))))
				abilities_bot_text.text=String(energy);
				player_abilities[ability_num.x][ability_num.y]+=1;
				abilities_menu_text[ability_num.x][ability_num.y].text="Lv. "+String(player_abilities[ability_num.x][ability_num.y]);
				abilities_alpha_change();
				var str:String=new String;
				str="Upgrade cost: "+abilities_info[ability_num.x][ability_num.y][0]+'\n';
				if(abilities_info[ability_num.x][ability_num.y][1]!=0)
				{
					str+="Base damage: "+String(abilities_info[ability_num.x][ability_num.y][1])+" (+"+String(Math.floor(0.1*abilities_info[ability_num.x][ability_num.y][1]))+")"+'\n';
					str+="Damage: "+String(Math.floor(abilities_info[ability_num.x][ability_num.y][1]+player_stats_full[0]*abilities_coe[ability_num.x][ability_num.y][0]+player_stats_full[2]*abilities_coe[ability_num.x][ability_num.y][1]))+" (+"+String(Math.floor(0.1*abilities_info[ability_num.x][ability_num.y][1]))+")"+'\n';
				}
				if(abilities_info[ability_num.x][ability_num.y][2]!=0)str+="Healing: "+String(abilities_info[ability_num.x][ability_num.y][2])+" (+"+String(abilities_info[ability_num.x][ability_num.y][2]*0.1)+")"+'\n';
				if(abilities_info[ability_num.x][ability_num.y][4]!=0)str+="Stun duration: "+String((Math.round((abilities_info[ability_num.x][ability_num.y][4]/30)*100))/100)+" ("+String((Math.round(((Math.floor(abilities_info[ability_num.x][ability_num.y][4]+(27000/(Math.pow(abilities_info[ability_num.x][ability_num.y][4],2)))))/30)*100))/100)+")"+'\n';
				if(abilities_info[ability_num.x][ability_num.y][3]!=0)str+="Recharge: "+String((Math.round((abilities_info[ability_num.x][ability_num.y][3]/30)*100))/100)+" ("+String((Math.round(((Math.floor(abilities_info[ability_num.x][ability_num.y][3]*0.99))/30)*100))/100)+")"+'\n';
				abilities_side_text.text=str;
			}
		}
		public function abilities_restore_fun(e:MouseEvent):void
		{
			for(var X:int=0;X<6;X++)
			{
				for(var Y:int=0;Y<4;Y++)
				{
					player_abilities[X][Y]=player_abilities_old[X][Y];
					abilities_menu_text[X][Y].text="Lv. "+String(player_abilities[X][Y]);
				}
			}
			abilities_alpha_change();
			energy=energy_old;
			abilities_bot_text.text=String(energy);
			for(var X:int=0;X<4;X++)
			{
				if(hotkeys_set[X].x!=10&&player_abilities[hotkeys_set[X].x][hotkeys_set[X].y]==0)hotkeys_set[X].x=hotkeys_set[X].y=10;
			}
			hotkeys_refresh();
		}
		public function abilities_alpha_change():void
		{
			for(var X:int=0;X<6;X++)
			{
				for(var Y:int=0;Y<4;Y++)
				{
					if(player_abilities[X][Y]==0)
					{
						abilities_menu_bitmap[X][Y].alpha=0.5;
						abilities_menu_bitmap_ex[X][Y].alpha=0.5;
					}
					else
					{
						abilities_menu_bitmap[X][Y].alpha=1;
						abilities_menu_bitmap_ex[X][Y].alpha=1;
					}
				}
			}
		}
		public function abilities_close():void
		{
			removeChild(sel_b);
			for(var X:int=0;X<4;X++)
			{
				hotkeys_holder[X].removeEventListener(MouseEvent.CLICK,abilities_equip);
			}
			abilities_restore_holder.removeEventListener(MouseEvent.CLICK,abilities_restore_fun);
			abilities_restore_holder.removeChild(abilities_restore);
			removeChild(abilities_restore_holder);
			increase_ability_holder.removeEventListener(MouseEvent.CLICK,abilities_increase);
			increase_ability_holder.removeChild(increase_ability);
			removeChild(increase_ability_holder);
			removeChild(abilities_bot_text);
			abilities_side_text.text="";
			ability_num.x=ability_num.y=10;
			removeChild(abilities_side_text);
			for(var X:int=0;X<6;X++)
			{
				for(var Y:int=0;Y<4;Y++)
				{
					removeChild(abilities_menu_text[X][Y]);
					removeChild(abilities_menu_bitmap_ex[X][Y]);
					abilities_menu_holder[X][Y].removeChild(abilities_menu_bitmap[X][Y]);
					abilities_menu_holder[X][Y].removeEventListener(MouseEvent.CLICK,abilities_select);
					removeChild(abilities_menu_holder[X][Y]);
				}
			}
			removeChild(abilities_window);
			abi_open=false;
			for(var X:int=0;X<6;X++)
			{
				for(var Y:int=0;Y<4;Y++)
				{
					player_abilities_old[X][Y]=player_abilities[X][Y];
				}
			}
			energy_old=energy;
			update_stats();
		}
		public function abilities_equip(e:MouseEvent):void
		{
			if(ability_num.x!=10&&player_abilities[ability_num.x][ability_num.y]!=0&&hotkeys_recharge[hotkeys_holder.indexOf(e.target,0)]==0)
			{
				for(var X:int=0;X<4;X++)
				{
					if(hotkeys_set[X].x==ability_num.x&&hotkeys_set[X].y==ability_num.y)
					{
						if(hotkeys_recharge[X]==0)
						{
							hotkeys_set[X].x=10;
							X=4;
						}
						else return;
					}
				}
				hotkeys_set[hotkeys_holder.indexOf(e.target,0)].x=ability_num.x;
				hotkeys_set[hotkeys_holder.indexOf(e.target,0)].y=ability_num.y;
				hotkeys_refresh();
			}
		}
		public function hotkeys_refresh():void
		{
			for(var X:int=0;X<4;X++)
			{
				if(hotkeys_set[X].x!=10)hotkeys_bitmap[X].bitmapData=abilities_menu_bitmap[hotkeys_set[X].x][hotkeys_set[X].y].bitmapData;
				else hotkeys_bitmap[X].bitmapData=new empty_cell;
			}
		}
		public function update_stats():void
		{
			var bon:Vector.<Number>=new <Number>[0,0,0,0,0,0,0];
			
			for(var X:int=0;X<6;X++)
			{
				player_stats_full[X]=0;
			}
			for(var X:int=0;X<6;X++)
			{
				if(equiped_items[X]!=100)
				{
					player_stats_full[0]+=inventory_contents[equiped_items[X]][2];
					player_stats_full[1]+=inventory_contents[equiped_items[X]][3];
					player_stats_full[2]+=inventory_contents[equiped_items[X]][4];
					player_stats_full[3]+=inventory_contents[equiped_items[X]][5];
					if(inventory_contents[equiped_items[X]][6]!=0)bon[inventory_contents[equiped_items[X]][6]]+=inventory_contents[equiped_items[X]][7];
				}
			}
			player_stats_full[0]+=player_stats[0];
			player_stats_full[1]+=player_stats[1];
			player_stats_full[2]+=player_stats[2];
			player_stats_full[3]+=player_stats[3];
			player_stats_full[0]=Math.floor(player_stats_full[0]*(1+(bon[1]/100)));
			player_stats_full[1]=Math.floor(player_stats_full[1]*(1+(bon[2]/100)));
			player_stats_full[2]=Math.floor(player_stats_full[2]*(1+(bon[3]/100)));
			player_stats_full[3]=Math.floor(player_stats_full[3]*(1+(bon[4]/100)));
			co_p=100/(player_stats_full[1]/2+100);
			co_m=100/(player_stats_full[3]/2+100);
			cr_ch=100/(player_stats[4]/(-4)-100)+1+bon[5]/10000;
			trace(co_p,co_m,cr_ch);
		}
		public function map_open(e:MouseEvent):void
		{
			if(ma_open)
			{
				check_open(0);
			}
			else
			{
				ma_open=true;
				check_open(4);
				addChild(map_back);
				addChild(map_window_holder);
				map_window_holder.addChild(map_window);
				var rect:Rectangle=new Rectangle(0,0,9,9);
				for(var n:int=0;n<99;n++)
				{
					for(var m:int=0;m<99;m++)
					{
						if(explored[Math.floor(m/5)][Math.floor(n/5)]==1)
						{
							if(level[m][n]==5)map_window.bitmapData.fillRect(rect,0x00996633);
							else if(level[m][n]==6)map_window.bitmapData.fillRect(rect,0x000096ff);
							else map_window.bitmapData.fillRect(rect,0x00ffffff);
						}
						else map_window.bitmapData.fillRect(rect,0x00000000);
						rect.x+=9;
					}
					rect.y+=9;
					rect.x=0;
				}
				rect.x=9*player_pos.x;
				rect.y=9*player_pos.y;
				map_window.bitmapData.fillRect(rect,0x00ff0000);
				map_window_holder.addEventListener(MouseEvent.CLICK, drag);
				map_window_holder.x=285-9*player_pos.x;
				map_window_holder.y=205-9*player_pos.y;
			}
		}
		public function drag(e:MouseEvent):void
		{
			if(draged)
			{
				map_window_holder.stopDrag();
				draged=false;
			}
			else 
			{
				map_window_holder.startDrag();
				draged=true;
			}
		}
		public function map_close():void
		{
			if(draged)
			{
				map_window_holder.stopDrag();
				draged=false;
			}
			ma_open=false;
			map_window_holder.removeChild(map_window);
			map_window_holder.removeEventListener(MouseEvent.CLICK,drag);
			removeChild(map_window_holder);
			removeChild(map_back);
		}
		public function game_menu_open(e:MouseEvent):void
		{
			if(gam_men_open)
			{
				check_open(0);
			}
			else
			{
				gam_men_open=true;
				check_open(5);
				addChild(game_menu_window);
				addChild(game_menu_restart_button_holder);
				game_menu_restart_button_holder.addChild(game_menu_restart_button);
				game_menu_restart_button_holder.addEventListener(MouseEvent.CLICK,game_menu_restart);
				addChild(game_menu_quit_button_holder);
				game_menu_quit_button_holder.addChild(game_menu_quit_button);
				game_menu_quit_button_holder.addEventListener(MouseEvent.CLICK,game_menu_quit);
			}
		}
		public function game_menu_quit(e:MouseEvent):void
		{
			flush_game_data();
			game_quit();
			game_menu_close();
			menu_main();
		}
		public function game_quit():void
		{
			flush_game_data();
			removeChild(fog1);
			menu_button_holder.removeEventListener(MouseEvent.CLICK,game_menu_open);
			menu_button_holder.removeChild(menu_button);
			info_bar2_holder.removeChild(menu_button_holder);
			map_button_holder.removeEventListener(MouseEvent.CLICK,map_open);
			map_button_holder.removeChild(map_button);
			info_bar2_holder.removeChild(map_button_holder);
			info_bar2_holder.removeChild(info_bar2);
			removeChild(info_bar2_holder);
			info_bar_holder.removeChild(xp_info_bar);
			info_bar_holder.removeChild(hp_info_bar);
			info_bar_holder.removeChild(info_bar);
			removeChild(info_bar_holder);
			for(var X:int=0;X<4;X++)
			{
				hotkeys_holder[X].removeChild(hotkeys_bitmap[X]);
				taskbar_holder.removeChild(hotkeys_holder[X]);
			}
			abilities_holder.removeEventListener(MouseEvent.CLICK,abilities_open);
			abilities_holder.removeChild(abilities);
			taskbar_holder.removeChild(abilities_holder);
			stats_button_holder.removeEventListener(MouseEvent.CLICK,stats_open);
			stats_button_holder.removeChild(stats_button);
			taskbar_holder.removeChild(stats_button_holder);
			inventory_holder.removeEventListener(MouseEvent.CLICK,inventory_open);
			inventory_holder.removeChild(inventory);
			taskbar_holder.removeChild(inventory_holder);
			taskbar_holder.removeChild(taskbar);
			addChild(taskbar_holder);
			removeChild(char_gra_holder);
			for(var X:int=enemies_cur.length-1;X>=0;X--)
			{
				enemies_cur[X].addEventListener("OBSTACLE",call_pathfinder);
				enemies_cur[X].addEventListener("DAMAGE_RECIEVE",damage_recieve);
				enemies_cur[X].addEventListener("ENEMY_DEAD",xp_increase);
				removeChild(enemies_cur[X]);
				enemies_cur.pop();
			}
			removeChild(blocks);
			for(var X:int=particles.length-1;X>=0;X--)
			{
				removeChild(particles[X]);
				particles.pop();
			}
			removeEventListener(Event.EXIT_FRAME,setDepth);
			removeEventListener(Event.ENTER_FRAME,gameLoop);
			info_bar_holder.x=info_bar2_holder.x=440;
			timer=0;
			speed=5;
			time_cons=10;
		}
		public function game_menu_restart(e:MouseEvent):void
		{
			game_quit();
			game_menu_close();
			restart_ac();
		}
		public function restart_ac():void
		{
			var save_game:SharedObject=SharedObject.getLocal("010000010110100001110010011010012");
			level_num=save_game.data.level_number;
			hp=save_game.data.hp;
			total_hp=save_game.data.total_hp;
			player_level=save_game.data.player_level;
			player_stats=player_stats_old=save_game.data.player_stats;
			player_abilities=player_abilities_old=save_game.data.player_abilities;
			player_stats_full=save_game.data.player_stats_full;
			free_points=free_points_old=save_game.data.free_points;
			xp=save_game.data.xp;
			needed_xp=save_game.data.needed_xp;
			energy=energy_old=save_game.data.energy
			ba_re=save_game.data.ba_re;
			hotkeys_set=save_game.data.hotkeys_set;
			inventory_contents=save_game.data.inventory_contents;
			equiped_items=save_game.data.equiped_items;
			hotkeys_recharge[0]=0;
			hotkeys_recharge[1]=0;
			hotkeys_recharge[2]=0;
			hotkeys_recharge[3]=0;
			hotkeys_cov[0].width=0;
			hotkeys_cov[1].width=0;
			hotkeys_cov[2].width=0;
			hotkeys_cov[3].width=0;
			map_creation_main();
		}
		public function game_menu_close():void
		{
			gam_men_open=false;
			game_menu_quit_button_holder.removeEventListener(MouseEvent.CLICK,game_menu_quit);
			game_menu_quit_button_holder.removeChild(game_menu_quit_button);
			removeChild(game_menu_quit_button_holder);
			game_menu_restart_button_holder.removeChild(game_menu_restart_button);
			removeChild(game_menu_restart_button_holder);
			removeChild(game_menu_window);
		}
		public function flush_game_data():void
		{
			var save_game:SharedObject=SharedObject.getLocal("01000001011010000111001001101001");
			save_game.clear();
			for(var X:int=enemies_cur.length-1;X>=0;X--)
			{
				enemies[enemies_cur[X].posX][enemies_cur[X].posY]=enemies_cur[X].ar;
			}
			save_game.data.level_number=level_num;
			save_game.data.level=level;
			save_game.data.treasure=treasure;
			save_game.data.explored=explored;
			save_game.data.enemies=enemies;
			save_game.data.player_pos=player_pos;
			save_game.data.hp=hp;
			save_game.data.total_hp=total_hp;
			save_game.data.player_level=player_level;
			save_game.data.player_stats=player_stats;
			save_game.data.player_abilities=player_abilities;
			save_game.data.player_stats_full=player_stats_full;
			save_game.data.free_points=free_points;
			save_game.data.xp=xp;
			save_game.data.needed_xp=needed_xp;
			save_game.data.energy=energy
			save_game.data.particles=particles;
			save_game.data.ba_re=ba_re;
			save_game.data.hotkeys_set=hotkeys_set;
			save_game.data.inventory_contents=inventory_contents;
			save_game.data.equiped_items=equiped_items;
			save_game.flush(120000);
		}
		public function flush_game_data_old():void
		{
			var save_game_old:SharedObject=SharedObject.getLocal("010000010110100001110010011010012");
			save_game_old.clear();
			save_game_old.data.level_number=level_num;
			save_game_old.data.hp=hp;
			save_game_old.data.total_hp=total_hp;
			save_game_old.data.player_level=player_level;
			save_game_old.data.player_stats=player_stats;
			save_game_old.data.player_abilities=player_abilities;
			save_game_old.data.player_stats_full=player_stats_full;
			save_game_old.data.free_points=free_points;
			save_game_old.data.xp=xp;
			save_game_old.data.needed_xp=needed_xp;
			save_game_old.data.energy=energy
			save_game_old.data.ba_re=ba_re;
			save_game_old.data.hotkeys_set=hotkeys_set;
			save_game_old.data.inventory_contents=inventory_contents;
			save_game_old.data.equiped_items=equiped_items;
			save_game_old.flush(120000);
		}
		//abilities
		public function abi_fireball():void
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==2)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==2))
			{
				particles.push(new fireball_class(player_side,false,distance_water(),abilities_info[0][0][1]+player_stats_full[0]*abilities_coe[0][0][0]+player_stats_full[2]*abilities_coe[0][0][1]));
				addChild(particles[particles.length-1]);
			}
		}
		public function abi_explosion():void
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==2)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==2))
			{
				particles.push(new explosion_class(345,205,abilities_info[0][1][1]+player_stats_full[0]*abilities_coe[0][1][0]+player_stats_full[2]*abilities_coe[0][1][1]));
				addChild(particles[particles.length-1]);
			}
		}
		public function abi_dragon_breath():void
		{
			/*if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==2)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==2))*/db_len=60;
		}
		public function abi_fire_sphere():void
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==2)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==2))
			{
				particles.push(new fireball_class(player_side,true,distance_water(),abilities_info[0][3][1]+player_stats_full[0]*abilities_coe[0][3][0]+player_stats_full[2]*abilities_coe[0][3][1]));
				addChild(particles[particles.length-1]);
			}
		}
		public function abi_heal():void
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==2)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==2))
			{
				particles.push(new heal_class(false));
				hp+=abilities_info[1][0][2];
				if(hp>total_hp)hp=total_hp;
				particles[particles.length-1].x=345;
				particles[particles.length-1].y=205;
				hp_info_bar.width=160*(hp/total_hp);
				addChild(particles[particles.length-1]);
			}
		}
		public function abi_icicle():void
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==2)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==2))
			{
				particles.push(new icicle_class(player_side,distance(player_side),abilities_info[1][1][1]+player_stats_full[0]*abilities_coe[1][1][0]+player_stats_full[2]*abilities_coe[1][1][1],abilities_info[1][1][4]));
				addChild(particles[particles.length-1]);
			}
		}
		public function abi_razors()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==2)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==2))
				ra_len=60;
		}
		public function abi_hail()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==2)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==2))
				ha_len=90;
		}
		public function abi_boulder()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==2)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==2))
			{
				particles.push(new boulder_class(player_side,distance(player_side),abilities_info[2][0][1]+player_stats_full[0]*abilities_coe[2][0][0]+player_stats_full[2]*abilities_coe[2][0][1]));
				addChild(particles[particles.length-1]);
			}
		}
		public function abi_spikes()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==2)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==2))
			{
				particles.push(new spikes_class(player_side,abilities_info[2][1][1]+player_stats_full[0]*abilities_coe[2][1][0]+player_stats_full[2]*abilities_coe[2][1][1],abilities_info[2][1][4],345,205));
				addChild(particles[particles.length-1]);
			}
		}
		public function abi_stone_shield()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==2)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==2))
			{
				stsh_len=150;
				particles.push(new stone_shield_class(abilities_info[2][2][1]+player_stats_full[0]*abilities_coe[2][2][0]+player_stats_full[2]*abilities_coe[2][2][1]));
				addChild(particles[particles.length-1]);
			}
		}
		public function abi_earthquake()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==2)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==2))
			{
				ea_len=90;
				for(var X:int=0;X<enemies_cur.length-1;X++)enemies_cur[X].stuned=abilities_info[2][3][4];
			}
		}
		public function abi_rapid_shot()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==1)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==1))
			{
				rs_len=10;
			}
		}
		public function abi_scatter_shot()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==1)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==1))
			{
				for(var X:int=0;X<10;X++)
				{
					particles.push(new bullet(player_side,true,true,distance(player_side),abilities_info[3][1][1]+player_stats_full[0]*abilities_coe[3][1][0]+player_stats_full[2]*abilities_coe[3][1][1],player_pos.x*50,player_pos.y*50));
					addChild(particles[particles.length-1]);
				}
			}
		}
		public function abi_escape_shot()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==1)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==1))
			if(timer==0)
			{
				for(var X:int=0;X<4;X++)
				{
					particles.push(new bullet(player_side,true,true,distance(player_side),abilities_info[3][1][1]+player_stats_full[0]*abilities_coe[3][1][0]+player_stats_full[2]*abilities_coe[3][1][1],player_pos.x*50,player_pos.y*50));
					addChild(particles[particles.length-1]);
				}
				if(player_side==0)
				{
					if((level[player_pos.x][player_pos.y+2]==5||level[player_pos.x][player_pos.y+2]==6)&&(level[player_pos.x][player_pos.y+1]==5||level[player_pos.x][player_pos.y+1]==6)&&enemies[player_pos.x][player_pos.y+2]==0)
					{
						es_len=3;
						stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
						stage.removeEventListener(KeyboardEvent.KEY_UP,keyboard_up);
					}
					else if((level[player_pos.x][player_pos.y+1]==5||level[player_pos.x][player_pos.y+1]==6)&&enemies[player_pos.x][player_pos.y+1]==0)
					{
						es_len=2;
						stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
						stage.removeEventListener(KeyboardEvent.KEY_UP,keyboard_up);
					}
				}
				else if(player_side==1)
				{
					if((level[player_pos.x-2][player_pos.y]==5||level[player_pos.x-2][player_pos.y]==6)&&(level[player_pos.x-1][player_pos.y]==5||level[player_pos.x-1][player_pos.y]==6)&&enemies[player_pos.x-2][player_pos.y]==0)
					{
						es_len=3;
						stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
						stage.removeEventListener(KeyboardEvent.KEY_UP,keyboard_up);
					}
					else if((level[player_pos.x-1][player_pos.y]==5||level[player_pos.x][player_pos.y-1]==6)&&enemies[player_pos.x-1][player_pos.y]==0)
					{
						es_len=2;
						stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
						stage.removeEventListener(KeyboardEvent.KEY_UP,keyboard_up);
					}
				}
				else if(player_side==2)
				{
					if((level[player_pos.x][player_pos.y-2]==5||level[player_pos.x][player_pos.y-2]==6)&&(level[player_pos.x][player_pos.y-1]==5||level[player_pos.x][player_pos.y-1]==6)&&enemies[player_pos.x][player_pos.y-2]==0)
					{
						es_len=3;
						stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
						stage.removeEventListener(KeyboardEvent.KEY_UP,keyboard_up);
					}
					else if((level[player_pos.x][player_pos.y-1]==5||level[player_pos.x][player_pos.y-1]==6)&&enemies[player_pos.x][player_pos.y-1]==0)
					{
						es_len=2;
						stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
						stage.removeEventListener(KeyboardEvent.KEY_UP,keyboard_up);
					}
				}
				else if(player_side==3)
				{
					if((level[player_pos.x+2][player_pos.y]==5||level[player_pos.x+2][player_pos.y]==6)&&(level[player_pos.x+1][player_pos.y]==5||level[player_pos.x+1][player_pos.y]==6)&&enemies[player_pos.x+2][player_pos.y]==0)
					{
						es_len=3;
						stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
						stage.removeEventListener(KeyboardEvent.KEY_UP,keyboard_up);
					}
					else if((level[player_pos.x+1][player_pos.y]==5||level[player_pos.x+1][player_pos.y]==6)&&enemies[player_pos.x+1][player_pos.y]==0)
					{
						es_len=2;
						stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
						stage.removeEventListener(KeyboardEvent.KEY_UP,keyboard_up);
					}
				}
			}
		}
		public function abi_bullet_hell()
		{
			bh_len=60;
		}
		public function abi_heavy_strike()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==0)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==0))
			{
				particles.push(new heavy_strike_class(player_side,abilities_info[4][0][1]+player_stats_full[0]*abilities_coe[4][0][0]+player_stats_full[2]*abilities_coe[4][0][1]));
				addChild(particles[particles.length-1]);
			}
		}
		public function abi_knock_out()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==0)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==0))
			{
				particles.push(new knock_out_class(player_side,abilities_info[4][1][1]+player_stats_full[0]*abilities_coe[4][1][0]+player_stats_full[2]*abilities_coe[4][1][1],abilities_info[4][1][4]));
				addChild(particles[particles.length-1]);
			}
		}
		public function abi_puller()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==0)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==0))
			if(timer==0)
			{
				lkd=rkd=ukd=dkd=false;
				particles.push(new puller_class(player_side,distance(player_side),abilities_info[4][2][1]+player_stats_full[0]*abilities_coe[4][2][0]+player_stats_full[2]*abilities_coe[4][2][1],abilities_info[4][2][4]));
				addChild(particles[particles.length-1]);
				stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
				addListeners[1]=false;
				pu_len=10;
			}
		}
		public function abi_crusher()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==0)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==0))
			{
				particles.push(new crusher_class(player_side,abilities_info[4][3][1]+player_stats_full[0]*abilities_coe[4][3][0]+player_stats_full[2]*abilities_coe[4][3][1],abilities_info[4][3][4]));
				addChild(particles[particles.length-1]);
			}
		}
		public function abi_needles()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==0)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==0))
			{
				ne_len=30;
			}
		}
		public function abi_charge()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==0)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==0))
			{
				if(timer==0)
				{
					particles.push(new charge_class(player_side,abilities_info[5][1][1]+player_stats_full[0]*abilities_coe[5][1][0]+player_stats_full[2]*abilities_coe[5][1][1]));
					addChild(particles[particles.length-1]);
					if(player_side==0)
					{
						if(level[player_pos.x][player_pos.y-1]==5||level[player_pos.x][player_pos.y-1]==6)
						{
							ch_len=2;
							stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
							stage.removeEventListener(KeyboardEvent.KEY_UP,keyboard_up);
							addListeners[1]=addListeners[2]=false;
							if(enemies[player_pos.x][player_pos.y-1]!=0)
							{
								ch_len--;
							}
							else if(level[player_pos.x][player_pos.y-2]==5||level[player_pos.x][player_pos.y-2]==6)
							{
								ch_len=3;
								if(enemies[player_pos.x][player_pos.y-2]!=0)
								{
									ch_len--;
								}
								else if(level[player_pos.x][player_pos.y-3]==5||level[player_pos.x][player_pos.y-3]==6)
								{
									ch_len=4;
									if(enemies[player_pos.x][player_pos.y-3]!=0)
									{
										ch_len--;
									}
								}
							}
						}
					}
					else if(player_side==1)
					{
						if(level[player_pos.x+1][player_pos.y]==5||level[player_pos.x+1][player_pos.y]==6)
						{
							ch_len=2;
							stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
							stage.removeEventListener(KeyboardEvent.KEY_UP,keyboard_up);
							addListeners[1]=addListeners[2]=false;
							if(enemies[player_pos.x+1][player_pos.y]!=0)
							{
								ch_len--;
							}
							else if(level[player_pos.x+2][player_pos.y]==5||level[player_pos.x+2][player_pos.y]==6)
							{
								ch_len=3;
								if(enemies[player_pos.x+2][player_pos.y]!=0)
								{
									ch_len--;
								}
								else if(level[player_pos.x+3][player_pos.y]==5||level[player_pos.x+3][player_pos.y]==6)
								{
									ch_len=4;
									if(enemies[player_pos.x+3][player_pos.y]!=0)
									{
										ch_len--;
									}
								}
							}
						}
					}
					else if(player_side==2)
					{
						if(level[player_pos.x][player_pos.y+1]==5||level[player_pos.x][player_pos.y+1]==6)
						{
							ch_len=2;
							stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
							stage.removeEventListener(KeyboardEvent.KEY_UP,keyboard_up);
							addListeners[1]=addListeners[2]=false;
							if(enemies[player_pos.x][player_pos.y+1]!=0)
							{
								ch_len--;
							}
							else if(level[player_pos.x][player_pos.y+2]==5||level[player_pos.x][player_pos.y+2]==6)
							{
								ch_len=3;
								if(enemies[player_pos.x][player_pos.y+2]!=0)
								{
									ch_len--;
								}
								else if(level[player_pos.x][player_pos.y+3]==5||level[player_pos.x][player_pos.y+3]==6)
								{
									ch_len=4;
									if(enemies[player_pos.x][player_pos.y+3]!=0)
									{
										ch_len--;
									}
								}
							}
						}
					}
					else if(player_side==3)
					{
						if(level[player_pos.x-1][player_pos.y]==5||level[player_pos.x-1][player_pos.y]==6)
						{
							ch_len=2;
							stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
							stage.removeEventListener(KeyboardEvent.KEY_UP,keyboard_up);
							addListeners[1]=addListeners[2]=false;
							if(enemies[player_pos.x-1][player_pos.y]!=0)
							{
								ch_len--;
							}
							else if(level[player_pos.x-2][player_pos.y]==5||level[player_pos.x-2][player_pos.y]==6)
							{
								ch_len=3;
								if(enemies[player_pos.x-2][player_pos.y]!=0)
								{
									ch_len--;
								}
								else if(level[player_pos.x-3][player_pos.y]==5||level[player_pos.x-3][player_pos.y]==6)
								{
									ch_len=4;
									if(enemies[player_pos.x-3][player_pos.y]!=0)
									{
										ch_len--;
									}
								}
							}
						}
					}
				}
			}
		}
		public function abi_sakura()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==0)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==0))
			{
				particles.push(new sakura_class(abilities_info[5][2][1]+player_stats_full[0]*abilities_coe[5][2][0]+player_stats_full[2]*abilities_coe[5][2][1]));
				addChild(particles[particles.length-1]);
			}
		}
		public function abi_overdrive()
		{
			//if((equiped_items[0]!=100&&inventory_contents[equiped_items[0]][0]==0)||(equiped_items[2]!=100&&inventory_contents[equiped_items[2]][0]==0))
			if(timer==0)
			{
				ov_len=150;
				speed=25;
				time_cons=2;
			}
		}
		//stuff
		public function distance(ps:int):int
		{
			var a:int=new int;
			if(ps==0)
			{
				for(var X:int=1;X<12;X++)
				{
					a=X-1;
					if(level[player_pos.x][player_pos.y-X]!=5&&level[player_pos.x][player_pos.y-X]!=6)break;
				}
			}
			else if(ps==1)
			{
				for(var X:int=1;X<12;X++)
				{
					a=X-1;
					if(level[player_pos.x+X][player_pos.y]!=5&&level[player_pos.x+X][player_pos.y]!=6)break;
				}
			}
			else if(ps==2)
			{
				for(var X:int=1;X<12;X++)
				{
					a=X-1;
					if(level[player_pos.x][player_pos.y+X]!=5&&level[player_pos.x][player_pos.y+X]!=6)break;
				}
			}
			else if(ps==3)
			{
				for(var X:int=1;X<12;X++)
				{
					a=X-1;
					if(level[player_pos.x-X][player_pos.y]!=5&&level[player_pos.x-X][player_pos.y]!=6)break;
				}
			}
			return(a);
		}
		public function distance_water():int
		{
			var a:int=new int;
			if(player_side==0)
			{
				for(var X:int=1;X<12;X++)
				{
					a=X-1;
					if(level[player_pos.x][player_pos.y-X]!=5)break;
				}
			}
			else if(player_side==1)
			{
				for(var X:int=1;X<12;X++)
				{
					a=X-1;
					if(level[player_pos.x+X][player_pos.y]!=5)break;
				}
			}
			else if(player_side==2)
			{
				for(var X:int=1;X<12;X++)
				{
					a=X-1;
					if(level[player_pos.x][player_pos.y+X]!=5)break;
				}
			}
			else if(player_side==3)
			{
				for(var X:int=1;X<12;X++)
				{
					a=X-1;
					if(level[player_pos.x-X][player_pos.y]!=5)break;
				}
			}
			return(a);
		}
		public function enemies_check():void
		{
			for(var X:int=0;X<enemies_cur.length;X++)
			{
				if(Math.abs(enemies_cur[X].x-320)+Math.abs(enemies_cur[X].y-180)<500)pathfinder(X,false);
				else enemies_cur[X].path_rec(Vector.<int>([0]));
			}
		}
		public function call_pathfinder(e:PathEvent):void
		{
			pathfinder(enemies_cur.indexOf(e.target,0),true);
		}
		public function pathfinder(sp:int,special:Boolean):void
		{
			var eneX:int=enemies_cur[sp].posX;
			var eneY:int=enemies_cur[sp].posY;
			var open_nodes:Array=[Vector.<int>([0,heuristic_distance(eneX,eneY,player_pos.x,player_pos.y),heuristic_distance(eneX,eneY,player_pos.x,player_pos.y),-1,player_pos.x,player_pos.y])];
			var closed_nodes:Array=new Array;
			var min_val:int=1000;
			var min_num:int=0;
			var l:int=0;
			
			while(closed_nodes.length<200)
			{
				if(open_nodes.length==0)break;
				min_val=1000;
				min_num=0;
				for(var X:int=0;X<open_nodes.length;X++)
				{
					if(open_nodes[X][2]<min_val)
					{
						min_num=X;
						min_val=open_nodes[X][2];
					}
				}
				closed_nodes.push(open_nodes[min_num]);
				open_nodes.splice(min_num,1);
				l=closed_nodes.length-1;
				if(closed_nodes[l][1]==0)
				{
					var path:Array=new Array;
					min_num=l;
					while(closed_nodes[min_num][3]!=-1)
					{
						if(path.length>10)return;
						path.push(Vector.<int>([closed_nodes[min_num][4],closed_nodes[min_num][5]]));
						min_num=closed_nodes[min_num][3];
					}
					enemies_cur[sp].path_rec(path_recons(path));
					return;
				}
				else
				{
					var b_num:int=new int;
					var pos_1:int=new int;
					var pos_2:int=new int;
					
					pos_1=closed_nodes[l][4];
					pos_2=closed_nodes[l][5]-1;
					b_num=level[pos_1][pos_2];
					if(special)add_nodes_special()
					else add_nodes();
					pos_1=closed_nodes[l][4]+1;
					pos_2=closed_nodes[l][5];
					b_num=level[pos_1][pos_2];
					if(special)add_nodes_special()
					else add_nodes();
					pos_1=closed_nodes[l][4];
					pos_2=closed_nodes[l][5]+1;
					b_num=level[pos_1][pos_2];
					if(special)add_nodes_special()
					else add_nodes();
					pos_1=closed_nodes[l][4]-1;
					pos_2=closed_nodes[l][5];
					b_num=level[pos_1][pos_2];
					if(special)add_nodes_special()
					else add_nodes();
					function add_nodes():void
					{
						if((b_num==5||b_num==6)&&check_closed_nodes())
						{
							var p0:int=1+closed_nodes[l][0];
							var place:int=check_open_nodes();
							if(place!=-1)
							{
								if(p0<open_nodes[place][0])
								{
									open_nodes[place][0]=p0;
									open_nodes[place][2]=p0+open_nodes[place][1];
									open_nodes[place][3]=l;
								}
							}
							else
							{
								var p1:int=heuristic_distance(eneX,eneY,pos_1,pos_2);
								open_nodes.push(Vector.<int>([p0,p1,p0+p1,l,pos_1,pos_2]))
							}
						}
					}
					function add_nodes_special():void
					{
						if(pos_1==eneX&&pos_2==eneY)
						{
							open_nodes.push(Vector.<int>([0,0,0,l,pos_1,pos_2]));
						}
						else if((b_num==5||b_num==6)&&(enemies[pos_1][pos_2]==0||enemies[pos_1][pos_2]==1)&&check_closed_nodes())
						{
							var p0:int=1+closed_nodes[l][0];
							var place:int=check_open_nodes();
							if(enemies[pos_1][pos_2]==1)p0+=5;
							if(place!=-1)
							{
								if(p0<open_nodes[place][0])
								{
									open_nodes[place][0]=p0;
									open_nodes[place][2]=p0+open_nodes[place][1];
									open_nodes[place][3]=l;
								}
							}
							else
							{
								var p1:int=heuristic_distance(eneX,eneY,pos_1,pos_2);
								open_nodes.push(Vector.<int>([p0,p1,p0+p1,l,pos_1,pos_2]))
							}
						}
					}
					function check_closed_nodes():Boolean
					{
						for(var X:int=0;X<l;X++)
						{
							if(closed_nodes[X][4]==pos_1&&closed_nodes[X][5]==pos_2)
							{
								return(false);
							}
						}
						return(true);
					}
					function check_open_nodes():int
					{
						var l1:int=open_nodes.length;
						for(var X:int=0;X<l1;X++)
						{
							if(open_nodes[X][4]==pos_1&&open_nodes[X][5]==pos_2)
							{
								return(X);
							}
						}
						return(-1);
					}
				}
			}
			enemies_cur[sp].path=new Vector.<int>;
		}
		public function heuristic_distance(X:int,Y:int,X1:int,Y1:int):int
		{
			return(Math.abs(X1-X)+Math.abs(Y1-Y));
		}
		public function path_recons(a:Array):Vector.<int>
		{
			var return_vec:Vector.<int>=new Vector.<int>;
			var pX:int=player_pos.x;
			var pY:int=player_pos.y;
			
			for(var X:int=a.length-1;X>=0;X--)
			{
				if(pX==a[X][0])
				{
					if(pY-a[X][1]>0)return_vec.push(2)
					else return_vec.push(0);
				}
				else if(pX-a[X][0]>0)return_vec.push(1)
				else return_vec.push(3);
				pX=a[X][0];
				pY=a[X][1];
			}
			return(return_vec);
		}
		public function basic_attack():void
		{
			if(ov_len>0)
			{
				abi_needles();
			}
			else
			{
				if(equiped_items[0]!=100)
				{
					if(inventory_contents[equiped_items[0]][0]==0)
					{
						particles.push(new slash(player_side,player_stats_full[0]));
						addChild(particles[particles.length-1]);
					}
					else if(inventory_contents[equiped_items[0]][0]==1)
					{
						particles.push(new bullet(player_side,false,false,distance(player_side),player_stats_full[0]*0.6,player_pos.x*50,player_pos.y*50));
						addChild(particles[particles.length-1]);
					}
					else if(inventory_contents[equiped_items[0]][0]==2)
					{
						particles.push(new ball(player_side,distance(player_side),player_stats_full[2]*0.75));
						addChild(particles[particles.length-1]);
					}
				}
				if(equiped_items[2]!=100)
				{
					if(inventory_contents[equiped_items[2]][0]==0)
					{
						particles.push(new slash(player_side,player_stats_full[0]));
						addChild(particles[particles.length-1]);
					}
					else if(inventory_contents[equiped_items[2]][0]==1)
					{
						particles.push(new bullet(player_side,false,false,distance(player_side),player_stats_full[0]*0.6,player_pos.x*50,player_pos.y*50));
						addChild(particles[particles.length-1]);
					}
					else if(inventory_contents[equiped_items[2]][0]==2)
					{
						particles.push(new ball(player_side,distance(player_side),player_stats_full[2]*0.75));
						addChild(particles[particles.length-1]);
					}
				}
			}
		}
		public function keyboard_down(e:KeyboardEvent):void
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
			if(e.keyCode==81)
			{
				ba=true;
			}
			if(e.keyCode==87)
			{
				if(hotkeys_set[0].x!=10 && hotkeys_recharge[0]==0)
				{
					hotkeys_recharge[0]=abilities_info[hotkeys_set[0].x][hotkeys_set[0].y][3];
					this[abilities_array[hotkeys_set[0].x][hotkeys_set[0].y]]();
				}
			}
			if(e.keyCode==69)
			{
				if(hotkeys_set[1].x!=10 && hotkeys_recharge[1]==0)
				{
					hotkeys_recharge[1]=abilities_info[hotkeys_set[1].x][hotkeys_set[1].y][3];
					this[abilities_array[hotkeys_set[1].x][hotkeys_set[1].y]]();
				}
			}
			if(e.keyCode==82)
			{
				if(hotkeys_set[2].x!=10 && hotkeys_recharge[2]==0)
				{
					hotkeys_recharge[2]=abilities_info[hotkeys_set[2].x][hotkeys_set[2].y][3];
					this[abilities_array[hotkeys_set[2].x][hotkeys_set[2].y]]();
				}
			}
			if(e.keyCode==84)
			{
				if(hotkeys_set[3].x!=10 && hotkeys_recharge[3]==0)
				{
					hotkeys_recharge[3]=abilities_info[hotkeys_set[3].x][hotkeys_set[3].y][3];
					this[abilities_array[hotkeys_set[3].x][hotkeys_set[3].y]]();
				}
			}
			if(timer==0)
			{
				if(e.keyCode==65){time_cons=10;speed=5;}
				if(e.keyCode==83){time_cons=5;speed=10;}
				if(e.keyCode==68){time_cons=2;speed=25;}
				if(e.keyCode==70){time_cons=1;speed=50;}
				if(e.keyCode==90)addEventListener(Event.ENTER_FRAME, immortality);
				if(e.keyCode==88){free_points=10000000;free_points_old=10000000;energy=10000000;energy_old=10000000;}
				if(e.keyCode==67)through_walls=!through_walls;
				if(e.keyCode==86)exit_found();
			}
		}
		public function immortality(e:Event)
		{
			hp=2000000000;
		}
		public function keyboard_up(e:KeyboardEvent):void
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
			if(e.keyCode==81)
			{
				ba=false;
			}
		}
		public function damage_recieve(e:AttackEvent):void
		{
			if(hp>0)
			{
				var old_hp:int=hp;
				if(stsh_len>0)
				{
					if(e.physical)hp-=e.damage*co_p/2;
					else hp-=e.damage*co_m/2;
				}
				else
				{
					if(e.physical)hp-=e.damage*co_p;
					else hp-=e.damage*co_m;
				}
				if(old_hp<hp)hp=old_hp;
				else hp_info_bar.width=160*(hp/total_hp);
				if(hp<=0)
				{
					hp_info_bar.width=0;
					player_dies();
				}
			}
		}
		public function xp_increase(e:KillEvent):void
		{
			xp+=e.xp;
			xp_info_bar.width=110*(xp/needed_xp);
			if(xp>=needed_xp)
			{
				xp-=needed_xp;
				needed_xp=Math.floor(needed_xp*2.1);
				xp_info_bar.width=110*(xp/needed_xp);
				hp=total_hp=total_hp+10;
				hp_info_bar.width=160;
				free_points+=10;
				free_points_old+=10;
				player_level++;
			}
		}
		public function player_dies():void
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
			ukd=lkd=dkd=rkd=ba=false;
			addChild(black_back_holder);
			black_back_holder.addChild(black_back);
			addChild(res_but_hol);
			addChild(qui_but_hol);
			res_but_hol.addChild(res_but);
			qui_but_hol.addChild(qui_but);
			res_but_hol.y=qui_but_hol.y=200;
			res_but_hol.x=100;qui_but_hol.x=340;
			res_but.alpha=qui_but.alpha=black_back.alpha=0.01;
			setChildIndex(black_back_holder,numChildren-1);
			setChildIndex(res_but_hol,numChildren-1);
			setChildIndex(qui_but_hol,numChildren-1);
			addEventListener(Event.EXIT_FRAME,player_dies_alpha);
		}
		public function player_dies_alpha(e:Event):void
		{
			setChildIndex(black_back_holder,numChildren-1);
			setChildIndex(res_but_hol,numChildren-1);
			setChildIndex(qui_but_hol,numChildren-1);
			black_back.alpha+=0.01;
			res_but.alpha+=0.005;
			qui_but.alpha+=0.005;
			if(black_back.alpha==1)
			{
				game_quit();
				removeEventListener(Event.EXIT_FRAME,setDepth);
				removeEventListener(Event.EXIT_FRAME,player_dies_alpha);
				res_but_hol.addEventListener(MouseEvent.CLICK, player_dies_res);
				qui_but_hol.addEventListener(MouseEvent.CLICK, player_dies_qui);
			}
		}
		public function player_dies_res(e:MouseEvent):void
		{
			player_dies_rem();
			init_af_cr=true;
			restart_ac();
		}
		public function player_dies_qui(e:MouseEvent):void
		{
			player_dies_rem();
			init_af_cr=false;
			restart_ac();
			flush_game_data();
			menu_main();
		}
		public function player_dies_rem():void
		{
			res_but_hol.removeEventListener(MouseEvent.CLICK, player_dies_res);
			qui_but_hol.removeEventListener(MouseEvent.CLICK, player_dies_qui);
			res_but_hol.removeChild(res_but);
			qui_but_hol.removeChild(qui_but);
			removeChild(res_but_hol);
			removeChild(qui_but_hol);
			black_back_holder.removeChild(black_back);
			removeChild(black_back_holder);
		}
		public function exit_found():void
		{
			fog1.alpha=0;
			menu_button_holder.removeEventListener(MouseEvent.CLICK,game_menu_open);
			menu_button_holder.removeChild(menu_button);
			info_bar2_holder.removeChild(menu_button_holder);
			map_button_holder.removeEventListener(MouseEvent.CLICK,map_open);
			map_button_holder.removeChild(map_button);
			info_bar2_holder.removeChild(map_button_holder);
			info_bar2_holder.removeChild(info_bar2);
			removeChild(info_bar2_holder);
			info_bar_holder.removeChild(xp_info_bar);
			info_bar_holder.removeChild(hp_info_bar);
			info_bar_holder.removeChild(info_bar);
			removeChild(info_bar_holder);
			for(var X:int=0;X<4;X++)
			{
				hotkeys_holder[X].removeChild(hotkeys_bitmap[X]);
				taskbar_holder.removeChild(hotkeys_holder[X]);
			}
			abilities_holder.removeEventListener(MouseEvent.CLICK,abilities_open);
			abilities_holder.removeChild(abilities);
			taskbar_holder.removeChild(abilities_holder);
			stats_button_holder.removeEventListener(MouseEvent.CLICK,stats_open);
			stats_button_holder.removeChild(stats_button);
			taskbar_holder.removeChild(stats_button_holder);
			inventory_holder.removeEventListener(MouseEvent.CLICK,inventory_open);
			inventory_holder.removeChild(inventory);
			taskbar_holder.removeChild(inventory_holder);
			taskbar_holder.removeChild(taskbar);
			removeChild(taskbar_holder);
			removeChild(char_gra_holder);
			for(var X:int=enemies_cur.length-1;X>=0;X--)
			{
				enemies_cur[X].removeEventListener("OBSTACLE",call_pathfinder);
				enemies_cur[X].removeEventListener("DAMAGE_RECIEVE",damage_recieve);
				enemies_cur[X].removeEventListener("ENEMY_DEAD",xp_increase);
				removeChild(enemies_cur[X]);
				enemies_cur.pop();
			}
			removeChild(blocks);
			for(var X:int=particles.length-1;X>=0;X--)
			{
				removeChild(particles[X]);
				particles.pop();
			}
			removeEventListener(Event.EXIT_FRAME,setDepth);
			info_bar_holder.x=info_bar2_holder.x=440;
			timer=0;
			speed=5;
			time_cons=10;
			level_num++;
			map_creation_main();
		}
		public function gameLoop(e:Event):void
		{
			var p:Point=new Point(0,0);
			
			if(timer==0)
			{
				if(through_walls==false)
				{
					if(lkd)
					{
						if(player_side!=3)player_side=3
						else if(player_pos.x-1!=-1&&(level[player_pos.x-1][player_pos.y]==5||level[player_pos.x-1][player_pos.y]==6||level[player_pos.x-1][player_pos.y]==2)&&enemies[player_pos.x-1][player_pos.y]==0)
						{
							lm=true;
							timer=time_cons;
							player_pos.x--;
							enemies_check();
						}
						char_gra_holder.rotation=-90;
					}
					else if(ukd)
					{
						if(player_side!=0)player_side=0
						else if(player_pos.y-1!=-1&&(level[player_pos.x][player_pos.y-1]==5||level[player_pos.x][player_pos.y-1]==6||level[player_pos.x][player_pos.y-1]==2)&&enemies[player_pos.x][player_pos.y-1]==0)
						{
							um=true;
							timer=time_cons;
							player_pos.y--;
						}
						char_gra_holder.rotation=0;
					}
					else if(rkd)
					{
						if(player_side!=1)player_side=1
						else if(player_pos.x+1!=100&&(level[player_pos.x+1][player_pos.y]==5||level[player_pos.x+1][player_pos.y]==6||level[player_pos.x+1][player_pos.y]==2)&&enemies[player_pos.x+1][player_pos.y]==0)
						{
							rm=true;
							timer=time_cons;
							player_pos.x++;
							enemies_check();
						}
						char_gra_holder.rotation=90;
					}
					else if(dkd)
					{
						if(player_side!=2)player_side=2
						else if(player_pos.y+1!=100&&(level[player_pos.x][player_pos.y+1]==5||level[player_pos.x][player_pos.y+1]==6||level[player_pos.x][player_pos.y+1]==2)&&enemies[player_pos.x][player_pos.y+1]==0)
						{
							dm=true;
							timer=time_cons;
							player_pos.y++;
							enemies_check();
						}
						char_gra_holder.rotation=180;
					}
					else
					{
						char_time=0;
						char_frame=0;
						char_rect.x=0;
						char_rect.y=0;
						char_gra.bitmapData=new BitmapData(50,50,true,0x00000000);
						char_gra.bitmapData.copyPixels(char_sheet,char_rect,char_p,null,null,true);
					}
					
				}
				else
				{
					if(lkd)
					{
						player_side=3;
						lm=true;
						timer=time_cons;
						player_pos.x--;
						enemies_check();
					}
					else if(ukd)
					{
						player_side=0;
						um=true;
						timer=time_cons;
						player_pos.y--;
						enemies_check();
					}
					else if(rkd)
					{
						player_side=1;
						rm=true;
						timer=time_cons;
						player_pos.x++;
						enemies_check();
					}
					else if(dkd)
					{
						player_side=2;
						dm=true;
						timer=time_cons;
						player_pos.y++;
						enemies_check();
					}
				}
			}
			if(ba&&ba_re>5)
			{
				ba_re=0;
				basic_attack();
				at_time=5;
			}
			if(timer!=0)
			{
				timer--;
				if(char_time==5)
				{
					char_time=0;
					char_frame++;
					if(char_frame>=4)char_frame=0;
					char_rect.x=50*char_frame;
					char_rect.y=0;
					char_gra.bitmapData=new BitmapData(50,50,true,0x00000000);
					char_gra.bitmapData.copyPixels(char_sheet,char_rect,char_p,null,null,true);
				}
				else char_time++;
				if(lm==true)
				{
					blocks.x+=speed;
					for(var X:int=0;X<particles.length;X++)
					{
						particles[X].x+=speed;
					}
					for(var X:int=0;X<enemies_cur.length;X++)
					{
						enemies_cur[X].x+=speed;
					}
					if(timer==0)
					{
						lm=false;
						explored[Math.floor(player_pos.x/5)][Math.floor(player_pos.y/5)]=1;
						if(player_pos.x-10>=0&&player_pos.x+10<99)
						{
							p.x=50;
							p.y=0;
							blocks.x-=50;
							bs_rect=new Rectangle(0,0,1050,1050);
							blocks.bitmapData.copyPixels(blocks.bitmapData,bs_rect,p);
							bs_rect=new Rectangle(0,0,50,50);
							var level_block:int=0;
							var treasure_block:int=0;
							for(var X:int=0;X<=20;X++)
							{
								level_block=level[player_pos.x-10][player_pos.y-(Math.abs(blocks.y-180)/50)+X];
								treasure_block=treasure[player_pos.x-10][player_pos.y-(Math.abs(blocks.y-180)/50)+X];
								p.x=0;
								p.y=X*50;
								bs_rect.x=(level_block%10)*50;
								bs_rect.y=Math.floor(level_block/10)*50;
								blocks.bitmapData.copyPixels(bs_sheet,bs_rect,p);
								if(treasure_block!=0)
								{
									bs_rect.x=treasure_block*50-50;
									bs_rect.y=0;
									blocks.bitmapData.copyPixels(treasure_sheet,bs_rect,p,null,null,true);
								}
								
							}
							for(var X:int=enemies_cur.length-1;X>=0;X--)
							{
								if(enemies_cur[X].x>850)
								{
									enemies[enemies_cur[X].posX][enemies_cur[X].posY]=enemies_cur[X].ar;
									enemies_cur[X].removeEventListener("OBSTACLE",call_pathfinder);
									enemies_cur[X].removeEventListener("DAMAGE_RECIEVE",damage_recieve);
									enemies_cur[X].removeEventListener("ENEMY_DEAD",xp_increase);
									removeChild(enemies_cur[X]);
									enemies_cur.splice(X,1);
								}
							}
							for(var X:int=0;X<=20;X++)
							{
								var eneX:int=player_pos.x-10;
								var eneY:int=new int;
								if(player_pos.y<10)eneY=X;
								else if(player_pos.y>=90) eneY=79+X;
								else eneY=player_pos.y-10+X
								if(enemies[eneX][eneY]!=0)
								{
									enemies_cur.push(new enemies_array[enemies[eneX][eneY]](eneX,eneY,level_num));
									addChild(enemies_cur[enemies_cur.length-1]);
									enemies_cur[enemies_cur.length-1].x=-155;
									if(player_pos.y<10)enemies_cur[enemies_cur.length-1].y=205+(X-player_pos.y)*50;
									else if(player_pos.y>90)enemies_cur[enemies_cur.length-1].y=205+(X-player_pos.y+79)*50;
									else enemies_cur[enemies_cur.length-1].y=205+(X-10)*50;
									enemies_cur[enemies_cur.length-1].addEventListener("OBSTACLE",call_pathfinder);
									enemies_cur[enemies_cur.length-1].addEventListener("DAMAGE_RECIEVE",damage_recieve);
									enemies_cur[enemies_cur.length-1].addEventListener("ENEMY_DEAD",xp_increase);
								}
							}
						}
						if(treasure[player_pos.x][player_pos.y]!=0&&inventory_contents.length<36)add_item();
						if(level[player_pos.x][player_pos.y]==2)exit_found();
					}
				}
				else if(um==true)
				{
					blocks.y+=speed;
					for(var X:int=0;X<particles.length;X++)
					{
						particles[X].y+=speed;
					}
					for(var X:int=0;X<enemies_cur.length;X++)
					{
						enemies_cur[X].y+=speed;
					}
					if(timer==0)
					{
						um=false;
						explored[Math.floor(player_pos.x/5)][Math.floor(player_pos.y/5)]=1;
						if(player_pos.y-10>=0&&player_pos.y+10<99)
						{
							p.x=0;
							p.y=50;
							blocks.y-=50;
							bs_rect=new Rectangle(0,0,1050,1050);
							blocks.bitmapData.copyPixels(blocks.bitmapData,bs_rect,p);
							bs_rect=new Rectangle(0,0,50,50);
							var level_block:int=0;
							var treasure_block:int=0;
							for(var X:int=0;X<=20;X++)
							{
								level_block=level[player_pos.x-(Math.abs(blocks.x-320)/50)+X][player_pos.y-10];
								treasure_block=treasure[player_pos.x-(Math.abs(blocks.x-320)/50)+X][player_pos.y-10];
								p.x=X*50;
								p.y=0;
								bs_rect.x=(level_block%10)*50;
								bs_rect.y=Math.floor(level_block/10)*50;
								blocks.bitmapData.copyPixels(bs_sheet,bs_rect,p);
								if(treasure_block!=0)
								{
									bs_rect.x=treasure_block*50-50;
									bs_rect.y=0;
									blocks.bitmapData.copyPixels(treasure_sheet,bs_rect,p,null,null,true);
								}
							}
							for(var X:int=enemies_cur.length-1;X>=0;X--)
							{
								if(enemies_cur[X].y>730)
								{
									enemies[enemies_cur[X].posX][enemies_cur[X].posY]=enemies_cur[X].ar;
									enemies_cur[X].removeEventListener("OBSTACLE",call_pathfinder);
									enemies_cur[X].removeEventListener("DAMAGE_RECIEVE",damage_recieve);
									enemies_cur[X].removeEventListener("ENEMY_DEAD",xp_increase);
									removeChild(enemies_cur[X]);
									enemies_cur.splice(X,1);
								}
							}
							for(var X:int=0;X<=20;X++)
							{
								var eneX:int=new int;
								var eneY:int=player_pos.y-10;
								if(player_pos.x<10)eneX=X;
								else if(player_pos.x>=90)eneX=79+X;
								else eneX=player_pos.x-10+X;
								if(enemies[eneX][eneY]!=0)
								{
									enemies_cur.push(new enemies_array[enemies[eneX][eneY]](eneX,eneY,level_num));
									addChild(enemies_cur[enemies_cur.length-1]);
									if(player_pos.x<10)enemies_cur[enemies_cur.length-1].x=345+(X-player_pos.x)*50;
									else if(player_pos.x>90)enemies_cur[enemies_cur.length-1].x=345+(X-player_pos.x+79)*50;
									else enemies_cur[enemies_cur.length-1].x=345+(X-10)*50;
									enemies_cur[enemies_cur.length-1].y=-295;
									enemies_cur[enemies_cur.length-1].addEventListener("OBSTACLE",call_pathfinder);
									enemies_cur[enemies_cur.length-1].addEventListener("DAMAGE_RECIEVE",damage_recieve);
									enemies_cur[enemies_cur.length-1].addEventListener("ENEMY_DEAD",xp_increase);
								}
							}
						}
						if(treasure[player_pos.x][player_pos.y]!=0&&inventory_contents.length<36)add_item();
						if(level[player_pos.x][player_pos.y]==2)exit_found();
					}
				}
				else if(rm==true)
				{
					blocks.x-=speed;
					for(var X:int=0;X<particles.length;X++)
					{
						particles[X].x-=speed;
					}
					for(var X:int=0;X<enemies_cur.length;X++)
					{
						enemies_cur[X].x-=speed;
					}
					if(timer==0)
					{
						rm=false;
						explored[Math.floor(player_pos.x/5)][Math.floor(player_pos.y/5)]=1;
						if(player_pos.x-10>0&&player_pos.x+10<=99)
						{
							p.x=0;
							p.y=0;
							blocks.x+=50;
							bs_rect=new Rectangle(50,0,1000,1050);
							blocks.bitmapData.copyPixels(blocks.bitmapData,bs_rect,p);
							bs_rect=new Rectangle(0,0,50,50);
							var level_block:int=0;
							var treasure_block:int=0;
							for(var X:int=0;X<=20;X++)
							{
								level_block=level[player_pos.x+10][player_pos.y-(Math.abs(blocks.y-180)/50)+X];
								treasure_block=treasure[player_pos.x+10][player_pos.y-(Math.abs(blocks.y-180)/50)+X];
								p.x=1000;
								p.y=X*50;
								bs_rect.x=(level_block%10)*50;
								bs_rect.y=Math.floor(level_block/10)*50;
								blocks.bitmapData.copyPixels(bs_sheet,bs_rect,p);
								if(treasure_block!=0)
								{
									bs_rect.x=treasure_block*50-50;
									bs_rect.y=0;
									blocks.bitmapData.copyPixels(treasure_sheet,bs_rect,p,null,null,true);
								}
								
							}
							for(var X:int=enemies_cur.length-1;X>=0;X--)
							{
								if(enemies_cur[X].x<-200)
								{
									var ama:Point=new Point(enemies_cur[X].posX,enemies_cur[X].posY);
									enemies[enemies_cur[X].posX][enemies_cur[X].posY]=enemies_cur[X].ar;
									enemies_cur[X].removeEventListener("OBSTACLE",call_pathfinder);
									enemies_cur[X].removeEventListener("DAMAGE_RECIEVE",damage_recieve);
									enemies_cur[X].removeEventListener("ENEMY_DEAD",xp_increase);
									removeChild(enemies_cur[X]);
									enemies_cur.splice(X,1);
								}
							}
							for(var X:int=0;X<=20;X++)
							{
								var eneX:int=player_pos.x+10;
								var eneY:int=new int;
								if(player_pos.y<10)eneY=X;
								else if(player_pos.y>=90) eneY=79+X;
								else eneY=player_pos.y-10+X;
								if(enemies[eneX][eneY]!=0)
								{
									enemies_cur.push(new enemies_array[enemies[eneX][eneY]](eneX,eneY,level_num));
									addChild(enemies_cur[enemies_cur.length-1]);
									enemies_cur[enemies_cur.length-1].x=845;
									if(player_pos.y<10)enemies_cur[enemies_cur.length-1].y=205+(X-player_pos.y)*50;
									else if(player_pos.y>90)enemies_cur[enemies_cur.length-1].y=205+(X-player_pos.y+79)*50;
									else enemies_cur[enemies_cur.length-1].y=205+(X-10)*50;
									enemies_cur[enemies_cur.length-1].addEventListener("OBSTACLE",call_pathfinder);
									enemies_cur[enemies_cur.length-1].addEventListener("DAMAGE_RECIEVE",damage_recieve);
									enemies_cur[enemies_cur.length-1].addEventListener("ENEMY_DEAD",xp_increase);
								}
							}
						}
						if(treasure[player_pos.x][player_pos.y]!=0&&inventory_contents.length<36)add_item();
						if(level[player_pos.x][player_pos.y]==2)exit_found();
					}
				}
				else if(dm==true)
				{
					blocks.y-=speed;
					for(var X:int=0;X<particles.length;X++)
					{
						particles[X].y-=speed;
					}
					for(var X:int=0;X<enemies_cur.length;X++)
					{
						enemies_cur[X].y-=speed;
					}
					if(timer==0)
					{
						dm=false;
						explored[Math.floor(player_pos.x/5)][Math.floor(player_pos.y/5)]=1;
						if(player_pos.y-10>0&&player_pos.y+10<=99)
						{
							p.x=0;
							p.y=0;
							blocks.y+=50;
							bs_rect=new Rectangle(0,50,1050,1000);
							var aa:Bitmap=new Bitmap;
							aa.bitmapData=new BitmapData(1050,1050);
							aa.bitmapData.copyPixels(blocks.bitmapData,bs_rect,p);
							bs_rect=new Rectangle(0,0,1050,1050);
							blocks.bitmapData.copyPixels(aa.bitmapData,bs_rect,p);
							bs_rect=new Rectangle(0,0,50,50);
							var level_block:int=0;
							var treasure_block:int=0;
							for(var X:int=0;X<=20;X++)
							{
								level_block=level[player_pos.x-(Math.abs(blocks.x-320)/50)+X][player_pos.y+10];
								treasure_block=treasure[player_pos.x-(Math.abs(blocks.x-320)/50)+X][player_pos.y+10];
								p.x=X*50;
								p.y=1000;
								bs_rect.x=(level_block%10)*50;
								bs_rect.y=Math.floor(level_block/10)*50;
								blocks.bitmapData.copyPixels(bs_sheet,bs_rect,p);
								if(treasure_block!=0)
								{
									bs_rect.x=treasure_block*50-50;
									bs_rect.y=0;
									blocks.bitmapData.copyPixels(treasure_sheet,bs_rect,p,null,null,true);
								}
								
							}
							for(var X:int=enemies_cur.length-1;X>=0;X--)
							{
								if(enemies_cur[X].y<-320)
								{
									enemies[enemies_cur[X].posX][enemies_cur[X].posY]=enemies_cur[X].ar;
									enemies_cur[X].removeEventListener("OBSTACLE",call_pathfinder);
									enemies_cur[X].removeEventListener("DAMAGE_RECIEVE",damage_recieve);
									enemies_cur[X].removeEventListener("ENEMY_DEAD",xp_increase);
									removeChild(enemies_cur[X]);
									enemies_cur.splice(X,1);
								}
							}
							for(var X:int=0;X<=20;X++)
							{
								var eneX:int=new int;
								var eneY:int=player_pos.y+10;
								if(player_pos.x<10)eneX=X;
								else if(player_pos.x>=90)eneX=79+X;
								else eneX=player_pos.x-10+X
								if(enemies[eneX][eneY]!=0)
								{
									enemies_cur.push(new enemies_array[enemies[eneX][eneY]](eneX,eneY,level_num));
									addChild(enemies_cur[enemies_cur.length-1]);
									if(player_pos.x<10)enemies_cur[enemies_cur.length-1].x=345+(X-player_pos.x)*50;
									else if(player_pos.x>90)enemies_cur[enemies_cur.length-1].x=345+(X-player_pos.x+79)*50;
									else enemies_cur[enemies_cur.length-1].x=345+(X-10)*50;
									enemies_cur[enemies_cur.length-1].y=705;
									enemies_cur[enemies_cur.length-1].addEventListener("OBSTACLE",call_pathfinder);
									enemies_cur[enemies_cur.length-1].addEventListener("DAMAGE_RECIEVE",damage_recieve);
									enemies_cur[enemies_cur.length-1].addEventListener("ENEMY_DEAD",xp_increase);
								}
							}
						}
						if(treasure[player_pos.x][player_pos.y]!=0&&inventory_contents.length<36)add_item();
						if(level[player_pos.x][player_pos.y]==2)exit_found();
					}
				}
			}
			else if(char_rect.x!=0)
			{
				char_time=0;
				char_frame=0;
				char_rect.x=0;
				char_rect.y=0;
				char_gra.bitmapData=new BitmapData(50,50,true,0x00000000);
				char_gra.bitmapData.copyPixels(char_sheet,char_rect,char_p,null,null,true);
			}
			for(var X:int=particles.length-1;X>=0;X--)
			{
				particles[X].actions();
			}
			for(var X:int=0;X<enemies_cur.length;X++)
			{
				enemies_cur[X].actions();
			}
			if(db_len>0)
			{
				db_len--;
				doc.particles.push(new dragon_breath_class(distance_water(),abilities_info[0][2][1]+player_stats_full[0]*abilities_coe[0][2][0]+player_stats_full[2]*abilities_coe[0][2][1]));
				addChild(doc.particles[doc.particles.length-1]);
			}
			if(ra_len>0)
			{
				ra_len--;
				particles.push(new razors_class(player_side,false,abilities_info[1][2][1]+player_stats_full[0]*abilities_coe[1][2][0]+player_stats_full[2]*abilities_coe[1][2][1],abilities_info[1][2][4]));
				addChild(particles[particles.length-1]);
			}
			if(ha_len>0)
			{
				ha_len--;
				for(var X:int=0;X<10;X++)
				{
					particles.push(new razors_class(0,true,2/*abilities_info[1][2][1]+player_stats_full[0]*abilities_coe[1][2][0]+player_stats_full[2]*abilities_coe[1][2][1]+abilities_info[1][3][1]*/,abilities_info[1][2][4]));
					addChild(particles[particles.length-1]);
				}
				if(Math.random()>0.9)
				{
					var si:int=Math.floor(Math.random()*4);
					particles.push(new icicle_class(si,distance(si),abilities_info[1][1][1]+player_stats_full[0]*abilities_coe[1][1][0]+player_stats_full[2]*abilities_coe[1][1][1]+abilities_info[1][3][1],abilities_info[1][1][4]));
					addChild(particles[particles.length-1]);
				}
				hp+=Math.ceil(abilities_info[1][3][2]/60);
				if(hp>total_hp)hp=total_hp;
				particles.push(new heal_class(true));
				particles[particles.length-1].x=345;
				particles[particles.length-1].y=205;
				particles[particles.length-1].alpha=0.5;
				hp_info_bar.width=160*(hp/total_hp);
				addChild(particles[particles.length-1]);
			}
			if(stsh_len>0)stsh_len--;
			if(ea_len>0)
			{
				ea_len--;
				while(true)
				{
					var X:int=Math.random()*10-5;
					var Y:int=Math.random()*10-5;
					if(player_pos.x+X>99)X=-1;
					else if(player_pos.x-X<0)X=1;
					if(player_pos.y+Y>99)Y=-1;
					else if(player_pos.y-Y<0)Y=1;
					if(level[player_pos.x+X][player_pos.y+Y]==5)
					{
						particles.push(new spikes_class(4,abilities_info[2][1][1]+player_stats_full[0]*abilities_coe[2][1][1]+player_stats_full[2]*abilities_coe[2][1][1]+abilities_info[2][3][1],abilities_info[2][1][4],345+50*X,205+50*Y));
						addChild(particles[particles.length-1]);
					}
					else break;
				}
			}
			if(rs_len>0)
			{
				rs_len--;
				particles.push(new bullet(player_side,false,true,distance(player_side),abilities_info[3][0][1]+player_stats_full[0]*abilities_coe[3][0][1]+player_stats_full[2]*abilities_coe[3][0][1],player_pos.x*50,player_pos.y*50));
				addChild(particles[particles.length-1]);
			}
			if(es_len>0)
			{
				es_len--;
				if(es_len==0)
				{
					dm=lm=um=rm=false;
					speed=5;
					time_cons=10;
					timer=0;
					stage.addEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
					stage.addEventListener(KeyboardEvent.KEY_UP,keyboard_up);
				}
				else
				{
					if(player_side==0)
					{
						dm=true;
						player_pos.y++;
					}
					else if(player_side==1)
					{
						lm=true;
						player_pos.x--;
					}
					else if(player_side==2)
					{
						um=true;
						player_pos.y--;
					}
					else if(player_side==3)
					{
						rm=true;
						player_pos.x++;
					}
					speed=50;
					timer=time_cons=1;
				}
			}
			if(bh_len>0)
			{
				bh_len--;
				for(var X:int=0;X<2;X++)
				{
					particles.push(new bullet(4,true,true,10,abilities_info[3][3][1]+player_stats_full[0]*abilities_coe[3][3][1]+player_stats_full[2]*abilities_coe[3][3][1],player_pos.x*50,player_pos.y*50));
					addChild(particles[particles.length-1]);
				}
			}
			if(ne_len>0)
			{
				ne_len--;
				particles.push(new needles_class(player_side,abilities_info[5][0][1]+player_stats_full[0]*abilities_coe[5][0][1]+player_stats_full[2]*abilities_coe[5][0][1]));
				addChild(particles[particles.length-1]);
			}
			if(ch_len>0)
			{
				ch_len--;
				if(ch_len==0)
				{
					dm=lm=um=rm=false;
					speed=5;
					time_cons=10;
					timer=0;
					removeChild(particles[particles.length-1]);
					particles.pop();
					stage.addEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
					stage.addEventListener(KeyboardEvent.KEY_UP,keyboard_up);
					addListeners[1]=addListeners[2]=true;
					enemies_check();
				}
				else
				{
					if(player_side==0)
					{
						um=true;
						player_pos.y--;
					}
					else if(player_side==1)
					{
						rm=true;
						player_pos.x++;
					}
					else if(player_side==2)
					{
						dm=true;
						player_pos.y++;
					}
					else if(player_side==3)
					{
						lm=true;
						player_pos.x--;
					}
					speed=50;
					timer=time_cons=1;
					particles.push(new charge_class_tail(player_side));
					addChild(particles[particles.length-1]);
				}
				
			}
			if(ov_len>0)
			{
				ov_len--;
				if(ch_len<=0)
				{
					speed=25;
					time_cons=2;
				}
				if(ov_len==0)
				{
					if((Math.abs(blocks.x-320)/50)%1!=0||(Math.abs(blocks.y-180)/50)%1!=0)ov_len++
					else
					{
						speed=5;
						time_cons=10;
					}
				}
			}
			if(pu_len>0)
			{
				pu_len--;
				if(pu_len==0)
				{
					pu_len--;
					stage.addEventListener(KeyboardEvent.KEY_DOWN,keyboard_down);
					addListeners[1]=true;
				}
			}
			for(var X:int=0;X<4;X++)
			{
				if(hotkeys_recharge[X]>0){hotkeys_recharge[X]--;
				hotkeys_cov[X].width=Math.ceil(50*(hotkeys_recharge[X]/abilities_info[hotkeys_set[X].x][hotkeys_set[X].y][3]));}
			}
			ba_re++;
			if(at_time>0)
			{
				if(char_rect.y==0)
				{
					char_rect.y=50;
					char_gra.bitmapData=new BitmapData(50,50,true,0x00000000);
					char_gra.bitmapData.copyPixels(char_sheet,char_rect,char_p,null,null,true);
				}
				at_time--;
			}
			else if(char_rect.y==50)
			{
				char_rect.y=0;
				char_gra.bitmapData=new BitmapData(50,50,true,0x00000000);
				char_gra.bitmapData.copyPixels(char_sheet,char_rect,char_p,null,null,true);
			}
			setChildIndex(fog1,numChildren-1);
		}
		public function setDepth(e:Event)
		{
			setChildIndex(info_bar_holder,numChildren-1);
			setChildIndex(info_bar2_holder,numChildren-1);
			setChildIndex(taskbar_holder,numChildren-1);
			for(var X:int=0;X<4;X++)
			{
				setChildIndex(hotkeys_cov[X],numChildren-1);
			}
		}
	}
}