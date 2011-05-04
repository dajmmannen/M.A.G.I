package  {
	
	import flash.display.MovieClip;
	import flash.events.*
	import global.Global
	
	
	public class spikeObj extends MovieClip {
		
		
		public function spikeObj() {
			addEventListener(Event.ENTER_FRAME, frameUpdater)
			
			function frameUpdater(e) {
				try {
				if(hitTestObject(gameEngine(parent).player)) {
					global.Global.playerHealth--
				}
				}
				catch(error:Error) {
					trace("nr 3")
				}
			}
		}
	}
	
}
