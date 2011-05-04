package {
	import flash.events.*;
	import global.Global;
	import flash.display.*;
	
	
	public class objBlock extends Sprite {
		public var main:objBlock;
		
		public function objBlock():void {
			
			global.Global.objArray.push(this);
			
				
		}
	}
}