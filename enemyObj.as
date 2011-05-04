package  {
	
	import flash.display.MovieClip;
	import flash.events.*
	import global.Global;
	import flash.system.System;
	import flash.utils.Timer;
	import flash.display.Sprite
	import flash.text.*
	
	
	public class enemyObj extends MovieClip {
		
		
		var speed:Number = 10;
		var direct:Number;
		var objIndex;
		var activated2 = true
		var startX = x;
		var startY = y;
		var YLimit = 50;
		var XLimit = 50;
		var moveTimerUp:Timer = new Timer(1,speed)
		var activated = true;
		var damageMin = 10;
		var damageMax = 19;
		var damage;
		var monetarianValue = Math.round(randInt(3,5))
		public var health = 200;
		
		function randInt(max:Number, min:Number = 0):Number
			{
     			return Math.random() * (max - min) + min;
			}
			
		
		
		public function enemyObj() {
			addEventListener(Event.ENTER_FRAME, frameUpdater)
			stop()
			var self = this;
			//global.Global.objArray.push(this)
			global.Global.enemyArray.push(this);
			function frameUpdater(e) {
				try {
				if(activated) {
				direct = Math.floor(randInt(35,1))
				if(currentFrame==28) {
					activated = false;
				}
				if(health < 0) {
					if(activated2){
						gotoAndPlay(2);
						var i;
						for (i=0; i < global.Global.enemyArray.length; i++) {
							if (global.Global.enemyArray[i] == self) {
								global.Global.enemyArray.splice(i, 1)
							}
							
						}
						activated = false;
						addEventListener(Event.ENTER_FRAME, frameCheck)
					}
					activated2 = false
					
				}
				// 1 is up
				// 5 is down
				// 9 is left
				// 13 is right
				if(direct==1) {
					y -= speed;			
					if(y < startY - YLimit) {
						y += speed;
						if(hitTestObject(gameEngine(parent).player)) {
						   y -= speed;
						   damage = randInt(damageMax, damageMin)
						   global.Global.playerHealth -= damage;
						   }
					}
				}
				
				if(direct==5) {
					y += speed
					if(y > startY + YLimit) {
						y -= speed;
					}
				}
				
				if(direct==9) {
					x -= speed
					if(x < startX - XLimit) {
						x += speed;
					}
				}
				
				if(direct==13) {
					x += speed
					if(x > startX + XLimit) {
						x -= speed;
					}
				}
				
				if(direct==19 && !global.Global.playerDead) {
					if(gameEngine(parent).player.x > (x - 600) && gameEngine(parent).player.x < (x + 600)) {
					if(gameEngine(parent).player.y > (y - 600) && gameEngine(parent).player.y < (y + 600)) {
					var playerX = gameEngine(parent).player.x
					var playerY = gameEngine(parent).player.y
					gameEngine(parent).addChild(new fireball(x,y,playerX,playerY))
					}
					}
				}
				}
				
				}
				catch(error:Error) {
					removeEventListener(Event.ENTER_FRAME, frameUpdater)
				}
				
			}
			
			function frameCheck(e) {
				if(currentFrame==28) {
					activated = false;
					global.Global.playerMoney += monetarianValue;
					gameEngine(parent).removeChild(self)
					removeEventListener(Event.ENTER_FRAME, frameCheck)
					removeEventListener(Event.ENTER_FRAME, frameUpdater)
				}
			}
			
			
			
		}
	}
	
}
