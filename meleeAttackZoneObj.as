package  {
	
	import flash.display.*;
	import global.Global;
	
	
	public class meleeAttackZoneObj extends MovieClip {
		
		
		public function meleeAttackZoneObj(playerX:Number, playerY:Number, areaDirection:Number) {
			var self = this;
			x = playerX;
			y = playerY;
			var objIndex;
			
			function randInt(max:Number, min:Number):Number
			{
     			return Math.random() * (max - min) + min;
			}
			
			function collTestFunc(currObj:*, index:int, objArray:Array):Boolean {
				if(currObj.hitTestObject(self)) {
					objIndex = currObj;
					return true
				}
				else {
					return false
				}
			}
			
			if(areaDirection==0) {
				//Standard direction is up, therefore no code is needed
				rotation = 0;
			}
			if(areaDirection==1) {
				rotation = 180;
			}
			if(areaDirection==2) {
				rotation = 90;
			}
			if(areaDirection==3) {
				rotation = 270;
			}
			var collTest:Boolean = global.Global.enemyArray.some(collTestFunc);
			if(collTest) {
				objIndex.health - randInt(25,10)
			}
			
			
		}
	}
	
}
