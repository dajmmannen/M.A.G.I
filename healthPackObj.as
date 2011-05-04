package  {
	
	import flash.display.*;
	import flash.events.*
	import global.Global;
	
	
	public class healthPackObj extends MovieClip {
		
		
		var healVariable = 25; //Amount to heal
		var pickUpArea = false
		
		
		public function healthPackObj() {
			
			var healthPack = this
			addEventListener(Event.ENTER_FRAME, frameUpdater)
			stage.addEventListener(KeyboardEvent.KEY_DOWN, pressF)
			
			function frameUpdater(e) {
				try {
				if(hitTestObject(gameEngine(parent).player)) {
					pickUpArea = true
				}
				else {
					pickUpArea = false;
				}
				}
				catch(error:Error) {
					removeEventListener(Event.ENTER_FRAME, frameUpdater)
				}
			}
			
			function pressF(e) {
				if(e.keyCode==17) {
					if(pickUpArea) {
						global.Global.playerHealth += healVariable;
						pickUpArea = false
						x = 13371337
					}
				}
			}
		}
	}
	
}
