package  {
	
	import flash.display.MovieClip;
	
	
	public class con_dragon_breath_class extends MovieClip {
		
		var len:int=60;
		
		public function con_dragon_breath_class():void
		{
			
		}
		public function actions():void
		{
			add_flame()
			len--;
			if(len<=0)del();
		}
		public function add_flame():void
		{
			doc.particles.push(new flame_class())
			addChild(doc.particles[doc.particles.length-1]);
		}
		public function del():void
		{
			doc.particles.splice(doc.particles.indexOf(this,1),1);
			parent.removeChild(this);
		}
	}
}
