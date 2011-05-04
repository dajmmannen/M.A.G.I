package {
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	/*
	 * TopLevel class
	 * have all document classes extend this
	 * class instead of Sprite or MovieClip to
	 * allow global stage and root access through
	 * TopLevel.stage and TopLevel.root
	 */
	public class TopLevel extends MovieClip {
		
		public static var stage:Stage;
		public static var root:DisplayObject;
			
		public function TopLevel() {
			if (this.stage){
				setupTopLevel();
			}else{
				addEventListener(Event.ADDED_TO_STAGE, setupTopLevel);
			}
		}
		
		private function setupTopLevel(event:Event = null):void {
			if (event){
				removeEventListener(Event.ADDED_TO_STAGE, setupTopLevel);
			}
			TopLevel.stage = this.stage;
			TopLevel.root = this;
		}
	}
}