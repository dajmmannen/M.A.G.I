package {
	import flash.display.*;
	import flash.events.*;
	import flash.text.*
	import global.Global
	import flash.net.*
	import flash.net.FileReference
	import flash.utils.*
	import flash.system.System;
	import flash.system.IME;
	import flash.system.Security;
	import flash.system.fscommand;
	
	
	public class gameEngine extends MovieClip {
		
		public var top:gameEngine;
		public var mainStage:Stage;
		
		//Camera variables
		public var sceneHeight = 1000;
		public var sceneWidth = 700;
		public var viewHeight = 1000;
		public var viewWidth = 700;
		public var viewStep = 10;
		public var viewX;
		public var viewY;
		
		//Movement variables
		var up:Boolean; 
		var down:Boolean; 
		var left:Boolean; 
		var right:Boolean;
		
		//Attack Variables
		var space:Boolean;
		var q:Boolean;
		var canFireball:Boolean = true;
		public static var canMeleeAttack:Boolean = true;
		public static var myTimer:Timer = new Timer(global.Global.swingTime); 
		public static var castingFireDelay = 1100;
		public static var rangedTimer:Timer = new Timer(castingFireDelay);
		var objIndex;
		var enemyIndex;
		var mAZ;
		var lastMove = 3;
		var UP = 0;
		var DOWN = 1;
		var LEFT = 2;
		var RIGHT = 3;
		
		//Combat Text Variables
		var combatTextRightMax = 225;
		var combatTextLeftMax = 60;
		var combatTextUpMax = 50;
		var combatTextDownMax = 0;
		var combatTextSize = 36;
		var combatTextTickFade = 0.02
		var combatTextTickMove = 3
		var combatTextColor = 0xAA0000
		
		
		
		
		//Event listeners and stuff
		
		
		public static function meleeEvent(e) {
				canMeleeAttack = true;
				myTimer.stop()
			}
		public function gameEngine():void {	
			
		//Event listeners and stuff
		player.stop()
		stage.addEventListener(KeyboardEvent.KEY_DOWN, startMovePlayer)
		stage.addEventListener(KeyboardEvent.KEY_UP, stopMovePlayer)
		stage.addEventListener(KeyboardEvent.KEY_DOWN, startAttackCheck)
		stage.addEventListener(KeyboardEvent.KEY_UP, stopAttackCheck)
		myTimer.addEventListener(TimerEvent.TIMER, meleeEvent)
		addEventListener(Event.ENTER_FRAME, frameUpdater);
		myTimer.start();
		rangedTimer.addEventListener(TimerEvent.TIMER, rangedEvent)
			
			viewY = -(player.x + (viewWidth/2));
			viewX = -(player.y + (viewHeight/2));
			stop()
			
			
			function rangedEvent(e) {
				canMeleeAttack = true;
				var playerBALLS = addChild(new playerFireBall(player.x, player.y, lastMove))
				stage.addEventListener(KeyboardEvent.KEY_DOWN, startMovePlayer)
				canFireball = true;
				rangedTimer.stop()
			}
			
			//Money text
			
			var moneyTextColor = 0xFFFF00;
			var moneyTextSize = 36;
			
			var mainTextField2 = new TextField();
			mainTextField2.x = player.x + 250;
			mainTextField2.y = player.y + 250;
			mainTextField2.text = global.Global.playerMoney.toString()
			mainTextField2.width = 250;
			mainTextField2.selectable = false
			mainTextField2.autoSize = TextFieldAutoSize.CENTER
			
			var mainTextFormat2:TextFormat = new TextFormat(); 
			mainTextFormat2.color = moneyTextColor; 
			mainTextFormat2.size = moneyTextSize;
			
			mainTextField2.setTextFormat(mainTextFormat2); 
			addChild(mainTextField2)
			mainTextField2.addEventListener(Event.ENTER_FRAME, textUpdater2)
							
			function textUpdater2(e) {
				mainTextField2.text = global.Global.playerMoney.toString();
				mainTextField2.setTextFormat(mainTextFormat2); 
			}
			//End Money Text
			
			function collTestF(currObj:*, index:int, objArray:Array):Boolean {
				if(currObj.hitTestObject(player)) {
					objIndex = currObj;
					return true
				}
				else {
					return false
				}
			}
			
			function collTestFunc(currObj:*, index:int, objArray:Array):Boolean {
				if(currObj.hitTestObject(mAZ)) {
					enemyIndex = currObj;
					return true
				}
				else {
					return false
				}
			}
			
			function randInt(max:Number, min:Number):Number
			{
     			return Math.random() * (max - min) + min;
			}
			
			/* frameUpdater constantly updates and checks the boolean varibles up, down, right and left.
			When a keypress is detected, the appropriate key variable is true as long as the key is pressed.
			this causes the player to move.
			When the variable is true, the player moves as many units as the "viewStep" variable is. Altough if
			a collision is detected with the array which all the wall objects are in, the player will instantly
			move back, and it will look like the player never moved.
			Stupid wall of text ends here.*/
			
			function frameUpdater(e) {
				try {
				if(global.Global.playerHealth < 0) {
					global.Global.playerDead = true;
					player.gotoAndPlay(2)
					global.Global.playerHealth = 0;
					removeEventListener(Event.ENTER_FRAME, frameUpdater)
			}
				if ( q == true) {
					if(canFireball) {
					canFireball = false;
					canMeleeAttack = false;
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, startMovePlayer)
					up = false; down = false; left = false; right = false;
					rangedTimer.start()
					}
					
				}
				if (space == true) {
					if(canMeleeAttack) {
						mAZ = new meleeAttackZoneObj(player.x, player.y, lastMove)
						mAZ.x = player.x;
						mAZ.y = player.y;
						addChild(mAZ)
						canMeleeAttack = false
						//myTimer.stop()
						myTimer.start()
						if(lastMove==UP) {
							//Standard direction is up, therefore no code is needed
							mAZ.rotation = 0;
						}
						if(lastMove==DOWN) {
							mAZ.rotation = 180;
						}
						if(lastMove==LEFT) {
							mAZ.rotation = 270;
						}
						if(lastMove==RIGHT) {
							mAZ.rotation = 90;
						}
						
						var collTest:Boolean = global.Global.enemyArray.some(collTestFunc);
						if(collTest) {
							
							var damage = Math.floor(randInt(global.Global.maxDamage,global.Global.minDamage) * global.Global.damageMultiplier);
							enemyIndex.health -= damage
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
							addChild(mainTextField)
							mainTextField.addEventListener(Event.ENTER_FRAME, textUpdater)
							
							function textUpdater(e) {
								mainTextField.alpha -= combatTextTickFade
								mainTextField.y -= combatTextTickMove
								if(mainTextField.alpha == 0) {
									mainTextField.x = 13371337
									removeChild(mainTextField)
								}
							}
						}
						removeChild(mAZ)
					}
				}
				if(space==false) {
				if (up == true) {
					player.y -= viewStep;
					healthBar.y -= viewStep
					mainTextField2.y -= viewStep;
					if(!down && !left && !right) {
					player.gotoAndStop(2)
					}
					lastMove = UP;
					var collTestUp:Boolean = global.Global.objArray.some(collTestF);
					if(collTestUp) {
						player.y += viewStep;
						mainTextField2.y += viewStep;
					}
				}
				if(down == true) {
					player.y += viewStep;
					mainTextField2.y += viewStep
					if(!up && !left && !right) {
					player.gotoAndStop(1)
					}
					lastMove = DOWN;
					var collTestDown:Boolean = global.Global.objArray.some(collTestF);
					if(collTestDown) {
						player.y -= viewStep;
						mainTextField2.y -= viewStep;
					}
				}
				if(left == true) {
					player.x -= viewStep;
					healthBar.x -= viewStep;
					mainTextField2.x -= viewStep;
					if(!down && !up && !right) {
					player.gotoAndStop(4)
					}
					lastMove = LEFT;
					var collTestLeft:Boolean = global.Global.objArray.some(collTestF);
					if(collTestLeft) {
						player.x += viewStep;
						mainTextField2.x += viewStep;
					}
				}
				if (right == true) {
					player.x += viewStep;
					mainTextField2.x += viewStep
					if(!down && !left && !up) {
					player.gotoAndStop(3)
					}
					lastMove = RIGHT;
					var collTestRight:Boolean = global.Global.objArray.some(collTestF);
					if(collTestRight) {
						player.x -= viewStep;
						mainTextField2.x -= viewStep;
					}
				}
				
				if (!right && !left && !up && !down) {
					if(lastMove == UP) {
						player.gotoAndStop(5);
					}
					if(lastMove == DOWN) {
						player.gotoAndStop(6);
					}
					if(lastMove == RIGHT) {
						player.gotoAndStop(7);
					}
					if(lastMove == LEFT) {
						player.gotoAndStop(8);
					}
				}
				}
				x = -(player.x - sceneHeight/2);
				y = -(player.y - sceneHeight/2 + 120);
				healthBar.x = player.x - 5;
				healthBar.y = player.y - 90;
				}
				catch(error:Error) {
				}
				finally {
				}
				
			}
			

	function startAttackCheck(e) {
		if(e.keyCode==32) {
			space = true;
		}
		if(e.keyCode==81) {
			q = true;
		}
	}
	
	function stopAttackCheck(e) {
		if(e.keyCode==32) {
			space = false;
		}
		if(e.keyCode == 81) {
			q = false;
		}
	}
	
	function startMovePlayer(e) {
		if(e.keyCode==38) {
			up = true
			lastMove = UP
			//player.gotoAndStop(2)
		}
		if(e.keyCode==40) {
			down = true
			lastMove = DOWN
			//player.gotoAndStop(1)
		}
		if(e.keyCode==37) {
			left = true
			lastMove = LEFT;
			//player.gotoAndStop(4)
		}
		if (e.keyCode==39) {
			right = true
			lastMove = RIGHT;
			//player.gotoAndStop(3)
		}
	}
		
	function stopMovePlayer(e) {
		if(e.keyCode==38) {
			up = false
		}
		if(e.keyCode==40) {
			down = false
		}
		if(e.keyCode==37) {
			left = false
		}
		if (e.keyCode==39) {
			right = false
		}
		
}
		}
	}
}