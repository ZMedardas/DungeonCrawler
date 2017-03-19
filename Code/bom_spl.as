package  {
	
	import flash.display.MovieClip;
	
	
	public class bom_spl extends MovieClip {
		
		
		public function bom_spl()
		{
			
		}
		public function actions()
		{
			this.alpha-=0.05;
			if(this.alpha<0)del();
		}
		public function del()
		{
			parent.removeChild(this);
			doc.particles.splice(doc.particles.indexOf(this,0),1);
		}
	}
	
}
