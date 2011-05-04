package  {
	import flash.display.MovieClip;
	import flash.events.*
	import global.Global
	import gameEngine
	import flash.text.*
	
	public class playerFireBall extends MovieClip {

		public function playerFireBall(startX, startY, startDirection) {
			var fireBall:playerFireBall = this;
			x = startX
			y = startY
			var direct:Number;
			var combatTextRightMax = 225;
			var combatTextLeftMax = 60;
			var combatTextUpMax = 50;
			var combatTextDownMax = 0;
			var combatTextSize = 36;
			var combatTextTickFade = 0.02
			var combatTextTickMove = 3
			var combatTextColor = 0xAA0000
			
			var speed = 18
			var ticks = 0;
			var enemyIndex;
			var damageMin = 25;
			var damageMax = 76;
			if(startDirection==0) {
			direct = 0; rotation = 0;
			}
			if(startDirection==1) {
			direct = 1; rotation = 180;
			}
			if(startDirection==2) {
			direct = 2; rotation = 270;
			}
			if(startDirection==3) {
			direct = 3; rotation = 90;
			}
			
			
			
			addEventListener(Event.ENTER_FRAME, frameUpdater)
			
			function randInt(max:Number, min:Number):Number
			{
     			return Math.random() * (max - min) + min;
			}
			
			
			function collTestFunc(currObj:*, index:int, objArray:Array):Boolean {
				if(currObj.hitTestObject(fireBall)) {
					enemyIndex = currObj;
					return true
				}
				else {
					return false
				}
			}
			function frameUpdater(e) {
				try {
				if(ticks < 100) {
					if(direct==0) {
						y -= speed;
					}
					if(direct==1) {
						y += speed
					}
					if(direct==2) {
						x -= speed;
					}
					if(direct==3) {
						x += speed;
					}
					ticks++
				}
				else {
					gameEngine(parent).removeChild(fireBall)
					removeEventListener(Event.ENTER_FRAME, frameUpdater)
				}
				
				function collTestWallFunc(currObj:*, index:int, objArray:Array):Boolean {
					
					if(currObj.hitTestObject(fireBall)) {
					enemyIndex = currObj;
					return true
				}
				else {
					return false
				}
				}
				var collTestWall:Boolean = global.Global.objArray.some(collTestWallFunc);
				if (collTestWall)  {
					x = 13371337
					y = 13371337
					gameEngine(parent).removeChild(fireBall)
				}
				
				
				var collTest:Boolean = global.Global.enemyArray.some(collTestFunc);
				if (collTest) {
					var damage = Math.floor(randInt(damageMax, damageMin))
					enemyIndex.health -= damage * global.Global.damageMultiplier
					var damageNumberString = damage.toString()
					
					var mainTextField = new TextField();
							mainTextField.x = enemyIndex.x - randInt(combatTextRightMax,combatTextLeftMax);
							mainTextField.y = enemyIndex.y - 150 + randInt(combatTextUpMax,combatTextDownMax);
							mainTextField.text = damageNumberString;
							mainTextField.width = 250;
							mainTextField.selectable = false
							mainTextField.autoSize = TextFieldAutoSize.CENTER
			
							var mainTextFormat:TextFormat = new TextFormat(); 
							mainTextFormat.color = combatTextColor; 
							mainTextFormat.size = combatTextSize;
			
							mainTextField.setTextFormat(mainTextFormat); 
							gameEngine(parent).addChild(mainTextField)
							mainTextField.addEventListener(Event.ENTER_FRAME, textUpdater)
							
							function textUpdater(e) {
								mainTextField.alpha -= combatTextTickFade
								mainTextField.y -= combatTextTickMove
								if(mainTextField.alpha == 0) {
									mainTextField.x = 13371337
									gameEngine(parent).removeChild(mainTextField)
								}
							}
					
					gameEngine(parent).removeChild(fireBall)
					removeEventListener(Event.ENTER_FRAME, frameUpdater)
				}
				
				}
				catch(error:Error) {
					removeEventListener(Event.ENTER_FRAME, frameUpdater)
				}
			}
		}

	}
	
}
