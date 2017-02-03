package  {
	
	import flash.display.MovieClip;
	
	
	public class heal_class extends MovieClip {
		var ulti:Boolean=false;
		
		public function heal_class(u:Boolean)
		{
			ulti=u;
		}
		public function actions()
		{
			if(ulti==false)this.alpha-=0.075
			else this.alpha-=0.5;
			if(this.alpha<=0)del();
		}
		public function del()
		{
			doc.particles.splice(doc.particles.indexOf(this,0),1);
			parent.removeChild(this);
		}
	}
}
