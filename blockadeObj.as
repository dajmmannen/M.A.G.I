package  {
	
	import flash.display.MovieClip;
	import global.Global
	import flash.events.*
	
	public class blockadeObj extends MovieClip {
		
		var doorOpen:Boolean
		
		
		public function blockadeObj() {
			global.Global.objArray.push(this)
			addEventListener(Event.ENTER_FRAME, frameUpdater)
			
			function frameUpdater(e) {
				
				if(doorOpen) {
					enabled = true
				}
				else {
					enabled = false
				}
			}
		}
		
		
		
		public function setOpen() {
			doorOpen = true;
		}
		
		public function setClosed() {
			doorOpen = false;
		}
	}
	
}
