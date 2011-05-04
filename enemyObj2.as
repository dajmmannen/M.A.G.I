package  {
	
	import flash.display.MovieClip;
	import flash.events.*
	import global.Global;
	import flash.utils.Timer;
	
	
	public class enemyObj2 extends MovieClip {
		
		var speed = 50; //Higher values equals slower speed
		var speedFast = 35;
		var speedSlow = 50;
		
		public var health = 150;
		public static var canAttack = true;
		var damage = 5;
		public static var swingTime = 900 //In milliseconds
		public static var attackTimer:Timer = new Timer(swingTime)
		attackTimer.addEventListener(TimerEvent.TIMER, attackTimerEvent)
		
		public static function attackTimerEvent(e) {
			canAttack = true;
		}
		
		var monetarianValue = Math.round(randInt(2,6))
		
		function randInt(max:Number, min:Number = 0):Number
			{
     			return Math.random() * (max - min) + min;
			}
		
		
		public function enemyObj2() {
			var self = this;
			var enemyIndex;
			
			addEventListener(Event.ENTER_FRAME, frameUpdater)
			global.Global.enemyArray.push(this)
			
			function collTestFunc(currObj:*, index:int, objArray:Array):Boolean {
				if(currObj.hitTestObject(self)) {
					enemyIndex = currObj;
					return true
				}
				else {
					return false
				}
			}
			
			function collTestFunc2(currObj:*, index:int, objArray:Array):Boolean {
				if(currObj==self) {
					return false;
				}
				if(currObj.hitTestObject(self)) {
					enemyIndex = currObj;
					return true
				}
				else {
					return false
				}
			}
			
			
			function frameUpdater(e) {
				
				if (health < 150) {
					speed = speedSlow;
					moveTest()
				}
				
				if(health==150) {
				if(gameEngine(parent).player.x > (x - 450) && gameEngine(parent).player.x < (x + 450)) {
					if(gameEngine(parent).player.y > (y - 450) && gameEngine(parent).player.y < (y + 450)) {
						speed = speedSlow;
						moveTest()
						
					}
				   
				   }
				}
				
				if (health < 0) {
					
					global.Global.playerMoney += monetarianValue;
					gameEngine(parent).removeChild(self)
					removeEventListener(Event.ENTER_FRAME, frameUpdater)
					x = 13371337
					y = 13371337
				}
				
				
			}
			
			function moveTest() {
				var oldX = x;
				var oldY = y;
				x -= (x-gameEngine(parent).player.x)/speedSlow;
				y -= (y-gameEngine(parent).player.y)/speedSlow;
				
				var collTestEnemy:Boolean = global.Global.enemyArray.some(collTestFunc2)
				var collTest:Boolean = global.Global.objArray.some(collTestFunc);
				if (collTestEnemy) {
					x += 2*(x-gameEngine(parent).player.x)/speedSlow;
					y += 2*(y-gameEngine(parent).player.y)/speedSlow;
				}
				if(collTest) {
					x = oldX;
					y = oldY;
					if(gameEngine(parent).player.y > y) {
						y += 3;
						collTest = global.Global.objArray.some(collTestFunc);
						if(collTest) {
							y -= 3;
						}
					}
					if(gameEngine(parent).player.y < y) {
						y -= 3;
						collTest = global.Global.objArray.some(collTestFunc);
						if(collTest) {
							y += 3;
						}
					}
					if(gameEngine(parent).player.x > x) {
						x += 3;
						collTest = global.Global.objArray.some(collTestFunc);
						if(collTest) {
							x -= 3;
						}
					}
					if(gameEngine(parent).player.x < x) {
						x -= 3;
						collTest = global.Global.objArray.some(collTestFunc);
						if(collTest) {
							x += 3;
						}
					}
				}
				
				if(hitTestObject(gameEngine(parent).player)) {
					x = oldX
					y = oldY
				   	if(canAttack) {
						global.Global.playerHealth -= damage;
						canAttack = false;
						attackTimer.start()
					   
				   	}
				}
			}
		}
	}
	
}
