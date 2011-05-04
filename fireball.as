package  {
	import flash.events.*
	import flash.display.*
	import global.Global
	import gameEngine;
	
	public class fireball extends Sprite {

		var dieArea:Number = 20
		
		public function fireball(startX:Number, startY:Number, playerX:Number, playerY:Number):void {
			var theBall:fireball = this;
			addEventListener(Event.ENTER_FRAME, frameUpdater)
			var speedX:Number = playerX/startX
			var speedY:Number = playerY/startY
			var speed = 35
			var damage = 7
			x = startX
			y = startY
			var self = this;
			
			function collTestF(currObj:*, index:int, objArray:Array):Boolean {
				if(currObj.hitTestObject(theBall)) {
					return true
				}
				else {
					return false
				}
			}
			
			function frameUpdater(e) {
				try{
				var collTest:Boolean = global.Global.objArray.some(collTestF);
				if(collTest) {
					removeEventListener(Event.ENTER_FRAME, frameUpdater)
					gameEngine(parent).removeChild(theBall)
					return;
					
				}
				if(hitTestObject(gameEngine(parent).player)) {
					global.Global.playerHealth -= 7
					removeEventListener(Event.ENTER_FRAME, frameUpdater)
					gameEngine(parent).removeChild(theBall)
					
				}
				
				if (x > playerX + dieArea) {
					x -= (startX-playerX)/speed;
				}
				
				if (x < playerX - dieArea) {
					x -= (startX-playerX)/speed
				}
				
				if(y > playerY + dieArea) {
					y -= (startY-playerY)/speed
				}
				
				if(y < playerY - dieArea) {
					y -= (startY-playerY)/speed
				}
				if(x > playerX - 35 && x < playerX + 35) {
					x = 1337*5
					y = 1337*5
				}
				}
				catch(error:Error) {
					removeEventListener(Event.ENTER_FRAME, frameUpdater)
				}
			}
		}

	}
	
}
