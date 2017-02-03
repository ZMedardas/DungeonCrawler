package  {
	
	import flash.display.MovieClip;
	
	public class s_c extends MovieClip
	{
		
		public function s_c(X:int,Y:int)
		{
			this.x=X;this.y=Y;
		}
		public function actions()
		{
			this.alpha-=0.05;
			if(this.alpha<0)del();
		}
		public function del()
		{
			doc.particles.splice(doc.particles.indexOf(this,0),1);
			parent.removeChild(this);
		}
	}
}