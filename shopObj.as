package  {
	
	import flash.display.MovieClip;
	import flash.events.*
	
	
	public class shopObj extends MovieClip {
		
		
		public function shopObj() {
			
			addEventListener(Event.ENTER_FRAME, frameUpdater)
			stage.addEventListener(KeyboardEvent.KEY_DOWN, shopOpen)
			stage.addEventListener(KeyboardEvent.KEY_UP, shopClose)
			
			function frameUpdater(e) {
				
			}
			
			function shopOpen(e) {
				if(hitTestObject(gameEngine(parent).player)) {
					if(e.keyCode==17) {
						gameEngine(parent).shop1.visible = true
						gameEngine(parent).shop2.visible = true
						gameEngine(parent).shop3.visible = true;
						
					}
				}
				else {
					gameEngine(parent).shop1.visible = false
					gameEngine(parent).shop2.visible = false
					gameEngine(parent).shop3.visible = false;
				}
			}
			
			function shopClose(e) {
				if(e.keyCode==17) {
					gameEngine(parent).shop1.visible = false
					gameEngine(parent).shop2.visible = false
					gameEngine(parent).shop3.visible = false;
				}
			}
		}
	}
	
}
