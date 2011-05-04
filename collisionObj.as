package  {
	
	import flash.display.MovieClip;
	import global.Global
	
	public class collisionObj extends MovieClip {
		
		
		public function collisionObj() {
			global.Global.objArray.push(this)
		}
	}
	
}
