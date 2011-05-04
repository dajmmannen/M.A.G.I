package  {
	
	import flash.display.MovieClip;
	import flash.events.*
	import gameEngine
	import global.Global;
	import flash.utils.Timer;
	
	public class pickUpItemObj extends MovieClip {
		
		var pickUpArea = false;
		var damageMultiply = 2;
		public static var damageIncreaseTime = 20000;
		public static var damageTimer:Timer = new Timer(damageIncreaseTime)
		damageTimer.addEventListener(TimerEvent.TIMER, damageReset)
		
		
			
		
		public static function damageReset(e) {
				global.Global.damageMultiplier = global.Global.standardMultiplier;
			}
		
		public function pickUpItemObj() {
			addEventListener(Event.ENTER_FRAME, frameUpdater)
			stage.addEventListener(KeyboardEvent.KEY_DOWN, pressF)
			var self = this
			
			
			function remove() {
				removeEventListener(Event.ENTER_FRAME,frameUpdater)
				gameEngine(parent).removeChild(self)
				
			}
			
			function frameUpdater(e) {
				try {
				if(hitTestObject(gameEngine(parent).player)) {
				   pickUpArea = true;
				   }				
				else {
					pickUpArea = false;
				}
				}
				catch(error:Error) {
					//trace("nr 3")
				}
			}
			
			
			function pressF(e) {
				if(e.keyCode==17) {
					if(pickUpArea) {
						global.Global.damageMultiplier = damageMultiply
						alpha = 0
						damageTimer.start();
					}
				}
			}
			
		}
		
	}
}
