package  {
	
	import flash.display.MovieClip;
	import flash.events.*
	import global.Global;
	
	import flash.display.Loader
	import  flash.net.URLRequest
	
	public class frameChangerObj1 extends MovieClip {
		
		
		public function frameChangerObj1() {
			
			addEventListener(Event.ENTER_FRAME, frameUpdater) 
			
			function frameUpdater(e)  {
				if(hitTestObject(gameEngine(parent).player)) {
					/*gameEngine(parent)
					
					
					for(var i = 0; i < gameEngine(parent).numChildren; i++) {
						try {
						//gameEngine(parent).removeChildAt(i);
						}
						catch (error:ArgumentError) {} 
						catch (error:SecurityError) {} 
						catch (error:TypeError) {} 
						catch (error:Error) {}
					}
					gameEngine(parent).removeChild(gameEngine(parent).healthBar)
					global.Global.objArray = []
					global.Global.enemyArray = []
					gameEngine(parent).gotoAndStop(2)
					removeEventListener(Event.ENTER_FRAME, frameUpdater)*/
					
					/*var myLoader:Loader = new Loader(); 
					gameEngine(parent).addChild(myLoader); 
					var url:URLRequest = new URLRequest("game2.swf"); 
					myLoader.load(url);*/
					
					}
			}
		}
		
		}
	}
	

