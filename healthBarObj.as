package  {
	
	import flash.display.MovieClip;
	import flash.events.*
	import global.Global;
	
	
	public class healthBarObj extends MovieClip {
		var playerHp = global.Global.playerHealth
		
		
		public function healthBarObj() {
			addEventListener(Event.ENTER_FRAME, frameUpdater)
			x = gameEngine(parent).player.x - 19
				y = gameEngine(parent).player.y - 71.65
			
			
			function frameUpdater(e) {
				try {
				gotoAndStop(global.Global.playerHealth + 1)
				
				if(global.Global.playerDead) {
					visible = false;
					alpha = 0	
				}
				}
				catch(error:Error) {
					trace("hest")
				}
			}
			
			
		}
	}
	
}
