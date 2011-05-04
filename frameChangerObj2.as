package  {
	
	import flash.display.MovieClip;
	import flash.events.*
	import global.Global;
	
	
	public class frameChangerObj2 extends MovieClip {
		
		
		public function frameChangerObj2() {
			
			addEventListener(Event.ENTER_FRAME, frameUpdater) 
			
			function frameUpdater(e)  {
				if(hitTestObject(gameEngine(parent).player)) {
					gameEngine(parent)
					
					
					for(var i = 0; i < gameEngine(parent).numChildren; i++) {
						gameEngine(parent).removeChildAt(i);
						trace(i);
					}
					gameEngine(parent).removeChild(gameEngine(parent).healthBar)
					global.Global.objArray = []
					global.Global.enemyArray = []
					gameEngine(parent).gotoAndStop(1)
					removeEventListener(Event.ENTER_FRAME, frameUpdater)
					
					}
			}
		}
		
		}
	}
	

