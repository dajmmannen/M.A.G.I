package  {
	
	import flash.display.MovieClip;
	import flash.events.*
	import gameEngine
	import global.Global;
	import flash.utils.Timer;
	
	public class pickUpItemObj extends MovieClip {
		
		//Declare any variables here
		var pickUpArea = false;
		
		public function pickUpItemObj() {
			addEventListener(Event.ENTER_FRAME, frameUpdater)
			stage.addEventListener(KeyboardEvent.KEY_DOWN, pressF)
			
			
			//The constant updating function, standard is to check for collision with the player and change pickUpArea accordingly.
			function frameUpdater(e) {
				if(hitTestObject(gameEngine(parent).player)) {
				   pickUpArea = true;
				   }				
				else {
					pickUpArea = false;
				}
			}
			
			
			function pressF(e) {
				if(e.keyCode==17) {
					if(pickUpArea) {
						//What to do when the button is pressed (Ctrl) and the player is within reach of the object.
						//Removing the object is already coded
						//If you want to increase player damage, check out global.Global.damageMultiplier and global.Global.standardMultiplier
						//If you want to edit player health, it's global.Global.playerHealth and global.Global.playerHealthMax
						//Of course you can add mor functionality to the "global" class and then edit it from here.
						x = 13371337
						alpha = 0
					}
				}
			}
		}
	}
}
