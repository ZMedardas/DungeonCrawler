package  {
	
	import flash.display.MovieClip;
	
	
	public class charge_class_tail extends MovieClip
	{
		var side:int=0;
		
		public function charge_class_tail(s:int)
		{
			side=s;
			this.x=345;
			this.y=205;
			if(side==0){this.rotation=-90;this.y=155;}
			else if(side==1)this.x=395;
			else if(side==2){this.rotation=90;this.y=255;}
			else if(side==3){this.rotation=180;this.x=295;}
		}
		public function actions()
		{
			this.alpha-=0.1;
			if(this.alpha<=0)del()
		}
		public function del()
		{
			parent.removeChild(this);
			doc.particles.splice(doc.particles.indexOf(this,0),1);
		}
	}
}